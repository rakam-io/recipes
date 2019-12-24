local util = import '.././util.libsonnet';
local common = import 'common.libsonnet';
local target = std.extVar('schema');

local custom_measures = {
  average_revenue_per_user: {
    sql: '{{measure.revenue}}/{{measure.active_users}}',
    type: 'double',
  },
  average_revenue_per_new_user: {
    sql: '{{measure.revenue}}/{{measure.new_users}}',
    type: 'double',
  },
  average_revenue_per_returning_user: {
    sql: '{{measure.revenue}}/{{measure.returning_users}}',
    type: 'double',
  },
  paying_and_returning_user_ratio: {
    sql: '{{measure.paying_users}}/{{measure.returning_users}}',
    type: 'double',
  },
  paying_and_returning_users: {
    sql: '{{dimension.firebase_user_id}}',
    aggregation: 'countUnique',
    filters: [{ dimension: 'returning_user_id', operator: 'isSet', valueType: 'unknown' }, { dimension: 'is_paying', operator: 'is', value: true, valueType: 'boolean' }],
    type: 'double',
    hidden: true,
  },
  revenue_from_paying_users: {
    sql: '{{measure.paying_and_returning_users}}/{{measure.returning_users}}',
  },
};

local user_props = common.get_user_properties();
local embedded_event = common.predefined.in_app_purchase;

local user_dimensions = std.foldl(function(a, b) a + b, std.map(function(attr) {
  ['user__' + attr.name]: {
    category: 'User Attribute',
    sql: '{{TABLE}}.`user__' + attr.name + '`',
    type: attr.type,
  },
}, user_props), {});

{
  name: 'firebase_events',
  measures: common.predefined.in_app_purchase.measures + common.measures + custom_measures,
  mappings: common.mappings,
  relations: common.relations,
  sql: |||
    SELECT *
    %(user_jinja)s
    %(event_jinja)s
    FROM `%(project)s`.`%(dataset)s`.`events_*`
    {%% if in_query.user__ %%} LEFT JOIN UNNEST(user_properties) as user_properties {%% endif %%}
    {%% if in_query.event__ %%} LEFT JOIN UNNEST(event_params) as event_params {%% endif %%}
    {%% if partitioned %%} WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE("%%Y%%m%%d", DATE '{{date.start}}') and FORMAT_DATE("%%Y%%m%%d", DATE '{{date.end}}') {%% endif %%}
  ||| % {
    project: target.database,
    dataset: target.schema,
    user_jinja: std.join('\n', common.generate_jinja_for_user_properties(user_props)),
    event_jinja: std.join('\n', common.generate_jinja_for_event_properties(embedded_event.properties)),
  },
  dimensions: common.dimensions + user_dimensions,
}
