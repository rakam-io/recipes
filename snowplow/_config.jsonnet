{
  version: 1.0,
  label: 'Snowplow Analytics',
  description: 'It implements sessions and pageview models for Snowplow web page event',
  image: 'https://github.com/rakam-io/recipes/raw/master/snowplow/logo.png',
  variables: {
    snowplow_sessions: {
      label: 'Snowplow DBT sessions table',
      type: 'table',
      default: { schema: 'atomic', table: 'snowplow_sessions' },
    },
    snowplow_page_views: {
      label: 'Snowplow DBT page views table',
      type: 'table',
      default: { schema: 'atomic', table: 'snowplow_page_views' },
    },
  },
  tags: ['website'],
}
