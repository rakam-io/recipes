{
  name: 'rakam_facebook_ads_insights',
  label: 'Facebook Ads',
  mappings: {
    eventTimestamp: 'date_start',
    incremental: 'received_at',
    userId: 'user_id',
  },
  dbtConfig: {
    materialized: 'view',
  },
  dbtModel: |||
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
     ORDER BY campaigns.name, insights.date_start
  |||,
  measures: {
    'Total Impressions': {
      type: 'customColumn',
      aggregation: 'sum',
      customColumn: 'impressions',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Total Reach': {
      type: 'customColumn',
      aggregation: 'sum',
      customColumn: 'reach',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Total Clicks': {
      type: 'customColumn',
      aggregation: 'count',
      customColumn: 'clicks',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Total Spent': {
      type: 'customColumn',
      aggregation: 'count',
      customColumn: 'spend',
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
    },
    'Average Frequency': {
      type: 'customColumn',
      aggregation: 'average',
      customColumn: 'frequency',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Click Through Rate': {
      type: 'expression',
      expression: 'SUM("clicks")/SUM("impressions")',
      reportOptions: {
        formatNumbers: true,
      },
    },
  },
  dimensions: {
    ad_set: {

    },
    campaign: {

    },
    clicks: {

    },
    date_start: {

    },
    date_stop: {

    },
    frequency: {

    },
    impressions: {

    },
    reach: {

    },
    spend: {

    },
  },
}
