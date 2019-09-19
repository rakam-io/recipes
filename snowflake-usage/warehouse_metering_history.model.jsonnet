{
  name: 'snowflake.warehouse_metering_history',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'WAREHOUSE_METERING_HISTORY' },
  measures: {
    count: {
      aggregation: 'count',
    },
    average_credits_used: {
      aggregation: 'average',
      column: 'credits_used',
    },
    total_credits_used: {
      aggregation: 'sum',
      column: 'credits_used',
    },
    current_month_credits_used: {
      aggregation: 'sum',
      column: 'credits_used',
      filters: [{ dimension: 'start_date', operator: 'between', value: 'P1M', valueType: 'timestamp' }],
      reportOptions: {
        prefix: '$',
      },
    },
  },
  dimensions: {
    start_time: {
      column: 'START_TIME',
      timeframes: [],
    },
    end_time: {
      column: 'END_TIME',
      timeframes: [],
    },
    warehouse_name: {
      column: 'WAREHOUSE_NAME',
    },
    is_prior_month_mtd: {
      type: 'boolean',
      sql: 'EXTRACT(month, {{dimension.start_time}}) = EXTRACT(month, current_timestamp()) - 1 and {{dimension.start_time}} <= dateadd(month, -1, current_timestamp())',
    },
  },
}
