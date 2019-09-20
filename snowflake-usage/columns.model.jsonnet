{
  name: 'snowflake_columns',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'COLUMNS' },
  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    id: {
      column: 'COLUMN_ID',
    },
    character_maximum_length: {
      column: 'CHARACTER_MAXIMUM_LENGTH',
    },
    character_octet_length: {
      column: 'CHARACTER_OCTET_LENGTH',
    },
    character_set_catalog: {
      column: 'CHARACTER_SET_CATALOG',
    },
    character_set_name: {
      column: 'CHARACTER_SET_NAME',
    },
    character_set_schema: {
      column: 'CHARACTER_SET_SCHEMA',
    },
    collation_catalog: {
      column: 'COLLATION_CATALOG',
    },
    collation_name: {
      column: 'COLLATION_NAME',
    },
    collation_schema: {
      column: 'COLLATION_SCHEMA',
    },
    column_default: {
      column: 'COLUMN_DEFAULT',
    },
    column_name: {
      column: 'COLUMN_NAME',
    },
    comment: {
      column: 'COMMENT',
    },
    data_type: {
      column: 'DATA_TYPE',
    },
    datetime_precision: {
      column: 'DATETIME_PRECISION',
    },
    domain_catalog: {
      column: 'DOMAIN_CATALOG',
    },
    domain_name: {
      column: 'DOMAIN_NAME',
    },
    domain_schema: {
      column: 'DOMAIN_SCHEMA',
    },
    dtd_identifier: {
      column: 'DTD_IDENTIFIER',
    },
    identity_cycle: {
      column: 'IDENTITY_CYCLE',
    },
    identity_generation: {
      column: 'IDENTITY_GENERATION',
    },
    identity_maximum: {
      column: 'IDENTITY_MAXIMUM',
    },
    identity_minimum: {
      column: 'IDENTITY_MINIMUM',
    },
    interval_precision: {
      column: 'INTERVAL_PRECISION',
    },
    interval_type: {
      column: 'INTERVAL_TYPE',
    },
    is_identity: {
      sql: "CASE WHEN {{TABLE}}.IS_IDENTITY = 'YES' THEN TRUE ELSE FALSE END",
    },
    deleted: {
      column: 'DELETED',
      timeframes: [],
    },
    is_nullable: {
      sql: "CASE WHEN {{TABLE}}.IS_NULLABLE = 'YES' THEN TRUE ELSE FALSE END",
    },
    is_self_referencing: {
      sql: "CASE WHEN {{TABLE}}.IS_SELF_REFERENCING = 'YES' THEN TRUE ELSE FALSE END",
    },
    maximum_cardinality: {
      column: 'MAXIMUM_CARDINALITY',
    },
    numeric_precision: {
      column: 'NUMERIC_PRECISION',
    },
    numeric_precision_radix: {
      column: 'NUMERIC_PRECISION_RADIX',
    },
    numeric_scale: {
      column: 'NUMERIC_SCALE',
    },
    ordinal_position: {
      column: 'ORDINAL_POSITION',
    },
    scope_catalog: {
      column: 'SCOPE_CATALOG',
    },
    scope_name: {
      column: 'SCOPE_NAME',
    },
    scope_schema: {
      column: 'SCOPE_SCHEMA',
    },
    table_name: {
      column: 'TABLE_NAME',
    },
    udt_catalog: {
      column: 'UDT_CATALOG',
    },
    udt_name: {
      column: 'UDT_NAME',
    },
    udt_schema: {
      column: 'UDT_SCHEMA',
    },
    table_schema: {
      column: 'TABLE_SCHEMA',
    },
    table_catalog: {
      column: 'TABLE_CATALOG',
    },
    table_catalog_deleted: {
      column: 'TABLE_CATALOG_DELETED',
      timeframes: [],
    },
    table_schema_deleted: {
      column: 'TABLE_SCHEMA_DELETED',
      timeframes: [],
    },
    table_deleted: {
      column: 'TABLE_DELETED',
      timeframes: [],
    },
  },
}
