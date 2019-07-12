local commonDimensions = import 'common_dimensions.jsonnet';

{
  name: 'pages',
  label: '[Segment] Pageview',
  description: "The pageview data that's collected via Segment Javascript SDK",
  target: {
      table: 'pages'
  },
  mapping: {
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
  relations: [
    {
      relationType: 'oneToMany',
      modelName: 'rakam_segment_web_sessions',
      sourceColumn: 'anonymous_id',
      targetColumn: 'anonymous_id',
    }
  ],
  columns: commonDimensions {
    page_url_host: {
      description: 'Host value extracted from the url',
      sql: "split_part(split_part(replace(replace(url, 'http://', ''), 'https://', ''), '/', 1), '?', 1)",
    },
    page_referrer_host: {
      description: 'Referrer host extracted from the referrer url',
      sql: "split_part(split_part(replace(replace(referrer, 'http://', ''), 'https://', ''), '/', 1), '?', 1)",
    },
    gclid: {
      description: 'Google Click Identifier extracted from the referrer url',
      sql: "split_part(split_part(replace(replace(referrer, 'http://', ''), 'https://', ''), '/', 1), '?', 1)",
    },
    device: {
      description: 'The device type',
      sql: |||
        CASE
            WHEN lower(context_user_agent) ~~ '%android%'::text THEN 'Android'
            ELSE replace(split_part(split_part(context_user_agent, '(', 2), ' ', 1), ';', '')
        END
      |||,
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
    },
    path: {
      label: 'Page Path',
      category: 'Website',
      type: 'string',
    },
    referrer: {
      category: 'Website',
      type: 'string',

    },
    search: {
      label: 'Page Search Parameter',
      category: 'Website',
      type: 'string',

    },
  },
}