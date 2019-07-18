{
  label: 'All Users',
  category: 'attribution',
  name: std.strReplace(std.thisFile, '.model.jsonnet', ''),
  target: std.extVar('users_target'),
  mappings: {
      userId: 'id'
    },
    dimensions: std.extVar('attributions') {
     last_update: {
        type: 'timestamp',
        column: 'received_at'
     }
  }
}