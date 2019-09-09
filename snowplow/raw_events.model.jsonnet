SELECT
  page_urlpath,
  SUM(CASE WHEN event = 'page_view' THEN 1 ELSE 0 END) AS pageviews,
  COUNT(DISTINCT domain_sessionid) AS sessions,
  COUNT(DISTINCT domain_userid) AS unique_browsers
FROM atomic.events
WHERE
  app_id = 'poplinedata.com'
  AND CONVERT_TIMEZONE('Australia/Sydney', derived_tstamp) > CONVERT_TIMEZONE('Australia/Sydney', SYSDATE) - INTERVAL '7 days'
GROUP BY 1
ORDER BY 2 DESC

DROP TABLE lookup_pageview;
CREATE TABLE lookup_pageview
  DISTKEY(2)
  SORTKEY(2, 1)
  AS (
  SELECT
    atomic.com_snowplowanalytics_snowplow_web_page_1.id AS pageview_id,
    (COUNT(*) * 5)-5                                    AS time_spent_seconds,
    MAX(pp_yoffset_max)                                 AS max_pp_yoffset_max,
    MAX(doc_height)                                     AS max_doc_height,
    CASE WHEN MAX(pp_yoffset_max) = 0 THEN 0 ELSE (MAX(CAST(pp_yoffset_max AS float)) / MAX(CAST(doc_height AS float))) END AS scroll_depth_percent
  FROM atomic.events
    JOIN atomic.com_snowplowanalytics_snowplow_web_page_1
      ON atomic.events.event_id = atomic.com_snowplowanalytics_snowplow_web_page_1.root_id AND
         atomic.events.collector_tstamp = snowplow.atomic.com_snowplowanalytics_snowplow_web_page_1.root_tstamp
  WHERE
    app_id = 'poplindata.com'
    AND event IN ('pageview', 'page_ping')
  GROUP BY 1
);

SELECT
  ev.page_urlpath,
  SUM(CASE WHEN ev.event = 'page_view' THEN 1 ELSE 0 END) AS pageviews,
  COUNT(DISTINCT ev.domain_sessionid) AS sessions,
  COUNT(DISTINCT ev.domain_userid) AS UBs,
  AVG(pv.time_spent_seconds) AS time_spent_average,
  SUM(pv.time_spent_seconds) AS time_spent_total,
  ROUND(AVG(pv.scroll_depth_percent)*100) AS scroll_depth_percent_average
FROM atomic.events ev, atomic.com_snowplowanalytics_snowplow_web_page_1 pg, lookup_pageview pv
WHERE CONVERT_TIMEZONE('Australia/Sydney', ev.derived_tstamp) > CONVERT_TIMEZONE('Australia/Sydney', SYSDATE) - INTERVAL '120 days'
  AND ev.event_id = pg.root_id
  AND pg.id = pv.pageview_id
  AND ev.app_id = 'poplindata.com'
GROUP BY 1
ORDER BY 2 DESC

SELECT
  ev.page_urlpath,
  SUM(CASE WHEN scroll_depth_percent = 0 THEN 1 ELSE 0 END) AS "0%",
  SUM(CASE WHEN scroll_depth_percent > 0 AND scroll_depth_percent <= 0.25 THEN 1 ELSE 0 END) AS "25%",
  SUM(CASE WHEN scroll_depth_percent > 0.25 AND scroll_depth_percent <= 0.5 THEN 1 ELSE 0 END) AS "50%",
  SUM(CASE WHEN scroll_depth_percent > 0.5 AND scroll_depth_percent <= 0.75 THEN 1 ELSE 0 END) AS "75%",
  SUM(CASE WHEN scroll_depth_percent > 0.75 THEN 1 ELSE 0 END) AS "100%"
FROM atomic.events ev, atomic.com_snowplowanalytics_snowplow_web_page_1 pg, lookup_pageview pv
WHERE CONVERT_TIMEZONE('Australia/Sydney', ev.derived_tstamp) > CONVERT_TIMEZONE('Australia/Sydney', SYSDATE) - INTERVAL '120 days'
  AND ev.event_id = pg.root_id
  AND pg.id = pv.pageview_id
  AND ev.app_id = 'poplindata.com'
  AND event = 'page_view'
