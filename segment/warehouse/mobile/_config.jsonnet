{
  version: 1.1,
  label: 'Segment Mobile Analytics',
  description: 'It implements screen event for Segment Warehouse in order to track user actions on Android & iOS.',
  variables: {
    screens_target: {
      label: 'Segment Pageview Table',
      type: 'table',
      default: {table: 'screens'},
      description: 'The pages table in your Segment Destionation. See: https://segment.com/docs/destinations/#warehouse-schemas',
    },
    user_model: {
      label: 'Segment user model',
      type: 'model',
      default: 'users',
      description: 'If you have installed the user recipe, select the `All users` model.',
    }
  },
  tags: ["segment"]
}
