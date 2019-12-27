{
  name: 'tenjin_campaigns',
  hidden: false,
  label: 'Campaigns',
  target: std.mergePatch(std.extVar('schema'), { table: 'campaigns' }),
  description: 'Campaigns that users are attributed to, or campaigns from ad-networks API',
  mappings: {},
  relations: {
    ad_networks: {
      relationType: 'manyToOne',
      joinType: 'innerJoin',
      modelName: 'tenjin_ad_networks',
      sourceColumn: 'ad_network_id',
      targetColumn: 'id',
    },
    app: {
      relationType: 'manyToOne',
      joinType: 'innerJoin',
      modelName: 'tenjin_apps',
      sourceColumn: 'app_id',
      targetColumn: 'id',
    },
    campaign_buckets: {
      relationType: 'oneToOne',
      joinType: 'innerJoin',
      modelName: 'tenjin_campaign_buckets',
      sourceColumn: 'campaign_bucket_id',
      targetColumn: 'id',
    },
  },
  dimensions: {
    name: {
      pivot: false,
      type: 'string',
      column: 'name',
      reportOptions: {
        formatNumbers: true,
      },
    },
    ad_network_id: {
      column: 'ad_network_id',
      hidden: true,
    },
  },
}
