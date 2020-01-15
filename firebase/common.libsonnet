local predefined = import 'predefined.jsonnet';

{
  generate_user_dimensions(user_props)::
    std.foldl(function(a, b) a + b, std.map(function(attr) {
      ['user__' + attr.name]: {
        category: 'User Attribute',
        sql: '{{TABLE}}.`user__' + attr.name + '`',
        type: attr.type,
      },
    }, user_props), {}),
  generate_event_dimensions(event_props)::
    std.foldl(function(a, b) a + b, std.map(function(attr) {
      ['event__' + attr.name]: {
        category: 'Event Attribute',
        sql: '{{TABLE}}.`event__' + attr.name + '`',
        type: attr.type,
      },
    }, event_props), {}),
  generate_jinja_for_user_properties(user_props)::
    std.map(function(prop)
      |||
        {%% if in_query.user__%(name)s %%}
          , (SELECT value.%(value_type)s FROM UNNEST(user_properties) WHERE key = '%(prop_db)s') as user__%(name)s
        {%% endif %%}
      ||| % prop, user_props),
  generate_jinja_for_event_properties(event_props)::
    std.map(function(prop)
      |||
        {%% if in_query.event__%(name)s %%}
          , (SELECT value.%(value_type)s FROM UNNEST(event_params) WHERE key = '%(prop_db)s') as event__%(name)s
        {%% endif %%}
      ||| % prop, event_props),
  get_user_properties()::
    if std.extVar('user_properties') != null then std.extVar('user_properties') else
      [
        { name: 'last_deep_link_referrer', type: 'string', value_type: 'string_value', prop_db: 'last_deep_link_referrer', description: 'Last deep-link referrer value (2K-character limit)' },
      ],
  get_event_properties()::
    if std.extVar('event_properties') != null then std.extVar('event_properties') else
      std.flattenArrays(std.map(function(event_type) std.map(function(prop) { event_name: event_type, event_db: event_type, name: prop.name, prop_db: prop.prop_db, type: prop.type, value_type: prop.value_type }, predefined[event_type].properties), std.objectFields(predefined)))
  ,
  mappings: {
    eventTimestamp: 'event_timestamp',
    userId: 'firebase_user_id',
    deviceId: 'advertising_id',
  },
  relations: {
    //   rel_sessions: {
    //     relationType: 'oneToOne',
    //     joinType: 'leftJoin',
    //     modelName: 'sessions',
    //     sql: |||
    //       {{dimension.user_pseudo_id}} = sessions.user_pseudo_id
    //       AND {{dimension.event_timestamp}} >= {{model.sessions.dimension.session_start.filter}}
    //       AND {{dimension.event_timestamp}} <= {{model.sessions.dimension.session_end.filter}}
    //     |||,
    //   },
  },
  measures: {
    all_users: {
      sql: '{{dimension.firebase_user_id}}',
      aggregation: 'countUnique',
    },
    whales_playing: {
      aggregation: 'countUnique',
      sql: '{{dimension.firebase_user_id}}',
      filters: [
        { dimension: 'is_whale', operator: 'is', value: true, valueType: 'boolean' },
      ],
    },
    paying_users: {
      aggregation: 'countUnique',
      sql: '{{dimension.firebase_user_id}}',
      filters: [{ dimension: 'is_paying', operator: 'is', value: true, valueType: 'boolean' }],
    },
    number_of_events: {
      aggregation: 'count',
    },
    active_users: {
      aggregation: 'countUnique',
      sql: '{{dimension.firebase_user_id}}',
      filters: [
        { dimension: 'is_retained', operator: 'is', value: true, valueType: 'boolean' },
      ],
    },
    new_users: {
      aggregation: 'countUnique',
      sql: '{{dimension.firebase_user_id}}',
      filters: [
        { dimension: 'is_retained', operator: 'is', value: false, valueType: 'boolean' },
      ],
    },
  },
  dimensions: {
    event_timestamp: {
      sql: 'TIMESTAMP_MICROS({{TABLE}}.`event_timestamp`)',
      type: 'timestamp',
    },
    firebase_user_id: {
      label: 'User Id',
      description: 'either user_id or user_pseudo_id',
      // sql: 'COALESCE({{dimension.user_id}}, {{dimension.user_pseudo_id}})',
      sql: '{{dimension.user_pseudo_id}}',
    },
    platform: {
      type: 'string',
      category: 'Event',
      column: 'platform',
    },
    // Revenue
    event_value_in_usd: {
      type: 'double',
      category: 'Revenue',
      column: 'event_value_in_usd',
    },
    is_retained: {
      type: 'boolean',
      category: 'Revenue',
      sql: 'TIMESTAMP_DIFF({{dimension.event_timestamp}}, {{dimension.user_first_touch}}, DAY) > 1',
    },
    // Event related
    traffic_source: {
      hidden: true,
      category: 'Event',
      column: 'traffic_source',
    },
    user_first_touch: {
      description: 'The time at which the user first opened the app.',
      type: 'timestamp',
      category: 'Event',
      sql: 'TIMESTAMP_MICROS({{TABLE}}.`user_first_touch_timestamp`)',
    },
    user_id: {
      description: 'The user ID set via the setUserId API.',
      type: 'string',
      column: 'user_id',
      category: 'Event',
      hidden: true,
    },
    user_pseudo_id: {
      description: 'The pseudonymous id (e.g., app instance ID) which is unique for user install.',
      column: 'user_pseudo_id',
      hidden: true,
      category: 'Event',
      type: 'string',
    },
    event_server_timestamp_offset: {
      label: 'Server timestamp offset',
      sql: '{{TABLE}}.`event_server_timestamp_offset`',
      category: 'Event',
    },

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
      category: 'Device',
      sql: '{{TABLE}}.`device`.`mobile_os_hardware_model`',
    },
    mobile_model_name: {
      description: 'The device model name.',
      type: 'string',
      category: 'Device',
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
  },
}
