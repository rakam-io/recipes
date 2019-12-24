{
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
}
