{
  label: 'Attributions',
  category: 'attribution',
  name: 'identifies',
  target: std.extVar('identifies_target'),
  mappings: {
      userId: 'id',
      eventTimestamp: 'received_at'
    },
    dimensions: std.extVar('attributions') {
     received_at: {
        type: 'timestamp',
        column: 'received_at'
     }
    }
}
