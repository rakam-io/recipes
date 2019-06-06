local segmentColumns = import 'common_columns.jsonnet';
local pages = import 'pages.libsonnet';

{
  name: 'tracks',
  label: 'All Events',
  description: 'The table that contains all your event.track() calls',
  relations: pages.relations,
  columns: segmentColumns {
    event: {
      hide: true,
      description: 'The slug of the event name, mapping to an event-specific table.',
    },
  },
}
