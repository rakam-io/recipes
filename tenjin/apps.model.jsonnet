{
  name: 'tenjin_apps',
  hidden: true,
  category: 'Tenjin Marketing',
  label: 'Apps',
  target: std.mergePatch(std.extVar('schema'), { table: 'apps' }),
  description: 'List of apps',
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
    store_id: {
      type: 'string',
      column: 'store_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    platform: {
      type: 'string',
      column: 'platform',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    bundle_id: {
      type: 'string',
      column: 'bundle_id',
      description: 'ex. com.tenjin.wordfinder',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
