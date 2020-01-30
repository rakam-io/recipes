{
  measures: {
    total_pageviews: {
      aggregation: 'count',
    },
    unique_visitors: {
      column: 'fullVisitorId',
      aggregation: 'countUnique',
    },
  },
  dimensions: {
    pageview_time: {
      sql: 'TIMESTAMP_SECONDS(CAST({{TABLE}}.visitStartTime + ({{TABLE}}.time / 1000) as INT64))',
      type: 'timestamp',
    },
    seconds_since_session_start: {
      sql: 'time',
      description: 'The number of milliseconds after the visitStartTime when this hit was registered. The first hit has a hits.time of 0',
    },
    data_source: {
      sql: 'dataSource',
      description: 'The data source of a hit. By default, hits sent from analytics.js are reported as "web" and hits sent from the mobile SDKs are reported as "app".',
    },
    hit_number: {
      sql: 'hitNumber',
      description: 'The sequenced hit number. For the first hit of each session, this is set to 1.',
    },
    is_entrance: {
      sql: 'isEntrance',
      description: 'If this hit was the first pageview or screenview hit of a session, this is set to true.',
    },
    is_exit: {
      sql: 'isExit',
      description: 'If this hit was the last pageview or screenview hit of a session, this is set to true.',
    },
    is_interaction: {
      sql: 'isInteraction',
      description: 'If this hit was an interaction, this is set to true. If this was a non-interaction hit (i.e., an event with interaction set to false), this is false.',
    },
    hit_type: {
      sql: 'type',
      description: 'The type of hit. One of: "PAGE", "TRANSACTION", "ITEM", "EVENT", "SOCIAL", "APPVIEW", "EXCEPTION".',
    },
    hit_referer: {
      sql: 'referer',
      description: 'The referring page, if the session has a goal completion or transaction. If this page is from the same domain, this is blank.',
    },
  },
}
