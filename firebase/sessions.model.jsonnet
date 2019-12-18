local util = import '../util.libsonnet';

{
  name: 'sessions',
  hidden: false,
  label: 'Sessions',
  sql: |||
    SELECT unique_session_id,
        user_session_id,
        user_pseudo_id,
        MAX(TIMESTAMP_MICROS(event_timestamp)) as session_end,
        MIN(TIMESTAMP_MICROS(event_timestamp)) as session_start,
        (MAX(event_timestamp) - MIN(event_timestamp))/(60 * 1000 * 1000) AS session_length_minutes
    FROM (
    SELECT user_pseudo_id,
        event_timestamp,
        SUM(is_new_session) OVER (ORDER BY user_pseudo_id, event_timestamp) AS unique_session_id,
        SUM(is_new_session) OVER (PARTITION BY user_pseudo_id ORDER BY event_timestamp) AS user_session_id
    FROM (
        SELECT *,
                CASE WHEN TIMESTAMP_DIFF(TIMESTAMP_MICROS(event_timestamp), TIMESTAMP_MICROS(last_event),MINUTE) >= 20 --session timout = 20 minutes
                        OR last_event IS NULL
                    THEN 1 ELSE 0 END AS is_new_session
            FROM (
                SELECT user_pseudo_id,
                        event_timestamp,
                        LAG(event_timestamp,1) OVER (PARTITION BY user_pseudo_id ORDER BY event_timestamp) AS last_event
                    FROM `%(target)s`
                ) last
        ) final
        ) session
    GROUP BY 1,2,3
  ||| % { target: util.generate_target_reference(std.mergePatch(std.extVar('schema'), { table: 'events_*' })) },
  mappings: {
    eventTimestamp: 'session_start',
    userId: 'user_pseudo_id',
  },
  dimensions: {
    user_pseudo_id: {
      type: 'string',
      column: 'user_pseudo_id',
    },
    session_end: {
      type: 'timestamp',
      column: 'session_end',
    },
    session_start: {
      type: 'timestamp',
      column: 'session_start',
    },
    unique_session_id: {
      type: 'integer',
      column: 'unique_session_id',
    },
    user_session_id: {
      type: 'integer',
      column: 'user_session_id',
    },
    session_length_minutes: {
      type: 'double',
      column: 'session_length_minutes',
    },
  },
  measures: {
    sum_of_unique_session_id: {
      column: 'unique_session_id',
      aggregation: 'sum',
      type: 'double',
    },
    sum_of_user_session_id: {
      column: 'user_session_id',
      aggregation: 'sum',
      type: 'double',
    },
    sum_of_session_length_minutes: {
      column: 'session_length_minutes',
      aggregation: 'sum',
      type: 'double',
    },
    number_of_sessions: {
      aggregation: 'count',
      type: 'double',
    },
    average_first_session_length: {
      column: 'session_length_minutes',
      aggregation: 'average',
      type: 'double',
    },
    session_length_minutes: {
      column: 'session_length_minutes',
      aggregation: 'average',
      type: 'double',
    },
  },
}
