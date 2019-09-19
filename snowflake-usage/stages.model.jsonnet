{
  name: 'snowflake.stages',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'STAGES' },
  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    comment: {
      column: 'comment',
    },
    created: {
      column: 'created',
      timeframes: [],
    },
    deleted: {
      timeframes: [],
      column: 'deleted',
    },
    last_altered: {
      column: 'last_altered',
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
