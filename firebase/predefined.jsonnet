{
  level: {
    properties: [],
    dimensions: {
      event__level_num_fl: {
        sql: 'CAST({{dimension.event__level_num}} AS FLOAT64)',
        type: 'double',
      },
      event__difficulty_readable: {
        sql: |||
          CASE WHEN {{dimension.event__difficulty}} = 1 THEN 'Good'
           WHEN {{dimension.event__difficulty}} = 2 THEN 'Better'
           WHEN {{dimension.event__difficulty}} = 3 THEN 'Best'
           WHEN {{dimension.event__difficulty}} = 4 THEN 'Grind'
          END
        |||,
        type: 'string',
      },
    },
    measures: {
      total_wins: {
        aggregation: 'count',
        filters: [{ dimension: 'event__level_outcome', operator: 'equals', value: 1, valueType: 'integer' }],
      },
      win_loss_ratio: {
        sql: 'IEEE_DIVIDE(COUNTIF({{dimension.event__level_outcome}} = 1), COUNTIF({{dimension.event__level_outcome}} = 0))',
        reportOptions: { formatNumbers: '0.00%' },
      },
      total_losses: {
        aggregation: 'count',
        filters: [{ dimension: 'event__level_outcome', operator: 'equals', value: 0, valueType: 'integer' }],
      },
      total_exists: {
        aggregation: 'count',
        filters: [{ dimension: 'event__level_outcome', operator: 'equals', value: 2, valueType: 'integer' }],
      },
      total_exists_without_playing: {
        aggregation: 'count',
        filters: [{ dimension: 'event__level_outcome', operator: 'equals', value: 3, valueType: 'integer' }],
      },
      win_ratio: {
        label: 'Win Ratio %',
        sql: 'IEEE_DIVIDE({{measure.total_wins}}, ({{measure.total_wins}} + {{measure.total_losses}}))',
        reportOptions: { formatNumbers: '0.00%' },
      },
      number_of_times_5moves_bought_ratio: {
        label: '+ 5 Moves in %',
        sql: 'IEEE_DIVIDE(SUM({{dimension.event__number_of_times_5moves_bought}}), SUM({{dimension.event__number_times_played}}))',
        reportOptions: { formatNumbers: '0.00%' },
      },
      boosters_use_ratio: {
        label: 'Boosters %',
        sql: 'IEEE_DIVIDE(SUM({{dimension.event__count_boosters_used}}), SUM({{dimension.event__number_times_played}}))',
        reportOptions: { formatNumbers: '0.00%' },
      },
      superboosters_use_ratio: {
        label: 'SuperBoost %',
        sql: 'IEEE_DIVIDE(SUM({{dimension.event__count_superboosts}}), SUM({{dimension.event__number_times_played}}))',
        reportOptions: { formatNumbers: '0.00%' },
      },
      average_moves_left: {
        label: 'Avg. Moves Left',
        sql: 'IEEE_DIVIDE(SUM({{dimension.event__moves_left}}), COUNTIF({{dimension.event__level_outcome}} = 1))',
        reportOptions: { formatNumbers: '0.00' },
      },
      strategic_assist_enabled_ratio: {
        label: 'SAS enabled %',
        sql: 'IEEE_DIVIDE(SUM({{dimension.event__strategic_assist_enabled}}), SUM({{dimension.event__number_times_played}}))',
        reportOptions: { formatNumbers: '0.00%' },
      },
      average_tilekinds_percentage: {
        label: 'TileKind %',
        aggregation: 'average',
        sql: '{{dimension.event__goal_delta_percentage_tile_kinds}} / 100',
        reportOptions: { formatNumbers: '0.00%' },
      },
      average_score_percentage: {
        label: 'Score %',
        aggregation: 'average',
        sql: '{{dimension.event__goal_delta_percentage_score}} / 100',
        reportOptions: { formatNumbers: '0.00%' },
      },
      average_backgrounds_percentage: {
        label: 'Backgrounds %',
        aggregation: 'average',
        sql: '{{dimension.event__goal_delta_percentage_backgrounds}} / 100',
        reportOptions: { formatNumbers: '0.00%' },
      },
      average_drop_items_percentage: {
        label: 'Drop Items%',
        aggregation: 'average',
        sql: '{{dimension.event__goal_delta_percentage_drop_items}} / 100',
        reportOptions: { formatNumbers: '0.00%' },
      },
      average_crates_percentage: {
        label: 'Crates %',
        aggregation: 'average',
        sql: '{{dimension.event__goal_delta_percentage_stickers}} / 100',
        reportOptions: { formatNumbers: '0.00%' },
      },
      average_balloons_percentage: {
        label: 'Balloons %',
        aggregation: 'average',
        sql: '{{dimension.event__goal_delta_percentage_litters}} / 100',
        reportOptions: { formatNumbers: '0.00%' },
      },
      average_pinata_percentage: {
        label: 'Pinata %',
        aggregation: 'average',
        sql: '{{dimension.event__goal_delta_percentage_pinata}} / 100',
        reportOptions: { formatNumbers: '0.00%' },
      },
      average_furrypals_percentage: {
        label: 'FurryPals %',
        aggregation: 'average',
        sql: '{{dimension.event__goal_delta_percentage_animal}} / 100',
        reportOptions: { formatNumbers: '0.00%' },
      },
    },
  },
  user_engagement: {
    description: 'When a user engages the app for more than the minimum session duration after a period of inactivity that exceeds the session timeout duration.',
    properties: [
      { name: 'engagement_time_msec', prop_db: 'engagement_time_msec', type: 'integer', value_type: 'int_value' },
    ],
    measures: {
      average_engagement_time: {
        aggregation: 'average',
        column: 'engagement_time_msec',
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
      total_transactions: {
        aggregation: 'count',
      },
      revenue: {
        aggregation: 'sum',
        column: 'event_value_in_usd',
        reportOptions: { formatNumbers: '$0,0' },
      },
      transaction_count_per_paying_user: {
        sql: 'IEEE_DIVIDE({{measure.total_transactions}}, {{measure.paying_users}})',
      },
      average_transaction_per_paying_user: {
        sql: 'IEEE_DIVIDE({{measure.revenue}}, {{measure.paying_users}})',
        reportOptions: { formatNumbers: '$0,0' },
      },
      revenue_from_retained_users: {
        aggregation: 'sum',
        column: 'event_value_in_usd',
        filters: [
          { dimension: 'is_retained', operator: 'is', value: true, valueType: 'boolean' },
        ],
        reportOptions: { formatNumbers: '$0,0' },
      },
      revenue_from_new_users: {
        aggregation: 'sum',
        column: 'event_value_in_usd',
        filters: [
          { dimension: 'is_retained', operator: 'is', value: false, valueType: 'boolean' },
        ],
        reportOptions: { formatNumbers: '$0,0' },
      },
      revenue_from_whales: {
        aggregation: 'sum',
        column: 'event_value_in_usd',
        filters: [{ dimension: 'is_whale', operator: 'is', value: true, valueType: 'boolean' }],
        reportOptions: { formatNumbers: '$0,0' },
      },
      revenue_whales_ratio: {
        sql: 'IEEE_DIVIDE({{measure.revenue_from_whales}}, {{measure.revenue}})',
        reportOptions: { formatNumbers: '0.0%' },
      },
    },
  },
}
