local util = import '.././util.libsonnet';
local common = import 'common.libsonnet';
local target = std.extVar('schema');
local predefined = import './predefined.jsonnet';


local custom_measures = {
  revenue: {
    aggregation: 'sum',
    column: 'event_value_in_usd',
    reportOptions: { formatNumbers: '$0,0' },
  },
  average_revenue_per_user: {
    label: 'ARPU [All]',
    sql: '1.0 * ({{measure.revenue}}/{{measure.all_users}})',
    type: 'double',
    reportOptions: { formatNumbers: '$0,0.00' },
  },
  average_revenue_per_new_user: {
    aggregation: 'average',
    label: 'ARPU [New users]',
    column: 'event_value_in_usd',
    type: 'double',
    filters: [
      { dimension: 'is_retained', operator: 'is', value: false, valueType: 'boolean' },
    ],
    reportOptions: { formatNumbers: '$0,0.00' },
  },
  average_revenue_per_retained_user: {
    aggregation: 'average',
    label: 'ARPU [Retained users]',
    column: 'event_value_in_usd',
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
local in_app_purchase = predefined.in_app_purchase;

{
  name: 'firebase_events',
  label: 'All events',
  measures: common.measures + custom_measures,
  mappings: common.mappings,
  relations: common.relations,
  sql: |||
    SELECT *
    %(user_jinja)s
    %(event_jinja)s
    FROM (
      SELECT * FROM `%(project)s`.`%(dataset)s`.`events_*`
      {%% if partitioned %%} WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE("%Y%m%d", DATE '{{date.start}}') and FORMAT_DATE("%Y%m%d", DATE '{{date.end}}') {%% endif %%}
      {%% if include_today %%}
      UNION ALL
      SELECT * FROM `%(project)s`.`%(dataset)s`.`events_intraday_*` WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE("%Y%m%d", CURRENT_DATE()) AND FORMAT_DATE("%Y%m%d", DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY))
      {%% endif %%}
    ) events
  ||| % {
    project: target.database,
    dataset: target.schema,
    user_jinja: std.join('\n', common.generate_jinja_for_user_properties(user_props)),
    event_jinja: std.join('\n', common.generate_jinja_for_event_properties(in_app_purchase.properties)),
  },
  dimensions: {
    event_name: {
      sql: '{{TABLE}}.`event_name`',
    },
  } + common.dimensions + common.generate_user_dimensions(user_props) + common.generate_event_dimensions(in_app_purchase.properties),
}
