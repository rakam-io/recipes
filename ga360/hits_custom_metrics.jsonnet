{
  dimensions: {
    index: {
      sql: '{{TABLE}}.hits.customMetrics.index',
      description: 'The index of the custom metric.',
      type: 'integer',
    },
    value: {
      sql: '{{TABLE}}.hits.customMetrics.value',
      description: 'The value of the custom metric.',
      type: 'integer',
    },
  },
}
