local modelSql = (importstr 'consolidated_marketing.sql');
local pages = import 'pages.libsonnet';
local util = import '../../util.libsonnet';

{
  name: 'marketing',
  label: 'All campaigns',
  description: 'Consolidated marketing data',
  sql: util.generate_jinja_header({
                    inactivity_cutoff: std.extVar('session_duration_in_minutes'),
                    sessionization_trailing_window: 2.0,
                    pages_target: pages_target_ref,
                    first_values: { [k]: first_values[k].column for k in std.objectFields(first_values) },
                    last_values: { [k]: last_values[k].column for k in std.objectFields(last_values) }
                  }) + dbtModel,
  relations: pages.relations,
  dimensions: segmentColumns {
    event: {
      hide: true,
      description: 'The slug of the event name, mapping to an event-specific table.',
    },
  },
}
