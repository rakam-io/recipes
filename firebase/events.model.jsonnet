local util = import '.././util.libsonnet';
local common = import 'common.libsonnet';
local target = std.extVar('schema');
local predefined = import './predefined.jsonnet';

local installRevenue = std.extVar('installRevenue');

local user_props = common.get_user_properties();
local in_app_purchase = predefined.in_app_purchase;
local common_dimensions_all = common.dimensions + common.generate_event_dimensions(in_app_purchase.properties);
local common_measures_all = common.measures + common.all_events_revenue_measures;

local common_dimensions = if (!installRevenue) then std.filter(function(dimension) dimension.category != 'Revenue', common_dimensions_all) else common_dimensions_all;
local common_measures = if (!installRevenue) then std.filter(function(measure) measure.category != 'Revenue', common_measures_all) else common_measures_all;

{
  name: 'firebase_events',
  label: 'All events',
  measures: common_measures,
  mappings: common.mappings,
  relations: common.relations,
  sql: |||
    SELECT *
    %(user_jinja)s
    %(event_jinja)s
    FROM (
      SELECT * FROM `%(project)s`.`%(dataset)s`.`events_*`
      {%% if partitioned %%} WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE("%%Y%%m%%d", DATE '{{date.start}}') and FORMAT_DATE("%%Y%%m%%d", DATE '{{date.end}}') {%% endif %%}
      {%% if include_today %%}
      UNION ALL
      SELECT * FROM `%(project)s`.`%(dataset)s`.`events_intraday_*` WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE("%%Y%%m%%d", CURRENT_DATE()) AND FORMAT_DATE("%%Y%%m%%d", DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY))
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
  } + common.generate_user_dimensions(user_props) + common_dimensions,
}
