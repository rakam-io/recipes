local commonDimensions = import '../common_dimensions.jsonnet';
local sessionsModel = import './pageview_sessions.models.jsonnet';


if std.extVar('pages_target') != null then [{
  name: 'segment_pages',
  label: '[Segment] Pageview',
  description: "The pageview data that's collected via Segment Javascript SDK",
  target: std.extVar('pages_target'),
  category: 'Segment Events',
  mappings: {
    eventTimestamp: 'received_at',
    incremental: 'timestamp',
    userId: 'user_id',
    deviceId: null,
    sessionId: null,
  },
  measures: {
    pageviews: {
      aggregation: 'count',
      label: 'Total Pageviews',
    },
  },
  relations: {
    user: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'segment_users',
      sourceColumn: 'user_id',
      targetColumn: 'id',
    },
  } + if std.extVar('session_model_target') != null then { session: {
    relationType: 'oneToOne',
    joinType: 'leftJoin',
    modelName: 'segment_rakam_pageview_sessions',
    sourceColumn: 'anonymous_id',
    targetColumn: 'anonymous_id',
  } } else {},
  dimensions: commonDimensions + std.extVar('pages_campaign_columns') + {
    page_url_host: {
      description: 'Host value extracted from the url',
      sql: "split_part(split_part(replace(replace({{TABLE}}.url, 'http://', ''), 'https://', ''), '/', 1), '?', 1)",
    },
    page_referrer_host: {
      description: 'Referrer host extracted from the referrer url',
      sql: "split_part(split_part(replace(replace({{TABLE}}.referrer, 'http://', ''), 'https://', ''), '/', 1), '?', 1)",
    },
    gclid: {
      description: 'Google Click Identifier extracted from the referrer url',
      sql: "split_part(split_part(replace(replace({{TABLE}}.referrer, 'http://', ''), 'https://', ''), '/', 1), '?', 1)",
    },
    title: {
      label: 'Page Title',
      category: 'Website',
      type: 'string',
      column: 'title',
    },
    url: {
      label: 'Page URL',
      category: 'Website',
      type: 'string',
      column: 'url',
    },
    browser: {
      description: 'The browser type parsed from the user agent',
      category: 'Website',
      sql: |||
        (CASE
          WHEN {{TABLE}}.context_user_agent LIKE '%Firefox/%' THEN 'Firefox'
          WHEN {{TABLE}}.context_user_agent LIKE '%Chrome/%' OR {{TABLE}}.context_user_agent LIKE '%CriOS%' THEN 'Chrome'
          WHEN {{TABLE}}.context_user_agent LIKE '%MSIE %' THEN 'IE'
          WHEN {{TABLE}}.context_user_agent LIKE '%MSIE+%' THEN 'IE'
          WHEN {{TABLE}}.context_user_agent LIKE '%Trident%' THEN 'IE'
          WHEN {{TABLE}}.context_user_agent LIKE '%iPhone%' THEN 'iPhone Safari'
          WHEN {{TABLE}}.context_user_agent LIKE '%iPad%' THEN 'iPad Safari'
          WHEN {{TABLE}}.context_user_agent LIKE '%Opera%' THEN 'Opera'
          WHEN {{TABLE}}.context_user_agent LIKE '%BlackBerry%' AND {{TABLE}}.context_user_agent LIKE '%Version/%' THEN 'BlackBerry WebKit'
          WHEN {{TABLE}}.context_user_agent LIKE '%BlackBerry%' THEN 'BlackBerry'
          WHEN {{TABLE}}.context_user_agent LIKE '%Android%' THEN 'Android'
          WHEN {{TABLE}}.context_user_agent LIKE '%Safari%' THEN 'Safari'
          WHEN {{TABLE}}.context_user_agent LIKE '%bot%' THEN 'Bot'
          WHEN {{TABLE}}.context_user_agent LIKE '%http://%' THEN 'Bot'
          WHEN {{TABLE}}.context_user_agent LIKE '%www.%' THEN 'Bot'
          WHEN {{TABLE}}.context_user_agent LIKE '%Wget%' THEN 'Bot'
          WHEN {{TABLE}}.context_user_agent LIKE '%curl%' THEN 'Bot'
          WHEN {{TABLE}}.context_user_agent LIKE '%urllib%' THEN 'Bot'
          ELSE 'Unknown'
        END)
      |||,
    },
    // in BigQuery, there's no POSITION but SUBFND function as an alternative so I'm disabling it until we support dbt_utils in dimensions
    // browser_version: {
    //   description: 'The browser type parsed from the user agent',
    //   category: 'Website',
    //   sql: |||
    //     (CASE
    //       WHEN {{dimension.browser}} = 'Firefox'
    //         THEN SUBSTRING({{dimension.browser}}, POSITION('Firefox' IN {{dimension.browser}}) + 8, 100)
    //       WHEN {{dimension.browser}} = 'Safari'
    //         THEN SUBSTRING({{dimension.browser}}, POSITION('Safari' IN {{dimension.browser}}) + 7, 100)
    //       WHEN {{dimension.browser}} = 'Chrome'
    //         THEN SUBSTRING(
    //                   SUBSTRING({{dimension.browser}}
    //                             , POSITION('Chrome' IN {{dimension.browser}}) + 7
    //                             , 100), 0, POSITION(' ' IN SUBSTRING({{dimension.browser}}
    //                                               , POSITION('Chrome' IN {{dimension.browser}}) + 7
    //                                               , 100)
    //                             )
    //                   )
    //       WHEN {{dimension.browser}} LIKE '%Trident%'
    //         THEN '11.0'
    //       WHEN {{dimension.browser}} = 'IE'
    //         THEN SUBSTRING({{dimension.browser}}, POSITION('MSIE' IN {{dimension.browser}}) + 5, 4)
    //       WHEN {{dimension.browser}} = 'iPhone Safari'
    //         THEN SUBSTRING({{dimension.browser}}, POSITION('Safari' IN {{dimension.browser}}) + 7, 100)
    //       WHEN {{dimension.browser}} = 'iPad Safari'
    //         THEN SUBSTRING({{dimension.browser}}, POSITION('Safari' IN {{dimension.browser}}) + 7, 100)
    //       ELSE 'Unknown'
    //     END)
    //   |||,
    // },
    user_agent: {
      column: 'context_user_agent',
      category: 'Website',
    },
    page_path: {
      category: 'Website',
      type: 'string',
      column: 'context_page_path',
    },
    page_referrer: {
      category: 'Marketing',
      type: 'string',
      column: 'context_page_referrer',
    },
    page_search: {
      category: 'Website',
      type: 'string',
      column: 'context_page_search',
    },
    page_title: {
      category: 'Website',
      type: 'string',
      column: 'context_page_title',
    },
    page_url: {
      category: 'Website',
      type: 'string',
      column: 'context_page_url',
    },
    device_category: {
      description: 'The device category',
      sql: |||
        (case replace(split_part(split_part({{TABLE}}.context_user_agent, '(', 2), ' ', 1), ';', '')
            when 'iPhone' then 'iPhone'
            when  'Android' then 'Android'
            when 'iPad' then 'Tablet'
            when 'iPod' then 'Tablet'
            when 'Windows' then 'Desktop'
            when 'Macintosh' then 'Desktop'
            when 'X11' then 'Desktop'
            else 'Uncategorized'
        end)
      |||,
    },
    path: {
      label: 'Page Path',
      category: 'Website',
      type: 'string',
      column: 'context_page_path',
    },
    referrer: {
      category: 'Website',
      type: 'string',
      column: 'context_page_referrer',
    },
  },
}] else []
