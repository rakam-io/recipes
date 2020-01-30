local target = std.extVar('schema');

local device = import '././s_device.jsonnet';
local geoNetwork = import 's_geonetwork.jsonnet';
local totals = import 's_totals.jsonnet';
local trafficSource = import 's_trafficsource.jsonnet';
local customDimensions = import 's_custom_dimensions.jsonnet';
local sessions = import 's.jsonnet';

{
  label: 'Sessions',
  name: 'ga_sessions',
  sql: |||
    SELECT * FROM `%(project)s`.`%(dataset)s`.`ga_sessions_*`
    {%% if partitioned %%} WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE("%%Y%%m%%d", DATE '{{date.start}}') and FORMAT_DATE("%%Y%%m%%d", DATE '{{date.end}}') {%% endif %%}
    {%% if include_today %%}
    UNION ALL
    SELECT * FROM `%(project)s`.`%(dataset)s`.`ga_sessions_intraday_*` WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE("%%Y%%m%%d", CURRENT_DATE()) AND FORMAT_DATE("%%Y%%m%%d", DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY))
    {%% endif %%}
  ||| % {
    project: target.database,
    dataset: target.schema,
  },
  mappings: {
    userId: 'user_id',
    eventTimestamp: 'visit_start_time',
  },
  dimensions: device.dimensions + geoNetwork.dimensions + totals.dimensions + trafficSource.dimensions + customDimensions.dimensions + sessions.dimensions,
  measures: sessions.measures + totals.measures,
}
