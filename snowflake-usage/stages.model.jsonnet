{
  name: 'snowflake_stages',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'STAGES' },
  category: 'Snowflake Data-warehouse',

  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    comment: {
      column: 'COMMENT',
    },
    created: {
      column: 'CREATED',
      timeframes: [],
    },
    deleted: {
      timeframes: [],
      column: 'DELETED',
    },
    last_altered: {
      column: 'LAST_ALTERED',
      timeframes: [],
    },
    stage_catalog: {
      column: 'STAGE_CATALOG',
    },
    stage_name: {
      column: 'STAGE_NAME',
    },
    stage_owner: {
      column: 'STAGE_OWNER',
    },
    stage_region: {
      column: 'STAGE_REGION',
    },
    stage_schema: {
      column: 'STAGE_SCHEMA',
    },
    stage_type: {
      column: 'STAGE_TYPE',
    },
    stage_url: {
      column: 'STAGE_URL',
    },
  },
}
