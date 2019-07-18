{
  label: 'All Users',
  name: 'users',
  target: std.extVar('users_target'),
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