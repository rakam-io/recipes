{
  name: 'add_to_basket',
  label: 'Test',
  description: 'test',
  columnMapping: {
    eventTimestamp: 'received_at',
    incremental: null,
    userId: '_user',
    deviceId: null,
    sessionId: null,
  },
  columns: {
    anonymous_id: {
      hide: false,
      groupable: true,
      filterable: true,
      reportOptions: {
        prefix: '$',
        suffix: '&',
      },
    },
  },
}
