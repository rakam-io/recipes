{
  name: 'tenjin_ad_networks',
  hidden: true,
  label: 'Ad Networks',
  target: std.mergePatch(std.extVar('schema'), { table: 'ad_networks' }),
  description: 'List of ad networks',
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
