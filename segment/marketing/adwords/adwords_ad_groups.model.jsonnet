{
  name: 'adwords_ad_groups',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), {table: 'ad_groups'}),
  mappings: {},
  relations: {
    adwords_campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'adwords_campaigns',
      sourceColumn: 'campaign_id',
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
    adwords_customer_id: {
      pivot: false,
      type: 'string',
      column: 'adwords_customer_id',
      hidden: false,
    },
    campaign_id: {
      pivot: false,
      type: 'string',
      column: 'campaign_id',
      hidden: true,
    },
  },
}
