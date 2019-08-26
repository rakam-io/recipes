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
  sql: |||
    -- adset_name and campaign_name are for the consolidated marketing dashboard
    select facebook_insights.*, facebook_ads.name as ad_name,
    facebook_ad_sets.id as adset_id, facebook_ad_sets.name as adset_name,
    facebook_campaigns.id as campaign_id, facebook_campaigns.name as campaign_name
    from %s as facebook_insights
    {{relation.facebook_ads}}
    {{model.facebook_ads.relation.facebook_ad_sets}}
    {{model.facebook_ad_sets.relation.facebook_campaigns}}
  ||| % {target: util.generate_target_reference(std.mergePatch(std.extVar('schema'), {table: 'insights'}))},
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
      sql: 'facebook_ad_sets.id = (select adset_id from "facebook_ads".ads where id = facebook_insights.ad_id limit 1)',
    },
    facebook_campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'facebook_campaigns',
      sql: 'facebook_campaigns.id = (select campaign_id from "facebook_ads".ads where id = facebook_insights.ad_id limit 1)',
    },
    facebook_ad_accounts: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'facebook_ad_accounts',
      sql: 'facebook_account.id = (select account_id from "facebook_ads".ads where id = facebook_insights.ad_id limit 1)',
    },
  },
  dimensions: mappingForConsolidatedMarketing {
    date_stop: {
      pivot: false,
      type: 'timestamp',
      column: 'date_stop',
      hidden: false,
    },
    date_start: {
      pivot: false,
      type: 'timestamp',
      column: 'date_start',
      hidden: false,
    },
    ad_id: {
      pivot: false,
      type: 'string',
      column: 'ad_id',
      hidden: true,
    },
  },
  measures: {
    'Total Reach': {
      description: 'The number of people who saw your ads at least once. Reach is different from impressions, which may include multiple views of your ads by the same people.',
      column: 'reach',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    'Total Impressions': {
      description: 'The number of times your ads were on screen.',
      column: 'impressions',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    'Total Social Spend': {
      description: 'The total amount you’ve spent so far for your ads showed with social information.',
      column: 'social_spend',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    'Total Clicks': {
      column: 'clicks',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    'Average Frequency': {
      description: 'The average number of times each person saw your ad.',
      column: 'frequency',
      aggregation: 'average',
      fieldType: 'double',
      hidden: false,
    },
    'Total Link Clicks': {
      column: 'link_clicks',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    'Total Post Engagements': {
      description: 'The total number of actions that people take involving your ads.',
      column: 'inline_post_engagements',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    'Total Spend': {
      description: 'The estimated total amount of money you’ve spent on your campaign, ad set or ad during its schedule.',
      column: 'spend',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    click_through_rate: {
      sql: 'SUM("clicks")/SUM("impressions")',
      fieldType: 'double',
      hidden: false,
    },
  },
}
