{
  name: 'adwords_ad_groups',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'ad_groups' }),
  category: 'Marketing',
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
      type: 'string',
      column: 'id',
      hidden: true,
    },
    name: {
      type: 'string',
      column: 'name',
      hidden: false,
    },
    status: {
      type: 'string',
      column: 'status',
      hidden: false,
    },
    adwords_customer_id: {
      type: 'string',
      column: 'adwords_customer_id',
      hidden: false,
    },
    campaign_id: {
      type: 'string',
      column: 'campaign_id',
      hidden: true,
    },
  },
}
