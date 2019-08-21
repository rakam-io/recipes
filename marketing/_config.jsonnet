local channels = import './channels.libsonnet';

local mapping = {
     dimensions: {
        ad_name: {},
        ad_group: {},
        campaign: {},
      },
      measures: {
       cost: {},
       reach: {}
     }
  };

local generateVariableForChannel(name) = {[name + '_model']: {
                                               type: 'model'
                                             },
                                             [name + '_mapping']: {
                                               parent: name + '_model',
                                               type: 'modelMapping',
                                               options: mapping,
                                             }
                                             };

local items = std.map(generateVariableForChannel, std.objectFields(channels));
local variables = std.foldl(function(a, b) a + b, items, {});

{
  version: 1.1,
  label: 'Marketing Analytics',
  description: 'It creates a consolidated dashboard that combines all your marketing data.',
  variables: variables,
  tags: ["marketing"]
}