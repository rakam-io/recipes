{
  name: 'snowflake.login_history',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'LOGIN_HISTORY' },
  mappings: {
    eventTimestamp: 'event_timestamp',
  },
  measures: {
    logins: {
      aggregation: 'count',
    },
    total_failed_logins: {
      aggregation: 'count',
      filters: [{ dimension: 'is_success', operator: 'is', value: false, valueType: 'boolean' }],
    },
    login_failure_rate: {
      sql: '1.0 * ({{measure.total_failed_logins}} / NULLIF({{measure.logins}},0))',
    },
  },
  dimensions: {
    client_ip: {
      column: 'CLIENT_IP',
    },
    error_code: {
      column: 'ERROR_CODE',
    },
    error_message: {
      column: 'ERROR_MESSAGE',
    },
    event_id: {
      column: 'EVENT_ID',
    },
    event_timestamp: {
      column: 'EVENT_TIMESTAMP',
    },
    event_type: {
      column: 'EVENT_TYPE',
    },
    first_authentication_factor: {
      column: 'FIRST_AUTHENTICATION_FACTOR',
    },
    is_success: {
      type: 'boolean',
      sql: "CASE WHEN {{TABLE}}.IS_SUCCESS = 'YES' THEN TRUE ELSE FALSE END",
    },
    related_event_id: {
      column: 'RELATED_EVENT_ID',
    },
    reported_client_type: {
      column: 'REPORTED_CLIENT_TYPE',
    },
    reported_client_version: {
      column: 'REPORTED_CLIENT_VERSION',
    },
    second_authentication_factor: {
      column: 'SECOND_AUTHENTICATION_FACTOR',
    },
    user_name: {
      column: 'USER_NAME',
    },
    seconds_between_login_attempts: {
      sql: 'timediff(seconds, {{TABLE}}.EVENT_TIMESTAMP, lead({{TABLE}}.EVENT_TIMESTAMP) over(partition by {{dimension.user_name}} order by {{TABLE}}.EVENT_TIMESTAMP)) ',
    },
  },
}
