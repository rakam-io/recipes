local util = import '../../util.libsonnet';
local common = import '../common.libsonnet';
local target = std.extVar('target');

local dimensions = [
  {
    db: 'collection',
    n: 'collection',
    t: 'VARCHAR',
  },
  {
    db: 'property',
    n: 'property',
    t: 'VARCHAR',
  },
  {
    db: 'type',
    n: 'type',
    t: 'VARCHAR',
  },
  {
    db: 'event_id',
    n: 'event_id',
    t: 'VARCHAR',
  },
  {
    db: 'error_message',
    n: 'error_message',
    t: 'VARCHAR',
  },
  {
    db: 'encoded_value',
    n: 'encoded_value',
    t: 'VARCHAR',
  },
];

{
  category: 'Rakam Events',
  name: 'rakam_invalid_schema',
  label: '[System] Invalid Schema',
  sql: |||
    select * from %(target)s where event_type = '$invalid_schema'
  ||| % { target: util.generate_target_reference(target) },
  measures: common.measures,
  mappings: common.mappings,
  dimensions: common.dimensions + std.foldl(function(a, b) a + b, std.map(function(prop) {
    [prop.n]: {
      sql: '{{TABLE}}.properties:"%(name)s"::%(type)s' % { type: prop.t, name: prop.db },
      category: if std.startsWith(prop.db, '_') then 'SDK' else 'Event Property',
    },
  }, dimensions), {}),
}
