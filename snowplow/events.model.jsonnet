local common_dimensions = import 'dimensions/common_dimensions.jsonnet';
local ecommerce_transactions = import 'dimensions/ecommerce_transactions.jsonnet';
local page_pings = import 'dimensions/page_pings.jsonnet';
local structured_event = import 'dimensions/structured_event.jsonnet';
local web_specific_dimensions = import 'dimensions/web_specific.jsonnet';

local common_measures = import 'common_measures.jsonnet';

{
  name: 'snowplow_events',
  label: '[Snowplow] All events',
  category: 'Snowplow Events',
  target: std.extVar('events'),
  mappings: {
    eventTimestamp: 'dvce_sent_tstamp',
    userId: 'user_id',
  },
  measures: common_measures,
  dimensions: common_dimensions + ecommerce_transactions + page_pings + structured_event + web_specific_dimensions,
}
