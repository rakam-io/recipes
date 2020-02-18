{
  name: 'adwords_ads',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'ads' }),
  category: 'Marketing',
  relations: {
    adwords_ad_groups: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'adwords_ad_groups',
      sourceColumn: 'ad_group_id',
      targetColumn: 'id',
    },
  },
  measures: {
    total_ads: {
      aggregation: 'count',
    },
  },
  dimensions: {
    id: {
      type: 'string',
      column: 'id',
      hidden: true,
    },
    type: {
      type: 'string',
      column: 'type',
      hidden: false,
    },
    is_active: {
      type: 'boolean',
      sql: "CASE WHEN {{TABLE}}.status = 'ENABLED' then TRUE else FALSE END",
    },
    status: {
      type: 'string',
      column: 'status',
      hidden: false,
    },
    final_urls: {
      type: 'string',
      column: 'final_urls',
      hidden: false,
    },
    original_id: {
      type: 'string',
      column: 'original_id',
      hidden: false,
    },
    ad_group_id: {
      type: 'string',
      column: 'ad_group_id',
      hidden: true,
    },
    adwords_customer_id: {
      type: 'string',
      column: 'adwords_customer_id',
      hidden: false,
    },
  },
}
