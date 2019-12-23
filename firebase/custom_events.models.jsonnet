local event_props = [
  { event_name: 'app_opened', event_db: 'AppOpened', name: 'firebase_event_origin', type: 'string', prop_db: 'firebase_event_origin', value_type: 'string_value' },
];
local util = import '.././util.libsonnet';
local user_props = [{ name: 'user_type', prop_db: 'userType', type: 'string', value_type: 'string_value' }];

local user_props_jinja = std.map(function(prop)
  |||
    {%% if in_query.user_%(name)s %%}
       , CASE WHEN user_properties.key = '%(prop_db)s' THEN user_properties.value.%(value_type)s END as %(name)s
    {%% endif %%}
  ||| % prop, user_props);

local unique_events = std.uniq(std.map(function(attr) attr.event_name, event_props));

std.map(function(event_type)
  local current_event_props = std.filter(function(p) p.event_name == event_type, event_props);

  local event_params_jinja = std.map(function(prop)
    |||
      {%% if in_query.event_%(name)s %%}
        , CASE WHEN event_params.key = '%(prop_db)s' THEN event_params.value.%(value_type)s END as %(name)s
      {%% endif %%}
    ||| % prop, current_event_props);
  {
    name: event_type,
    sql: |||
      SELECT *
      %(user_props)s
      %(event_params)s
      FROM `%(dataset)s`.`events_*`
      {%% if in_query.user_ %%} LEFT JOIN UNNEST(user_properties) as user_properties {%% endif %%}
      {%% if in_query.event_ %%} LEFT JOIN UNNEST(event_params) as event_params {%% endif %%}
      WHERE event_name = '%(event)s' {%% if partitioned %%} AND _TABLE_SUFFIX BETWEEN FORMAT_DATE("%%Y%%m%%d", DATE '{{date.start}}') and FORMAT_DATE("%%Y%%m%%d", DATE '{{date.end}}') {%% endif %%}
    ||| % { user_props: std.join(', \n', user_props_jinja), event_params: std.join(', \n', event_params_jinja), dataset: 'analytics_163124468', event: 'AppOpened' },
    dimensions: std.foldl(function(a, b) a + b, std.map(function(attr) {
                  ['user_' + attr.name]: {
                    category: 'User Attribute',
                    sql: '{{TABLE}}.`' + attr.name + '`',
                    type: attr.type,
                  },
                }, user_props), {})
                +
                std.foldl(function(a, b) a + b, std.map(function(attr) {
                  ['event_' + attr.name]: {
                    category: 'Event Attribute',
                    sql: '{{TABLE}}.`' + attr.name + '`',
                    type: attr.type,
                  },
                }, event_props), {}),
  }, unique_events)
