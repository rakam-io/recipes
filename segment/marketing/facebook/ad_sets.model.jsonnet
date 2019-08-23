{
  name: 'facebook_ad_sets',
  hidden: true,
  target: {
    database: 'vpn_segment',
    schema: 'facebook_ads',
    table: 'ad_sets',
  },
  mappings: {
    eventTimestamp: 'end_time',
  },
  relations: {
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
    name: {
      pivot: false,
      type: 'string',
      column: 'name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
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
    campaign_id: {
      pivot: false,
      type: 'string',
      column: 'campaign_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
    effective_status: {
      description: 'The effective status of the ad set, which can be either its own status or caused by its parent campaign.',
      pivot: false,
      type: 'string',
      column: 'effective_status',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    configured_status: {
      description: 'The status set at the ad set level. It can be different from the effective status due to its parent campaign.',
      pivot: false,
      type: 'string',
      column: 'configured_status',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    end_time: {
      pivot: false,
      type: 'timestamp',
      column: 'end_time',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
