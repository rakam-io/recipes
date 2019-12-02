local util = import '../../../util.libsonnet';

local event_types = std.extVar('event_types');

std.map(function(event_table) {
  target: { database: event_types.database, schema: event_types.schema, table: event_table },
  name: 'event_' + event_table,
  mappings: {
    eventTimestamp: 'received_at',
    userId: 'user_id',
    deviceId: 'context_device_id',
    incremental: 'received_at',
  },
  description: 'Custom event defined in Segment SDK',
  measures: {
    events: {
      aggregation: 'count',
    },
    unique_users: {
      aggregation: 'countUnique',
      column: 'user_id',
    },
    unique_devices: {
      aggregation: 'countUnique',
      column: 'context_device_id',
    },
    unique_ip: {
      aggregation: 'countUnique',
      column: 'context_ip',
    },
  },
  dimensions: [],  // let the server discover
  // }, ['app_opened'])
}, event_types.table)
