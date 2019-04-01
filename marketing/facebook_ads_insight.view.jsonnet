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
     FROM (((%(facebookSchema)s.insights
       LEFT JOIN %(facebookSchema)s.ads ON (((ads.id)::text = insights.ad_id)))
       LEFT JOIN %(facebookSchema)s.ad_sets ON (((ad_sets.id)::text = ads.adset_id)))
       LEFT JOIN %(facebookSchema)s.campaigns ON (((campaigns.id)::text = ad_sets.campaign_id)))
    ORDER BY campaigns.name, insights.date_start;
  |||,
  measures: {
    'Facebook Ads Insight spend SUM': {
      value: { aggregation: 'sum', column: 'spend' },
      type: 'customColumn',
      reportOptions: {},
    },
    'Facebook Ads Insight frequency AVERAGE': {
      type: 'customColumn',
      aggregation: 'average', column: 'frequency',
      reportOptions: {},
    },
    'Facebook Ads Insight impressions SUM': {
      type: 'customColumn',
      aggregation: 'sum', column: 'impressions',
      reportOptions: {},
    },
    'Facebook Ads Insight campaign COUNT_UNIQUE': {
      type: 'customColumn',
      aggregation: 'countUnique', column: 'campaign',
      reportOptions: {},
    },
    'Facebook Ads Insight clicks SUM': {
      type: 'customColumn',
      aggregation: 'sum', column: 'clicks',
      reportOptions: {},
    },
  },

}
