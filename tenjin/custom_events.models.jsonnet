local events = import './events.model.jsonnet';

local custom_events = if std.extVar('custom_events') != null then std.extVar('custom_events') else [];

std.map(function(row) {
  name: 'tenjin_event_' + row.event,
  label: row.event,
  category: 'Custom Event',
  target: "SELECT * FROM %(target)s WHERE event = '%(event)s' " % { target: std.mergePatch(std.extVar('schema'), { table: 'events' }), event: row.event },
  description: 'User event data that comes from Tenjin SDK or 3rd party attribution provider',
  mappings: events.mappings,
  relations: events.relations,
  dimensions: events.dimensions,
  measures: events.measures,
}, custom_events)
