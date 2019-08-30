{
  label: 'Attributions',
  category: 'attribution',
  name: 'identifies',
  target: std.extVar('identifies_target'),
  mappings: {
    userId: 'id',
    eventTimestamp: 'received_at',
  },
  measures: {
    total_identify: {
      aggregation: 'count',
    },
  },
  dimensions: std.extVar('attributions') {
    received_at: {
      column: 'received_at',
    },
    id: {
      column: 'id',
    },
  },
}
