{
  label: 'All Users',
  name: 'users',
  target: std.extVar('identifies_target'),
  mappings: {
      userId: 'id',
      eventTimestamp: 'received_at'
    },
    dimensions: {
     received_at: {
        type: 'timestamp',
        column: 'received_at'
     }
    }
}
