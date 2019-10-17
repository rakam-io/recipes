{
  version: '1.0',
  label: 'IOWA Liquor Sales',
  description: 'bigquery-public-data',
  tags: ['public-dataset'],
  databases: ['bigQuery'],
  variables: {
    table: {
      label: 'Sales Table',
      type: 'table',
      default: { database: 'bigquery-public-data', schema: 'iowa_liquor_sales', table: 'sales' },
    },
  },
}
