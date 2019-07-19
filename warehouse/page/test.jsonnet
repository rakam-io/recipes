local obj = {
   'context_campaign_source': {
        column: 'utm_source'
   },
};

//{ [k]: obj[k].column for k in std.objectFields(obj) }

{ [obj[k].column]: obj[k] for k in std.objectFields(obj) }