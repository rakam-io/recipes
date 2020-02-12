local common = import '../common.libsonnet';
local predefined = import '../predefined.libsonnet';

local target = std.extVar('target');

std.map(function(event_type)
  local event_name = event_type.n;
  local db_name = event_type.db;

  local defined = if std.objectHas(predefined, event_name) then predefined[event_name] else null;

  local dimensions_for_event = std.foldl(function(a, b) a + b, std.map(function(prop) {
                                 [prop.n]: {
                                   sql: '{{TABLE}}.properties:"%(name)s"::%(type)s' % { type: prop.t, name: prop.db },
                                   category: if std.startsWith(prop.db, '_') then 'SDK' else 'Event Property',
                                 },
                               }, std.parseJson(event_type.props)), {})
                               +
                               if defined != null then defined.dimensions else {};
  {
    name: 'rakam_event_' + event_name,
    label: (if defined != null then '[SDK] ' else '') + event_name,
    sql: |||
      select * from "%(database)s"."%(schema)s"."%(table)s" where event_type = '%(event_name)s'
    ||| % { event_name: event_name, database: target.database, schema: target.schema, table: target.table },
    measures: common.measures + if defined != null then defined.measures else {},
    mappings: common.mappings,
    category: 'Rakam Events',
    dimensions: common.dimensions + dimensions_for_event,
  }, std.extVar('event_schema'))
