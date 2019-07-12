{
  name: 'rakam_adwords_ads_insights',
  label: 'Adwords',
  mapping: {
    eventTimestamp: 'received_at',
    incremental: 'received_at',
    userId: 'user_id',
  },
  dbtConfig: {
    materialized: 'view',
  },
  dbtModel: |||
    SELECT c.id AS campaign_id,
             c.name AS campaign,
             cpr.received_at,
             cpr.interactions,
             cpr.active_view_impressions,
             cpr.amount,
             cpr.clicks,
             cpr.impressions,
             cpr.interaction_types,
             cpr.cost,
             cpr.conversions
            FROM (adwords.campaign_performance_reports cpr
              LEFT JOIN adwords.campaigns c ON (((c.id)::text = cpr.campaign_id)))
  |||,
  measures: {
    'Total Clicks': {
      type: 'customColumn',
      aggregation: 'sum',
      customColumn: 'clicks',
      reportOptions: {
        formatNumbers: true,
      },
    },
    'Total Spent': {
      type: 'customColumn',
      aggregation: 'sum',
      customColumn: 'cost',
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
    },
    'Total Conversions': {
      type: 'customColumn',
      aggregation: 'sum',
      customColumn: 'conversions',
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
    },
    'Total Interactions': {
      type: 'customColumn',
      aggregation: 'count',
      customColumn: 'interactions',
      reportOptions: {
        formatNumbers: true,
      },
    },
  },
  relations: [],
  columns: {
    active_view_impressions: {

      
      
    },
    amount: {

      
      
    },
    campaign: {
      
    },
    campaign_id: {

      hide: true,

    },
    clicks: {

      
      
    },
    conversions: {

      
      
    },
    cost: {

      
      
    },
    impressions: {

      
      
    },
    interaction_types: {

      

    },
    interactions: {

      
      
    },
    received_at: {

      

    },
  },
}
