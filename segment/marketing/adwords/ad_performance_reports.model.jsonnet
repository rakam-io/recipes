local util = import '../../../util.libsonnet';

local mappingForConsolidatedMarketing = {
                              // measures
                              clicks: {hidden: true, column: 'clicks'},
                              conversions: {hidden: true, column: 'conversions'},
                              conversion_value: {hidden: true, column: 'conversion_value'},
                              cost: {hidden: true, column: 'cost'},
                              impressions: {hidden: true, column: 'impressions'},

                              // dimensions
                              ad_name: {column: 'ad_name'},
                              ad_group_name: {column: 'ad_group_name'},
                              campaign_name: {column: 'campaign_name'},
                              };

{
  name: 'adwords_ad_performance_reports',
  hidden: false,
  sql: |||
      SELECT
      ad_performance_reports.*, adwords_ads.name as ad_name,
      adwords_ad_groups.id as ad_group_id, adwords_ad_groups.name as ad_group_name,
      adwords_campaigns.id as campaign_id, adwords_campaigns.name as campaign_name,
      from %(target)s
      {{relation.adwords_ads}}
      {{model.adwords_ads.relation.adwords_ad_groups}}
      {{model.adwords_ad_groups.relation.adwords_campaigns}}
||| % {target: util.generate_target_reference(std.mergePatch(std.extVar('schema'), {table: 'ad_performance_reports'}))},
  relations: {
    adwords_ads: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'adwords_ads',
      sourceColumn: 'ad_id',
      targetColumn: 'id',
    },
  },
  dimensions: {
    id: {
      pivot: false,
      type: 'string',
      column: 'id',
      hidden: false,
    },
    received_at: {
      pivot: false,
      type: 'timestamp',
      column: 'received_at',
      hidden: false,
    },
    date_stop: {
      pivot: false,
      type: 'timestamp',
      column: 'date_stop',
      hidden: false,
    },
    ad_id: {
      pivot: false,
      type: 'string',
      column: 'ad_id',
      hidden: false,
    },
    date_start: {
      pivot: false,
      type: 'timestamp',
      column: 'date_start',
      hidden: false,
    },
    uuid_ts: {
      pivot: false,
      type: 'timestamp',
      column: 'uuid_ts',
      hidden: false,
    },
    adwords_customer_id: {
      pivot: false,
      type: 'string',
      column: 'adwords_customer_id',
      hidden: false,
    },
    interaction_types: {
      pivot: false,
      type: 'string',
      column: 'interaction_types',
      hidden: false,
    },
    account_currency_code: {
      pivot: false,
      type: 'string',
      column: 'account_currency_code',
      hidden: false,
    },
    account_descriptive_name: {
      pivot: false,
      type: 'string',
      column: 'account_descriptive_name',
      hidden: false,
    },
  },
  measures: {
                invalid_clicks: {
                  category: 'Overview',
                  column: 'invalid_clicks',
                  aggregation: 'sum',
                  fieldType: 'double',
                  hidden: false,
                },
                average_time_on_site: {
                  category: 'Overview',
                  column: 'average_time_on_site',
                  aggregation: 'average',
                  fieldType: 'double',
                  hidden: false,
                },
                average_bounce_rate: {
                  category: 'Overview',
                  column: 'bounce_rate',
                  aggregation: 'average',
                  fieldType: 'double',
                  hidden: false,
                },
                click_assisted_conversions: {
                  category: 'Overview',
                  column: 'click_assisted_conversions',
                  aggregation: 'sum',
                  fieldType: 'double',
                  hidden: false,
                },
                gmail_forwards: {
                  category: 'Gmail',
                  column: 'gmail_forwards',
                  aggregation: 'sum',
                  fieldType: 'double',
                  hidden: false,
                },
                average_video_view_rate: {
                  category: 'Video',
                  column: 'video_view_rate',
                  aggregation: 'average',
                  fieldType: 'double',
                  hidden: false,
                },
                budget: {
                  category: 'Cost',
                  reportOptions: {
                    prefix: '$',
                    formatNumbers: true,
                  },
                  column: 'amount',
                  aggregation: 'sum',
                  fieldType: 'double',
                  hidden: false,
                },
                viewability: {
                  category: 'Overview',
                  column: 'active_view_viewability',
                  aggregation: 'average',
                  fieldType: 'double',
                  hidden: false,
                },
                cost: {
                  description: 'The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period.',
                  category: 'Cost',
                  column: 'cost',
                  aggregation: 'sum',
                  fieldType: 'double',
                  hidden: false,
                },
                clicks: {
                  category: 'Overview',
                  column: 'clicks',
                  aggregation: 'sum',
                  fieldType: 'double',
                  hidden: false,
                },
                impressions: {
                  category: 'Overview',
                  column: 'impressions',
                  aggregation: 'count',
                  fieldType: 'double',
                  hidden: false,
                },
                engagements: {
                  category: 'Overview',
                  column: 'engagements',
                  aggregation: 'count',
                  fieldType: 'double',
                  hidden: false,
                },
                video_quartile_100_rate: {
                  description: 'Percentage of impressions where the viewer watched all of your video.',
                  category: 'Video',
                  column: 'video_quartile_100_rate',
                  aggregation: 'average',
                  fieldType: 'double',
                  hidden: false,
                },
                video_quartile_50_rate: {
                  category: 'Video',
                  column: 'video_quartile_50_rate',
                  aggregation: 'average',
                  fieldType: 'double',
                  hidden: false,
                },
                video_view_rate: {
                  description: 'The number of views your TrueView video ad receives divided by its number of impressions, including thumbnail impressions for TrueView in-display ads.',
                  category: 'Video',
                  column: 'video_view_rate',
                  aggregation: 'average',
                  fieldType: 'double',
                  hidden: false,
                },
                total_video_views: {
                  category: 'Video',
                  column: 'video_views',
                  aggregation: 'sum',
                  fieldType: 'double',
                  hidden: false,
                },
                gmail_saves: {
                  category: 'Gmail',
                  column: 'gmail_saves',
                  aggregation: 'sum',
                  fieldType: 'double',
                  hidden: false,
                },
                gmail_secondary_clicks: {
                  description: 'The number of clicks to your landing page on the expanded state of Gmail ads.',
                  category: 'Gmail',
                  column: 'gmail_secondary_clicks',
                  aggregation: 'count',
                  fieldType: 'double',
                  hidden: false,
                },
                interactions: {
                  category: 'Overview',
                  column: 'interactions',
                  aggregation: 'sum',
                  fieldType: 'double',
                  hidden: false,
                },
              }
}