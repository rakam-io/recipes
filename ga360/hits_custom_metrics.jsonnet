{
  dimensions: {
    index: {
      sql: '{{TABLE}}.customMetrics.index',
      description: 'The index of the custom metric.',
      type: 'integer',
    },
    value: {
      sql: '{{TABLE}}.customMetrics.value',
      description: 'The value of the custom metric.',
      type: 'integer',
    },
  },
}
