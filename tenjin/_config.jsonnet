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
    custom_events: {
      type: 'sql',
      parent: 'schema',
      required: false,
      options: {
        sql: "select distinct event from events where event is not null and event_type = 'event'",
      },
      description: 'If you want to add your custom events as models, you can run the SQL query.',
    },
  },
  tags: ['attribution'],
  databases: ['redshift'],
}
