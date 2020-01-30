local customDimensions = import 's_custom_dimensions.jsonnet';
local device = import 's_device.jsonnet';
local geoNetwork = import 's_geonetwork.jsonnet';
local totals = import 's_totals.jsonnet';
local trafficSource = import 's_trafficsource.jsonnet';

{
  measures: totals.measures {
    min_visit_start: {
      sql: 'DATE(TIMESTAMP_SECONDS({{TABLE}}.visitStarttime))',
      aggregation: 'minimum',
      hidden: true,
    },
    max_visit_start: {
      sql: 'DATE(TIMESTAMP_SECONDS({{TABLE}}.visitStarttime))',
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
      aggregation: 'count',
      filters: [
        { dimension: 'visit_number', operator: 'equals', value: 1, valueType: 'integer' },
      ],
    },
    percent_new_users: {
      sql: '1.0 * ({{measure.new_users}} / NULLIF({{measure.unique_visitors}},0))',
      reportOptions: { formatNumbers: '0.0%' },
    },
    returning_visitors: {
      aggregation: 'count',
      filters: [
        { dimension: 'visit_number', operator: 'greaterThan', value: 1, valueType: 'integer' },
      ],
    },
  },
  dimensions: device.dimensions + geoNetwork.dimensions + totals.dimensions + trafficSource.dimensions + customDimensions.dimensions {
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
      sql: 'TIMESTAMP_SECONDS({{TABLE}}.visitStarttime)',
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
