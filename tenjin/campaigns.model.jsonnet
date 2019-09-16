{
  name: 'campaigns',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'campaigns' }),
  mappings: {},
  relations: {
    ad_networks: {
      relationType: 'manyToOne',
      joinType: 'innerJoin',
      modelName: 'ad_networks',
      sourceColumn: 'ad_network_id',
      targetColumn: 'id',
      hidden: false,
    },
    App: {
      relationType: 'manyToOne',
      joinType: 'innerJoin',
      modelName: 'apps',
      sourceColumn: 'app_id',
      targetColumn: 'id',
      hidden: false,
    },
    campaign_buckets: {
      relationType: 'oneToOne',
      joinType: 'innerJoin',
      modelName: 'campaign_buckets',
      sourceColumn: 'campaign_bucket_id',
      targetColumn: 'id',
    },
  },
  dimensions: {
    name: {
      label: 'Campaign Name',
      pivot: false,
      type: 'string',
      column: 'name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
