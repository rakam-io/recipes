if std.extVar('dbt_snowplow_page_views') == null then null else {
  name: 'snowplow_page_views',
  target: std.extVar('dbt_snowplow_page_views'),
  mappings: {},
  category: 'Snowplow Pageview',
  label: 'Pageviews',
  measures: {
    all_events: {
      aggregation: 'count',
    },
  },
  dimensions: {
    /* App */
    app_cache_time_in_ms: {
      column: 'app_cache_time_in_ms',
      category: 'App',
    },
    app_id: {
      column: 'app_id',
      category: 'App',
    },

    /* Browser */
    browser: {
      column: 'browser',
      category: 'Browser',
    },
    browser_build_version: {
      column: 'browser_build_version',
      category: 'Browser',
    },
    browser_engine: {
      column: 'browser_engine',
      category: 'Browser',
    },
    browser_language: {
      column: 'browser_language',
      category: 'Browser',
    },
    browser_major_version: {
      column: 'browser_major_version',
      category: 'Browser',
    },
    browser_minor_version: {
      column: 'browser_minor_version',
      category: 'Browser',
    },
    browser_name: {
      column: 'browser_name',
      category: 'Browser',
    },
    browser_window_height: {
      column: 'browser_window_height',
      category: 'Browser',
    },
    browser_window_width: {
      column: 'browser_window_width',
      category: 'Browser',
    },

    /* Device */
    device: {
      column: 'device',
      category: 'Device',
    },
    device_is_mobile: {
      column: 'device_is_mobile',
      category: 'Device',
    },
    device_type: {
      column: 'device_type',
      category: 'Device',
    },

    /* Load Time */
    dns_time_in_ms: {
      column: 'dns_time_in_ms',
      category: 'Load Time',
    },
    dom_interactive_to_complete_time_in_ms: {
      column: 'dom_interactive_to_complete_time_in_ms',
      category: 'Load Time',
    },
    dom_loading_to_interactive_time_in_ms: {
      column: 'dom_loading_to_interactive_time_in_ms',
      category: 'Load Time',
    },
    onload_time_in_ms: {
      column: 'onload_time_in_ms',
      category: 'Load Time',
    },
    processing_time_in_ms: {
      column: 'processing_time_in_ms',
      category: 'Load Time',
    },
    redirect_time_in_ms: {
      column: 'redirect_time_in_ms',
      category: 'Load Time',
    },
    tcp_time_in_ms: {
      column: 'tcp_time_in_ms',
      category: 'Load Time',
    },
    time_engaged_in_s: {
      column: 'time_engaged_in_s',
      category: 'Load Time',
    },
    time_engaged_in_s_tier: {
      column: 'time_engaged_in_s_tier',
      category: 'Load Time',
    },
    total_time_in_ms: {
      column: 'total_time_in_ms',
      category: 'Load Time',
    },
    unload_time_in_ms: {
      column: 'unload_time_in_ms',
      category: 'Load Time',
    },

    /* GEO */

    geo_city: {
      column: 'geo_city',
      category: 'Geo',
    },
    geo_country: {
      column: 'geo_country',
      category: 'Geo',
    },
    geo_latitude: {
      column: 'geo_latitude',
      category: 'Geo',
    },
    geo_longitude: {
      column: 'geo_longitude',
      category: 'Geo',
    },
    geo_region: {
      column: 'geo_region',
      category: 'Geo',
    },
    geo_region_name: {
      column: 'geo_region_name',
      category: 'Geo',
    },
    geo_timezone: {
      column: 'geo_timezone',
      category: 'Geo',
    },
    geo_zipcode: {
      column: 'geo_zipcode',
      category: 'Geo',
    },
    // geo_location: {
    //   type: 'location',
    //   category: 'Geo',
    //   column: {
    //     latitude: 'geo_latitude',
    //     longitude: 'geo_longitude',
    //   },
    // },

    /* Scrolling */
    horizontal_percentage_scrolled: {
      column: 'horizontal_percentage_scrolled',
      category: 'Scrolling',
    },
    horizontal_pixels_scrolled: {
      column: 'horizontal_pixels_scrolled',
      category: 'Scrolling',
    },
    vertical_percentage_scrolled: {
      column: 'vertical_percentage_scrolled',
      category: 'Scrolling',
    },
    vertical_percentage_scrolled_tier: {
      column: 'vertical_percentage_scrolled_tier',
      category: 'Scrolling',
    },
    vertical_pixels_scrolled: {
      column: 'vertical_pixels_scrolled',
      category: 'Scrolling',
    },

    /* IP */
    address: {
      column: 'ip_address',
      category: 'IP',
    },
    ip_domain: {
      column: 'ip_domain',
      category: 'IP',
    },
    ip_isp: {
      column: 'ip_isp',
      category: 'IP',
    },
    ip_net_speed: {
      column: 'ip_net_speed',
      category: 'IP',
    },
    ip_organization: {
      column: 'ip_organization',
      category: 'IP',
    },

    /* Marketing */
    marketing_campaign: {
      column: 'marketing_campaign',
      category: 'Marketing',
    },
    marketing_click_id: {
      column: 'marketing_click_id',
      category: 'Marketing',
    },
    marketing_content: {
      column: 'marketing_content',
      category: 'Marketing',
    },
    marketing_medium: {
      column: 'marketing_medium',
      category: 'Marketing',
    },
    marketing_network: {
      column: 'marketing_network',
      category: 'Marketing',
    },
    marketing_source: {
      column: 'marketing_source',
      category: 'Marketing',
    },
    marketing_term: {
      column: 'marketing_term',
      category: 'Marketing',
    },

    /* Timestamps */
    max_tstamp: {
      column: 'max_tstamp',
      category: 'Timestamps',
    },
    min_tstamp: {
      column: 'min_tstamp',
      category: 'Timestamps',
    },

    /* OS */
    os: {
      column: 'os',
      category: 'OS',
    },
    os_build_version: {
      column: 'os_build_version',
      category: 'OS',
    },
    os_major_version: {
      column: 'os_major_version',
      category: 'OS',
    },
    os_manufacturer: {
      column: 'os_manufacturer',
      category: 'OS',
    },
    os_minor_version: {
      column: 'os_minor_version',
      category: 'OS',
    },
    os_name: {
      column: 'os_name',
      category: 'OS',
    },
    os_timezone: {
      column: 'os_timezone',
      category: 'OS',
    },

    /* Page */
    page_height: {
      column: 'page_height',
      category: 'Page',
    },
    page_width: {
      column: 'page_width',
      category: 'Page',
    },
    page_title: {
      column: 'page_title',
      category: 'Page',
    },
    page_url: {
      column: 'page_url',
      category: 'Page',
    },
    page_url_fragment: {
      column: 'page_url_fragment',
      category: 'Page',
    },
    page_url_host: {
      column: 'page_url_host',
      category: 'Page',
    },
    page_url_path: {
      column: 'page_url_path',
      category: 'Page',
    },
    page_url_port: {
      column: 'page_url_port',
      category: 'Page',
    },
    page_url_query: {
      column: 'page_url_query',
      category: 'Page',
    },
    page_url_scheme: {
      column: 'page_url_scheme',
      category: 'Page',
    },

    /* Page View */
    page_view_date: {
      column: 'page_view_date',
      category: 'Page View',
    },
    page_view_end: {
      column: 'page_view_end',
      category: 'Page View',
    },
    page_view_end_local: {
      column: 'page_view_end_local',
      category: 'Page View',
    },
    page_view_hour: {
      column: 'page_view_hour',
      category: 'Page View',
    },
    page_view_id: {
      column: 'page_view_id',
      category: 'Page View',
    },
    page_view_in_session_index: {
      column: 'page_view_in_session_index',
      category: 'Page View',
    },
    page_view_index: {
      column: 'page_view_index',
      category: 'Page View',
    },
    /*page_view_local_day_of_week: {
            column: 'page_view_local_day_of_week',
      category: 'Page View',
    },
    page_view_local_day_of_week_index: {
            column: 'page_view_local_day_of_week_index',
      category: 'Page View',
    },
    page_view_local_hour_of_day: {
            column: 'page_view_local_hour_of_day',
      category: 'Page View',
    },*/
    /*page_view_local_time: {
            column: 'page_view_local_time',
      category: 'Page View',
    },
    page_view_local_time_of_day: {
            column: 'page_view_local_time_of_day',
      category: 'Page View',
    },
    page_view_minute: {
            column: 'page_view_minute',
      category: 'Page View',
    },
    page_view_month: {
            column: 'page_view_month',
      category: 'Page View',
    },
    page_view_quarter: {
            column: 'page_view_quarter',
      category: 'Page View',
    },*/
    page_view_start: {
      column: 'page_view_start',
      category: 'Page View',
    },
    page_view_start_local: {
      column: 'page_view_start_local',
      category: 'Page View',
    },
    /*page_view_time: {
            column: 'page_view_time',
      category: 'Page View',
    },
    page_view_week: {
            column: 'page_view_week',
      category: 'Page View',
    },
    page_view_year: {
            column: 'page_view_year',
      category: 'Page View',
    },*/

    /* Referrer */
    referer_medium: {
      column: 'referer_medium',
      category: 'Referer',
    },
    referer_source: {
      column: 'referer_source',
      category: 'Referer',
    },
    referer_term: {
      column: 'referer_term',
      category: 'Referer',
    },
    referer_url: {
      column: 'referer_url',
      category: 'Referer',
    },
    referer_url_fragment: {
      column: 'referer_url_fragment',
      category: 'Referer',
    },
    referer_url_host: {
      column: 'referer_url_host',
      category: 'Referer',
    },
    referer_url_path: {
      column: 'referer_url_path',
      category: 'Referer',
    },
    referer_url_port: {
      column: 'referer_url_port',
      category: 'Referer',
    },
    referer_url_query: {
      column: 'referer_url_query',
      category: 'Referer',
    },
    referer_url_scheme: {
      column: 'referer_url_scheme',
      category: 'Referer',
    },

    /* Performance */
    request_time_in_ms: {
      column: 'request_time_in_ms',
      category: 'Performance',
    },
    response_time_in_ms: {
      column: 'response_time_in_ms',
      category: 'Performance',
    },

    /* Session */
    session_id: {
      column: 'session_id',
      category: 'Session',
    },
    session_index: {
      column: 'session_index',
      category: 'Session',
    },

    /* User */
    user_bounced: {
      column: 'user_bounced',
      category: 'User',
    },
    user_custom_id: {
      column: 'user_custom_id',
      category: 'User',
    },
    user_engaged: {
      column: 'user_engaged',
      category: 'User',
    },
    user_snowplow_crossdomain_id: {
      column: 'user_snowplow_crossdomain_id',
      category: 'User',
    },
    user_snowplow_domain_id: {
      column: 'user_snowplow_domain_id',
      category: 'User',
    },
  },
}
