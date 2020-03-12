local common = import 'common.libsonnet';
local installRevenue = std.extVar('installRevenue');
local target = std.extVar('schema');
local predefined = import 'predefined.jsonnet';

local user_props = common.get_user_properties();

local all_event_props = common.get_event_properties();
local current_event_props = std.filter(function(p) p.event_name == 'in_app_purchase', all_event_props);


if installRevenue then [
  {
    label: 'In-app Purchase Distribution',
    name: 'firebase_event_in_app_purchase_distribution',
    sql: |||
      select * from {{model.firebase_event_in_app_purchase}}
    |||,
    measures: common.measures + predefined.in_app_purchase.measures,
    dimensions: {
      purchase_number: {
        sql: 'ROW_NUMBER() OVER(PARTITION BY {{TABLE}}.user_id ORDER BY {{TABLE}}.event_timestamp ASC)',
      },
    } + common.generate_user_dimensions(user_props) + common.generate_event_dimensions(current_event_props),
  },
] else []
