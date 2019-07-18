{
  label: 'All Users',
  name: 'users',
  target: std.extVar('identifies_table'),
  mappings: {
      eventTimestamp: received_at
    },
    dimensions: {
     last_update: {
        type: 'timestamp',
        column: 'received_at'
     } + std.extVar('attributions')
  }
}