local util = import '../../../util.libsonnet';

std.map(function(event_table) {
  target: { database: std.extVar('event_types').database, schema: std.extVar('event_types').schema, table: event_table },
  name: 'event_' + event_table.table,
  mappings: {
    eventTimestamp: 'received_at',
    userId: 'user_id',
    deviceId: 'context_device_id',
    incrementalTimestamp: 'received_at',
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
  dimensions: null,  // let the server discover
  // }, ['app_opened'])
}, std.extVar('event_types').table)
