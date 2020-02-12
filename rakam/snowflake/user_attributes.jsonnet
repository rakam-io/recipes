{
  sql: |||
    SELECT
        DISTINCT F.KEY as PROP_DB,
        LOWER(LTRIM(REGEXP_REPLACE(REGEXP_REPLACE(F.KEY, '([a-z])([A-Z])', '\1_\2'), '[^a-zA-Z0-9_]', ''), '_')) as PROP_NAME,
        FALSE AS IS_IN_SET,
        MODE(TYPEOF(f.VALUE)) OVER (PARTITION BY PROP_DB, TYPEOF(f.VALUE)) as TYPE
    FROM
        EVENTS E,
        LATERAL FLATTEN(PROPERTIES:"$set", RECURSIVE=>FALSE) F
    WHERE
        _TIME > DATEADD(MINUTE, -60, current_timestamp)
        AND TYPEOF(F.VALUE) IN ('BOOLEAN', 'DECIMAL', 'DOUBLE', 'INTEGER', 'VARCHAR')
        AND EVENT_TYPE = '$identify'
    UNION ALL
    SELECT
        DISTINCT F.KEY as PROP_DB,
        LOWER(LTRIM(REGEXP_REPLACE(REGEXP_REPLACE(F.KEY, '([a-z])([A-Z])', '\1_\2'), '[^a-zA-Z0-9_]', ''), '_')) as PROP_NAME,
        TRUE AS IS_IN_SET,
        MODE(TYPEOF(f.VALUE)) OVER (PARTITION BY PROP_DB, TYPEOF(f.VALUE)) as TYPE
    FROM
        EVENTS E,
        LATERAL FLATTEN(PROPERTIES, RECURSIVE=>FALSE) F
    WHERE
        _TIME > DATEADD(MINUTE, -60, current_timestamp)
        AND TYPEOF(F.VALUE) IN ('BOOLEAN', 'DECIMAL', 'DOUBLE', 'INTEGER', 'VARCHAR')
        AND EVENT_TYPE = '$identify'
  |||,
}
