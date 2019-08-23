{
  name: 'facebook_insights',
  hidden: false,
  target: {
    database: 'vpn_segment',
    schema: 'facebook_ads',
    table: 'insights',
  },
  mappings: {},
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
  dimensions: {
    date_stop: {
      pivot: false,
      type: 'timestamp',
      column: 'date_stop',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    date_start: {
      pivot: false,
      type: 'timestamp',
      column: 'date_start',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    ad_id: {
      pivot: false,
      type: 'string',
      column: 'ad_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
  },
  measures: {
    'Total Reach': {
      description: 'The number of people who saw your ads at least once. Reach is different from impressions, which may include multiple views of your ads by the same people.',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'reach',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    'Total Impressions': {
      description: 'The number of times your ads were on screen.',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'impressions',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    'Total Social Spend': {
      description: 'The total amount you’ve spent so far for your ads showed with social information.',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'social_spend',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    'Total Clicks': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'clicks',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    'Average Frequency': {
      description: 'The average number of times each person saw your ad.',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'frequency',
      aggregation: 'average',
      fieldType: 'double',
      hidden: false,
    },
    'Total Link Clicks': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'link_clicks',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    'Total Post Engagements': {
      description: 'The total number of actions that people take involving your ads.',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'inline_post_engagements',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    'Total Spend': {
      description: 'The estimated total amount of money you’ve spent on your campaign, ad set or ad during its schedule.',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'spend',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
    click_through_rate: {
      reportOptions: {
        formatNumbers: true,
      },
      sql: 'SUM("clicks")/SUM("impressions")',
      fieldType: 'double',
      hidden: false,
    },
  },
}
