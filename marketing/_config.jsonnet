local channels = import './channels.libsonnet';

local mapping = {
  // measures
  clicks: {},
  conversions: {},
  cost: {},
  conversion_value: {},

  ad_name: {},
  adgroup_name: {},
  campaign_name: {},
  impressions: {}
  };

local variable_mapping = std.mapWithKey(function(key, value) value.variable, channels.mapping);

local generateVariableForChannel(name) = {[name + '_model']: {
                                               type: 'model',
                                               defaultValue: channels.options[name].defaultValue
                                             },
                                             [name + '_mapping']: {
                                               parent: name + '_model',
                                               type: 'modelMapping',
                                               options: {dimensions: variable_mapping},
                                             }
                                             };

local items = std.map(generateVariableForChannel, std.objectFields(channels.options));
local variables = std.foldl(function(a, b) a + b, items, {});

{
  version: 1.0,
  label: 'Marketing Analytics',
  description: 'It creates a consolidated dashboard that combines all your marketing data.',
  variables: variables,
  tags: ["marketing"]
}