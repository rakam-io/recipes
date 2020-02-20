local common_dimensions = import 'dimensions/common_dimensions.jsonnet';
local web_specific_dimensions = import 'dimensions/web_specific_dimensions.jsonnet';

{
  name: 'snowplow_events',
  label: '[Snowpolow] All events',
  category: 'Snowplow Events',
  target: std.extVar('events'),
  mappings: {
    eventTimestamp: 'dvce_sent_tstamp',
    userId: 'user_id'
  },
  measures: {
    count_all_rows: {
      description: 'Counts All Rows',
      reportOptions: {
        formatNumbers: true,
      },
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
  },
  dimensions: common_dimensions,
}
