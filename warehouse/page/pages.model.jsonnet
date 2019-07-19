local commonDimensions = import '../common_dimensions.jsonnet';

{
  name: 'pages',
  label: '[Segment] Pageview',
  description: "The pageview data that's collected via Segment Javascript SDK",
  target: std.extVar('pages_target'),
  mappings: {
    eventTimestamp: 'received_at',
    incremental: 'timestamp',
    userId: 'user_id',
    deviceId: null,
    sessionId: null,
  },
  measures: {
     'Total Pageviews': {
        aggregation: 'count'
     }
  },
  relations: {
    session: {
      relationType: 'oneToMany',
      joinType: 'leftJoin',
      modelName: 'rakam_segment_web_sessions',
      sourceColumn: 'anonymous_id',
      targetColumn: 'anonymous_id',
    }
  },
  dimensions: commonDimensions {
    page_url_host: {
      description: 'Host value extracted from the url',
      sql: "split_part(split_part(replace(replace(url, 'http://', ''), 'https://', ''), '/', 1), '?', 1)",
      postOperations: []

    },
    page_referrer_host: {
      description: 'Referrer host extracted from the referrer url',
      sql: "split_part(split_part(replace(replace(referrer, 'http://', ''), 'https://', ''), '/', 1), '?', 1)",
      postOperations: []
    },
    gclid: {
      description: 'Google Click Identifier extracted from the referrer url',
      sql: "split_part(split_part(replace(replace(referrer, 'http://', ''), 'https://', ''), '/', 1), '?', 1)",
      postOperations: []
    },
    device: {
      description: 'The device type',
      sql: |||
        CASE
            WHEN lower(context_user_agent) ~~ '%android%'::text THEN 'Android'
            ELSE replace(split_part(split_part(context_user_agent, '(', 2), ' ', 1), ';', '')
        END
      |||,
      postOperations: []
    },
    device_category: {
      description: 'The device category',
      sql: |||
        case replace(split_part(split_part(context_user_agent, '(', 2), ' ', 1), ';', '')
            when 'iPhone' then 'iPhone'
            when  'Android' then 'Android'
            when 'iPad' then 'Tablet'
            when 'iPod' then 'Tablet'
            when 'Windows' then 'Desktop'
            when 'Macintosh' then 'Desktop'
            when 'X11' then 'Desktop'
            else 'Uncategorized'
        end
      |||,
      postOperations: []
    },
    path: {
      label: 'Page Path',
      category: 'Website',
      type: 'string',
      column: 'path',
      postOperations: []
    },
    referrer: {
      category: 'Website',
      type: 'string',
column: 'referrer',
postOperations: []
    },
    search: {
      label: 'Page Search Parameter',
      category: 'Website',
      type: 'string',
column: 'search',
postOperations: []
    },
  },
}
