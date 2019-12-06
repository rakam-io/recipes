{
  version: 1.0,
  label: 'Segment User Attribution',
  description: 'It provides user attribution analytics for Segment Warehouse',
  image: 'https://github.com/rakam-io/recipes/raw/master/segment/logo.png',

  variables: {
    users_target: {
      label: 'Segment User Table',
      type: 'table',
      default: { table: 'users' },
      description: 'The users table in your Segment Destination. See: https://segment.com/docs/destinations/#warehouse-schemas',
    },
    identifies_target: {
      label: 'Segment Identifies Table',
      type: 'table',
      default: { table: 'identifies' },
      description: 'The identifies table in your Segment Destination. See: https://segment.com/docs/destinations/#warehouse-schemas',
    },
    attributions: {
      label: 'User properties',
      parent: 'users_target',
      type: 'table-multiple-column',
      description: 'The attributions that will be attached as dimensions to user model',
    },
  },
  tags: ['attribution'],
}
