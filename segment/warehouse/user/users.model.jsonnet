{
  label: 'All Users',
  category: 'attribution',
  name: 'users',
  target: std.extVar('users_target'),
  mappings: {
      userId: 'id'
    },
     measures: {
         total_users: {
              aggregation: 'count',
         }
        },
    dimensions: std.extVar('attributions') {
     last_update: {
        type: 'timestamp',
        column: 'received_at'
     }
  }
}