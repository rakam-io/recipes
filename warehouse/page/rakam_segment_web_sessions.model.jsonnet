local dbtModel = (importstr 'rakam_segment_web_sessions.sql');
local pages_target_ref = std.join(".", std.filter(function(x) x != null, [std.extVar('pages_target').database, std.extVar('pages_target').schema, std.extVar('pages_target').table]));
local generate_jinja_header(obj) = std.join('', ['{%% set %s = %s %%} ' % [f, std.manifestPython(obj[f])] for f in std.objectFields(obj)]);


/* We will extract the first values of the events in a given session from pageview events and materialize it in our model.
 key: column_column
 value: dimension with target column name
 */

local first_values = {
  context_campaign_source : {column: 'utm_source', postOperations: []},
  context_campaign_content : {column: 'utm_content', postOperations: []},
  context_campaign_medium : {column: 'utm_medium', postOperations: []},
 context_campaign_name :{column: 'utm_campaign', postOperations: []} ,
  context_campaign_term : {column: 'utm_term', postOperations: []},
  url : {column: 'first_page_url', postOperations: []},
  path : {column: 'first_page_url_path', postOperations: []},
  search : {column: 'first_page_url_query', postOperations: []},
  };

/* We will extract the last values of the events in a given session from pageview events and materialize it in our model. */
local last_values = {
  url : {column: 'last_url', postOperations: []},
  path : {column: 'last_path', postOperations: []},
  search : {column: 'last_search', postOperations: []}
  };


{
  name: 'rakam_segment_web_sessions',
  label: 'Pageview Sessions',
  description: 'Website session information for the pageview event',
  target: std.extVar('model_target'),
  dbt: {
     model: generate_jinja_header({
             inactivity_cutoff: std.extVar('session_duration_in_minutes'),
             sessionization_trailing_window: 2.0,
             pages_target: pages_target_ref,
             first_values: { [k]: first_values[k].column for k in std.objectFields(first_values) },
             last_values: { [k]: last_values[k].column for k in std.objectFields(last_values) }
           }) + dbtModel,
     config: {
     unique_key: 'session_id',
     materialized: 'incremental',
   },
   updateInterval: 'PT3H'
  },
  mappings: {
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
    device: {
       column: 'device'
    },
    device_category: {
        column: 'device_category'
    },
    duration_in_s: {
        column: 'duration_in_s'
    },
    duration_in_s_tier: {
        column: 'duration_in_s_tier'
    },
    page_views: {
        column: 'page_views'

    },
    referrer: {
        column: 'referrer'

    },
    referrer_host: {
        column: 'referrer_host'

    },
    session_end_tstamp: {
        column: 'session_end_tstamp'

    },
    session_id: {
        column: 'session_id'

    },
    session_number: {
        column: 'session_number'

    },
    session_start_tstamp: {
        column: 'session_start_tstamp'

    },
  }
}