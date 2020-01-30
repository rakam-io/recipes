{
  dimensions: {
    custom_dimension_index: {
      category: 'Custom Dimension',
      label: 'Index',
      type: 'integer',
      sql: '{{TABLE}}.customDimensions.index',
    },
    custom_dimension_value: {
      category: 'Custom Dimension',
      label: 'Value',
      type: 'string',
      sql: '{{TABLE}}.customDimensions.value',
    },
  },
}
