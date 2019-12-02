local util = import '../../../util.libsonnet';

local measures = {
  clicks: {
    column: 'clicks',
    aggregation: 'sum',
  },
  conversions: {
    column: 'conversions',
    aggregation: 'sum',
  },
  conversion_value: {
    column: 'conversion_value',
    aggregation: 'sum',
  },
  cost: {
    description: 'The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period.',
    column: 'cost',
    aggregation: 'sum',
    hidden: false,
    reportOptions: {
      prefix: '$',
    },
  },
  impressions: {
    column: 'impressions',
    aggregation: 'sum',
  },
};

local dimensions = {
  ad_name: { column: 'ad_id' },
  ad_group_name: { column: 'ad_group_name' },
  campaign_name: { column: 'campaign_name' },
};

local mappingForConsolidatedMarketing = std.mapWithKey(function(key, value) { hidden: true, column: value.column }, measures) + dimensions;

{
  name: 'adwords_ad_performance_reports',
  hidden: false,
  label: 'Adwords Ads',
  category: 'Marketing',
  sql: |||
    SELECT
    adwords_ad_performance_reports.*,
    adwords_ad_groups.id as ad_group_id, adwords_ad_groups.name as ad_group_name,
    adwords_campaigns.id as campaign_id, adwords_campaigns.name as campaign_name
    from %(target)s as adwords_ad_performance_reports
    {{relation.adwords_ads}}
    {{model.adwords_ads.relation.adwords_ad_groups}}
    {{model.adwords_ad_groups.relation.adwords_campaigns}}
  ||| % { target: util.generate_target_reference(std.mergePatch(std.extVar('schema'), { table: 'ad_performance_reports' })) },
  relations: {
    adwords_ads: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'adwords_ads',
      sourceColumn: 'ad_id',
      targetColumn: 'id',
    },
  },
  dimensions: mappingForConsolidatedMarketing {
    ad_id: {
      column: 'ad_id',
      hidden: true,
    },
    date: {
      sql: 'cast(date_start as date)',
      timeframes: [],
    },
    adwords_customer_id: {
      column: 'adwords_customer_id',
      hidden: true,
    },
    interaction_types: {
      column: 'interaction_types',
    },
    account_currency_code: {
      column: 'account_currency_code',
      hidden: false,
    },
    account_descriptive_name: {
      column: 'account_descriptive_name',
    },
  },
  measures: measures {
    invalid_clicks: {
      category: 'Overview',
      column: 'invalid_clicks',
      aggregation: 'sum',
    },
    average_time_on_site: {
      category: 'Overview',
      column: 'average_time_on_site',
      aggregation: 'average',
    },
    average_bounce_rate: {
      category: 'Overview',
      column: 'bounce_rate',
      aggregation: 'average',
    },
    click_assisted_conversions: {
      category: 'Overview',
      column: 'click_assisted_conversions',
      aggregation: 'sum',
    },
    gmail_forwards: {
      category: 'Gmail',
      column: 'gmail_forwards',
      aggregation: 'sum',
    },
    average_video_view_rate: {
      category: 'Video',
      column: 'video_view_rate',
      aggregation: 'average',
    },
    budget: {
      category: 'Cost',
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
      column: 'cost',
      aggregation: 'sum',
    },
    viewability: {
      category: 'Overview',
      column: 'active_view_viewability',
      aggregation: 'average',
    },
    engagements: {
      category: 'Overview',
      column: 'engagements',
      aggregation: 'count',
    },
    video_quartile_100_rate: {
      description: 'Percentage of impressions where the viewer watched all of your video.',
      category: 'Video',
      column: 'video_quartile_100_rate',
      aggregation: 'average',
    },
    video_quartile_50_rate: {
      category: 'Video',
      column: 'video_quartile_50_rate',
      aggregation: 'average',
    },
    video_view_rate: {
      description: 'The number of views your TrueView video ad receives divided by its number of impressions, including thumbnail impressions for TrueView in-display ads.',
      category: 'Video',
      column: 'video_view_rate',
      aggregation: 'average',
    },
    total_video_views: {
      category: 'Video',
      column: 'video_views',
      aggregation: 'sum',
    },
    gmail_saves: {
      category: 'Gmail',
      column: 'gmail_saves',
      aggregation: 'sum',
    },
    gmail_secondary_clicks: {
      description: 'The number of clicks to your landing page on the expanded state of Gmail ads.',
      category: 'Gmail',
      column: 'gmail_secondary_clicks',
      aggregation: 'count',
    },
    interactions: {
      category: 'Overview',
      column: 'interactions',
      aggregation: 'sum',
    },
  },
}
