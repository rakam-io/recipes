{
  name: 'ad_networks',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'ad_networks' }),
  mappings: {},
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
