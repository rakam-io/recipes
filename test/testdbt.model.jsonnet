{
  label: 'test',
  name: std.extVar('testTableName'),
  target: {table: std.extVar('testTableName')},
  dbt: {
    model: "select " + std.extVar('sessionDuration'),
    config: {
        materialized: 'view'
    }
  },
  description: 'It provides session and pageview analytics for Segment Warehouse. For Segment Warehouse users, it provides basic reports similar to Googl Analytics',
}