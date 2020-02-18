{
  name: 'tenjin_ad_networks',
  hidden: true,
  category: 'Tenjin Marketing',
  label: 'Ad Networks',
  target: std.mergePatch(std.extVar('schema'), { table: 'ad_networks' }),
  description: 'List of ad networks',
  mappings: {},
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
