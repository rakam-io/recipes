{
  name: 'tenjin_campaign_buckets',
  hidden: true,
  category: 'Tenjin Marketing',
  target: std.mergePatch(std.extVar('schema'), { table: 'campaign_buckets' }),
  description: 'List of campaign buckets',
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
