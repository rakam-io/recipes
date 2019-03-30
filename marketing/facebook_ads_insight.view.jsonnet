{
  label: 'Facebook Ads Insight',
  columnMapping: {
    eventTimestamp: 'date_start',
    incremental: null,
    userId: null,
    deviceId: null,
    sessionId: null,
  },
  type: 'view',
  query: |||
  SELECT campaigns.name AS campaign,
      ad_sets.name AS ad_set,
      (insights.date_start)::date AS date_start,
      (insights.date_stop)::date AS date_stop,
      insights.impressions,
      insights.clicks,
      insights.spend,
      insights.reach,
      insights.frequency
     FROM (((facebook_ads.insights
       LEFT JOIN facebook_ads.ads ON (((ads.id)::text = insights.ad_id)))
       LEFT JOIN facebook_ads.ad_sets ON (((ad_sets.id)::text = ads.adset_id)))
       LEFT JOIN facebook_ads.campaigns ON (((campaigns.id)::text = ad_sets.campaign_id)))
    ORDER BY campaigns.name, insights.date_start;
  |||,
  measures: {
    'Facebook Ads Insight spend SUM': {
      value: { aggregation: 'sum', column: 'spend' },
      type: 'customColumn',
      reportOptions: {},
    },
    'Facebook Ads Insight frequency AVERAGE': {
      value: { aggregation: 'average', column: 'frequency' },
      type: 'customColumn',
      reportOptions: {},
    },
    'Facebook Ads Insight impressions SUM': {
      value: { aggregation: 'sum', column: 'impressions' },
      type: 'customColumn',
      reportOptions: {},
    },
    'Facebook Ads Insight campaign COUNT_UNIQUE': {
      value: { aggregation: 'countUnique', column: 'campaign' },
      type: 'customColumn',
      reportOptions: {},
    },
    'Facebook Ads Insight clicks SUM': {
      value: { aggregation: 'sum', column: 'clicks' },
      type: 'customColumn',
      reportOptions: {},
    },
  },

}
