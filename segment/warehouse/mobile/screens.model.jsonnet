local commonDimensions = import '../common_dimensions.jsonnet';
local pages = import '../page/pages.model.jsonnet';
local config = import '_config.jsonnet';

local embeddedDimensions = config.variables.attributes.options.exclude;
local screenDimensions = std.foldl(function(a, b) a { [b]: { column: b, category: 'Mobile' } }, embeddedDimensions, {});

{
  name: 'screens',
  label: '[Segment] Mobile Screen',
  category: 'Segment Events',
  description: 'A model with all of your screen method calls. This table will include all of the properties you record for screens as top-level columns, for example <source>.screens.title.',
  target: std.extVar('screens_target'),
  dimensions: commonDimensions + screenDimensions + std.extVar('attributes'),
  mappings: pages.mappings,
  measures: {
    total_events: {
      aggregation: 'count',
    },
    unique_users: {
      aggregation: 'countUnique',
      column: 'user_id',
    },
    unique_devices: {
      aggregation: 'countUnique',
      column: 'context_device_id',
    },
  },
}
