{
  dimensions: {
    app_cache_time_in_ms: 'Time to fetch resource from relevant application cache',
    app_id: 'Application ID',
    dns_time_in_ms: 'Time to complete domain lookup',
    dom_interactive_to_complete_time_in_ms: "Time for the current document readiness to change from 'interactive' to 'complete'",
    dom_loading_to_interactive_time_in_ms: "Time for the current document readiness to change from 'loading' to 'interactive'",
    onload_time_in_ms: 'Time to complete the load event',
    processing_time_in_ms: 'Processing time',
    redirect_time_in_ms: 'Time to redirect the visitor',
    tcp_time_in_ms: 'Time to establish connection',
    total_time_in_ms: 'Total time from navigation start to load event completion',
    unload_time_in_ms: 'Time to complete the unload event',
    horizontal_percentage_scrolled: 'Percentage of page scrolled horizontally',
    horizontal_pixels_scrolled: 'Distance the user scrolled horizontally in pixels',
    vertical_percentage_scrolled: 'Percentage of page scrolled vertically',
    vertical_percentage_scrolled_tier: 'Range of percentage of page scrolled vertically',
    vertical_pixels_scrolled: 'Distance the user scrolled vertically in pixels',
    ip_address: 'The IP address of the visitor',
    ip_domain: "Second level domain name associated with the visitor's IP address",
    ip_isp: "Visitor's ISP",
    ip_net_speed: "Visitor's connection type",
    ip_organization: "Organization associated with the visitor's IP address - defaults to ISP name if none is found",

    // testst
    geo_city: 'City the visitor is in',
    geo_country: 'ISO 3166-1 code for the country the visitor is located in',
    geo_latitude: 'Visitor location latitude',
    geo_longitude: 'Visitor location longitude',
    geo_region: 'ISO-3166-2 code for country region the visitor is in',
    geo_region_name: 'Visitor region name',
    geo_timezone: 'Visitor timezone name',
    geo_zipcode: 'Postcode the visitor is in',

    marketing_campaign: 'The campaign ID',
    marketing_click_id: 'The click ID',
    marketing_content: 'The content of the ad. (Or an ID so that it can be looked up.)',
    marketing_medium: 'Type of traffic source',
    marketing_network: 'The ad network to which the click ID belongs',
    marketing_source: 'The company / website where the traffic came from',
    marketing_term: '',
    referer_medium: 'Type of referer',
    referer_source: 'Name of referer if recognised',
    referer_term: 'Keywords if source is a search engine',
    referer_url: 'The referer URL',
    referer_url_fragment: 'Referer URL fragment',
    referer_url_host: 'Referer host',
    referer_url_path: 'Referer page path',
    referer_url_port: 'Referer port',
    referer_url_query: 'Referer URL querystring',
    referer_url_scheme: 'Referer scheme',

    browser: "The name and version of the visitor's browser",
    browser_build_version: 'Browser build version',
    browser_engine: 'Browser rendering engine',
    browser_language: 'Language the browser is set to',
    browser_major_version: 'Browser major version',
    browser_minor_version: 'Browser minor version',
    browser_name: "The name, or family, of the visitor's browser",
    device: 'Device model',
    device_is_mobile: 'Is the device mobile?',
    device_type: 'Type of device',
    os: "The name and version of the visitor's OS",
    os_build_version: 'OS build version',
    os_major_version: 'OS major version',
    os_manufacturer: 'OS manufacturer',
    os_minor_version: 'OS minor version',
    os_name: "The name of the visitor's OS",
    os_timezone: 'Time zone the OS is set to',
    time_engaged_in_s: 'Time spent by the user on this visit',
    time_engaged_in_s_tier: 'Range of time spent by the user on this visit',
    user_bounced: 'Did the user bounce on their first page view in this session?',

    max_tstamp: '',
    min_tstamp: '',
    page_height: "The page's height in pixels",
    age_width: "The page's width in pixels",
    page_title: 'Web page title',
    page_url: 'The page URL',
    page_url_fragment: 'Fragment aka anchor',
    page_url_host: 'Host aka domain',
    page_url_path: 'Path to page',
    page_url_port: 'Port if specified, 80 if not',
    page_url_query: 'Query String',
    page_url_scheme: 'Scheme aka protocol',
    page_view_date: '',
    page_view_end: 'Timestamp for the end of the page view on your preferred clock',
    page_view_end_local: "Timestamp for the end of the page view on the user's clock",
    page_view_hour: '',
    page_view_id: 'Universally unique identifier',
    page_view_in_session_index: 'A page view index within a single session',
    page_view_index: '',
    page_view_start: 'Timestamp for the start of the page view on your preferred clock',
    page_view_start_local: "Timestamp for the start of the page view on the user's clock",
    request_time_in_ms: 'Time between the user agent sending a request and receiving the first byte of the response',
    response_time_in_ms: 'Time to complete the response',
    session_id: 'A visit / session identifier',
    session_index: 'A visit / session index',
    user_custom_id: 'Unique ID set by business, user_id atomic field',
    user_engaged: 'Did the user engage with the page?',
    user_snowplow_crossdomain_id: 'User ID set by Snowplow using 3rd party cookie',
    user_snowplow_domain_id: 'User ID set by Snowplow using 1st party cookie',
  },
}