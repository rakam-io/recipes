{
  version: 1.0,
  label: 'Snowplow Analytics',
  description: 'It implements sessions and pageview models for Snowplow web page event',
  image: 'https://github.com/rakam-io/recipes/raw/master/snowplow/logo.png',
  variables: {
    events: {
      label: 'Snowplow Events Table',
      type: 'table',
      default: { schema: 'atomic', table: 'events' },
    },
  },
  tags: ['website'],
}