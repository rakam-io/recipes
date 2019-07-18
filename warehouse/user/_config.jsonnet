{
  version: 1.1,
  label: 'Segment User Attribution',
  description: 'It provides user attribution analytics for Segment Warehouse',
  variables: {
    users_table: {
      order: 1,
      label: 'Segment User Table',
      type: 'table',
      default: {table: 'users'},
      description: 'The users table in your Segment Destionation. See: https://segment.com/docs/destinations/#warehouse-schemas',
    },
    attributions: {
      order: 2,
      label: 'Attributions',
      parent: 'users_table',
      type: 'table-column',
      options: {
        multiple: true
      },
      description: 'WThe attributions that will be attached as dimensions to user model',
    }
  },
}
