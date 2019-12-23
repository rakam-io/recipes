{
  in_app_purchase: {
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
    },
    revenue_from_returning_users: {
      aggregation: 'sum',
      sql: '{{dimension.price}}/1000000',
      filters: [{ dimension: 'is_returning_user', operator: 'is', value: true, valueType: 'boolean' }],
      reportOptions: { prefix: '$' },
    },
    revenue_from_new_users: {
      aggregation: 'sum',
      sql: '{{dimension.price}}/1000000',
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
}
