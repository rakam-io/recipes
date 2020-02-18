{
  name: 'facebook_ad_sets',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'ad_sets' }),
  mappings: {
    eventTimestamp: 'end_time',
  },
  category: 'Marketing',
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
      type: 'string',
      column: 'id',
      hidden: true,
    },
    is_active: {
      type: 'boolean',
      sql: 'CASE WHEN {{TABLE}}.effective_status = "ACTIVE" then TRUE else FALSE END',
    },
    name: {
      type: 'string',
      column: 'name',
      hidden: false,
    },
    account_id: {
      type: 'string',
      column: 'account_id',
      hidden: true,
    },
    campaign_id: {
      type: 'string',
      column: 'campaign_id',
      hidden: true,
    },
    effective_status: {
      description: 'The effective status of the ad set, which can be either its own status or caused by its parent campaign.',
      type: 'string',
      column: 'effective_status',
      hidden: false,
    },
    configured_status: {
      description: 'The status set at the ad set level. It can be different from the effective status due to its parent campaign.',
      type: 'string',
      column: 'configured_status',
      hidden: false,
    },
    end_time: {
      type: 'timestamp',
      column: 'end_time',
      hidden: false,
    },
  },
}
