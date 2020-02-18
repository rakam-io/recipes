local attrs = std.extVar('attributions');

{
  name: 'Users Overview',
  category: 'Segment Users',
  filterSchema: [
    {
      name: 'dateRange',
      type: 'mappingDimension',
      value: {
        name: 'eventTimestamp',
      },
      defaultValue: 'P1Y',
      isRequired: true,
    },
  ],
  reports: [
             {
               name: '7-Day Active Users',
               x: 0,
               y: 1,
               h: 1,
               w: 1,
               component: 'r-number',
               type: 1,
               reportOptions: {
                 modelName: 'segment_users',
                 dimensions: [],
                 measures: [
                   {
                     name: 'total_users',
                     modelName: 'segment_users',
                     relationName: null,
                   },
                 ],
                 reportOptions: {
                   chartOptions: {
                     type: null,
                     columnOptions: [],
                   },
                   tableOptions: {
                     columnOptions: [],
                   },
                   columnOptions: null,
                 },
                 defaultDateRange: 'P14D',
                 limit: 1000,
                 filters: [
                   {
                     type: 'metricFilter',
                     value: {
                       metricType: 'dimension',
                       metricValue: {
                         name: 'last_update',
                         modelName: 'segment_users',
                         relationName: null,
                         postOperation: {
                           type: 'timestamp',
                           value: 'hour',
                         },
                         pivot: null,
                       },
                       filters: [
                         {
                           valueType: 'timestamp',
                           operator: 'between',
                           value: 'P7D',
                         },
                       ],
                     },
                   },
                 ],
               },
             },
             {
               name: 'Total Users',
               x: 0,
               y: 0,
               h: 1,
               w: 2,
               component: 'r-number',
               type: 1,
               reportOptions: {
                 modelName: 'segment_users',
                 dimensions: [],
                 measures: [
                   {
                     name: 'total_users',
                     modelName: 'segment_users',
                     relationName: null,
                   },
                 ],
                 reportOptions: {
                   chartOptions: {
                     type: null,
                     columnOptions: [],
                   },
                   tableOptions: {
                     columnOptions: [],
                   },
                   columnOptions: null,
                 },
                 defaultDateRange: 'P14D',
                 limit: 1000,
                 filters: null,
               },
             },
             {
               name: '30-day Active Users',
               x: 1,
               y: 1,
               h: 1,
               w: 1,
               component: 'r-number',
               type: 1,
               reportOptions: {
                 modelName: 'segment_users',
                 dimensions: [],
                 measures: [
                   {
                     name: 'total_users',
                     modelName: 'segment_users',
                     relationName: null,
                   },
                 ],
                 reportOptions: {
                   chartOptions: {
                     type: null,
                     columnOptions: [],
                   },
                   tableOptions: {
                     columnOptions: [],
                   },
                   columnOptions: null,
                 },
                 defaultDateRange: 'P14D',
                 limit: 1000,
                 filters: [
                   {
                     type: 'metricFilter',
                     value: {
                       metricType: 'dimension',
                       metricValue: {
                         name: 'last_update',
                         modelName: 'segment_users',
                         relationName: null,
                         postOperation: {
                           type: 'timestamp',
                           value: 'hour',
                         },
                         pivot: null,
                       },
                       filters: [
                         {
                           valueType: 'timestamp',
                           operator: 'between',
                           value: 'P30D',
                         },
                       ],
                     },
                   },
                 ],
               },
             },
           ] + std.map(function(attr) {
             name: 'Distribution by ' + attr,
             h: 1,
             w: 2,
             component: 'r-segmentation-chart',
             type: 1,
             reportOptions: {
               modelName: 'segment_users',
               dimensions: [
                 {
                   name: attr,
                   modelName: 'segment_users',
                   relationName: null,
                   postOperation: null,
                 },
               ],
               measures: [
                 {
                   name: 'total_users',
                   modelName: 'segment_users',
                   relationName: null,
                 },
               ],
               reportOptions: {
                 chartOptions: {
                   type: 'line',
                   columnOptions: [],
                 },
                 tableOptions: {
                   columnOptions: [],
                 },
                 columnOptions: null,
               },
               defaultDateRange: 'P14D',
               limit: 1000,
               filters: null,
             },
           }, std.objectFields(attrs))
           +
           if std.extVar('identifies_target') != null then [{
             name: 'Total Attributions',
             x: 2,
             y: 0,
             h: 2,
             w: 4,
             component: 'r-segmentation-chart',
             type: 1,
             reportOptions: {
               modelName: 'identifies',
               dimensions: [
                 {
                   name: 'received_at',
                   modelName: 'identifies',
                   relationName: null,
                   postOperation: {
                     type: 'timestamp',
                     value: 'day',
                   },
                 },
               ],
               measures: [
                 {
                   name: 'total_identify',
                   modelName: 'identifies',
                   relationName: null,
                 },
               ],
               reportOptions: {
                 chartOptions: {
                   type: 'line',
                   columnOptions: [],
                 },
                 tableOptions: {
                   columnOptions: [],
                 },
                 columnOptions: null,
               },
               defaultDateRange: 'P14D',
               limit: 1000,
               filters: null,
             },
           }] else [],
}
