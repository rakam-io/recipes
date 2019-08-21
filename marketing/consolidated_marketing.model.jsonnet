local modelSql = (importstr 'consolidated_marketing.sql');
local util = import '../../util.libsonnet';
local channels = import './channels.jsonnet';

local keys = std.objectFields(channels);
local event_types = std.extVar('event_types');

{
  name: 'marketing',
  label: 'All campaigns',
  description: 'Consolidated marketing data',
  sql: util.generate_jinja_header(std.mapWithKey(function(channel) {
    model: std.extVar(channel + '_model'),
    mapping: std.extVar(channel + '_mapping')
  }, channels) + dbtModel,
  dimensions: segmentColumns {
    event: {
      hide: true,
      description: 'The slug of the event name, mapping to an event-specific table.',
    },
  },
}
