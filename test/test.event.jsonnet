{
  name: 'add_to_basket',
  label: 'Test',
  description: 'test',
  mapping: {
    eventTimestamp: 'received_at',
    userId: '_user',
  },
  measures: [],
  columns:
      [ {
        name: 'test',
        hide: false,
        groupable: true,
        filterable: true,
        reportOptions: {
          prefix: '$',
          suffix: '&'
        }
        }
      ]
}
