{
  name: 'facebook_insights2',
  hidden: false,
  sql: '-- adset_name and campaign_name are for the consolidated marketing dashboard\nselect facebook_insights.*, \nfacebook_ads.name as ad_name,\nfacebook_ad_sets.id as adset_id, facebook_ad_sets.name as adset_name, \nfacebook_campaigns.id as campaign_id, facebook_campaigns.name as campaign_name \nfrom {{model.facebook_insights}} \n{{model.facebook_insights.relation.facebook_ads}}\n{{model.facebook_ads.relation.facebook_ad_sets}}\n{{model.facebook_ad_sets.relation.facebook_campaigns}}',
  mappings: {},
  dimensions: {
    id: {
      pivot: false,
      type: 'string',
      column: 'id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    received_at: {
      pivot: false,
      type: 'timestamp',
      column: 'received_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
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
    uuid_ts: {
      pivot: false,
      type: 'timestamp',
      column: 'uuid_ts',
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
      hidden: false,
    },
    ad_name: {
      pivot: false,
      type: 'string',
      column: 'ad_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    adset_id: {
      pivot: false,
      type: 'string',
      column: 'adset_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    adset_name: {
      pivot: false,
      type: 'string',
      column: 'adset_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    campaign_id: {
      pivot: false,
      type: 'string',
      column: 'campaign_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    campaign_name: {
      pivot: false,
      type: 'string',
      column: 'campaign_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
