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
    dbt_snowplow_page_views: {
      label: 'DBT Pageview Table',
      required: false,
      type: 'table',
    },
    dbt_snowplow_sessions: {
      label: 'DBT Sessions Table',
      required: false,
      type: 'table',
    },
    custom_event_schema: {
      type: 'sql',
      parent: 'schema',
      required: false,
      description: 'You can run the query above in order to add your custom events as models',
      options: {
        sql: |||
          SELECT 'test' as event_db, 'test' as prop_db, 'test' as event_name, 'test' as name, 'string' as value_type
        |||,
      },
    },
  },
  tags: ['website'],
}
