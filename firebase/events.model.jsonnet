local util = import '.././util.libsonnet';
local common = import 'common.libsonnet';
local target = std.extVar('schema');

local user_props = std.extVar('user_properties');

{
  name: 'firebase_events',
  measures: common.measures,
  mappings: common.mappings,
  relations: common.relations,
  sql: |||
    SELECT *
    %(user_props)s
    FROM `%(project)s`.`%(dataset)s`.`events_*`
    {%% if partitioned %%} WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE("%%Y%%m%%d", DATE '{{date.start}}') and FORMAT_DATE("%%Y%%m%%d", DATE '{{date.end}}') {%% endif %%}'
  ||| % { user_props: std.join('\n', common.generate_jinja_for_user_properties(user_props)), project: target.database, dataset: target.schema },
  dimensions: common.dimensions + std.foldl(function(a, b) a + b, std.map(function(attr) {
    ['user_' + attr.name]: {
      category: 'User Attribute',
      sql: '{{TABLE}}.`' + attr.name + '`',
      type: attr.type,
    },
  }, user_props), {}),
}
