local commonDimensions = import '../common_dimensions.jsonnet';
local pages = import 'pages.model.jsonnet';

{
  name: 'screens',
  label: 'Mobile Screen Events',
  description: "A model with all of your screen method calls. This table will include all of the properties you record for screens as top-level columns, for example <source>.screens.title.",
  target: {
     table: std.extVar('screens_target')
  },
  relations: pages.relations,
  dimensions: commonDimensions + std.extVar('attributes'),
  mappings: pages.mappings,
}
