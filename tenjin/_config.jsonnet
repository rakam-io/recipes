{
  version: 1.0,
  label: 'Tenjin DataVault',
  description: 'It provides data models for your Tenjin DataVault',
  image: 'https://github.com/rakam-io/recipes/raw/master/tenjin/logo.png',
  variables: {
    schema: {
      label: 'DataVault Schema',
      type: 'schema',
      default: { schema: 'tenjin' },
      description: 'The Tenjin DataVault Schema that you ingest the data. The schema must have tables such as apps, campaign_buckets, events etc.',
    },
  },
  tags: ['attribution'],
  databases: ['redshift'],
}
