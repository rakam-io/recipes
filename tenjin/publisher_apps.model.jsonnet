{
  name: 'tenjin_publisher_apps',
  hidden: true,
  category: 'Tenjin Marketing',
  target: std.mergePatch(std.extVar('schema'), { table: 'publisher_apps' }),
  description: 'Publisher campaigns that we get from ad-network API',
  mappings: {},
  relations: {
    apps: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_apps',
      sourceColumn: 'app_id',
      targetColumn: 'id',
    },
  },
  dimensions: {
    name: {
      type: 'string',
      column: 'name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
