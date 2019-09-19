{
  name: 'snowflake_table_constraints',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'TABLE_CONSTRAINTS' },
  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    comment: {
      column: 'COMMENT',
    },
    constraint_catalog: {
      column: 'CONSTRAINT_CATALOG',
    },
    constraint_name: {
      column: 'CONSTRAINT_NAME',
    },
    constraint_schema: {
      column: 'constraint_schema',
    },
    constraint_type: {
      column: 'CONSTRAINT_TYPE',
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
    table_catalog: {
      column: 'TABLE_CATALOG',
    },
    table_name: {
      column: 'TABLE_NAME',
    },
    table_schema: {
      column: 'TABLE_SCHEMA',
    },
    enforced: {
      column: 'ENFORCED',
    },
    initially_deferred: {
      sql: "CASE WHEN {{TABLE}}.INITIALLY_DEFERRED = 'YES' THEN TRUE ELSE FALSE END",
    },
    is_deferrable: {
      sql: "CASE WHEN {{TABLE}}.IS_DEFERRABLE = 'YES' THEN TRUE ELSE FALSE END",
    },
  },
}
