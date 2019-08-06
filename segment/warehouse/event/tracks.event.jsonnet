local commonDimensions = import '../common_dimensions.jsonnet';
local pages = import 'pages.libsonnet';

{
  name: 'tracks',
  label: 'All Events',
  description: 'The table that contains all your event.track() calls',
  target: {
       table: 'tracks'
    },
    mappings: {
        eventTimestamp: 'received_at',
        incremental: 'timestamp',
        userId: 'user_id',
        deviceId: null,
        sessionId: null,
      },
  relations: pages.relations,
  dimensions: segmentColumns {
    event: {
      hide: true,
      description: 'The slug of the event name, mapping to an event-specific table.',
    },
  },
}
