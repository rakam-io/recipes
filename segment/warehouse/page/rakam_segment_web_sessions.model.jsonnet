local util = import '../../../util.libsonnet';

local dbtModel = (importstr 'rakam_segment_web_sessions.sql');

local pages_target_ref = util.generate_target_reference(std.extVar('pages_target'));

/* We will extract the first values of the events in a given session from pageview events and materialize it in our model.
 key: column_column
 value: dimension with target column name
 */

local first_values = {
  context_campaign_source: { column: 'utm_source' },
  context_campaign_content: { column: 'utm_content' },
  context_campaign_medium: { column: 'utm_medium' },
  context_campaign_name: { column: 'utm_campaign' },
  context_page_url: { column: 'first_page_url' },
  context_page_path: { column: 'first_page_url_path' },
  context_page_referrer: { column: 'first_referrer' },
};

/* We will extract the last values of the events in a given session from pageview events and materialize it in our model. */
local last_values = {
  context_page_url: { column: 'last_url' },
  context_page_path: { column: 'last_path' },
  context_page_search: { column: 'last_search' },
};


{
  name: 'rakam_segment_web_sessions',
  label: '[Segment] Pageview Sessions',
  description: 'Website session information for the pageview event',
  hidden: false,
  target: std.extVar('model_target'),
  dbt: {
    model: util.generate_jinja_header({
      inactivity_cutoff: std.extVar('session_duration_in_minutes'),
      sessionization_trailing_window: 2.0,
      pages_target: pages_target_ref,
      first_values: { [k]: first_values[k].column for k in std.objectFields(first_values) },
      last_values: { [k]: last_values[k].column for k in std.objectFields(last_values) },
    }) + dbtModel,
    config: {
      unique_key: 'session_id',
      materialized: 'incremental',
    },
    updateInterval: 'PT3H',
  },
  mappings: {
    eventTimestamp: 'session_start_tstamp',
    incremental: 'received_at',
    userId: 'blended_user_id',
  },
  measures: {
    average_duration: {
      aggregation: 'average',
      label: 'Average Duration',
      column: 'duration_in_s',
      reportOptions: {
        prefix: '',
        suffix: ' seconds',
        formatNumbers: true,
      },
    },
    sessions: {
      aggregation: 'count',
      label: 'Total Sessions',
    },
    users: {
      label: 'Distinct Users',
      aggregation: 'countUnique',
      column: 'blended_user_id',
    },
    pages_per_session: {
      label: 'Pages Per Session',
      sql: '1.0 * "page_views" / nullif(count(*), 0)',
    },
    bounce_rate: {
      sql: '1.0 * sum(case when "page_views" = 1 then 1 else 0 end) /\n            nullif(count(*), 0)',
      label: 'Bounce Rate',
    },
    new_sessions: {
      label: 'New Sessions',
      sql: 'sum(case when "session_number" = 1 then 1 else 0 end)',
    },
    returning_sessions: {
      label: 'Returning Sessions',
      sql: 'sum(case when "session_number" > 1 then 1 else 0 end)',
    },
    average_session_count_per_user: {
      label: 'Average Session Per User',
      aggregation: 'average',
      column: 'session_number',
    },
  },
  dimensions: ({ [first_values[k].column]: first_values[k] for k in std.objectFields(first_values) }) +
              ({ [last_values[k].column]: last_values[k] for k in std.objectFields(last_values) }) + {
    //    anonymous_id: {
    //
    //    },
    //    blended_user_id: {
    //
    //    },
    //    gclid: {
    //
    //    },
    duration_in_s: {
      column: 'duration_in_s',
    },
    duration_in_s_tier: {
      column: 'duration_in_s_tier',
    },
    page_views: {
      column: 'page_views',
    },
    first_referrer: {
      column: 'first_referrer',
    },
    session_end_tstamp: {
      column: 'session_end_tstamp',
    },
    session_id: {
      column: 'session_id',
    },
    session_number: {
      column: 'session_number',
    },
    session_start_tstamp: {
      column: 'session_start_tstamp',
    },
  },
}
