{
  version: 1.0,
  label: 'Firebase bilmemne',
  description: '',
  image: 'https://github.com/rakam-io/recipes/raw/master/snowflake-usage/logo.png',
  tags: ['event-analytics'],
  databases: ['bigQuery'],
  variables: {
    schema: {
      label: 'Schema',
      type: 'schema',
      options: {
        placeholder: 'analytics_54353',
      },
    },
    user_properties: {
      type: 'sql',
      options: {
        sql: |||
          select 1,1,1
        |||,
      },
    },
    event_properties: {
      type: 'sql',
      options: {
        sql: |||
          select 1,1,1
        |||,
      },
    },
  },
}
