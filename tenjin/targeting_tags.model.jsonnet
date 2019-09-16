{
  name: 'targeting_tags',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'targeting_tags' }),
  mappings: {},
  dimensions: {
    display: {
      pivot: false,
      type: 'string',
      column: 'display',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    category: {
      pivot: false,
      type: 'string',
      column: 'category',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    segment: {
      pivot: false,
      type: 'string',
      column: 'segment',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
