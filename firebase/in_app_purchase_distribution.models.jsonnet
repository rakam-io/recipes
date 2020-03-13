local common = import 'common.libsonnet';
local installRevenue = std.extVar('installRevenue');
local predefined = import 'predefined.jsonnet';

local user_props = common.get_user_properties();
local current_event_props = std.filter(function(p) p.event_name == 'in_app_purchase', common.get_event_properties());


if installRevenue then [
  {
    label: 'In-app Purchase Distribution',
    name: 'firebase_event_in_app_purchase_distribution',
    mappings: common.mappings,
    sql: |||
      SELECT *,
      ROW_NUMBER() OVER(PARTITION BY events.user_id ORDER BY events.event_timestamp ASC) as purchase_number,
      COUNT(*) over (partition by events.user_id) as user_total_transactions
      FROM {{model.firebase_event_in_app_purchase}} as events
    |||,
    measures: {

    } + common.measures + predefined.in_app_purchase.measures,
    dimensions: {
      purchase_number: {
        type: 'integer',
        column: 'purchase_number',
      },
      user_total_transactions: {
        type: 'integer',
        column: 'user_total_transactions',
      },
    } + common.dimensions + common.generate_user_dimensions(user_props) + common.generate_event_dimensions(current_event_props),
  },
] else []
