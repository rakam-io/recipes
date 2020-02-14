{

  measures: {
    unique_users: {
      aggregation: 'countUnique',
      sql: '{{dimension.user}}',
    },
    unique_devices: {
      aggregation: 'countUnique',
      sql: '{{dimension.device_id}}',
    },
    unique_sessions: {
      aggregation: 'countUnique',
      sql: '{{dimension.session_id}}',
    },
    total_events: {
      aggregation: 'count',
    },
  },
  dimensions: {
    time: {
      column: '_TIME',
      type: 'timestamp',
    },
    server_time: {
      column: '_SERVER_TIME',
      type: 'timestamp',
    },
    user: {
      column: '_USER',
    },
  },
  mappings: {
    eventTimestamp: 'time',
    userId: 'user',
    device_id: 'device_id',
  },
}
