{
  name: 'snowplow_sessions',
  target: std.extVar('snowplow_sessions'),
  mappings: {},
  measures: {
    sessions: {
        category: '',
        column: 'sessions',
        aggregation: 'sum'
    },
    page_views: {
        category: '',
        column: 'page_views',
        aggregation: 'sum'
    },
    distinct_users: {
        category: '',
        sql: '{{dimension.inferred_user_id}}',
        aggregation: 'sum'
    },
    average_time_engaged_in_s: {
        category: '',
        sql: '{{dimension.time_engaged_in_s}}',
        aggregation: 'sum'
    },
    sessions_from_new_visitors: {  // Measure filter new_vs_returning -> new
        category: '',
        column: 'sessions_from_new_visitors',
        aggregation: 'sum'
    },
    sessions_from_returning_visitors: {  // Measure filter new_vs_returning -> returning
        category: '',
        column: 'sessions_from_returning_visitors',
        aggregation: 'sum'
    },
    percent_new_visitors: {
        category: '',
        sql: '{{dimension.sessions_from_new_visitors}}::float / nullif({{dimension.sessions}}, 0)',
        aggregation: 'sum'
    },
    percent_returning_visitors: {
        category: '',
        sql: '{{dimension.sessions_from_returning_visitors}}::float / nullif({{dimension.sessions}}, 0)',
        aggregation: 'sum'
    },
    bounced_sessions: { // Measure filter user_bounced -> yes
        category: '',
        column: 'bounced_sessions',
        aggregation: 'sum'
    },
    bounce_rate: {
        category: '',
        sql: '{{dimension.bounced_sessions}}::float / nullif({{dimension.sessions}}, 0)',
        aggregation: 'sum'
    },
    sessions_per_user: {
        category: '',
        sql: '{{dimension.sessions}}::float / nullif({{dimension.distinct_users}}, 0) ;;',
        aggregation: 'sum'
    },
  },
  dimensions: { 
    session_id: {
        label: '',
        column: 'session_id',
        category: ''
    },
    session_index: {
        label: '',
        column: 'session_index',
        category: ''
    },
    app_id: {
        label: '',
        column: 'app_id',
        category: ''
    },
    inferred_user_id: {
        label: '',
        column: 'inferred_user_id',
        category: ''
    },
    user_custom_id: {
        label: '',
        column: 'user_custom_id',
        category: ''
    },
    user_snowplow_domain_id: {
        label: '',
        column: 'user_snowplow_domain_id',
        category: ''
    },
    user_snowplow_crossdomain_id: {
        label: '',
        column: 'user_snowplow_crossdomain_id',
        category: ''
    },
    session_end: {
        label: '',
        column: 'session_end',
        category: ''
    },
    session_end_local: {
        label: '',
        column: 'session_end_local',
        category: ''
    },
    session_start: {
        label: '',
        column: 'session_start',
        category: ''
    },
    session_start_local: {
        label: '',
        column: 'session_start_local',
        category: ''
    },
    first_page_title: {
        label: '',
        column: 'first_page_title',
        category: ''
    },
    first_page_url: {
        label: '',
        column: 'first_page_url',
        category: ''
    },
    first_page_url_fragment: {
        label: '',
        column: 'first_page_url_fragment',
        category: ''
    },
    first_page_url_host: {
        label: '',
        column: 'first_page_url_host',
        category: ''
    },
    first_page_url_path: {
        label: '',
        column: 'first_page_url_path',
        category: ''
    },
    first_page_url_port: {
        label: '',
        column: 'first_page_url_port',
        category: ''
    },
    first_page_url_query: {
        label: '',
        column: 'first_page_url_query',
        category: ''
    },
    first_page_url_scheme: {
        label: '',
        column: 'first_page_url_scheme',
        category: ''
    },
    geo_city: {
        label: '',
        column: 'geo_city',
        category: ''
    },
    geo_country: {
        label: '',
        column: 'geo_country',
        category: ''
    },
    geo_latitude: {
        label: '',
        column: 'geo_latitude',
        category: ''
    },
    geo_longitude: {
        label: '',
        column: 'geo_longitude',
        category: ''
    },
    geo_region: {
        label: '',
        column: 'geo_region',
        category: ''
    },
    geo_region_name: {
        label: '',
        column: 'geo_region_name',
        category: ''
    },
    geo_timezone: {
        label: '',
        column: 'geo_timezone',
        category: ''
    },
    geo_zipcode: {
        label: '',
        column: 'geo_zipcode',
        category: ''
    },
    geo_latlong: {
        label: '',
        column: 'geo_latlong',
        category: ''
    },
    marketing_campaign: {
        label: '',
        column: 'marketing_campaign',
        category: ''
    },
    marketing_click_id: {
        label: '',
        column: 'marketing_click_id',
        category: ''
    },
    marketing_content: {
        label: '',
        column: 'marketing_content',
        category: ''
    },
    marketing_medium: {
        label: '',
        column: 'marketing_medium',
        category: ''
    },
    marketing_network: {
        label: '',
        column: 'marketing_network',
        category: ''
    },
    marketing_source: {
        label: '',
        column: 'marketing_source',
        category: ''
    },
    marketing_term: {
        label: '',
        column: 'marketing_term',
        category: ''
    },
    referer_medium: {
        label: '',
        column: 'referer_medium',
        category: ''
    },
    referer_source: {
        label: '',
        column: 'referer_source',
        category: ''
    },
    referer_term: {
        label: '',
        column: 'referer_term',
        category: ''
    },
    referer_url: {
        label: '',
        column: 'referer_url',
        category: ''
    },
    referer_url_fragment: {
        label: '',
        column: 'referer_url_fragment',
        category: ''
    },
    referer_url_host: {
        label: '',
        column: 'referer_url_host',
        category: ''
    },
    referer_url_path: {
        label: '',
        column: 'referer_url_path',
        category: ''
    },
    referer_url_port: {
        label: '',
        column: 'referer_url_port',
        category: ''
    },
    referer_url_query: {
        label: '',
        column: 'referer_url_query',
        category: ''
    },
    referer_url_scheme: {
        label: '',
        column: 'referer_url_scheme',
        category: ''
    },
    browser: {
        label: '',
        column: 'browser',
        category: ''
    },
    browser_build_version: {
        label: '',
        column: 'browser_build_version',
        category: ''
    },
    browser_engine: {
        label: '',
        column: 'browser_engine',
        category: ''
    },
    browser_language: {
        label: '',
        column: 'browser_language',
        category: ''
    },
    browser_major_version: {
        label: '',
        column: 'browser_major_version',
        category: ''
    },
    browser_minor_version: {
        label: '',
        column: 'browser_minor_version',
        category: ''
    },
    browser_name: {
        label: '',
        column: 'browser_name',
        category: ''
    },
    device: {
        label: '',
        column: 'device',
        category: ''
    },
    device_is_mobile: {
        label: '',
        column: 'device_is_mobile',
        category: ''
    },
    device_type: {
        label: '',
        column: 'device_type',
        category: ''
    },
    /*engaged_page_views: {
        label: '',
        column: 'engaged_page_views',
        category: ''
    },*/
    os: {
      label: '',
      column: 'os',
      category: ''  
    },
    os_build_version: {
        label: '',
        column: 'os_build_version',
        category: ''
    },
    os_major_version: {
        label: '',
        column: 'os_major_version',
        category: ''
    },
    os_manufacturer: {
        label: '',
        column: 'os_manufacturer',
        category: ''
    },
    os_minor_version: {
        label: '',
        column: 'os_minor_version',
        category: ''
    },
    os_name: {
        label: '',
        column: 'os_name',
        category: ''
    },
    os_timezone: {
        label: '',
        column: 'os_timezone',
        category: ''
    },
    ip_address: {
        label: '',
        column: 'ip_address',
        category: ''
    },
    ip_domain: {
        label: '',
        column: 'ip_domain',
        category: ''
    },
    ip_isp: {
        label: '',
        column: 'ip_isp',
        category: ''
    },
    ip_net_speed: {
        label: '',
        column: 'ip_net_speed',
        category: ''
    },
    ip_organization: {
        label: '',
        column: 'ip_organization',
        category: ''
    },
    time_engaged_in_s: {
        label: '',
        column: 'time_engaged_in_s',
        category: ''
    },
    time_engaged_in_s_tier: {
        label: '',
        column: 'time_engaged_in_s_tier',
        category: ''
    },
    user_bounced: {
        label: '',
        column: 'user_bounced',
        category: ''
    },
    user_engaged: {
        label: '',
        column: 'user_engaged',
        category: ''
    },
    new_vs_returning: {
        label: '',
        column: 'new_vs_returning',
        category: ''
    },
  },
}