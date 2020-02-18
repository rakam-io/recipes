local ad_performance_reports = import './ad_performance_reports.model.jsonnet';

{
  name: 'adwords_campaign_performance_reports',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'campaign_performance_reports' }),
  label: 'Adwords Campaign Performance',
  description: 'Includes a daily snapshot of performance statistics per campaign.',
  category: 'Marketing',
  relations: {
    adwords_campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'adwords_campaigns',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
    base_adwords_campaign: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'adwords_campaigns',
      sourceColumn: 'base_campaign_id',
      targetColumn: 'id',
    },
  },
  dimensions: {
    campaign_status: {
      column: 'campaign_status',
    },
    campaign_trial_type: {
      column: 'campaign_trial_type',
    },
    interaction_types: {
      column: 'interaction_types',
    },
    base_campaign_id: {
      column: 'base_campaign_id',
    },
    date: {
      timeframes: [],
      sql: 'cast(date_start as date)',
    },
    advertising_channel_sub_type: {
      type: 'string',
      column: 'advertising_channel_sub_type',
    },
    campaign_id: {
      hidden: true,
      column: 'campaign_id',
    },
    budget_id: {
      hidden: true,
      column: 'budget_id',
    },
    adwords_customer_id: {
      hidden: true,
      column: 'adwords_customer_id',
    },
  },
  measures: ad_performance_reports.measures,
}
