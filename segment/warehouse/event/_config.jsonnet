{
  version: 1.1,
  label: 'Segment Event Analytics',
  description: 'It implements screen event for Segment Warehouse in order to track user actions on Android & iOS.',
  image: 'https://github.com/rakam-io/recipes/raw/master/segment/logo.png',
  variables: {
    tracks_target: {
      label: 'Segment Tracks Table',
      type: 'table',
      default: { table: 'tracks' },
      description: 'The tracks table in your Segment Destination. See: https://segment.com/docs/destinations/#warehouse-schemas',
    },
    user_model: {
      label: 'Segment user model',
      type: 'model',
      default: 'segment.users',
      description: 'If you have installed the user recipe, select the `All users` model.',
      //      required: false,
      //      hidden: true,
      //      dependencies: [
      //          {
      //            path: '/segment/warehouse/user',
      //            repository: 'https://github.com/rakam-io/recipes',
      //          }
      //      ]
    },
  },
  tags: ['event'],
}
