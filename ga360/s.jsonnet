{
  measures: {
    min_visit_start: {
      column: 'DATE(TIMESTAMP_SECONDS({{TABLE}}.visitStarttime))',
      aggregation: 'minimum',
      hidden: true,
    },
    max_visit_start: {
      column: 'DATE(TIMESTAMP_SECONDS({{TABLE}}.visitStarttime))',
      aggregation: 'maximum',
      hidden: true,
    },
    days_active: {
      sql: '(date_diff({{measure.max_visit_start}}, {{measure.min_visit_start}}, day)+1)',
    },
    weeks_active: {
      sql: '(date_diff({{measure.max_visit_start}}, {{measure.min_visit_start}}, week)+1)',
    },
    days_since_first_session: {
      sql: 'date_diff(CURRENT_DATE, {{measure.min_visit_start}}, day)',
    },
    count_of_sessions: {
      aggregation: 'count',
    },
    unique_visitors: {
      column: 'fullVisitorId',
      aggregation: 'countUnique',
    },
    average_sessions_per_visitor: {
      sql: '1.0 * ({{measure.count_of_sessions}}/NULLIF({{measure.unique_visitors}},0))',
      type: 'double',
    },
    new_users: {
      sql: 'first_time_visitors',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    percent_new_users: {
      sql: '1.0 * ({{measure.new_users}} / NULLIF(unique_visitors,0))',
      type: 'double',
      hidden: false,
    },
    returning_visitors: {
      label: 'Returning Users',
      sql: 'returning_visitors',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
  },
  dimensions: {
    id: {
      type: 'string',
      hidden: true,
      column: "CONCAT(CAST(fullVisitorId AS STRING), '|', COALESCE(CAST(visitId AS STRING),''), '|', CAST(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'^\\d\\d\\d\\d\\d\\d\\d\\d'))   AS STRING))",
    },
    visit_number: {
      label: 'Visit Number',
      description: 'The session number for this user.',
      type: 'string',
      column: 'visitNumber',
    },
    is_first_time_visitor: {
      type: 'boolean',
      sql: 'CASE WHEN {{TABLE}}.visitNumber = 1 THEN TRUE ELSE FALSE END',
    },
    visit_id: {
      column: 'visitId',
    },
    full_visitor_id: {
      column: 'fullVisitorId',
    },
    visit_start_time: {
      type: 'timestamp',
      column: 'TIMESTAMP_SECONDS(data.visitStarttime)',
    },
    is_socially_engaged: {
      type: 'boolean',
      sql: "CASE WHEN {{TABLE}}.socialEngagementType = 'Socially Engaged' THEN TRUE ELSE FALSE",
    },
    user_id: {
      description: 'Overridden User ID sent to Analytics.',
      column: 'userId',
    },
    channel_grouping: {
      description: "The Default Channel Group associated with an end user's session for this View.",
      column: 'channelGrouping',
    },
  },
}
