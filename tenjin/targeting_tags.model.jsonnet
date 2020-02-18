{
  name: 'tenjin_targeting_tags',
  hidden: true,
  category: 'Tenjin Marketing',
  target: std.mergePatch(std.extVar('schema'), { table: 'targeting_tags' }),
  description: 'Includes targeting tag information',
  mappings: {},
  dimensions: {
    display: {
      type: 'string',
      column: 'display',
      description: 'Targeting tag name shown on Tenjin dashboard. (Ex. Gender: Male)',
    },
    is_standard: {
      column: 'standard',
      description: "If it's Tenjin's default targeting tag or not.",
    },
    category: {
      type: 'string',
      column: 'category',
    },
    segment: {
      type: 'string',
      column: 'segment',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
