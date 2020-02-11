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
    total_events: {
      aggregation: 'count',
    },
  },
  dimensions: {
    time: {
      column: '_time',
      type: 'timestamp',
    },
    user: {
      column: '_user',
    },
  },
  mappings: {
    eventTimestamp: 'time',
    userId: 'user',
  },
}