GROUP BY 1
ORDER BY COUNT(*) DESC

DROP TABLE IF EXISTS lookup_sessions;
CREATE TABLE lookup_sessions
  DISTKEY(1)
  SORTKEY(1)
  AS (
    WITH sessions AS
    (SELECT DISTINCT
      collector_tstamp,
      domain_sessionid,
      refr_urlhost,
      page_referrer,
      mkt_campaign,
      refr_urlscheme,
      refr_urlhost,
      refr_urlport,
      refr_urlpath,
      refr_urlquery,
      refr_urlfragment,
      refr_medium,
      refr_source,
      refr_term,
      mkt_content,
      mkt_medium,
      mkt_source,
      page_urlpath,
      FIRST_VALUE(refr_urlhost)
      OVER (
        PARTITION BY domain_sessionid
        ORDER BY domain_sessionid, collector_tstamp
        rows between unbounded preceding and unbounded following ) AS first_refr_urlhost,
       FIRST_VALUE(page_referrer)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_page_referrer,
       FIRST_VALUE(refr_urlscheme)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_refr_urlscheme,
       FIRST_VALUE(refr_urlport)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_refr_urlport,
       FIRST_VALUE(refr_urlpath)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_refr_urlpath,
       FIRST_VALUE(refr_urlquery)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_refr_urlquery,
       FIRST_VALUE(refr_urlfragment)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_refr_urlfragment,
       FIRST_VALUE(refr_medium)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_refr_medium,
       FIRST_VALUE(refr_source)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_refr_source,
       FIRST_VALUE(refr_term)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_refr_term,
       FIRST_VALUE(mkt_campaign)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_mkt_campaign,
       FIRST_VALUE(mkt_content)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_mkt_content,
       FIRST_VALUE(mkt_medium)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_mkt_medium,
       FIRST_VALUE(mkt_source)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_mkt_source,
       FIRST_VALUE(page_urlpath)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS first_page_urlpath,
       LAST_VALUE(page_urlpath)
       OVER (
         PARTITION BY domain_sessionid
         ORDER BY domain_sessionid, collector_tstamp
         rows between unbounded preceding and unbounded following ) AS last_page_urlpath
      FROM atomic.events
      WHERE app_id IN ('poplindata.com')
      ORDER BY
        1 DESC)
    SELECT DISTINCT
      domain_sessionid,
      first_refr_urlhost,
      first_page_referrer,
      first_refr_urlscheme,
      first_refr_urlport,
      first_refr_urlpath,
      first_refr_urlquery,
      first_refr_urlfragment,
      first_refr_medium,
      first_refr_source,
      first_refr_term,
      first_mkt_campaign,
      first_mkt_content,
      first_mkt_medium,
      first_mkt_source,
      first_page_urlpath,
      last_page_urlpath,
      CASE
        WHEN first_refr_urlhost LIKE '%poplindata.com'
          THEN 'internal'
        WHEN first_refr_urlhost = 'localhost'
          THEN 'localhost'
        WHEN first_refr_urlhost = '127.0.0.1'
          THEN 'localhost'

        -- Google
        WHEN first_mkt_source = 'adwords'
          THEN 'Adwords'
        WHEN first_refr_urlhost LIKE 'www.google.%'
          THEN 'Google'
        WHEN first_refr_urlhost = 'com.google.android.googlequicksearchbox'
          THEN 'Google'
        WHEN first_refr_urlhost = 'encrypted.google.com'
          THEN 'Google'
        WHEN first_refr_urlhost LIKE '%doubleclick.net'
          THEN 'Google Doubleclick'
        WHEN first_refr_urlhost = 'plus.google.com'
          THEN 'Google Plus'
        WHEN first_refr_urlhost = 'plus.url.google.com'
          THEN 'Google Plus'
        WHEN first_refr_urlhost = 'www.googleadservices.com'
          THEN 'Google Ad Services'
        WHEN first_refr_urlhost = 'cse.google.com'
          THEN 'Google Custom Search'

        -- Email platforms
        WHEN first_refr_urlhost = 'outlook.live.com'
          THEN 'Email'
        WHEN first_refr_urlhost = 'mailchi.mp'
          THEN 'Email'
        WHEN first_refr_urlhost = 'mail.google.com'
          THEN 'Email'
        WHEN first_refr_urlhost = 'com.google.android.gm'
          THEN 'Email'

        WHEN first_refr_urlhost LIKE '%ecosia.org'
          THEN 'Ecosia Search'
        WHEN first_refr_urlhost LIKE '%search.yahoo.com'
          THEN 'Yahoo Search'
        WHEN first_refr_urlhost = 't.co'
          THEN 'Twitter'
        WHEN first_refr_urlhost LIKE '%bing.com'
          THEN 'Bing'
        WHEN first_refr_urlhost = 'discourse.snowplowanalytics.com'
          THEN 'Discourse'
        WHEN first_refr_urlhost LIKE '%snowplowanalytics.com'
          THEN 'Snowplow'
        WHEN first_refr_urlhost = 'yandex.ru'
          THEN 'Yandex'
        WHEN first_refr_urlhost = 'www.linkedin.com'
          THEN 'LinkedIn'
        WHEN first_refr_urlhost = 'com.linkedin.android'
          THEN 'LinkedIn'
        WHEN first_refr_urlhost = 'lnkd.in'
          THEN 'LinkedIn'
        WHEN first_refr_urlhost = 'chrome.google.com'
          THEN 'Chrome'
        WHEN first_refr_urlhost = 'duckduckgo.com'
          THEN 'DuckDuckGo'
        WHEN first_refr_urlhost LIKE '%measurecamp.org'
          THEN 'MeasureCamp'
        WHEN first_refr_urlhost LIKE '%meetup.com'
          THEN 'Meetup'
        WHEN first_refr_urlhost LIKE '%wawsydney.com'
          THEN 'WAW Sydney'
        WHEN first_page_referrer LIKE '%meetup.com/Web-Analytics-Wednesday-Sydney%'
          THEN 'WAW Sydney'
        WHEN first_refr_urlhost LIKE '%wawmelbourne.com'
          THEN 'WAW Melbourne'
        WHEN first_page_referrer LIKE '%meetup.com/Web-Analytics-Wednesdays-Melbourne%'
          THEN 'WAW Melbourne'
        WHEN first_refr_urlhost LIKE '%meetup.com'
          THEN 'Meetup'
        WHEN first_refr_urlhost = 'com.Slack'
          THEN 'Slack'
        WHEN first_refr_urlhost LIKE '%reddit.com'
          THEN 'Reddit'
        WHEN first_refr_urlhost LIKE '%facebook.com'
          THEN 'Facebook'
        WHEN first_refr_urlhost LIKE '%baidu.com'
          THEN 'Baidu'
        WHEN first_refr_urlhost LIKE '%github.com'
          THEN 'Github'
        WHEN first_refr_urlhost LIKE '%getpocket.com'
          THEN 'Pocket'
        WHEN first_refr_urlhost LIKE '%evernote.com'
          THEN 'Evernote'
        WHEN first_refr_urlhost IS NULL
          THEN 'Unknown'
        ELSE 'other'
        END AS channel
      FROM sessions
      ORDER BY channel
  )

  SELECT se.channel, COUNT(DISTINCT ev.domain_sessionid) AS sessions
