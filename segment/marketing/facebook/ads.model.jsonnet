{
  name: 'facebook_ads',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'ads' }),
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
      type: 'string',
      column: 'id',
      hidden: true,
    },
    account_id: {
      type: 'string',
      column: 'account_id',
      hidden: true,
    },
    bid_type: {
      type: 'string',
      column: 'bid_type',
      hidden: false,
    },
    campaign_id: {
      type: 'string',
      column: 'campaign_id',
      hidden: true,
    },
    adset_id: {
      type: 'string',
      column: 'adset_id',
      hidden: true,
    },
    name: {
      type: 'string',
      column: 'name',
      hidden: false,
    },
    is_active: {
      type: 'boolean',
      sql: "CASE WHEN {{TABLE}}.status = 'ACTIVE' then TRUE else FALSE END",
    },
    status: {
      type: 'string',
      column: 'status',
      hidden: false,
    },
  },
}
