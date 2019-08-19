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

{
  version: 1.1,
  label: 'Marketing Analytics',
  description: 'It creates a consolidated dashboard that combines all your marketing data.',
  variables: generateVariableForChannel("facebook") + generateVariableForChannel("google"),
  tags: ["marketing"]
}
