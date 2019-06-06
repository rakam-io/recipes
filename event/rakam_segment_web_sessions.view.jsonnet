{
  name: 'rakam_segment_web_sessions',
  label: 'Pageview Sessions',
  description: 'Website session information for the pageview event',
  dbtConfig: {
    unique_key: 'session_id',
    materialized: 'incremental',
  },
  dbtModel: importstr 'rakam_segment_web_sessions.sql' % {
    segment_inactivity_cutoff: 1,
    segment_sessionization_trailing_window: 2,
  },
  dbtUpdateInterval: 'PT3H',
  mapping: {
    eventTimestamp: 'session_start_tstamp',
    incremental: 'received_at',
    userId: 'blended_user_id',
  },
  measures: {
    'Average Duration': {
      type: 'customColumn',
      aggregation: 'average',
      customColumn: 'duration_in_s',
      reportOptions: {
        prefix: '',
        suffix: ' seconds',
        formatNumbers: true,
      },
    },
    'Total Sessions': {
      type: 'customColumn',
      aggregation: 'count',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Distinct Users': {
      type: 'mappingColumn',
      aggregation: 'countUnique',
      mappingColumn: 'userId',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Pages Per Session': {
      type: 'expression',
      expression: '1.0 * "page_views" / nullif(count(*), 0)',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Bounce Rate': {
      type: 'expression',
      expression: '1.0 * sum(case when "page_views" = 1 then 1 else 0 end) /\n            nullif(count(*), 0)',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'New Sessions': {
      type: 'expression',
      expression: 'sum(case when "session_number" = 1 then 1 else 0 end)',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Returning Sessions': {
      type: 'expression',
      expression: 'sum(case when "session_number" > 1 then 1 else 0 end)',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Average Session Per User': {
      type: 'customColumn',
      aggregation: 'average',
      customColumn: 'session_number',
      reportOptions: {
        formatNumbers: true,
      },
    },
  },
  columns: {
    anonymous_id: {
      groupable: true,
      filterable: false,
    },
    blended_user_id: {
      groupable: true,
      filterable: false,
    },
    device: {
      groupable: true,
      filterable: false,
    },
    device_category: {
      groupable: true,
      filterable: false,
    },
    duration_in_s: {
      groupable: true,
      filterable: false,
    },
    duration_in_s_tier: {
      groupable: true,
      filterable: false,
    },
    first_page_url: {
      groupable: true,
      filterable: false,
    },
    first_page_url_host: {
      groupable: true,
      filterable: false,
    },
    first_page_url_path: {
      groupable: true,
      filterable: false,
    },
    first_page_url_query: {
      groupable: true,
      filterable: false,
    },
    gclid: {
      groupable: true,
      filterable: false,
    },
    last_page_url: {
      groupable: true,
      filterable: false,
    },
    last_page_url_host: {
      groupable: true,
      filterable: false,
    },
    last_page_url_path: {
      groupable: true,
      filterable: false,
    },
    last_page_url_query: {
      groupable: true,
      filterable: false,
    },
    page_views: {
      groupable: true,
      filterable: false,
    },
    referrer: {
      groupable: true,
      filterable: false,
    },
    referrer_host: {
      groupable: true,
      filterable: false,
    },
    session_end_tstamp: {
      groupable: true,
      filterable: false,
    },
    session_id: {
      groupable: true,
      filterable: false,
    },
    session_number: {
      groupable: true,
      filterable: false,
    },
    session_start_tstamp: {
      groupable: true,
      filterable: false,
    },
    utm_campaign: {
      groupable: true,
      filterable: false,
    },
    utm_content: {
      groupable: true,
      filterable: false,
    },
    utm_medium: {
      groupable: true,
      filterable: false,
    },
    utm_source: {
      groupable: true,
      filterable: false,
    },
    utm_term: {
      groupable: true,
      filterable: false,
    },
  },
}
