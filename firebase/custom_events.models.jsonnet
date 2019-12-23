local util = import '.././util.libsonnet';
local common = import '././common.libsonnet';

local event_props = std.extVar('event_properties');
local target = std.extVar('schema');
local user_props = std.extVar('user_properties');

local unique_events = std.uniq(std.map(function(attr) attr.event_name, event_props));

std.map(function(event_type)
  local current_event_props = std.filter(function(p) p.event_name == event_type, event_props);

  local event_db_name = std.filter(function(attr) attr.event_name == event_type, event_props)[0].event_db;

  local event_params_jinja = std.map(function(prop)
    |||
      {%% if in_query.event_%(name)s %%}
        , CASE WHEN event_params.key = '%(prop_db)s' THEN event_params.value.%(value_type)s END as %(name)s
      {%% endif %%}
    ||| % prop, current_event_props);

  {
    name: event_type,
    measures: common.measures,
    mappings: common.mappings,
    relations: common.relations,
    sql: |||
      SELECT *
      %(user_props)s
      %(event_params)s
      FROM `%(project)s`.`%(dataset)s`.`events_*`
      {%% if in_query.user_ %%} LEFT JOIN UNNEST(user_properties) as user_properties {%% endif %%}
      {%% if in_query.event_ %%} LEFT JOIN UNNEST(event_params) as event_params {%% endif %%}
      WHERE event_name = '%(event)s'
      {%% if partitioned %%} AND _TABLE_SUFFIX BETWEEN FORMAT_DATE("%%Y%%m%%d", DATE '{{date.start}}') and FORMAT_DATE("%%Y%%m%%d", DATE '{{date.end}}') {%% endif %%}
    ||| % { user_props: std.join('\n', common.generate_jinja_for_user_properties(user_props)), event_params: std.join('\n', event_params_jinja), project: target.database, dataset: target.schema, event: event_db_name },
    dimensions: common.dimensions + std.foldl(function(a, b) a + b, std.map(function(attr) {
                  ['user_' + attr.name]: {
                    category: 'User Attribute',
                    sql: '{{TABLE}}.`' + attr.name + '`',
                    type: attr.type,
                  },
                }, user_props), {})
                +
                std.foldl(function(a, b) a + b, std.map(function(attr) {
                  ['event_' + attr.name]: {
                    category: 'Event Attribute',
                    sql: '{{TABLE}}.`' + attr.name + '`',
                    type: attr.type,
                  },
                }, event_props), {}),
  }, unique_events)
