local event_types = std.extVar('event_types');

std.map(function(tableName) {
    target: {database: event_types.database, schema: event_types.schema, table: tableName},
    name: 'segment.event.'+tableName
}, event_types.table)