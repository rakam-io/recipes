{
  version: 1.0,
  label: 'Firebase Analytics',
  description: 'Analytics models for Firebase BigQuery Export.',
  image: 'https://github.com/rakam-io/recipes/raw/master//logo.png',
  tags: ['event-analytics'],
  databases: ['bigQuery'],
  variables: {
    schema: {
      label: 'Schema',
      type: 'schema',
      options: {
        placeholder: 'analytics_54353',
      },
    },
    user_properties: {
      type: 'sql',
      required: false,
      parent: 'schema',
      description: 'You can run the query above in order to add your custom events as models',
      options: {
        sql: |||
          SELECT DISTINCT user_properties.key as prop_db,
          LOWER(LTRIM(REGEXP_REPLACE(REGEXP_REPLACE(user_properties.key, r'([a-z])([A-Z])', r'\1_\2'), r'[^a-zA-Z0-9_]', ''), '_')) as name,
          CASE WHEN user_properties.value.string_value IS NOT NULL THEN 'string'
              WHEN user_properties.value.int_value IS NOT NULL THEN 'integer'
              WHEN user_properties.value.double_value IS NOT NULL THEN 'double'
              WHEN user_properties.value.float_value IS NOT NULL THEN 'decimal'
          END as type,
          CASE WHEN user_properties.value.string_value IS NOT NULL THEN 'string_value'
              WHEN user_properties.value.int_value IS NOT NULL THEN 'int_value'
              WHEN user_properties.value.double_value IS NOT NULL THEN 'double_value'
              WHEN user_properties.value.float_value IS NOT NULL THEN 'float_value'
          END as value_type
          FROM `red-lion-43515070.analytics_193028004.events_*` AS events
          LEFT JOIN UNNEST(events.user_properties) AS user_properties
          WHERE user_properties.key NOT LIKE '_ltv%'
        |||,
      },
    },
    event_properties: {
      type: 'sql',
      parent: 'schema',
      required: false,
      description: 'You can run the query above in order to add custom user properties as dimensions',
      options: {
        sql: |||
          SELECT DISTINCT
          event_name as event_db,
          event_params.key as prop_db,
          LOWER(LTRIM(REGEXP_REPLACE(REGEXP_REPLACE(event_name, r'([a-z])([A-Z])', r'\1_\2'), r'[^a-zA-Z0-9_]', ''), '_')) as event_name,
          LOWER(LTRIM(REGEXP_REPLACE(REGEXP_REPLACE(event_params.key, r'([a-z])([A-Z])', r'\1_\2'), r'[^a-zA-Z0-9_]', ''), '_')) as name,
          CASE WHEN event_params.value.string_value IS NOT NULL THEN 'string'
              WHEN event_params.value.int_value IS NOT NULL THEN 'integer'
              WHEN event_params.value.double_value IS NOT NULL THEN 'double'
              WHEN event_params.value.float_value IS NOT NULL THEN 'decimal'
          END as type,
          CASE WHEN event_params.value.string_value IS NOT NULL THEN 'string_value'
              WHEN event_params.value.int_value IS NOT NULL THEN 'int_value'
              WHEN event_params.value.double_value IS NOT NULL THEN 'double_value'
              WHEN event_params.value.float_value IS NOT NULL THEN 'float_value'
          END as value_type,
          FROM `red-lion-43515070.analytics_193028004.events_*` AS events
          LEFT JOIN UNNEST(events.event_params) as event_params
          ORDER BY 1
        |||,
      },
    },
  },
}
