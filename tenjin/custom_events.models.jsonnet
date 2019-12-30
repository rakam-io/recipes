local schema = import './custom_events_schema.jsonnet';
local events = import './events.model.jsonnet';

local custom_events = if std.extVar('custom_events') != null then std.extVar('custom_events') else [];

std.map(function(row)
  local defined = if std.objectHas(schema, row.event) then schema[row.event] else null;

  {
    name: 'tenjin_event_' + row.event,
    label: row.event,
    category: 'Event',
    sql: "SELECT * FROM events WHERE event = '%(event)s' " % {
      event: row.event,
    },
    description: 'User event data that comes from Tenjin SDK or 3rd party attribution provider',
    mappings: events.mappings,
    relations: events.relations,
    dimensions: if defined != null && std.objectHas(defined, 'dimensions') then defined.dimensions else {} + events.dimensions,
    measures: if defined != null && std.objectHas(defined, 'measures') then defined.measures else {} + events.measures,
  }, custom_events)
