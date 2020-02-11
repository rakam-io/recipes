{

  measures: {
    unique_users: {
      aggregation: 'countUnique',
      column: '_user',
    },
    total_events: {
      aggregation: 'count',
    },
  },
  dimensions: {

  },
  mappings: {
    eventTimestamp: '_time',
    userId: '_user',
  },
}
