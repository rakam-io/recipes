{
  version: 1.0,
  label: 'Snowplow Analytics',
  description: 'It implements screen event for Segment Warehouse in order to track user actions on Android & iOS.',
  image: 'https://github.com/rakam-io/recipes/raw/master/segment/logo.png',
  variables: {
    events_target: {
      label: 'Segment Screens Table',
      type: 'table',
      default: { table: 'screens' },
      description: 'The pages table in your Segment Destination. See: https://segment.com/docs/destinations/#warehouse-schemas',
    },
  },
  tags: ['website'],
}
