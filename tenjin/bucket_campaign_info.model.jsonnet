{
  name: 'tenjin_bucket_campaign_info',
  hidden: true,
  category: 'Tenjin Marketing',
  target: std.mergePatch(std.extVar('schema'), { table: 'bucket_campaign_info' }),
  description: 'A view that joins campaign buckets and campaigns table',
  mappings: {},
  relations: {
    ad_networks: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_ad_networks',
      sourceColumn: 'ad_network_id',
      targetColumn: 'id',
    },
    apps: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_apps',
      sourceColumn: 'app_id',
      targetColumn: 'id',
    },
  },
  dimensions: {
    id: {
      type: 'string',
      column: 'id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    name: {
      type: 'string',
      column: 'name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    app_id: {
      type: 'string',
      column: 'app_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
