{
  name: 'facebook_ads',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'ads' }),
  mappings: {},
  category: 'Marketing',
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
      hidden: true,
    },
    account_id: {
      pivot: false,
      type: 'string',
      column: 'account_id',
      hidden: true,
    },
    bid_type: {
      pivot: false,
      type: 'string',
      column: 'bid_type',
      hidden: false,
    },
    campaign_id: {
      pivot: false,
      type: 'string',
      column: 'campaign_id',
      hidden: true,
    },
    adset_id: {
      pivot: false,
      type: 'string',
      column: 'adset_id',
      hidden: true,
    },
    name: {
      pivot: false,
      type: 'string',
      column: 'name',
      hidden: false,
    },
    status: {
      pivot: false,
      type: 'string',
      column: 'status',
      hidden: false,
    },
  },
}
