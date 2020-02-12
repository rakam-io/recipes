{
  version: 1.1,
  label: 'Rakam API',
  description: 'It automatically creates models from your collections.',
  variables: {
    target: {
      label: 'Events Table',
      type: 'table',
      default: { table: 'EVENTS' },
    },
    event_schema: {
      type: 'sql',
      parent: 'target',
      description: 'The event schema in your Snowflake Warehouse',
      options: {
        sql: |||
          SELECT EVENT_NAME as "n", ANY_VALUE(EVENT_DB) as "db", ARRAY_AGG(OBJECT_CONSTRUCT('db', PROP_DB, 'n', PROP_NAME, 't', TYPE)) as "props"
          FROM (
                  SELECT
                  DISTINCT E.EVENT_TYPE as EVENT_DB,
                  LOWER(LTRIM(REGEXP_REPLACE(REGEXP_REPLACE(E.EVENT_TYPE, '([a-z])([A-Z])', '\1_\2'), '[^a-zA-Z0-9_]', ''), '_')) as EVENT_NAME,
                  F.KEY as PROP_DB,
                  LOWER(LTRIM(REGEXP_REPLACE(REGEXP_REPLACE(F.KEY, '([a-z])([A-Z])', '\1_\2'), '[^a-zA-Z0-9_]', ''), '_')) as PROP_NAME,
                  MODE(TYPEOF(f.VALUE)) OVER (PARTITION BY EVENT_DB, PROP_DB, TYPEOF(f.VALUE)) as TYPE
              FROM
                  EVENTS E,
                  LATERAL FLATTEN(PROPERTIES, RECURSIVE=>FALSE) F
              WHERE
                  _TIME > DATEADD(MINUTE, -50, current_timestamp)
                  AND TYPEOF(F.VALUE) IN ('BOOLEAN', 'DECIMAL', 'DOUBLE', 'INTEGER', 'VARCHAR')
                  --AND REGEXP_LIKE(F.KEY, '^[a-zA-Z0-9]*$')
                  AND EVENT_TYPE NOT IN ('$invalid_schema', '$identify')    
          ) d
          GROUP BY 1
        |||,
      },
    },
  },
  tags: ['event-analytics'],
  warehouse: ['snowflake'],
}
