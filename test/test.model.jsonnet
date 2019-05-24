{
  name: 'test_model',
  label: 'Test',
  description: 'test',
  dbtConfig: {
     materialized: 'view'
  },
  dbtModel: 'select 1 as test',
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