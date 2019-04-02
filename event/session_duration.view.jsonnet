{
  label: 'Session Duration',
  description: '',
  hide: true,
  type: 'view',
  query: |||
    WITH all_mappings AS (
             SELECT tracks.anonymous_id,
                tracks.user_id,
                tracks.received_at
               FROM tracks
            UNION ALL
             SELECT tracks.user_id,
                NULL::text,
                tracks.received_at
               FROM tracks
            ), aliases_mapping AS (
             SELECT DISTINCT all_mappings.anonymous_id AS alias,
                COALESCE(first_value(all_mappings.user_id) OVER (PARTITION BY all_mappings.anonymous_id ORDER BY
                    CASE
                        WHEN (all_mappings.user_id IS NULL) THEN 1
                        ELSE 0
                    END, all_mappings.received_at ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), all_mappings.anonymous_id) AS rakam_visitor_id,
                all_mappings.received_at
               FROM all_mappings
              WHERE (all_mappings.anonymous_id IS NOT NULL)
              ORDER BY all_mappings.received_at
            ), mapped_tracks AS (
             SELECT t2.event_id,
                t2.anonymous_id,
                t2.rakam_visitor_id,
                t2.received_at,
                t2.event,
                t2.uuid_ts,
                (date_part('EPOCH'::text, age(t2.received_at, lag(t2.received_at) OVER (PARTITION BY t2.anonymous_id ORDER BY t2.received_at))) / (60)::double precision) AS idle_time_minutes
               FROM ( SELECT concat(t_1.received_at, t_1.anonymous_id) AS event_id,
                        t_1.anonymous_id,
                        a2v.rakam_visitor_id,
                        t_1.received_at,
                        t_1.event,
                        t_1.uuid_ts
                       FROM (tracks t_1
                         JOIN aliases_mapping a2v ON ((a2v.alias = COALESCE(t_1.user_id, t_1.anonymous_id))))) t2
            ), session_tracks AS (
             SELECT ((row_number() OVER (PARTITION BY mapped_tracks.rakam_visitor_id ORDER BY mapped_tracks.received_at) || '-'::text) || mapped_tracks.rakam_visitor_id) AS session_id,
                mapped_tracks.rakam_visitor_id,
                mapped_tracks.received_at AS session_start_at,
                row_number() OVER (PARTITION BY mapped_tracks.rakam_visitor_id ORDER BY mapped_tracks.received_at) AS session_sequence_number,
                lead(mapped_tracks.received_at) OVER (PARTITION BY mapped_tracks.rakam_visitor_id ORDER BY mapped_tracks.received_at) AS next_session_start_at
               FROM mapped_tracks
              WHERE ((mapped_tracks.idle_time_minutes > (%(sessionDurationInMinutes)0.2f)::double precision) OR (mapped_tracks.idle_time_minutes IS NULL))
            )
     SELECT s.session_id,
        min(s.session_start_at) AS session_start_at,
        (date_part('EPOCH'::text, age(max(t.received_at), min(t.received_at))) / (60)::double precision) AS session_duration_minute
       FROM (tracks t
         JOIN session_tracks s ON (((COALESCE(t.user_id, t.anonymous_id) = s.rakam_visitor_id) AND (t.received_at >= s.session_start_at) AND ((t.received_at < s.next_session_start_at) OR (s.next_session_start_at IS NULL)))))
      GROUP BY s.session_id;
  ||| % variables,
  columnMapping: {
    eventTimestamp: 'session_start_at',
    incremental: null,
    userId: null,
    deviceId: null,
    sessionId: 'session_id',
  },
  measures: {
    'Average Session Duration': {
      type: 'column',
      aggregation: 'average',
      column: 'session_duration_minute',
      reportOptions: { suffix: 'minutes', formatNumbers: true },
    },
  },
  relations: [],
}
