{
  version: 1.0,
  label: 'Google Analytics 360 Export',
  description: 'It provides session and pageview analytics for Google Analytics BigQuery Export. Please see details from https://support.google.com/analytics/answer/3437719?hl=en',
  tags: ['pageview-analytics'],
  variables: {
    schema: {
      label: 'Schema',
      type: 'schema',
      description: 'Please enter the schema that has ga_sessions_* tables in it.',
    },
  },
  databases: ['bigQuery'],
}
