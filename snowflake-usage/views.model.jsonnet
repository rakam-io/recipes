{
  name: 'snowflake_views',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'VIEWS' },
  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    check_option: {
      column: 'CHECK_OPTION',
    },
    comment: {
      column: 'COMMENT',
    },
    created: {
      column: 'CREATED',
      timeframes: [],
    },
    deleted: {
      column: 'DELETED',
      timeframes: [],
    },
    last_altered: {
      column: 'LAST_ALTERED',
      timeframes: [],
    },
    commit_action: {
      column: 'COMMIT_ACTION',
    },
    table_catalog: {
      column: 'TABLE_CATALOG',
    },
    insertable_into: {
      sql: "CASE WHEN {{TABLE}}.INSERTABLE_INTO = 'YES' THEN TRUE ELSE FALSE END",
    },
    is_secure: {
      sql: "CASE WHEN {{TABLE}}.IS_SECURE = 'YES' THEN TRUE ELSE FALSE END",
    },
    is_updatable: {
      sql: "CASE WHEN {{TABLE}}}.IS_UPDATABLE = 'YES' THEN TRUE ELSE FALSE END",
    },
    table_name: {
      column: 'TABLE_NAME',
    },
    table_owner: {
      column: 'TABLE_OWNER',
    },
    table_schema: {
      column: 'TABLE_SCHEMA',
    },
    view_definition: {
      column: 'VIEW_DEFINITION',
    },
  },
}
