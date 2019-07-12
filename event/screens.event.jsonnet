local commonDimensions = import 'common_dimensions.jsonnet';
local pages = import 'pages.model.jsonnet';

{
  name: 'screens',
  label: '[Segment] Screens',
  description: "The screen data that's collected via Segment Javascript SDK",
  target: {
     table: 'screens'
  },
  relations: pages.relations,
  columns: commonDimensions,
  mapping: pages.mapping,
}
