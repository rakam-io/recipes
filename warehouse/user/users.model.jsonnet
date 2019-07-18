{
  label: 'All Users',
  name: 'users',
  target: std.extVar('users_table'),
  mappings: {
      userId: 'id'
    },
    dimensions: {
     last_update: {
        type: 'timestamp',
        column: 'received_at'
     } + std.extVar('attributions')
  }
}