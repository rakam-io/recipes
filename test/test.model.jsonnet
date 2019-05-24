{
  name: 'test_model',
  label: 'Test',
  description: 'test',
  dbtConfig: {
     materialized: 'view'
  },
  dbtModel: 'select 1 as test',
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