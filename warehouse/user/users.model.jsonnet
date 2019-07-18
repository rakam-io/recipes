{
  label: 'All Users',
  name: 'users',
  target: {
     table: 'users'
  },
  mappings: {
      eventTimestamp: received_at
    },
    dimensions: {
     received_at: {
        type: 'timestamp',
        column: 'received_at'
     }
    }
}
