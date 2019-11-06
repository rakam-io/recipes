{
    app_id: {
        description: 'Application ID',
        column: 'app_id',
        category: 'Application'
    },
    platform: {
        description: 'Platform',
        column: 'platform',
        category: 'Application'
    },

    collector_tstamp: {
        description: 'Time stamp for the event recorded by the collector',
        column: 'collector_tstamp',
        category: 'Date/time'
    },
    dvce_created_tstamp: {
        description: 'Timestamp event was recorded on the client device',
        column: 'dvce_created_tstamp',
        category: 'Date/time'
    },
    dvce_sent_tstamp:{
        description: 'When the event was sent by the client device	',
        column: 'dvce_sent_tstamp',
        category: 'Date/time'
    },
    etl_tstamp: {
        description: 'Timestamp event began ETL	',
        column: 'etl_tstamp',
        category: 'Date/time'
    },
    os_timezone: {
        description: 'Client operating system timezone	',
        column: 'os_timezone',
        category: 'Date/time'
    },
    derived_tstamp: {
        description: 'Timestamp making allowance for innaccurate device clock	',
        column: 'derived_tstamp',
        category: 'Date/time'
    },
    true_tstamp: {
        description: 'User-set "true timestamp" for the event	',
        column: 'true_tstamp',
        category: 'Date/time'
    },

    event: {
        description: 'The type of event recorded	',
        column: 'event',
        category: 'Event/transaction'
    },
    event_id: {
        description: 'A UUID for each event	',
        column: 'event_id',
        category: 'Event/transaction'
    },
    txn_id: {
        description: 'Transaction ID set client-side, used to de-dupe records	',
        column: 'txn_id',
        category: 'Event/transaction'
    },
    event_fingerprint: {
        description: 'Hash client-set event fields	',
        column: 'event_fingerprint',
        category: 'Event/transaction'
    },

    v_tracker: {
        description: 'Tracker version',
        column: 'v_tracker',
        category: 'Snowplow version'
    },
    v_collector: {
        description: 'Collector version',
        column: 'v_collector',
        category: 'Snowplow version'
    },
    v_etl: {
        description: 'ETL version',
        column: 'v_etl',
        category: 'Snowplow version'
    },
    name_tracker: {
        description: 'Tracker namespace',
        column: 'name_tracker',
        category: 'Snowplow version'
    },
    etl_tags: {
        description: 'JSON of tags for this ETL run',
        column: 'etl_tags',
        category: 'Snowplow version'
    },

    user_id : {
        description: 'Unique ID set by business',
        column: 'user_id',
        category: 'User-related'
    },
    domain_userid : {
        description: 'User ID set by Snowplow using 1st party cookie',
        column: 'domain_userid',
        category: 'User-related'
    },
    network_userid : {
        description: 'User ID set by Snowplow using 3rd party cookie',
        column: 'network_userid',
        category: 'User-related'
    },
    user_ipaddress : {
        description: 'User IP address',
        column: 'user_ipaddress',
        category: 'User-related'
    },
    domain_sessionidx : {
        description: 'A visit / session index',
        column: 'domain_sessionidx',
        category: 'User-related'
    },
    domain_sessionid : {
        description: 'A visit / session identifier',
        column: 'domain_sessionid',
        category: 'User-related'
    },
    
    useragent: {
        description: 'Raw useragent',
        column: 'useragent',
        category: 'Device and operating system'
    },
    dvce_type: {
        description: 'Type of device',
        column: 'dvce_type',
        category: 'Device and operating system'
    },
    dvce_ismobile: {
        description: 'Is the device mobile?',
        column: 'dvce_ismob',
        category: 'Device and operating system'
    },
    dvce_screenheight: {
        description: 'Screen height in pixels',
        column: 'dvce_scree',
        category: 'Device and operating system'
    },
    dvce_screenwidth: {
        description: 'Screen width in pixels',
        column: 'dvce_scree',
        category: 'Device and operating system'
    },
    os_name: {
        description: 'Name of operating system',
        column: 'os_name',
        category: 'Device and operating system'
    },
    os_family: {
        description: 'Operating system family',
        column: 'os_family',
        category: 'Device and operating system'
    },
    os_manufacturer: {
        description: 'Company responsible for OS',
        column: 'os_manufac',
        category: 'Device and operating system'
    },

    geo_country: {
        description: 'ISO 3166-1 code for the country the visitor is located in',
        column: 'geo_country',
        category: 'Location'
    },
    geo_region: {
        description: 'ISO-3166-2 code for country region the visitor is in ',
        column: 'geo_region',
        category: 'Location'
    },
    geo_city: {
        description: 'City the visitor is in',
        column: 'geo_city',
        category: 'Location'
    },
    geo_zipcode: {
        description: 'Postcode the visitor is in',
        column: 'geo_zipcode',
        category: 'Location'
    },
    geo_latitude: {
        description: 'Visitor location latitude',
        column: 'geo_latitude',
        category: 'Location'
    },
    geo_longitude: {
        description: 'Visitor location longitude',
        column: 'geo_longitude',
        category: 'Location'
    },
    geo_region_name: {
        description: 'Visitor region name',
        column: 'geo_region_name',
        category: 'Location'
    },
    geo_timezone: {
        description: 'Visitor timezone name',
        column: 'geo_timezone',
        category: 'Location'
    },

    ip_isp: {
        description: 'Visitor\'s ISP',
        column: 'ip_isp',
        category: 'IP address-based'
    },
    ip_organization: {
        description: 'Organization associated with the visitor\'s IP address - defaults to ISP name if none is found',
        column: 'ip_organization',
        category: 'IP address-based'
    },
    ip_domain: {
        description: 'Second level domain name associated with the visitor\'s',
        column: 'ip_domain',
        category: 'IP address-based'
    },
    ip_netspeed: {
        description: 'Visitor\'s connection type',
        column: 'ip_netspeed',
        category: 'IP address-based'
    },

    event_vendor: {
        description: 'Who defined the event',
        column: 'event_vendor',
        category: 'Metadata'
    },
    event_name: {
        description: 'Event name',
        column: 'event_name',
        category: 'Metadata'
    },
    event_format: {
        description: 'Format for event',
        column: 'event_format',
        category: 'Metadata'
    },
    event_version: {
        description: 'Version of event schema',
        column: 'event_version',
        category: 'Metadata'
    },
}