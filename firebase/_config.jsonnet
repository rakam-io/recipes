{
  version: 1.0,
  label: 'Firebase bilmemne',
  description: '',
  image: 'https://github.com/rakam-io/recipes/raw/master/snowflake-usage/logo.png',
  tags: ['event-analytics'],
  databases: ['bigQuery'],
  variables: {
    custom_event_schema: {
      type: 'sql',
      options: {
        sql: 'select event_type, attribute_name, attribute_type from bilmemne',
      },
    },
    events_table: {
      type: 'r-table',
    },
  },
}
