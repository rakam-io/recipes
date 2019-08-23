{
  version: 1.1,
  label: 'Segment Mobile Analytics',
  description: 'It implements screen event for Segment Warehouse in order to track user actions on Android & iOS.',
  image: 'https://github.com/rakam-io/recipes/raw/master/segment/logo.png',
  variables: {
    screens_target: {
      label: 'Segment Screens Table',
      type: 'table',
      default: {table: 'screens'},
      description: 'The pages table in your Segment Destionation. See: https://segment.com/docs/destinations/#warehouse-schemas',
    },
    attributes: {
      label: 'Event attributes',
      parent: 'screens_target',
      type: 'table-column',
      description: 'Select the attributes that you want to turn into dimensions',
      options: {
        multiple: true
      }
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
