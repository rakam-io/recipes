{
  name: 'snowflake_load_history',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'LOAD_HISTORY' },
  category: 'Snowflake Data-warehouse',
  measures: {
    total_row_count: {
      aggregation: 'sum',
      sql: '{{dimension.row_count}}',
    },
    total_error_count: {
      aggregation: 'sum',
      sql: '{{dimension.error_count}}',
    },
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    table_id: {
      column: 'TABLE_ID',
    },
    table_name: {
      column: 'TABLE_NAME',
    },
    schema_id: {
      column: 'SCHEMA_ID',
    },
    schema_name: {
      column: 'SCHEMA_NAME',
    },
    catalog_id: {
      column: 'CATALOG_ID',
    },
    catalog_name: {
      column: 'CATALOG_NAME',
    },
    file_name: {
      column: 'FILE_NAME',
    },
    last_load_time: {
      column: 'LAST_LOAD_TIME',
      timeframes: [],
    },
    status: {
      column: 'STATUS',
    },
    row_count: {
      column: 'ROW_COUNT',
    },
    row_parsed: {
      column: 'ROW_PARSED',
    },
    first_error_message: {
      column: 'FIRST_ERROR_MESSAGE',
    },
    first_error_line_number: {
      column: 'FIRST_ERROR_LINE_NUMBER',
    },
    first_error_character_position: {
      column: 'FIRST_ERROR_CHARACTER_POSITION',
    },
    first_error_col_name: {
      column: 'FIRST_ERROR_COL_NAME',
    },
    error_count: {
      column: 'ERROR_COUNT',
    },
    error_limit: {
      column: 'ERROR_LIMIT',
    },
  },
}
