local util = import '../../../util.libsonnet';
local commonDimensions = import '../common_dimensions.jsonnet';

if std.extVar('tracks_target') == null then [] else [{
  name: util.generate_model_name_from_file(std.thisFile),
  label: '[Segment] All Events',
  category: 'Segment Events',
  description: 'A table with all of your track method calls. This model will only include a few standardized properties that are all common to all events: anonymous_id, context_*, event, event_text, received_at, sent_at, and user_id. This is because every event that you send to Segment has completely different properties. For querying by the custom properties, use the event type models instead.',
  target: std.extVar('tracks_target'),
  mappings: {
    eventTimestamp: 'received_at',
    incremental: 'timestamp',
    userId: 'user_id',
    deviceId: null,
    sessionId: null,
  },
  relations: {
    user: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'segment_users',
      sourceColumn: 'user_id',
      targetColumn: 'id',
    },
  },
  measures: {
    total_events: {
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
    context_library_name: {
      label: 'Platforms',
      type: 'arrayString',
      sql: 'array_agg({{TABLE}}.context_library_name)',
    },
    context_app_version: {
      label: 'Last Seen App Version',
      description: 'It helps you to identify deprecated events',
      sql: 'max({{TABLE}}.context_app_version order by {{TABLE}}.received_at desc)',
      type: 'string',
    },
  },
  dimensions: commonDimensions {
    event_text: {
      description: 'The name of the event.',
      column: 'event_text',
    },
  },
}]
