local util = import '.././util.libsonnet';
local common = import '././common.libsonnet';
local predefined = import '././predefined.jsonnet';


local all_event_props = common.get_event_properties();
local unique_events = std.uniq(std.sort(std.map(function(attr) attr.event_name, all_event_props)));

local user_props = common.get_user_properties();
local target = std.extVar('schema');

std.map(function(event_type)
  local current_event_props = std.filter(function(p) p.event_name == event_type, all_event_props);
  local event_db_name = std.filter(function(attr) attr.event_name == event_type, all_event_props)[0].event_db;

  local defined = if std.objectHas(predefined, event_type) then predefined[event_type] else null;

  local dimensions_for_event = common.generate_user_dimensions(user_props)
                               +
                               common.generate_event_dimensions(current_event_props)
                               +
                               if defined != null && std.objectHas(defined, 'dimensions') then defined.dimensions else {};

  {
    name: 'firebase_event_' + event_type,
    label: event_type,
    measures: common.measures + if defined != null && std.objectHas(defined, 'measures') then defined.measures else {},
    mappings: common.mappings,
    category: if defined != null then 'Firebase events' else 'Custom events',
    relations: common.relations + if defined != null && std.objectHas(defined, 'relations') then defined.relations else {},
    sql: |||
      SELECT *
      %(user_jinja)s
      %(event_jinja)s
      FROM `%(project)s`.`%(dataset)s`.`events_*`
      WHERE event_name = '%(event)s'
      {%% if partitioned %%} AND _TABLE_SUFFIX BETWEEN FORMAT_DATE("%%Y%%m%%d", DATE '{{date.start}}') and FORMAT_DATE("%%Y%%m%%d", DATE '{{date.end}}') {%% endif %%}
    ||| % {
      user_jinja: std.join('\n', common.generate_jinja_for_user_properties(user_props)),
      event_jinja: std.join('\n', common.generate_jinja_for_event_properties(current_event_props)),
      project: target.database,
      dataset: target.schema,
      event: event_db_name,
    },
    dimensions: common.dimensions + dimensions_for_event,
  }, unique_events)
