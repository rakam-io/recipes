{
  name: 'ad_insight',
  label: 'Ad Insights',
  type: 'view',
  query: |||
   SELECT c.name AS campaign,
      (cpr.received_at)::date AS "time",
      sum(cpr.impressions) AS impressions,
      sum(cpr.clicks) AS clicks,
      (sum(cpr.cost) / (10000)::numeric) AS cost,
      'google'::text AS channel
     FROM (%(adwordsSchema)s.campaign_performance_reports cpr
       LEFT JOIN %(adwordsSchema)s.campaigns c ON (((c.id)::text = cpr.campaign_id)))
    GROUP BY c.name, ((cpr.received_at)::date)
  UNION ALL
   SELECT campaigns.name AS campaign,
      (insights.received_at)::date AS "time",
      sum(insights.impressions) AS impressions,
      sum(insights.clicks) AS clicks,
      sum(insights.spend) AS cost,
      'facebook'::text AS channel
     FROM (((%(facebookSchema)s.insights insights
       LEFT JOIN %(facebookSchema)s.ads ads ON (((ads.id)::text = insights.ad_id)))
       LEFT JOIN %(facebookSchema)s.ad_sets ad_sets ON (((ad_sets.id)::text = ads.adset_id)))
       LEFT JOIN %(facebookSchema)s.campaigns campaigns ON (((campaigns.id)::text = ad_sets.campaign_id)))
    GROUP BY campaigns.name, ((insights.received_at)::date);
  ||| % variables,
  columnMapping: {
    eventTimestamp: 'time',
    incremental: null,
    userId: null,
    deviceId: null,
    sessionId: null,
  },
  measures: {
    'Total Spend': {
      type: 'customColumn',
      aggregation: 'sum',
              column: 'cost',
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
    },
    Clicks: {
      type: 'customColumn',
        aggregation: 'sum',
              column: 'clicks',
      reportOptions: {},
    },
    'Click Through Rate': {
      type: 'expression',
              expression: 'SUM("clicks")/SUM("impressions")',

      reportOptions: {},
    },
    Impressions: {
      type: 'customColumn',
       aggregation: 'sum',
              column: 'impressions',
      reportOptions: {},
    },
    'Campaign Count': {
      type: 'customColumn',
       aggregation: 'countUnique',
              column: 'campaign',
      reportOptions: {},
    },
  },
}
