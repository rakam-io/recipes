local segmentColumns = import 'common_columns.jsonnet';
local pages = import 'pages.libsonnet';

{
  name: 'screens',
  label: '[Segment] Screens',
  description: "The screen data that's collected via Segment Javascript SDK",
  relations: pages.relations,
  columns: segmentColumns,
  mapping: pages.mapping,
}
