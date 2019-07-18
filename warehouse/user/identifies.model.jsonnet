{
  label: 'Attributions',
  category: 'attribution',
  name: std.strReplace(std.thisFile, '.model.jsonnet', ''),
  target: std.extVar('identifies_target'),
  mappings: {
      userId: 'id',
      eventTimestamp: 'received_at'
    },
    dimensions: std.extVar('attributions') {
     received_at: {
        type: 'timestamp',
        column: 'received_at'
     }
    }
}
