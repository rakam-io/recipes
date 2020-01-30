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

{
  label: 'Pageviews',
  name: 'ga_pageviews',
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
    eventTimestamp: 'fullVisitorId',
  },
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
                time: {
                  sql: 'time',
                },
                seconds_since_session_start: {
                  sql: 'time',
                  description: 'The number of milliseconds after the visitStartTime when this hit was registered. The first hit has a hits.time of 0',
                },
                dataSource: {
                  sql: 'dataSource',
                  description: 'The data source of a hit. By default, hits sent from analytics.js are reported as "web" and hits sent from the mobile SDKs are reported as "app".',
                },
                hitNumber: {
                  sql: 'hitNumber',
                  description: 'The sequenced hit number. For the first hit of each session, this is set to 1.',
                },
                isEntrance: {
                  sql: 'isEntrance',
                  description: 'If this hit was the first pageview or screenview hit of a session, this is set to true.',
                },
                isExit: {
                  sql: 'isExit',
                  description: 'If this hit was the last pageview or screenview hit of a session, this is set to true.',
                },
                isInteraction: {
                  sql: 'isInteraction',
                  description: 'If this hit was an interaction, this is set to true. If this was a non-interaction hit (i.e., an event with interaction set to false), this is false.',
                },
                type: {
                  sql: 'type',
                  description: 'The type of hit. One of: "PAGE", "TRANSACTION", "ITEM", "EVENT", "SOCIAL", "APPVIEW", "EXCEPTION".',
                },
                referer: {
                  sql: 'referer',
                  description: 'The referring page, if the session has a goal completion or transaction. If this page is from the same domain, this is blank.',
                },
              },
  measures:
    item.dimensions +
    product.dimensions +
    publisher.dimensions
    {
      count_of_pageviews: {
        aggregation: 'count',
      },
      unique_visitors: {
        column: 'fullVisitorId',
        aggregation: 'countUnique',
      },
    },
}
