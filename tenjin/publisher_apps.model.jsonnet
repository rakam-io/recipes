{
  name: 'publisher_apps',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'publisher_apps' }),
  description: 'Publisher campaigns that we get from ad-network API',
  mappings: {},
  relations: {
    apps: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'apps',
      sourceColumn: 'app_id',
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
      hidden: false,
    },
  },
}
