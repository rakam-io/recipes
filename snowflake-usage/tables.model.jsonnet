{
  name: 'snowflake_tables',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'TABLES' },
  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    id: {
      column: 'table_id',
    },
    bytes: {
      column: 'BYTES',
    },
    clustering_key: {
      column: 'CLUSTERING_KEY',
    },
    comment: {
      column: 'COMMENT',
    },
    commit_action: {
      column: 'COMMIT_ACTION',
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
    is_insertable_into: {
      sql: "CASE WHEN {{TABLE}}.IS_INSERTABLE_INTO = 'YES' THEN TRUE ELSE FALSE END",
      type: 'boolean',
    },
    is_transient: {
      sql: "CASE WHEN {{TABLE}}.IS_TRANSIENT = 'YES' THEN TRUE ELSE FALSE END",
      type: 'boolean',
    },
    is_typed: {
      sql: "CASE WHEN {{TABLE}}.IS_TYPED = 'YES' THEN TRUE ELSE FALSE END",
      type: 'boolean',
    },
    reference_generation: {
      column: 'REFERENCE_GENERATION',
    },
    row_count: {
      column: 'ROW_COUNT',
    },
    self_referencing_column_name: {
      column: 'SELF_REFERENCING_COLUMN_NAME',
    },
    table_catalog: {
      column: 'TABLE_CATALOG',
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
    table_type: {
      column: 'TABLE_TYPE',
    },
    user_defined_type_name: {
      column: 'USER_DEFINED_TYPE_NAME',
    },
    user_defined_catalog_type: {
      column: 'USER_DEFINED_CATALOG_TYPE',
    },
    user_defined_schema_type: {
      column: 'USER_DEFINED_SCHEMA_TYPE',
    },
  },
}
