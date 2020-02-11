local common = import '../common.libsonnet';
local predefined = import '../predefined.libsonnet';


std.map(function(event_type)
  local event_name = event_type.n;
  local db_name = event_type.db;

  local defined = if std.objectHas(predefined, event_name) then predefined[event_name] else null;

  local dimensions_for_event = std.map(function(prop) {
                                 name: prop.n,
                                 sql: '{{TABLE}}.properties:"%(name)"s::%(type)' % { type: prop.t, name: prop.db },
                                 category: if std.startsWith(prop.db, '_') then 'SDK' else null,
                               }, event_type.props)
                               +
                               if defined != null then defined.dimensions else {};

  {
    name: 'rakam_event_' + event_type,
    label: (if defined != null then '[Rakam] ' else '') + event_type,
    sql: |||
      select * from %(target) where event_type = '%(event_name)s'
    ||| % { event_name: event_name, target: std.extVar('target') },
    measures: common.measures + if defined != null then defined.measures else {},
    mappings: common.mappings,
    category: 'Rakam Events',
    dimensions: common.dimensions + dimensions_for_event,
  }, std.extVar('event_schema'))
