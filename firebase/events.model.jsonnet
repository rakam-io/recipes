local util = import '.././util.libsonnet';
local common = import 'common.libsonnet';
local target = std.extVar('schema');
local predefined = import './predefined.jsonnet';


local custom_measures = {
  average_revenue_per_user: {
    label: 'ARPU [All]',
    sql: '1.0 * ({{measure.revenue}}/{{measure.all_users}})',
    type: 'double',
    reportOptions: { formatNumbers: '$0,0.00' },
  },
  average_revenue_per_new_user: {
    aggregation: 'average',
    label: 'ARPU [New users]',
    sql: '{{dimension.event__price}} / 1000000',
    type: 'double',
    filters: [
      { dimension: 'is_retained', operator: 'is', value: false, valueType: 'boolean' },
    ],
    reportOptions: { formatNumbers: '$0,0.00' },
  },
  average_revenue_per_retained_user: {
    aggregation: 'average',
    label: 'ARPU [Retained users]',
    sql: '{{dimension.event__price}} / 1000000',
    type: 'double',
    filters: [
      { dimension: 'is_retained', operator: 'is', value: true, valueType: 'boolean' },
    ],
    reportOptions: { formatNumbers: '$0,0.00' },
  },
  paying_and_retained_users: {
    sql: '{{dimension.firebase_user_id}}',
    aggregation: 'countUnique',
    filters: [
      { dimension: 'is_retained', operator: 'is', value: true, valueType: 'boolean' },
      { dimension: 'is_paying', operator: 'is', value: true, valueType: 'boolean' },
    ],
    type: 'double',
    hidden: true,
  },
  paying_and_new_users: {
    sql: '{{dimension.firebase_user_id}}',
    aggregation: 'countUnique',
    filters: [
      { dimension: 'is_retained', operator: 'is', value: false, valueType: 'boolean' },
      { dimension: 'is_paying', operator: 'is', value: true, valueType: 'boolean' },
    ],
    type: 'double',
    hidden: true,
  },
  percent_retained_users_paying: {
    sql: '{{measure.paying_and_retained_users}}/{{measure.active_users}}',
    reportOptions: { formatNumbers: '0.0%' },
  },
  percent_new_users_paying: {
    sql: '{{measure.paying_and_new_users}}/{{measure.new_users}}',
    reportOptions: { formatNumbers: '0.0%' },
  },
};

local user_props = common.get_user_properties();
local embedded_event = predefined.in_app_purchase;

{
  name: 'firebase_events',
  label: 'All events',
  measures: predefined.in_app_purchase.measures + common.measures + custom_measures,
  mappings: common.mappings,
  relations: common.relations,
  sql: |||
    SELECT *
    %(user_jinja)s
    %(event_jinja)s
    FROM `%(project)s`.`%(dataset)s`.`events_*`
    {%% if partitioned %%} WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE("%%Y%%m%%d", DATE '{{date.start}}') and FORMAT_DATE("%%Y%%m%%d", DATE '{{date.end}}') {%% endif %%}
  ||| % {
    project: target.database,
    dataset: target.schema,
    user_jinja: std.join('\n', common.generate_jinja_for_user_properties(user_props)),
    event_jinja: std.join('\n', common.generate_jinja_for_event_properties(embedded_event.properties)),
  },
  dimensions: {
    event_name: {
      sql: '{{TABLE}}.`event_name`',
    },
  } + common.dimensions + common.generate_user_dimensions(user_props) + common.generate_event_dimensions(embedded_event.properties),
}
