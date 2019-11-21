{
  name: 'snowflake_warehouse_metering_history',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'WAREHOUSE_METERING_HISTORY' },
  mappings: {
    eventTimestamp: 'start_time',
  },
  measures: {
    count: {
      aggregation: 'count',
    },
    average_credits_used: {
      aggregation: 'average',
      column: 'CREDITS_USED',
    },
    total_credits_used: {
      aggregation: 'sum',
      column: 'CREDITS_USED',
    },
    total_credits_used_usd: {
      aggregation: 'sum',
      sql: "{{dimension.credits_used_usd}}",
      reportOptions: {
        suffix: '$',
      },
    },
  },
  dimensions: {
    credits_used: {
      column: 'CREDITS_USED'
    },
    credits_used_usd: {
      sql: "{{dimension.credits_used}} * 2.5",
      reportOptions: {
        suffix: '$',
      },
    },
    start_time: {
      column: 'START_TIME',
      timeframes: [],
      type: 'timestamp'
    },
    end_time: {
      column: 'END_TIME',
      timeframes: [],
      type: 'timestamp'
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
