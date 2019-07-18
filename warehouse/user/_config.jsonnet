{
  version: 1.1,
  label: 'Segment User Attribution',
  description: 'It provides user attribution analytics for Segment Warehouse',
  variables: {
    users_table: {
      label: 'Segment User Table',
      type: 'table',
      default: {table: 'users'},
      description: 'The users table in your Segment Destionation. See: https://segment.com/docs/destinations/#warehouse-schemas',
    },
    attributions: {
      label: 'Attributions',
      parent: 'users_table',
      type: 'multiple-table-column',
      description: 'WThe attributions that will be attached as dimensions to user model',
    }
  },
}
