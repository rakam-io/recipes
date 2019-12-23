{
  generate_jinja_for_user_properties(user_props)::
    std.map(function(prop)
      |||
        {%% if in_query.user_%(name)s %%}
          , CASE WHEN user_properties.key = '%(prop_db)s' THEN user_properties.value.%(value_type)s END as %(name)s
        {%% endif %%}
      ||| % prop, user_props),
  mappings: {
    eventTimestamp: 'event_timestamp',
    userId: 'firebase_user_id',
    deviceId: 'advertising_id',
  },
  relations: {
    rel_sessions: {
      relationType: 'oneToOne',
      joinType: 'leftJoin',
      modelName: 'sessions',
      sql: |||
        {{dimension.user_pseudo_id}} = sessions.user_pseudo_id
        AND {{dimension.event_timestamp}} >= {{model.sessions.dimension.session_start.filter}}
        AND {{dimension.event_timestamp}} <= {{model.sessions.dimension.session_end.filter}}
      |||,
    },
  },
  measures: {
    number_of_users: {
      sql: '{{dimension.firebase_user_id}}',
      aggregation: 'countUnique',
    },
    number_of_events: {
      aggregation: 'count',
    },
  },
  dimensions: {
    // App Info
    id: {
      description: 'The package name or bundle ID of the app.',
      category: 'App Info',
      type: 'string',
      sql: '{{TABLE}}.`app_info`.`id`',
    },
    firebase_app_id: {
      description: 'The Firebase App ID associated with the app',
      category: 'App Info',
      type: 'string',
      sql: '{{TABLE}}.`app_info`.`firebase_app_id`',
    },
    version: {
      category: 'App Info',
      type: 'string',
      sql: '{{TABLE}}.`app_info`.`version`',
    },
    install_source: {
      description: 'The store that installed the app.',
      category: 'App Info',
      type: 'string',
      sql: '{{TABLE}}.`app_info`.`install_source`',
    },
    category: {
      description: 'The device category (mobile, tablet, desktop).',
      category: 'Device',
      type: 'string',
      sql: '{{TABLE}}.`device`.`category`',
    },

    // Device
    browser_version: {
      category: 'Device',
      type: 'string',
      sql: '{{TABLE}}.`device`.`browser_version`',
    },
    browser: {
      category: 'Device',
      type: 'string',
      sql: '{{TABLE}}.`device`.`browser`',
    },
    advertising_id: {
      description: 'Advertising ID/IDFA.',
      category: 'Device',
      type: 'string',
      sql: '{{TABLE}}.`device`.`advertising_id`',
    },
    is_limited_ad_tracking: {
      description: "he device's Limit Ad Tracking setting.",
      category: 'Device',
      type: 'string',
      sql: '{{TABLE}}.`device`.`is_limited_ad_tracking`',
    },
    operating_system: {
      description: 'The operating system of the device.',
      category: 'Device',
      type: 'string',
      sql: '{{TABLE}}.`device`.`operating_system`',
    },
    mobile_os_hardware_model: {
      description: 'The device model information retrieved directly from the operating system.',
      type: 'string',
      sql: '{{TABLE}}.`device`.`mobile_os_hardware_model`',
    },
    mobile_model_name: {
      description: 'The device model name.',
      type: 'string',
      sql: '{{TABLE}}.`device`.`mobile_model_name`',
    },
    mobile_marketing_name: {
      description: 'The device marketing name.',
      category: 'Device',
      type: 'string',
      sql: '{{TABLE}}.`device`.`mobile_marketing_name`',
    },
    mobile_brand_name: {
      description: 'The device brand name.',
      category: 'Device',
      type: 'string',
      sql: '{{TABLE}}.`device`.`mobile_brand_name`',
    },
    language: {
      description: 'The OS language.',
      category: 'Device',
      type: 'string',
      sql: '{{TABLE}}.`device`.`is_limited_ad_tracking`',
    },
    operating_system_version: {
      description: 'The OS version.',
      category: 'Device',
      type: 'string',
      sql: '{{TABLE}}.`device`.`operating_system_version`',
    },
    time_zone_offset_seconds: {
      description: 'The offset from GMT in seconds.',
      category: 'Device',
      type: 'string',
      sql: '{{TABLE}}.`device`.`time_zone_offset_seconds`',
    },
    vendor_id: {
      description: 'IDFV (present only if IDFA is not collected).',
      category: 'Device',
      type: 'string',
      sql: '{{TABLE}}.`device`.`vendor_id`',
    },

    // Event related
    event_name: {
      sql: '{{TABLE}}.`event_name`',
    },
    event_timestamp: {
      sql: 'TIMESTAMP_MICROS({{TABLE}}.`event_timestamp`)',
      type: 'timestamp',
    },
    event_bundle_sequence_id: {
      sql: '{{TABLE}}.`event_bundle_sequence_id`',
    },
    event_dimensions: {
      sql: '{{TABLE}}.`event_dimensions`',
    },
    event_params: {
      sql: '{{TABLE}}.`event_params`',
    },
    event_previous_timestamp: {
      sql: '{{TABLE}}.`event_previous_timestamp`',
    },
    event_server_timestamp_offset: {
      sql: '{{TABLE}}.`event_server_timestamp_offset`',
    },
    event_value_in_usd: {
      sql: '{{TABLE}}.`event_value_in_usd`',
    },

    // Geo
    city: {
      description: 'The city from which events were reported, based on IP address.',
      category: 'User Location',
      type: 'string',
      sql: '{{TABLE}}.`geo`.`city`',
    },
    continent: {
      description: 'The continent from which events were reported, based on IP address.',
      category: 'User Location',
      type: 'string',
      sql: '{{TABLE}}.`geo`.`continent`',
    },
    country: {
      description: 'The country from which events were reported, based on IP address.',
      category: 'User Location',
      type: 'string',
      sql: '{{TABLE}}.`geo`.`country`',
    },
    metro: {
      description: 'The metro from which events were reported, based on IP address.',
      category: 'User Location',
      type: 'string',
      sql: '{{TABLE}}.`geo`.`metro`',
    },
    region: {
      description: 'The region from which events were reported, based on IP address.',
      category: 'User Location',
      type: 'string',
      sql: '{{TABLE}}.`geo`.`region`',
    },
    sub_continent: {
      description: 'The subcontinent from which events were reported, based on IP address.',
      category: 'User Location',
      type: 'string',
      sql: '{{TABLE}}.`geo`.`sub_continent`',
    },

    // End of GEO

    platform: {
      type: 'string',
      column: 'platform',
    },
    stream_id: {
      type: 'string',
      column: 'stream_id',
      hidden: true,
    },
    traffic_source: {
      hidden: true,
      column: 'traffic_source',
    },
    user_first_touch: {
      description: 'The time at which the user first opened the app.',
      type: 'timestamp',
      sql: 'TIMESTAMP_MICROS({{TABLE}}.`user_first_touch_timestamp`)',
    },
    user_id: {
      description: 'The user ID set via the setUserId API.',
      type: 'string',
      column: 'user_id',
    },
    user_ltv: {
      hidden: true,
      column: 'user_ltv',
    },
    user_properties: {
      hidden: true,
      column: 'user_properties',
    },
    user_pseudo_id: {
      description: 'The pseudonymous id (e.g., app instance ID) for the user.',
      column: 'user_pseudo_id',
      type: 'string',
    },
    firebase_user_id: {
      description: 'either user_id or user_pseudo_id',
      sql: 'COALESCE({{dimension.user_pseudo_id}},{{dimension.user_id}})',
    },
  },
}
