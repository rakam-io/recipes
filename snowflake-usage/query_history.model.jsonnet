{
  name: 'snowflake_query_history',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'QUERY_HISTORY' },
  measures: {
    query_count: {
      aggregation: 'count',
    },
    current_month_query_count: {
      aggregation: 'count',
      filters: [{ dimension: 'start_date', operator: 'between', value: 'P1M', valueType: 'timestamp' }],
    },
    average_execution_time: {
      aggregation: 'average',
      sql: '{{dimension.execution_time}}',
    },
    total_execution_time: {
      aggregation: 'sum',
      sql: '{{dimension.execution_time}}',
    },
    total_queued_overload_time: {
      aggregation: 'sum',
      sql: '{{dimension.queued_overload_time}}',
      filters: [{ dimension: 'has_overload_time', operator: 'is', value: true, valueType: 'boolean' }],
    },
    average_queued_overload_time: {
      aggregation: 'average',
      sql: '1.0*{{queued_overload_time}}',
      filters: [{ dimension: 'has_overload_time', operator: 'is', value: true, valueType: 'boolean' }],
    },
    total_elapsed_time: {
      aggregation: 'sum',
      sql: '{{dimension.elapsed_time}}',
    },
    total_queued_repair_time: {
      aggregation: 'sum',
      sql: '{{dimension.queued_repair_time}}',
    },
    total_compilation_time: {
      aggregation: 'sum',
      sql: '{{dimension.compilation_time}}',
    },
    total_queued_provisioning_time: {
      aggregation: 'sum',
      sql: '{{dimension.queued_provisioning_time}}',
    },
    total_transaction_blocked_time: {
      aggregation: 'sum',
      sql: '{{dimension.transaction_blocked_time}}',
    },
    current_mtd_avg_exec_time: {
      aggregation: 'average',
      sql: '{{dimension.execution_time}}',
      filters: [{ dimension: 'start_date', operator: 'between', value: 'P1M', valueType: 'timestamp' }],
    },
    prior_mtd_avg_exec_time: {
      aggregation: 'average',
      sql: '{{dimension.execution_time}}',
      filters: [{ dimension: 'is_prior_month_mtd', operator: 'is', value: true, valueType: 'boolean' }],
    },
  },
  dimensions: {
    compilation_time: {
      column: 'COMPILATION_TIME',
    },
    query_context: {
      hidden: true,
      sql: "PARSE_JSON(regexp_substr(regexp_substr({{TABLE}}.query_text, 'Query\\sContext\\s\\'\\{.*\\}\\''),'\\{.*}'))",
    },
    looker_history_id: {
      sql: '{{dimension.looker_history_id}}:history_id',
    },
    looker_user_id: {
      sql: '{{dimension.looker_history_id}}:user_id',
    },
    database_name: {
      column: 'DATABASE_NAME',
    },
    end: {
      column: 'END_TIME',
      timeframes: [],
    },
    error_code: {
      column: 'ERROR_CODE',
    },
    error_message: {
      column: 'ERROR_MESSAGE',
    },
    execution_status: {
      column: 'EXECUTION_STATUS',
    },
    execution_time: {
      column: 'EXECUTION_TIME',
    },
    //    dimension: execution_time_tier {
    //        type: tier
    //        tiers: [1000,2500,5000,10000,25000,50000,100000]
    //      }
    query_id: {
      column: 'QUERY_ID',
    },
    query_tag: {
      column: 'QUERY_TAG',
    },
    query_text: {
      column: 'QUERY_TEXT',
    },
    query_type: {
      column: 'QUERY_TYPE',
    },
    queued_overload_time: {
      column: 'QUEUED_OVERLOAD_TIME',
    },
    has_overload_time: {
      type: 'boolean',
      sql: '{{dimension.queued_overload_time}}>0',
    },
    queued_provisioning_time: {
      column: 'QUEUED_PROVISIONING_TIME',
    },
    queued_repair_time: {
      column: 'QUEUED_REPAIR_TIME',
    },
    role_name: {
      column: 'ROLE_NAME',
    },
    session_id: {
      column: 'SESSION_ID',
    },
    start: {
      column: 'START_TIME',
      timeframes: [],
    },
    elapsed_time: {
      column: 'TOTAL_ELAPSED_TIME',
    },
    transaction_blocked_time: {
      column: 'TRANSACTION_BLOCKED_TIME',
    },
    user_name: {
      column: 'USER_NAME',
    },
    warehouse_name: {
      column: 'WAREHOUSE_NAME',
    },
    warehouse_size: {
      column: 'WAREHOUSE_SIZE',
    },
    warehouse_type: {
      column: 'WAREHOUSE_TYPE',
    },
    is_prior_month_mtd: {
      type: 'boolean',
      sql: 'EXTRACT(month, {{TABLE}}.START_TIME) = EXTRACT(month, current_timestamp()) - 1\n                          and {{TABLE}}.START_TIME <= dateadd(month, -1, current_timestamp())',
    },
  },
}