FROM atomic.events ev, lookup_sessions se
WHERE CONVERT_TIMEZONE('Australia/Sydney', ev.derived_tstamp) > CONVERT_TIMEZONE('Australia/Sydney', SYSDATE) - INTERVAL '7 days'
      AND EVENT = 'page_view'
  AND ev.domain_sessionid= se.domain_sessionid
  AND ev.app_id = 'poplindata.com'
GROUP BY 1
ORDER BY 2 DESC

SELECT se.channel,  se.first_page_urlpath, COUNT(DISTINCT ev.domain_sessionid) AS sessions, COUNT(*) AS pv
FROM atomic.events ev, lookup_sessions se
WHERE CONVERT_TIMEZONE('Australia/Sydney', ev.derived_tstamp) > CONVERT_TIMEZONE('Australia/Sydney', SYSDATE) - INTERVAL '7 days'
      AND EVENT = 'page_view'
  AND ev.domain_sessionid= se.domain_sessionid
  AND ev.app_id = 'poplindata.com'
GROUP BY 1, 2
ORDER BY 3 DESC

DROP TABLE IF EXISTS lookup_users;
CREATE TABLE lookup_users
  DISTKEY(1)
  SORTKEY(1)
  AS (

    WITH internal_users AS (
        SELECT DISTINCT
          domain_userid,
          TRUE user_internal
        FROM atomic.events
        WHERE page_urlhost IN ('127.0.0.1', 'localhost')
              OR
              user_ipaddress IN ('52.123.123.123', '150.123.123.123')
    ),
        clearbit_data AS (
          SELECT
            DISTINCT
            domain_userid,
            FIRST_VALUE(domain_sessionid)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) first_session,
            LAST_VALUE(domain_sessionid)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_session,
            LAST_VALUE(domain IGNORE NULLS)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_domain,
            LAST_VALUE(name IGNORE NULLS)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_name,
            LAST_VALUE(legal_name IGNORE NULLS)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_legal_name,
            LAST_VALUE(description IGNORE NULLS)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_description,
            LAST_VALUE(type IGNORE NULLS)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_type,
            LAST_VALUE("linkedin.handle" IGNORE NULLS)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_linkedin_handle,
            LAST_VALUE(logo IGNORE NULLS)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_logo,
            LAST_VALUE("metrics.alexa_global_rank" IGNORE NULLS)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_metrics_alexa_global_rank,
            LAST_VALUE("metrics.annual_revenue" IGNORE NULLS)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_metrics_annual_revenue,
            LAST_VALUE("metrics.employees" IGNORE NULLS)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_metrics_employees,
            LAST_VALUE("metrics.market_cap" IGNORE NULLS)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_metrics_market_cap,
            LAST_VALUE("crunchbase.handle" IGNORE NULLS)
            OVER (
              PARTITION BY domain_userid
              ORDER BY collector_tstamp ASC
              ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) last_crunchbase_handle

          FROM atomic.events
            LEFT JOIN atomic.com_clearbit_enrichment_company_1
              ON event_id = root_id
                 AND collector_tstamp = root_tstamp
          WHERE app_id = 'poplindata.com'
          ORDER BY collector_tstamp
      )
    SELECT *
    FROM clearbit_data
      LEFT JOIN internal_users
      USING (domain_userid)
  )


  SELECT ev.geo_country, ev.geo_city, NVL(us.last_domain, ev.user_ipaddress) AS last_domain, us.last_name, se.channel, SUM(pv.time_spent_seconds) AS time_spent_seconds, COUNT(*) AS pageviews, COUNT(DISTINCT ev.domain_sessionid) AS sessions, COUNT(DISTINCT ev.domain_userid) AS unique_browsers, ROUND(AVG(pv.scroll_depth_percent) * 100) AS avg_scroll_depth
FROM
  atomic.events ev, atomic.com_snowplowanalytics_snowplow_web_page_1 pg, lookup_pageview pv, lookup_sessions se, lookup_users us
  WHERE
    ev.app_id = 'poplindata.com'
    AND ev.event = 'page_view'
    AND CONVERT_TIMEZONE('Australia/Sydney', ev.derived_tstamp) > CONVERT_TIMEZONE('Australia/Sydney', SYSDATE) - INTERVAL '7 days'
    AND ev.event_id = pg.root_id
    AND pg.id = pv.pageview_id
    AND ev.domain_sessionid = se.domain_sessionid
    AND ev.domain_userid = us.domain_userid
    AND us.user_internal IS NOT TRUE
GROUP BY 1, 2, 3, 4, 5
ORDER BY 9 DESC, 6 DESC

{
  name: 'snowplow.events',
  label: 'Events',
  description: 'All the ',
  target: std.extVar('events_target'),
  dimensions: {
    app_id,
  },
  measures: {
    total_events: {
      aggregation: 'count',
    },
    unique_users: {
      aggregation: 'countUnique',
      column: 'user_id',
    },
    unique_devices: {
      aggregation: 'countUnique',
      column: 'context_device_id',
    },
  },
}
