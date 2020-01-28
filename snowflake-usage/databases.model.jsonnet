{
  name: 'snowflake_databases',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'DATABASES' },
  category: 'Snowflake Data-warehouse',
  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    id: {
      column: 'DATABASE_ID',
    },
    comment: {
      column: 'COMMENT',
    },
    created: {
      column: 'CREATED',
      timeframes: [],
    },
    database_name: {
      column: 'DATABASE_NAME',
    },
    database_owner: {
      column: 'DATABASE_OWNER',
    },
    deleted: {
      column: 'DELETED',
    },
    is_transient: {
      column: 'IS_TRANSIENT',
    },
    last_altered: {
      column: 'LAST_ALTERED',
      timeframes: [],
    },
  },
}
