local predefined = {
  user_engagement: {
    description: 'When a user engages the app for more than the minimum session duration after a period of inactivity that exceeds the session timeout duration.',
    properties: [
      { name: 'engagement_time_msec', prop_db: 'engagement_time_msec', type: 'integer', value_type: 'int_value' },
    ],
    measures: {
      average_engagement_time: {
        aggregation: 'average',

      },
    },
  },
  session_start: {
    description: 'when a user engages the app for more than the minimum session duration after a period of inactivity that exceeds the session timeout duration.\t',
    properties: [],
  },
  ad_impression: {
    description: 'When a user sees an ad impression Publisher events coming from AdMob via the Google Mobile Ads SDK',
    properties: [
      { name: 'ad_event_id', prop_db: 'ad_event_id', type: 'string', value_type: 'string' },
    ],
  },
  first_open: {
    description: 'The first time a user launches an app after installing or re-installing it. This event is not triggered when a user downloads the app onto a device, but instead when he or she first uses it. To see raw download numbers, look in Google Play Developer Console or in iTunesConnect.',
    properties: [],
  },
  ad_click: {
    description: 'when a user clicks an ad. Publisher events coming from AdMob via the Google Mobile Ads SDK',
    properties: [
      { name: 'ad_event_id', prop_db: 'ad_event_id', type: 'string', value_type: 'string' },
    ],
  },
  app_update: {
    description: 'when the app is updated to a new version and launched again The previous app version id is passed as a parameter. This event is conceptually different from the Daily upgrades by device metric, which is reported by Google Play Developer Console.  An upgrade refers to the updating of the application binary, whereas an app_update event is triggered upon the subsequent launch of the upgraded app.',
    properties: [
      { name: 'previous_app_version', prop_db: 'previous_app_version', type: 'string', value_type: 'string' },
    ],
  },
  in_app_purchase: {
    description: 'When a user completes an in-app purchase, including an initial subscription, that is processed by the App Store on iTunes or by Google Play.',
    properties: [
      { name: 'product_id', prop_db: 'product_id', type: 'string', value_type: 'string' },
      { name: 'value', prop_db: 'value', type: 'integer', value_type: 'int_value' },
      { name: 'subscription', prop_db: 'subscription', type: 'integer', value_type: 'int_value' },
      { name: 'price', prop_db: 'price', type: 'integer', value_type: 'int_value' },
      { name: 'quantity', prop_db: 'quantity', type: 'integer', value_type: 'int_value' },
      { name: 'currency', prop_db: 'currency', type: 'string', value_type: 'string_value' },
      { name: 'free_trial', prop_db: 'free_trial', type: 'integer', value_type: 'int_value' },
    ],
    measures: {
      paying_users: {
        aggregation: 'countUnique',
        sql: '{{dimension.firebase_user_id}}',
        filters: [{ dimension: 'is_paying', operator: 'is', value: true, valueType: 'boolean' }],
      },
      whales_playing: {
        aggregation: 'countUnique',
        sql: '{{dimension.firebase_user_id}}',
        filters: [
          { dimension: 'is_whale', operator: 'is', value: true, valueType: 'boolean' },
        ],
      },
      revenue: {
        aggregation: 'sum',
        sql: '{{dimension.price}}/1000000',
        reportOptions: { prefix: '$', formatNumbers: true },
      },
      transaction_count_per_paying_user: {
        sql: 'count(*)/{{count(distinct {{dimension.firebase_user_id}})}}',
      },
      average_transaction_per_paying_user: {
        sql: '{{measure.revenue}}/{{measure.paying_users}}',
      },
      revenue_from_returning_users: {
        aggregation: 'sum',
        sql: '{{dimension.price}}/1000000',
        filters: [{ dimension: 'is_returning_user', operator: 'is', value: true, valueType: 'boolean' }],
        reportOptions: { prefix: '$' },
      },
      revenue_from_new_users: {
        aggregation: 'sum',
        sql: '{{dimension.price}} / 1000000',
        filters: [{ dimension: 'is_returning_user', operator: 'is', value: false, valueType: 'boolean' }],
        reportOptions: { prefix: '$' },
      },
      revenue_from_whales: {
        sql: '{{measure.revenue}}',
        filters: [{ dimension: 'is_whale', operator: 'is', value: true, valueType: 'boolean' }],
      },
      revenue_whales_ratio: {
        sql: '{{measure.revenue_from_whales}} / {{measure.revenue}}',
      },
    },
    dimensions: {
      is_whale: {
        sql: "{{TABLE}}.`user_ltv`.`revenue` > 99 AND {{TABLE}}.`user_ltv`.`currency` = 'USD'",
      },
      is_paying: {
        sql: '{{TABLE}}.`user_ltv`.`revenue` > 0',
      },
      ltv_revenue: {
        sql: '{{TABLE}}.`user_ltv`.`revenue`',
        hidden: true,
      },
      ltv_currency: {
        sql: '{{TABLE}}.`user_ltv`.`currency`',
        hidden: true,
      },
    },
  },
};

{
  generate_jinja_for_user_properties(user_props)::
    std.map(function(prop)
      |||
        {%% if in_query.user_%(name)s %%}
          , CASE WHEN user_properties.key = '%(prop_db)s' THEN user_properties.value.%(value_type)s END as %(name)s
        {%% endif %%}
      ||| % prop, user_props),
  get_user_properties()::
    // if std.extVar('user_properties') then std.extVar('user_properties') else
    [
      { name: 'first_open_time', type: 'string', value_type: 'string_value', prop_db: 'first_open_time', description: 'UTC time when the user first launched the app (in milliseconds rounded to the nearest full hour)' },
      { name: 'last_deep_link_referrer', type: 'string', value_type: 'string_value', prop_db: 'last_deep_link_referrer', description: 'Last deep-link referrer value (2K-character limit)' },
    ],
  get_event_properties()::
    // if std.extVar('event_properties') then std.extVar('event_properties') else
    std.flattenArrays(std.map(function(event_type) std.map(function(prop) { event_name: event_type, event_db: event_type, name: prop.name, prop_db: prop.prop_db, type: prop.type, value_type: prop.value_type }, predefined[event_type].properties), std.objectFields(predefined)))
  ,
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
    active_users: {
      sql: '{{dimension.firebase_user_id}}',
      aggregation: 'countUnique',
    },
    number_of_events: {
      aggregation: 'count',
    },
    returning_users: {
      aggregation: 'countUnique',
      sql: '{{dimension.returning_user_id}}',
    },
    new_users: {
      aggregation: 'countUnique',
      sql: '{{dimension.user_first_open_time}} IS NULL',
    },
  },
  dimensions: {
    returning_user_id: {
      sql: 'IFNULL({{dimension.user_first_open_time}}, {{dimension.firebase_user_id}})',
      type: 'string',
      hidden: true,
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
  predefined: predefined,
}
