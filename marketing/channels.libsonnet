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
              clicks: {dimension: {hidden: true, column: 'clicks'}, variable: {}},
              conversions: {dimension: {hidden: true, column: 'conversions'}, variable: {}},
              cost: {dimension: {hidden: true, column: 'cost'}, variable: {}},
              conversion_value: {dimension: {hidden: true, column: 'conversion_value'}, variable: {}},
              impressions: {dimension: {hidden: true, column: 'impressions'}, variable: {}},

              // dimensions
              ad_name: {dimension: {column: 'ad_name'}, variable: {}},
              ad_group_name: {dimension: {column: 'ad_group_name'}, variable: {}},
              campaign_name: {dimension: {column: 'campaign_name'}, variable: {}},
              }
}
