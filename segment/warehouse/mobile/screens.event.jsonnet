local commonDimensions = import '../common_dimensions.jsonnet';
local pages = import 'pages.model.jsonnet';

{
  name: 'screens',
  label: 'Mobile Screen Events',
  description: "The screen data that's collected via Segment Javascript SDK",
  target: {
     table: std.extVar('screens_target')
  },
  relations: pages.relations,
  dimensions: commonDimensions,
  mappings: pages.mappings,
}
