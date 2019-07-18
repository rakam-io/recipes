{
  label: 'All Users',
  name: 'users',
  target: {
     table: 'identifies'
  },
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
