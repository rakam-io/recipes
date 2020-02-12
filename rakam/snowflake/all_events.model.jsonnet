local common = import '../common.libsonnet';

{
  name: 'rakam_events',
  label: '[Rakam] All events',
  target: std.extVar('target'),
  category: 'Rakam Events',
  measures: common.measures,
  dimensions: common.dimensions {
    event_type: {
      column: 'EVENT_TYPE',
    },
  },
}
