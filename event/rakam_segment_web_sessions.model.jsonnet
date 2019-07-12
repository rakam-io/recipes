local model = (importstr 'rakam_segment_web_sessions.sql');

{
  name: 'rakam_segment_web_sessions',
  label: 'Pageview Sessions',
  description: 'Website session information for the pageview event',
  target: {
     table: 'rakam_segment_web_sessions'
  },
  dbt: {
    model: std.strReplace(model, '%', '%%') % {
       segment_inactivity_cutoff: 1,
       segment_sessionization_trailing_window: 2,
     },
     config: {
     unique_key: 'session_id',
     materialized: 'incremental',
   },
   updateInterval: 'PT3H'
  },
  mapping: {
    eventTimestamp: 'session_start_tstamp',
    incremental: 'received_at',
    userId: 'blended_user_id',
  },
  measures: {
    'Average Duration': {
      aggregation: 'average',
      column: 'duration_in_s',
      reportOptions: {
        prefix: '',
        suffix: ' seconds',
        formatNumbers: true,
      },
    },
    'Total Sessions': {
      aggregation: 'count',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Distinct Users': {
      aggregation: 'countUnique',
      column: 'userId',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Pages Per Session': {
      type: 'expression',
      sql: '1.0 * "page_views" / nullif(count(*), 0)',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Bounce Rate': {
      sql: '1.0 * sum(case when "page_views" = 1 then 1 else 0 end) /\n            nullif(count(*), 0)',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'New Sessions': {
      sql: 'sum(case when "session_number" = 1 then 1 else 0 end)',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Returning Sessions': {
      sql: 'sum(case when "session_number" > 1 then 1 else 0 end)',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Average Session Per User': {
      aggregation: 'average',
      column: 'session_number',
      reportOptions: {
        formatNumbers: true,
      },
    },
  },
  columns: {
//    anonymous_id: {
//
//    },
//    blended_user_id: {
//
//    },
//    gclid: {
//
//    },
    device: {

    },
    device_category: {

    },
    duration_in_s: {

    },
    duration_in_s_tier: {

    },
    first_page_url: {

    },
    first_page_url_host: {

    },
    first_page_url_path: {

    },
    first_page_url_query: {

    },

    last_page_url: {

    },
    last_page_url_host: {

    },
    last_page_url_path: {

    },
    last_page_url_query: {

    },
    page_views: {

    },
    referrer: {

    },
    referrer_host: {

    },
    session_end_tstamp: {

    },
    session_id: {

    },
    session_number: {

    },
    session_start_tstamp: {

    },
    utm_campaign: {

    },
    utm_content: {

    },
    utm_medium: {

    },
    utm_source: {

    },
    utm_term: {

    },
  },
}