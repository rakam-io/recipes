{
  dimensions: {
    // TODO: duration
    time_on_site: {
      type: 'integer',
      sql: '{{TABLE}}.totals.timeOnSite',
      description: 'Total time of the session expressed in seconds',
      reportOptions: { suffix: 's' },
    },
    is_bounced: {
      type: 'boolean',
      sql: 'CASE WHEN {{TABLE}}.totals.bounces = 1 THEN true ELSE false END',
    },
    total_hits: {
      type: 'integer',
      sql: '{{TABLE}}.totals.hits',
      description: 'Total number of hits within the session',
    },
    is_new_visit: {
      type: 'boolean',
      sql: 'CASE WHEN {{TABLE}}.totals.newVisits = 1 THEN true ELSE false END',
    },
    total_pageviews: {
      type: 'integer',
      sql: '{{TABLE}}.totals.pageviews',
      description: 'Total number of pageviews within the session',
    },
    session_quality: {
      type: 'integer',
      sql: '{{TABLE}}.totals.sessionQualityDim',
      description: 'An estimate of how close a particular session was to transacting, ranging from 1 to 100, calculated for each session. A value closer to 1 indicates a low session quality, or far from transacting, while a value closer to 100 indicates a high session quality, or very close to transacting. A value of 0 indicates that Session Quality is not calculated for the selected time range.',
      reportOptions: { suffix: '%' },
    },
    total_revenue: {
      type: 'integer',
      sql: '{{TABLE}}.totals.totalTransactionRevenue/1000000',
      description: 'Total time of the session expressed in seconds',
      reportOptions: { formatNumbers: '$0,0' },
    },
    total_transactions: {
      type: 'integer',
      sql: '{{TABLE}}.totals.transactions',
      description: 'Total number of ecommerce transactions within the session',
    },
    is_interaction_visit: {
      type: 'boolean',
      sql: 'CASE WHEN {{TABLE}}.totals.visits = 1 THEN true ELSE false END',
      description: 'If the user did any interaction event in this session',
    },
  },
  measures: {
    total_visits: {
      sql: '{{dimension.total_visits}}',
      aggregation: 'sum',
      type: 'integer',
    },
    total_hits: {
      sql: '{{dimension.total_hits}}',
      aggregation: 'sum',
      type: 'integer',
    },
    hits_average_per_session: {
      sql: '1.0 * {{measure.total_hits}} / NULLIF({{measure.count_of_sessions}},0)',
      type: 'double',
    },
    total_pageviews: {
      sql: '{{dimension.total_pageviews}}',
      aggregation: 'sum',
      type: 'integer',
    },
    average_pageviews_per_user: {
      label: 'Average Pageviews per User',
      sql: '1.0 * ({{measure.total_pageviews}} / NULLIF({{measure.unique_visitors}} ,0))',
      type: 'double',
      hidden: false,
    },
    time_on_site: {
      sql: '{{dimension.time_on_site}} / 86400.0',
      aggregation: 'sum',
      type: 'double',
      description: 'Total time of the session expressed in seconds.',
    },
    average_time_on_site_per_session: {
      sql: '({{measure.time_on_site}}) / NULLIF({{measure.count_of_sessions}},0)',
      type: 'double',
      hidden: false,
    },
    page_views_per_session: {
      sql: '1.0 * {{measure.total_pageviews}} / NULLIF({{measure.count_of_sessions}},0)',
      type: 'double',
      hidden: false,
    },
    total_bounces: {
      sql: 'totals.bounces',
      aggregation: 'sum',
      type: 'integer',
    },
    bounce_rate: {
      sql: '1.0 * {{measure.total_bounces}} / NULLIF({{measure.count_of_sessions}},0)',
      type: 'double',
    },
    total_transactions: {
      sql: '{{dimension.total_transactions}}',
      aggregation: 'sum',
      type: 'integer',
    },
    total_revenue: {
      sql: '({{dimension.total_revenue}}/1000000)',
      aggregation: 'sum',
      type: 'double',
    },
    transaction_conversion_rate: {
      sql: '1.0 * (transactions_count/NULLIF({{measure.count_of_sessions}},0))',
      type: 'double',
    },
    average_revenue_per_transaction: {
      sql: '1.0 * ({{measure.total_transactions}}/NULLIF({{measure.total_transactions}},0))',
      type: 'double',
      hidden: false,
    },
    average_revenue_per_user: {
      sql: '1.0 * ({{measure.total_revenue}}/NULLIF({{measure.unique_visitors}},0))',
      type: 'double',
    },
    average_transactions_per_user: {
      sql: '1.0 * ({{measure.total_transactions}}/NULLIF({{measure.unique_visitors}},0))',
      type: 'double',
      hidden: false,
    },
    average_sessions_per_user: {
      sql: '1.0 * ({{measure.count_of_sessions}}/NULLIF({{measure.unique_visitors}},0))',
      type: 'double',
      hidden: false,
    },
    total_new_visits: {
      sql: '{{TABLE}}.totals.newVisits',
      aggregation: 'sum',
      type: 'integer',
    },
  },
}
