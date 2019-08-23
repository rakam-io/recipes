local util = import '../../../util.libsonnet';

local mappingForConsolidatedMarketing = {
                              // measures
                              clicks: {hidden: true, column: 'clicks'},
                              conversions: {hidden: true, column: 'conversions'},
                              cost: {hidden: true, column: 'cost'},
                              conversion_value: {hidden: true, column: 'conversion_value'},
                              impressions: {hidden: true, column: 'impressions'},

                              // dimensions
                              ad_name: {column: 'ad_name'},
                              ad_group_name: {column: 'ad_group_name'},
                              campaign_name: {column: 'campaign_name'},
                              }

{
  name: 'adwords_ad_performance_reports',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), {table: 'ad_performance_reports'}),
  sql: |||
     -- adset_name and campaign_name are for the consolidated marketing dashboard
      facebook_campaigns.id as campaign_id, facebook_campaigns.name as campaign_name
      from %s
      {{model.facebook_insights.relation.facebook_ads}}
      {{model.facebook_ads.relation.facebook_ad_sets}}
      {{model.facebook_ad_sets.relation.facebook_campaigns}}
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
}
