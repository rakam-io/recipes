{
  version: 1.0,
  label: 'Firebase Analytics',
  description: 'Analytics models for Firebase BigQuery Export.',
  image: 'https://github.com/rakam-io/recipes/raw/master/firebase/logo.png',
  tags: ['event-analytics'],
  databases: ['bigQuery'],
  variables: {
    schema: {
      label: 'Schema',
      type: 'schema',
      options: {
        placeholder: '(ex: analytics_54353)',
      },
    },
    user_properties: {
      type: 'sql',
      required: false,
      description: 'You can run the query above in order to add custom user properties as dimensions',
      parent: 'schema',
      options: {
        sql: |||
          SELECT DISTINCT user_properties.key as prop_db,
          LOWER(LTRIM(REGEXP_REPLACE(REGEXP_REPLACE(user_properties.key, r'([a-z])([A-Z])', r'\1_\2'), r'[^a-zA-Z0-9_]', ''), '_')) as name,
          CASE WHEN JSON_EXTRACT(TO_JSON_STRING(user_properties.value), '$.string_value') IS NOT NULL THEN 'string'
              WHEN JSON_EXTRACT(TO_JSON_STRING(user_properties.value), '$.int_value') IS NOT NULL THEN 'integer'
              WHEN JSON_EXTRACT(TO_JSON_STRING(user_properties.value), '$.double_value') IS NOT NULL THEN 'double'
              WHEN JSON_EXTRACT(TO_JSON_STRING(user_properties.value), '$.float_value') IS NOT NULL THEN 'decimal'
          END as type,
          CASE WHEN JSON_EXTRACT(TO_JSON_STRING(user_properties.value), '$.string_value') IS NOT NULL THEN 'string_value'
              WHEN JSON_EXTRACT(TO_JSON_STRING(user_properties.value), '$.int_value') IS NOT NULL THEN 'int_value'
              WHEN JSON_EXTRACT(TO_JSON_STRING(user_properties.value), '$.double_value')  IS NOT NULL THEN 'double_value'
              WHEN JSON_EXTRACT(TO_JSON_STRING(user_properties.value), '$.float_value') IS NOT NULL THEN 'float_value'
          END as value_type
          FROM `events_*` AS events
          LEFT JOIN UNNEST(events.user_properties) AS user_properties
          WHERE user_properties.key NOT LIKE '_ltv%' AND _TABLE_SUFFIX BETWEEN FORMAT_DATE("%Y%m%d", DATE_SUB(current_date(), INTERVAL 15 DAY)) and FORMAT_DATE("%Y%m%d", current_date())
        |||,
      },
    },
    event_properties: {
      type: 'sql',
      parent: 'schema',
      required: false,
      description: 'You can run the query above in order to add your custom events as models',
      options: {
        sql: |||
          SELECT DISTINCT
          event_name as event_db,
          event_params.key as prop_db,
          LOWER(LTRIM(REGEXP_REPLACE(REGEXP_REPLACE(event_name, r'([a-z])([A-Z])', r'\1_\2'), r'[^a-zA-Z0-9_]', ''), '_')) as event_name,
          LOWER(LTRIM(REGEXP_REPLACE(REGEXP_REPLACE(event_params.key, r'([a-z])([A-Z])', r'\1_\2'), r'[^a-zA-Z0-9_]', ''), '_')) as name,
          CASE WHEN JSON_EXTRACT(TO_JSON_STRING(event_params.value), '$.string_value') IS NOT NULL THEN 'string'
              WHEN JSON_EXTRACT(TO_JSON_STRING(event_params.value), '$.int_value') IS NOT NULL THEN 'integer'
              WHEN JSON_EXTRACT(TO_JSON_STRING(event_params.value), '$.double_value') IS NOT NULL THEN 'double'
              WHEN JSON_EXTRACT(TO_JSON_STRING(event_params.value), '$.float_value') IS NOT NULL THEN 'decimal'
          END as type,
          CASE WHEN JSON_EXTRACT(TO_JSON_STRING(event_params.value), '$.string_value') IS NOT NULL THEN 'string_value'
              WHEN JSON_EXTRACT(TO_JSON_STRING(event_params.value), '$.int_value') IS NOT NULL THEN 'int_value'
              WHEN JSON_EXTRACT(TO_JSON_STRING(event_params.value), '$.double_value') IS NOT NULL THEN 'double_value'
              WHEN JSON_EXTRACT(TO_JSON_STRING(event_params.value), '$.float_value') IS NOT NULL THEN 'float_value'
          END as value_type,
          FROM `events_*` AS events
          LEFT JOIN UNNEST(events.event_params) as event_params
          WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE("%Y%m%d", DATE_SUB(current_date(), INTERVAL 15 DAY)) and FORMAT_DATE("%Y%m%d", current_date())
          ORDER BY 1
        |||,
      },
    },
    installRevenue: {
      label: 'Install Revenue Metrics',
      type: 'boolean',
      default: true,
      description: "If you're sending the in app purchases to Firebase, you can enable this toggle in order to see metrics related to your revenue.",
    },
    intradayAnalytics: {
      label: 'Enable Intraday Analytics',
      type: 'boolean',
      default: true,
      description: "If enabled, will also union events_intraday_* tables",
    },
  },
}
