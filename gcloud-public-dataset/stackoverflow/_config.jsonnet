{
  version: 1.0,
  label: 'Stackoverflow',
  tags: ['public-dataset'],
  image: 'https://github.com/rakam-io/recipes/raw/master/gcloud-public-dataset/stackoverflow/logo.png',
  description: 'See details from https://console.cloud.google.com/marketplace/details/stack-exchange/stack-overflow?filter=solution-type:dataset&q=stack%20overflow&id=46a148ff-896d-444c-b08d-360169911f59',
  databases: ['bigQuery'],
  variables: {
    schema: {
      label: 'Schema',
      type: 'schema',
      default: { database: 'bigquery-public-data', schema: 'stackoverflow' },
    },
  },
}
