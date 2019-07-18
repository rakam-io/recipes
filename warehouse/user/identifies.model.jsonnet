{
  label: 'All Users',
  name: 'users',
  target: std.extVar('identifies_table'),
  mappings: {
      userId: 'id'
    },
    dimensions: {
     last_update: {
        type: 'timestamp',
        column: 'received_at'
     }
    }
}
