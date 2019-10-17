{
  version: 1.0,
  label: 'IOWA Liquor Sales',
  description: 'See details from https://console.cloud.google.com/marketplace/details/iowa-department-of-commerce/iowa-liquor-sales?filter=solution-type:dataset&q=liqour&id=18f0a495-8e20-4124-a349-0c4c167b60ab',
  tags: ['public-dataset'],
  image: 'https://github.com/rakam-io/recipes/raw/master/gcloud-public-dataset/iowa_liquor_sales/logo.png',
  databases: ['bigQuery'],
  variables: {
    table: {
      label: 'Sales Table',
      type: 'table',
      default: { database: 'bigquery-public-data', schema: 'iowa_liquor_sales', table: 'sales' },
    },
  },
}
