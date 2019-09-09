{
  dimensions: {
    session_id: 'A visit / session identifier', 
    session_index: 'A visit / session index', 
    app_id: 'Application ID', 
    inferred_user_id: null, 
    user_custom_id: 'Unique ID set by business, user_id', 
    user_snowplow_domain_id: 'User ID set by Snowplow using 1st party cookie', 
    user_snowplow_crossdomain_id: 'User ID set by Snowplow using 3rd party cookie', 
    session_end: 'Timestamp for the end of the session on your preferred clock', 
    session_end_local: "Timestamp for the end of the session on the user's clock", 
    session_start: 'Timestamp for the start of the session on your preferred clock',
    session_start_local: "Timestamp for the start of the session on the user's clock", 
    first_page_title: 'Web page title',
    first_page_url: 'The page URL',
    first_page_url_fragment: 'Fragment aka anchor',
    first_page_url_host: 'Host aka domain',
    first_page_url_path: 'Path to page',
    first_page_url_port: 'Port if specified, 80 if not',
    first_page_url_query: 'Query String',
    first_page_url_scheme: 'Scheme aka protocol',

    engaged_page_views,
    new_vs_returning: {
        sql: |||
        case
            when ${session_index} = 1 then 'new'
            else 'returning'
        end
|||
    },
  },
  measures: {
    sessions: {
       aggregation: 'count'
    },
    page_views: {
        aggregation: 'sum',
        column: 'count_page_views'
    },
    distinct_users: {
        aggregation: 'countUnique',
        sql: '{{dimension.inferred_user_id}}'
    },
    average_time_engaged_in_s: {
        aggregation: 'average',
        sql: '{{dimension.time_engaged_in_s}}'
    },
    sessions_from_new_visitors: {
        aggregation: 'count'
            filters: {
        field: new_vs_returning
        value: "new"
        }
    },
    sessions_from_returning_visitors: {
        aggregation: 'count'
        filters: {
            field: new_vs_returning
            value: "returning"
            }
    },
    percent_new_visitors: {
        sql: 'cast(${sessions_from_new_visitors} as FLOAT64) / nullif(${sessions}, 0)'
    },
    percent_returning_visitors: {
        sql: 'cast(${sessions_from_returning_visitors} as FLOAT64) / nullif(${sessions}, 0)'
    },
    bounced_sessions: {
        aggregation: 'count',
        filters: {
            field: user_bounced
            value: "yes"
            }
    },
    bounce_rate: {
        sql: 'cast(${bounced_sessions} as FLOAT64) / nullif(${sessions}, 0)'
    },
    sessions_per_user: {
        sql: 'cast(${sessions} as FLOAT64) / nullif(${distinct_users}, 0)'
    },
  },
}
