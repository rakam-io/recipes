local target = std.extVar('schema');

local appInfo = import 'hits_app_info.jsonnet';
local customDimensions = import 'hits_custom_dimensions.jsonnet';
local customMetrics = import 'hits_custom_metrics.jsonnet';
local eventInfo = import 'hits_event_info.jsonnet';
local item = import 'hits_item.jsonnet';
local latencyTracking = import 'hits_latency.jsonnet';
local page = import 'hits_page.jsonnet';
local product = import 'hits_product.jsonnet';
local publisher = import 'hits_publisher.jsonnet';
local social = import 'hits_social.jsonnet';

local sessions = import './././s.jsonnet';
local pageviews = import 'hits.jsonnet';

{
  label: 'Pageviews',
  name: 'ga_pageviews',
  category: 'Google Analytics',
  sql: |||
    SELECT * FROM `%(project)s`.`%(dataset)s`.`ga_sessions_*`
    {%% if partitioned %%} WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE("%%Y%%m%%d", DATE '{{date.start}}') and FORMAT_DATE("%%Y%%m%%d", DATE '{{date.end}}') {%% endif %%}
    {%% if include_today and false %%}
    UNION ALL
    SELECT * FROM `%(project)s`.`%(dataset)s`.`ga_sessions_intraday_*` WHERE _TABLE_SUFFIX BETWEEN FORMAT_DATE("%%Y%%m%%d", CURRENT_DATE()) AND FORMAT_DATE("%%Y%%m%%d", DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY))
    {%% endif %%}
  ||| % {
    project: target.database,
    dataset: target.schema,
  },
  mappings: {
    userId: 'user_id',
    eventTimestamp: 'pageview_time',
  },
  measures: item.dimensions +
            product.dimensions +
            publisher.dimensions +
            {
              [k]: sessions.measures[k]
                   { category: if (std.objectHas(sessions.measures[k], 'category')) then 'Session ' + sessions.measures[k].category else 'Session' }
              for k in std.objectFields(sessions.measures)
            } +
            pageviews.measures
  ,
  dimensions: appInfo.dimensions
              + customDimensions.dimensions
              + customMetrics.dimensions
              + eventInfo.dimensions
              + item.dimensions
              + latencyTracking.dimensions
              + page.dimensions
              + product.dimensions
              + publisher.dimensions
              + publisher.dimensions
              + social.dimensions
                {
                [k]: sessions.dimensions[k]
                     { category: if (std.objectHas(sessions.dimensions[k], 'category')) then 'Session ' + sessions.dimensions[k].category else 'Session' }
                for k in std.objectFields(sessions.dimensions)
              }
              + pageviews.dimensions,
}
