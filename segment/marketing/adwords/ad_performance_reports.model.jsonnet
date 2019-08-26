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
                              }

{
  name: 'adwords_ad_performance_reports',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), {table: 'ad_performance_reports'}),
  sql: |||
      SELECT
      ad_performance_reports.*, adwords_ads.name as ad_name,
      adwords_ad_groups.id as ad_group_id, adwords_ad_groups.name as ad_group_name,
      adwords_campaigns.id as campaign_id, adwords_campaigns.name as campaign_name,
      from %s
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
},
