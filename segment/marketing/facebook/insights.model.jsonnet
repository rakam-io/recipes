local util = import '../../../util.libsonnet';

local mappingForConsolidatedMarketing = {
  // measures
  clicks: { hidden: true, column: 'clicks' },
  // conversions on facebook are not collected by Segment, you need to create a ticket and activate it manually.
  // see: https://community.segment.com/t/q5jfdf/google-adwords-and-facebook-ads-data
  // conversions: {hidden: true, column: 'conversions'},
  // conversion_value: {hidden: true, column: 'conversion_value'},
  cost: { hidden: true, column: 'spend' },
  impressions: { hidden: true, column: 'impressions' },

  // dimensions
  ad_name: { column: 'ad_name' },
  ad_group_name: { column: 'adset_name' },
  campaign_name: { column: 'campaign_name' },
};

{
  name: 'facebook_insights',
  hidden: false,
  label: 'Facebook Ads',
  sql: |||
    select facebook_insights.*, 
    facebook_ads.adset_id, facebook_ads.campaign_id, facebook_ads.account_id,
    facebook_ads.name as ad_name, facebook_ad_sets.name as adset_name, facebook_campaigns.name as campaign_name, facebook_ad_accounts.name as account_name
    from %(target)s as facebook_insights
    {{relation.facebook_ads}}
    {{model.facebook_ads.relation.facebook_ad_sets}}
    {{model.facebook_ads.relation.facebook_campaigns}}
    {{model.facebook_ads.relation.facebook_ad_accounts}}
  ||| % { target: util.generate_target_reference(std.mergePatch(std.extVar('schema'), { table: 'insights' })) },
  category: 'Marketing',
  mappings: {
    eventTimestamp: 'date',
  },
  relations: {
    facebook_ads: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'facebook_ads',
      sourceColumn: 'ad_id',
      targetColumn: 'id',
    },
    facebook_ad_sets: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'facebook_ad_sets',
      sourceColumn: 'adset_id',
      targetColumn: 'id',
    },
    facebook_campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'facebook_campaigns',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
    facebook_ad_accounts: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'facebook_ad_accounts',
      sourceColumn: 'account_id',
      targetColumn: 'id',
    },
  },
  dimensions: mappingForConsolidatedMarketing {
    date: {
      sql: 'CAST({{TABLE}}.date_start AS DATE)',
      type: 'timestamp',
      timeframes: [],
    },
    ad_id: {
      pivot: false,
      type: 'string',
      column: 'ad_id',
      hidden: true,
    },
  },
  measures: {
    reach: {
      description: 'The number of people who saw your ads at least once. Reach is different from impressions, which may include multiple views of your ads by the same people.',
      column: 'reach',
      aggregation: 'sum',
      hidden: false,
    },
    impressions: {
      description: 'The number of times your ads were on screen.',
      column: 'impressions',
      aggregation: 'sum',
      hidden: false,
    },
    social_spend: {
      description: 'The total amount you’ve spent so far for your ads showed with social information.',
      column: 'social_spend',
      aggregation: 'sum',
      hidden: false,
    },
    clicks: {
      column: 'clicks',
      aggregation: 'sum',
      hidden: false,
    },
    frequency: {
      description: 'The average number of times each person saw your ad.',
      column: 'frequency',
      aggregation: 'average',
      hidden: false,
    },
    link_clicks: {
      column: 'link_clicks',
      aggregation: 'sum',
      hidden: false,
    },
    post_engagements: {
      description: 'The total number of actions that people take involving your ads.',
      column: 'inline_post_engagements',
      aggregation: 'sum',
      hidden: false,
    },
    total_spend: {
      description: 'The estimated total amount of money you’ve spent on your campaign, ad set or ad during its schedule.',
      sql: 'coalesce(spend, 0)',
      aggregation: 'sum',
      reportOptions: {
        prefix: '$',
      },
    },
    click_through_rate: {
      sql: '{{measure.clicks}}/{{measure.impressions}}',
      //      type: 'double',
      hidden: false,
    },
  },
}
