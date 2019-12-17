local util = import '../util.libsonnet';
local custom_event_schema = std.extVar('custom_event_schema');

std.map(function(event_table) {
  target: 'sql definition',
  label: event_table,
  name: 'custom+firebase_event_' + event_table,
  mappings: {
    eventTimestamp: 'received_at',
    userId: 'user_id',
    deviceId: 'context_device_id',
    incremental: 'received_at',
  },
  description: 'A custom event defined in Segment SDK',
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
  dimensions: {
    id: {
      description: 'An ID attached to the event at execution time and used for deduplication at the server level.',
      column: 'id',

    },
    sent_at: {
      description: 'The UTC timestamp set by library when the Segment API call was sent. This timestamp can be affected by device clock skew.',
      column: 'sent_at',


    },
    anonymous_id: {
      description: 'The anonymous ID of the user',
      category: 'Event',
      type: 'string',
      column: 'anonymous_id',
    },
    context_ip: {
      label: 'User Ip',
      category: 'Event',
      type: 'string',
      column: 'context_ip',
    },
    context_library_name: {
      label: 'Segment Library Name',
      category: 'Event',
      type: 'string',
      column: 'context_library_name',
    },
    context_library_version: {
      label: 'Segment Library Version',
      category: 'Event',
      type: 'string',
      column: 'context_library_version',
    },
    original_timestamp: {
      description: 'The original timestamp set by the Segment library at the time the event is created. Keep in mind, this timestamp can be affected by device clock skew.',
      category: 'Event',
      type: 'timestamp',
      column: 'original_timestamp',
    },
    received_at: {
      description: 'The UTC timestamp set by the Segment API when the API receives the payload from client or server.',
      category: 'Event',
      type: 'timestamp',
      column: 'received_at',
    },
    timestamp: {
      description: 'UTC-converted timestamp which is set by the Segment library.',
      category: 'Event',
      type: 'timestamp',
      column: 'timestamp',
    },
    user_id: {
      category: 'Event',
      type: 'string',
      column: 'user_id',
    },
  },
}, custom_event_schema)
