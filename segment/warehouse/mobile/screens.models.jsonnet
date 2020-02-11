local config = import '../_config.jsonnet';
local commonDimensions = import '../common_dimensions.jsonnet';
local pages = import '../page/pages.models.jsonnet';

local embeddedDimensions = config.variables.screens_event_attributes.options.exclude;
local screenDimensions = std.foldl(function(a, b) a { [b]: { column: b, category: 'Mobile' } }, embeddedDimensions, {});

if std.extVar('screens_target') != null then [{
  name: 'screens',
  label: '[Segment] Mobile Screen',
  category: 'Segment Events',
  description: 'A model with all of your screen method calls. This table will include all of the properties you record for screens as top-level columns, for example <source>.screens.title.',
  target: std.extVar('screens_target'),
  dimensions: commonDimensions + screenDimensions + std.extVar('screens_event_attributes'),
  mappings: pages[0].mappings,
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
}] else []
