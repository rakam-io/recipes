{
  version: '1.0',
  label: 'Stackoverflow',
  description: 'bigquery-public-data',
  tags: ['public-dataset'],
  databases: ['bigQuery'],
  variables: {
    schema: {
      label: 'Schema',
      type: 'schema',
      default: { database: 'bigquery-public-data', schema: 'stackoverflow' },
    },
  },
}
