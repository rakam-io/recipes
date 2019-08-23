{
  name: 'facebook_ads',
  hidden: true,
  target: {
    database: 'vpn_segment',
    schema: 'facebook_ads',
    table: 'ads',
  },
  mappings: {},
  relations: {
    facebook_campaigns: {
      relationType: 'manyToMany',
      joinType: 'leftJoin',
      modelName: 'facebook_campaigns',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
    facebook_ad_sets: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'facebook_ad_sets',
      sourceColumn: 'adset_id',
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
  dimensions: {
    id: {
      pivot: false,
      type: 'string',
      column: 'id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
    account_id: {
      pivot: false,
      type: 'string',
      column: 'account_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
    bid_type: {
      pivot: false,
      type: 'string',
      column: 'bid_type',
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
      hidden: true,
    },
    adset_id: {
      pivot: false,
      type: 'string',
      column: 'adset_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
    name: {
      pivot: false,
      type: 'string',
      column: 'name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    status: {
      pivot: false,
      type: 'string',
      column: 'status',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
