{
  name: 'snowflake_pipe_usage',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'PIPE_USAGE_HISTORY' },
  mappings: {
      eventTimestamp: 'start_time'
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
    pipe_name: {
      column: 'PIPE_NAME',
    },
    bytes_inserted: {
      column: 'BYTES_INSERTED',
    },
    files_inserted: {
      column: 'FILES_INSERTED',
    },
    credits_used: {
      column: 'CREDITS_USED',
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
      column: 'START_TIME',
      timeframes: [],
      type: 'timestamp'
    },
  },
}
