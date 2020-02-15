{
  name: 'tenjin_countries',
  hidden: true,
  category: 'Tenjin Marketing',
  target: std.mergePatch(std.extVar('schema'), { table: 'countries' }),
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
