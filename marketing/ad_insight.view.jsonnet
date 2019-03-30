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
     FROM (adwords.campaign_performance_reports cpr
       LEFT JOIN adwords.campaigns c ON (((c.id)::text = cpr.campaign_id)))
    GROUP BY c.name, ((cpr.received_at)::date)
  UNION ALL
   SELECT campaigns.name AS campaign,
      (insights.received_at)::date AS "time",
      sum(insights.impressions) AS impressions,
      sum(insights.clicks) AS clicks,
      sum(insights.spend) AS cost,
      'facebook'::text AS channel
     FROM (((facebook_ads.insights insights
       LEFT JOIN facebook_ads.ads ads ON (((ads.id)::text = insights.ad_id)))
       LEFT JOIN facebook_ads.ad_sets ad_sets ON (((ad_sets.id)::text = ads.adset_id)))
       LEFT JOIN facebook_ads.campaigns campaigns ON (((campaigns.id)::text = ad_sets.campaign_id)))
    GROUP BY campaigns.name, ((insights.received_at)::date);
  |||,
  columnMapping: {
    eventTimestamp: 'time',
    incremental: null,
    userId: null,
    deviceId: null,
    sessionId: null,
  },
  measures: {
    'Total Spend': {
      value: {
        aggregation: 'sum',
        column: 'cost',
      },
      type: 'customColumn',
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
    },
    Clicks: {
      value: {
        aggregation: 'sum',
        column: 'clicks',
      },
      type: 'customColumn',
      reportOptions: {},
    },
    'Click Through Rate': {
      value: {
        expression: 'SUM("clicks")/SUM("impressions")',
      },
      type: 'expression',
      reportOptions: {},
    },
    Impressions: {
      value: {
        aggregation: 'sum',
        column: 'impressions',
      },
      type: 'customColumn',
      reportOptions: {},
    },
    'Campaign Count': {
      value: {
        aggregation: 'countUnique',
        column: 'campaign',
      },
      type: 'customColumn',
      reportOptions: {},
    },
  },
}
