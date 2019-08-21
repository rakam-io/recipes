local modelSql = (importstr 'consolidated_marketing.sql');
local util = import '../util.libsonnet';
local channels = import './channels.libsonnet';
local dbtModel = (importstr 'consolidated_marketing.sql');

local map_values = function(options, channel) {
          model: std.extVar(channel + '_model'),
          mapping: std.extVar(channel + '_mapping'),
          options: options
        };

{
  name: 'marketing',
  label: 'All campaigns',
  description: 'Consolidated marketing data',
  sql: util.generate_jinja_header({channels: std.mapWithKey(map_values, channels)}) + dbtModel,
  dimensions: {},
}
