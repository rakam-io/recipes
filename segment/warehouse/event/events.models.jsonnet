local util = import '../../../util.libsonnet';
local event_types = std.extVar('event_types');

std.map(function(event_table) {
  target: { database: event_types.database, schema: event_types.schema, table: event_table },
  name: 'event_' + event_table,
  label: event_table,
  category: 'Segment Events',
  mappings: {
    eventTimestamp: 'received_at',
    userId: 'user_id',
    deviceId: 'context_device_id',
    incremental: 'received_at',
  },
  relations: if std.extVar('user_model') != null then
    { user: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: std.extVar('user_model'),
      sourceColumn: 'user_id',
      targetColumn: 'id',
    } } else {},
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
}, event_types.table)
