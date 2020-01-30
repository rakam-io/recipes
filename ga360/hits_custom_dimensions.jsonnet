local util = import '../util.libsonnet';

{
  dimensions: {
    index: {
      type: 'integer',
      sql: '{{TABLE}}.hits.customDimensions.index',
      description: 'The index of the custom dimension.',
    },
    value: {
      type: 'string',
      sql: '{{TABLE}}.hits.customDimensions.value',
      description: 'The value of the custom dimension.',
    },
  },
}
