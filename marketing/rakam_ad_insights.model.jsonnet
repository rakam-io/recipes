{
  name: 'rakam_ad_insights',
  label: 'Ad Insights',
  mapping: {
    eventTimestamp: 'time',
    incremental: 'received_at',
    userId: 'user_id',
  },
  dbtConfig: {
    materialized: 'view',
  },
  dbtModel: |||
    SELECT c.name AS campaign,
        (cpr.received_at) AS "time",
        sum(cpr.impressions) AS impressions,
        sum(cpr.clicks) AS clicks,
        (sum(cpr.cost) / (10000)::numeric) AS cost,
        'google' AS channel
       FROM (adwords.campaign_performance_reports cpr
         LEFT JOIN adwords.campaigns c ON (((c.id) = cpr.campaign_id)))
      GROUP BY c.name, ((cpr.received_at))
    UNION ALL
     SELECT campaigns.name AS campaign,
        insights.received_at AS "time",
        sum(insights.impressions) AS impressions,
        sum(insights.clicks) AS clicks,
        sum(insights.spend) AS cost,
        'facebook' AS channel
       FROM (((facebook_ads.insights insights
         LEFT JOIN facebook_ads.ads ads ON (((ads.id) = insights.ad_id)))
         LEFT JOIN facebook_ads.ad_sets ad_sets ON (((ad_sets.id) = ads.adset_id)))
         LEFT JOIN facebook_ads.campaigns campaigns ON (((campaigns.id) = ad_sets.campaign_id)))
      GROUP BY campaigns.name, ((insights.received_at))
  |||,
  measures: {
    'Total Spent': {
      type: 'customColumn',
      aggregation: 'sum',
      customColumn: 'cost',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Total Clicks': {
      type: 'customColumn',
      aggregation: 'sum',
      customColumn: 'clicks',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Total Impressions': {
      type: 'customColumn',
      aggregation: 'count',
      customColumn: 'impressions',
      reportOptions: {
        formatNumbers: true,
      },
    },
  },
  relations: {},
  dimensions: {
    campaign: {
      label: 'Campaign Name',
      type: 'string',
      hide: false,

    },
    channel: {
      label: 'Channel',
      type: 'string',
      hide: false,

    },
    clicks: {
      label: 'Clicks',
      type: 'double',
      hide: false,

    },
    cost: {
      label: 'Cost',
      type: 'double',
      hide: false,

    },
    impressions: {
      label: 'Impressions',
      type: 'double',
      hide: false,

    },
    time: {
      label: 'Date',
      type: 'date',
      hide: false,

    },
  },
}
