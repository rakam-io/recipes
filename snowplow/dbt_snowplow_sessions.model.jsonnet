if std.extVar('dbt_snowplow_sessions') == null then null else {
  name: 'snowplow_sessions',
  target: std.extVar('dbt_snowplow_sessions'),
  mappings: {},
  category: 'Snowplow Pageview',
  label: 'Sessions',
  measures: {
    sessions: {
      column: 'sessions',
      aggregation: 'sum',
    },
    page_views: {
      column: 'page_views',
      aggregation: 'sum',
    },
    distinct_users: {
      sql: '{{dimension.inferred_user_id}}',
      aggregation: 'sum',
    },
    average_time_engaged_in_s: {
      sql: '{{dimension.time_engaged_in_s}}',
      aggregation: 'sum',
    },
    sessions_from_new_visitors: {  // Measure filter new_vs_returning -> new
      column: 'sessions_from_new_visitors',
      aggregation: 'sum',
    },
    sessions_from_returning_visitors: {  // Measure filter new_vs_returning -> returning
      column: 'sessions_from_returning_visitors',
      aggregation: 'sum',
    },
    percent_new_visitors: {
      sql: '{{measure.sessions_from_new_visitors}}::float / nullif({{measure.sessions}}, 0)',
    },
    percent_returning_visitors: {
      sql: '{{measure.sessions_from_returning_visitors}}::float / nullif({{measure.sessions}}, 0)',
    },
    bounced_sessions: {  // Measure filter user_bounced -> yes
      column: 'bounced_sessions',
      aggregation: 'sum',
    },
    bounce_rate: {
      sql: '{{measure.bounced_sessions}}::float / nullif({{measure.sessions}}, 0)',
    },
    sessions_per_user: {
      sql: '{{measure.sessions}}::float / nullif({{measure.distinct_users}}, 0) ;;',
    },
  },
  dimensions: {
    session_id: {
      column: 'session_id',
      category: '',
    },
    session_index: {
      column: 'session_index',
      category: '',
    },
    app_id: {
      column: 'app_id',
      category: '',
    },
    inferred_user_id: {
      column: 'inferred_user_id',
      category: '',
    },
    user_custom_id: {

      column: 'user_custom_id',
      category: '',
    },
    user_snowplow_domain_id: {
      column: 'user_snowplow_domain_id',
      category: '',
    },
    user_snowplow_crossdomain_id: {
      column: 'user_snowplow_crossdomain_id',
      category: '',
    },
    session_end: {
      column: 'session_end',
      category: '',
    },
    session_end_local: {
      column: 'session_end_local',
      category: '',
    },
    session_start: {
      column: 'session_start',
      category: '',
    },
    session_start_local: {
      column: 'session_start_local',
      category: '',
    },
    first_page_title: {
      column: 'first_page_title',
      category: '',
    },
    first_page_url: {
      column: 'first_page_url',
      category: '',
    },
    first_page_url_fragment: {
      column: 'first_page_url_fragment',
      category: '',
    },
    first_page_url_host: {
      column: 'first_page_url_host',
      category: '',
    },
    first_page_url_path: {
      column: 'first_page_url_path',
      category: '',
    },
    first_page_url_port: {
      column: 'first_page_url_port',
      category: '',
    },
    first_page_url_query: {
      column: 'first_page_url_query',
      category: '',
    },
    first_page_url_scheme: {
      column: 'first_page_url_scheme',
      category: '',
    },
    geo_city: {
      column: 'geo_city',
      category: '',
    },
    geo_country: {
      column: 'geo_country',
      category: '',
    },
    geo_latitude: {
      column: 'geo_latitude',
      category: '',
    },
    geo_longitude: {
      column: 'geo_longitude',
      category: '',
    },
    geo_region: {
      column: 'geo_region',
      category: '',
    },
    geo_region_name: {
      column: 'geo_region_name',
      category: '',
    },
    geo_timezone: {
      column: 'geo_timezone',
      category: '',
    },
    geo_zipcode: {
      column: 'geo_zipcode',
      category: '',
    },
    /*geo_latlong: {
                column: 'geo_latlong',
        category: ''
    },*/
    marketing_campaign: {
      column: 'marketing_campaign',
      category: '',
    },
    marketing_click_id: {
      column: 'marketing_click_id',
      category: '',
    },
    marketing_content: {
      column: 'marketing_content',
      category: '',
    },
    marketing_medium: {
      column: 'marketing_medium',
      category: '',
    },
    marketing_network: {
      column: 'marketing_network',
      category: '',
    },
    marketing_source: {
      column: 'marketing_source',
      category: '',
    },
    marketing_term: {
      column: 'marketing_term',
      category: '',
    },
    referer_medium: {
      column: 'referer_medium',
      category: '',
    },
    referer_source: {
      column: 'referer_source',
      category: '',
    },
    referer_term: {
      column: 'referer_term',
      category: '',
    },
    referer_url: {
      column: 'referer_url',
      category: '',
    },
    referer_url_fragment: {
      column: 'referer_url_fragment',
      category: '',
    },
    referer_url_host: {
      column: 'referer_url_host',
      category: '',
    },
    referer_url_path: {
      column: 'referer_url_path',
      category: '',
    },
    referer_url_port: {
      column: 'referer_url_port',
      category: '',
    },
    referer_url_query: {
      column: 'referer_url_query',
      category: '',
    },
    referer_url_scheme: {
      column: 'referer_url_scheme',
      category: '',
    },
    browser: {
      column: 'browser',
      category: '',
    },
    browser_build_version: {
      column: 'browser_build_version',
      category: '',
    },
    browser_engine: {
      column: 'browser_engine',
      category: '',
    },
    browser_language: {
      column: 'browser_language',
      category: '',
    },
    browser_major_version: {
      column: 'browser_major_version',
      category: '',
    },
    browser_minor_version: {
      column: 'browser_minor_version',
      category: '',
    },
    browser_name: {
      column: 'browser_name',
      category: '',
    },
    device: {
      column: 'device',
      category: '',
    },
    device_is_mobile: {
      column: 'device_is_mobile',
      category: '',
    },
    device_type: {
      column: 'device_type',
      category: '',
    },
    /*engaged_page_views: {
                column: 'engaged_page_views',
        category: ''
    },*/
    os: {
      column: 'os',
      category: '',
    },
    os_build_version: {
      column: 'os_build_version',
      category: '',
    },
    os_major_version: {
      column: 'os_major_version',
      category: '',
    },
    os_manufacturer: {
      column: 'os_manufacturer',
      category: '',
    },
    os_minor_version: {
      column: 'os_minor_version',
      category: '',
    },
    os_name: {
      column: 'os_name',
      category: '',
    },
    os_timezone: {
      column: 'os_timezone',
      category: '',
    },
    ip_address: {
      column: 'ip_address',
      category: '',
    },
    ip_domain: {
      column: 'ip_domain',
      category: '',
    },
    ip_isp: {
      column: 'ip_isp',
      category: '',
    },
    ip_net_speed: {
      column: 'ip_net_speed',
      category: '',
    },
    ip_organization: {
      column: 'ip_organization',
      category: '',
    },
    time_engaged_in_s: {
      column: 'time_engaged_in_s',
      category: '',
    },
    time_engaged_in_s_tier: {
      column: 'time_engaged_in_s_tier',
      category: '',
    },
    user_bounced: {
      column: 'user_bounced',
      category: '',
    },
    /*user_engaged: {
                column: 'user_engaged',
        category: ''
    },*/
    /*new_vs_returning: {
                column: 'new_vs_returning',
        category: ''
    },*/
  },
}
