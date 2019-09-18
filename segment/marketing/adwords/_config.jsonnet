{
  version: 1.0,
  label: 'Segment Google Adwords',
  description: 'It provides marketing reports for your Adwords destinations',
  image: 'https://github.com/rakam-io/recipes/raw/master/segment/logo.png',
  variables: {
    schema: {
      label: 'Segment Adwords Schema',
      type: 'schema',
      default: { schema: 'adwords' },
      description: 'The Adwords Schema that you ingest the data. The schema must have tables such as ads, campaign_performance_reports, campaigns etc.',
    },
  },
  tags: ['marketing'],
}
