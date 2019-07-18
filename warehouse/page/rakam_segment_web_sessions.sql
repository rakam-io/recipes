{% set partition_by = "partition by session_id" %}

  {% set sessionization_cutoff = "
(
    select
    -- sessionization_trailing_window
    {{
        dbt_utils.safe_cast(
            dbt_utils.dateadd(
                'hour',
                -%(sessionization_trailing_window)0.2f,
                'max(session_start_tstamp)'),
            'timestamp') }}
    from {{this}}
)
" %}

  {% set window_clause = "
    partition by session_id
    order by page_view_number
    rows between unbounded preceding and unbounded following
    " %}

  {% set first_values = {
  'context_campaign_source' : 'utm_source',
  'context_campaign_content' : 'utm_content',
  'context_campaign_medium' : 'utm_medium',
  'context_campaign_name' : 'utm_campaign',
  'context_campaign_term' : 'utm_term',
  'url' : 'first_page_url',
  'path' : 'first_page_url_path',
  'search' : 'first_page_url_query',
  } %}

  {% set last_values = {
  'url' : 'last_url',
  'path' : 'last_path',
  'search' : 'last_search'
  } %}

with
  sessionized as (
    with pageviews as (

      select * from %(pages_target)s

        {% if is_incremental() %}
      where anonymous_id in (
        select distinct anonymous_id
        from %(pages_target)s
        where timestamp >= (
        select
        -- sessionization_trailing_window
        {{
        dbt_utils.safe_cast(
        dbt_utils.dateadd(
        'hour',
        -%(sessionization_trailing_window)0.2f,
        'max(session_start_tstamp)'),
        'timestamp') }}
        from {{ this }})
        )
          {% endif %}
      ),

      numbered as (

        --This CTE is responsible for assigning an all-time page view number for a
        --given anonymous_id. We don't need to do this across devices because the
        --whole point of this field is for sessionization, and sessions can't span
        --multiple devices.

        select

          *,

          row_number() over (
            partition by anonymous_id
            order by timestamp
            ) as page_view_number

        from pageviews

        ),

      lagged as (

        --This CTE is responsible for simply grabbing the last value of timestamp.
        --We'll use this downstream to do timestamp math--it's how we determine the
        --period of inactivity.

        select

          *,

          lag(timestamp) over (
            partition by anonymous_id
            order by page_view_number
            ) as previous_tstamp

        from numbered

        ),

      new_sessions as (

        --This CTE calculates a single 1/0 field--if the period of inactivity prior
        --to this page view was greater than 30 minutes, the value is 1, otherwise
        --it's 0. We'll use this to calculate the user's session #.

        select
          *,
          {{ dbt_utils.datediff('previous_tstamp', 'timestamp', 'second') }} as period_of_inactivity,
          (case
          when
          -- inactivity_cutoff
          {{ dbt_utils.datediff('previous_tstamp', 'timestamp', 'second') }} <= %(inactivity_cutoff)0.2f then 0 else 1 end) as new_session
        from lagged

        ),

      session_numbers as (

        --This CTE calculates a user's session (1, 2, 3) number from new_session.
        --This single field is the entire point of the entire prior series of
        --calculations.

        select

          *,

          sum(new_session) over (
            partition by anonymous_id
            order by page_view_number
            rows between unbounded preceding and current row
            ) as session_number

        from new_sessions

        ),

      session_ids as (

        --This CTE assigns a globally unique session id based on the combination of
        --anonymous_id and session_number.

        select
          *,
          {{dbt_utils.surrogate_key('anonymous_id', 'session_number')}} as session_id
          from session_numbers

      )

      select * from session_ids

  ),

  pageviews as (
    select distinct
      session_id,
      anonymous_id,

      {% for (key, value) in first_values.items() %}
      first_value({{key}}) over ({{window_clause}}) as {{value}},
      {% endfor %}

      {% for (key, value) in last_values.items() %}
      last_value({{key}}) over ({{window_clause}}) as {{value}},
      {% endfor %}

      min(timestamp) over ( {{partition_by}} ) as session_start_tstamp,
      max(timestamp) over ( {{partition_by}} ) as session_end_tstamp,
      count(*) over ( {{partition_by}} ) as page_views
    from sessionized
  ),

  sessionized_durations as (
    select
      *,
      {{ dbt_utils.datediff('session_start_tstamp', 'session_end_tstamp', 'second') }} as duration_in_s
    from pageviews

      {% if is_incremental() %}
    where session_start_tstamp > (
      select -- sessionization_trailing_window
      {{
      dbt_utils.safe_cast(
      dbt_utils.dateadd(
      'hour',
      -%(sessionization_trailing_window)0.2f,
      'max(session_start_tstamp)'),
      'timestamp') }}
      from {{ this }})
        {% endif %}
  ),

  sessions as (

    select

      *,

      case
        when duration_in_s between 0 and 9 then '0s to 9s'
        when duration_in_s between 10 and 29 then '10s to 29s'
        when duration_in_s between 30 and 59 then '30s to 59s'
        when duration_in_s > 59 then '60s or more'
        else null
        end as duration_in_s_tier

    from sessionized_durations

      {% if is_incremental() %}
    where session_start_tstamp > (
      select
       -- sessionization_trailing_window
      {{
      dbt_utils.safe_cast(
      dbt_utils.dateadd(
      'hour',
      -%(sessionization_trailing_window)0.2f,
      'max(session_start_tstamp)'),
      'timestamp') }}
      from {{ this }})
        {% endif %}
  ),

  id_stitching as (

    select distinct

      anonymous_id,

      last_value(user_id) over (
        partition by anonymous_id
        order by case when user_id is not null then 0 else 1 end ASC, timestamp
        rows between unbounded preceding and unbounded following
        ) as user_id,

      min(timestamp) over (
        partition by anonymous_id
        ) as first_seen_at,

      max(timestamp) over (
        partition by anonymous_id
        ) as last_seen_at

    from %(pages_target)s
  ),

  stitched_sessions as (
    select sessions.*, coalesce(id_stitching.user_id, sessions.anonymous_id) as blended_user_id
    from sessions left join id_stitching using (anonymous_id)
    {% if is_incremental() %}
       where session_start_tstamp > {{sessionization_cutoff}}
    {% endif %}
  )

  {% if is_incremental() %}

    , agg as (
      select
      blended_user_id,
      count(*) as starting_session_number
      from {{this}}

  -- only include sessions that are not going to be resessionized in this run
  where session_start_tstamp <= {{sessionization_cutoff}} group by 1)
  {% endif %}

select
  *,
  row_number() over (partition by blended_user_id order by s.session_start_tstamp)
  {% if is_incremental() %}+ agg.starting_session_number {% endif %}
  as session_number

from stitched_sessions s

  {% if is_incremental() %}
     left join agg using (blended_user_id)
  {% endif %}