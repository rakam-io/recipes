{
  options:: {
                 facebook: {
                     label: 'Facebook'
                 },
                 google: {
                     label: 'Google'
                 }
             },
  mapping:: {
              // measures
              clicks: {dimension: {hidden: true, column: 'clicks'}, variable: {default: 'clicks'}},
              conversions: {dimension: {hidden: true, column: 'conversions'}, variable: {default: 'conversions'}},
              cost: {dimension: {hidden: true, column: 'cost'}, variable: {default: 'cost'}},
              conversion_value: {dimension: {hidden: true, column: 'conversion_value'}, variable: {default: 'conversion_value'}},
              impressions: {dimension: {hidden: true, column: 'impressions'}, variable: {default: 'impressions'}},

              // dimensions
              ad_name: {dimension: {column: 'ad_name'}, variable: {default: 'ad_name'}},
              ad_group_name: {dimension: {column: 'ad_group_name'}, variable: {default: 'ad_group_name'}},
              campaign_name: {dimension: {column: 'campaign_name'}, variable: {default: 'campaign_name'}},
              }
}
