{
  label: 'User Attributions',
  name: 'identifies',
  target: std.extVar('identifies_target'),
  category: 'Segemnt Events',
  mappings: {
    userId: 'id',
    eventTimestamp: 'received_at',
  },
  measures: {
    distinct_users: {
      aggregation: 'countUnique',
      column: 'id',
    },
    total_identify: {
      label: 'Total Update',
      aggregation: 'count',
    },
  },
  dimensions: std.extVar('attributions') {
    received_at: {
      label: 'Date',
      column: 'received_at',
    },
    id: {
      column: 'id',
    },
  },
}
