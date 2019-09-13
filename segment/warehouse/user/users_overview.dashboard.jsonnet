{
  name: 'Users Overview',
  filterSchema: [
    {
      name: 'dateRange',
      type: 'mappingDimension',
      value: {
        name: 'eventTimestamp',
      },
      defaultValue: 'P5Y',
      isRequired: true,
    },
  ],
  reports: [
    {
      name: 'Total Attributions',
      ttl: 'PT1H',
      x: 2,
      y: 0,
      h: 2,
      w: 4,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'identifies',
        filter: null,
        dimensions: [
          {
            name: 'received_at',
            modelName: 'identifies',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'day',
            },
            pivot: false,
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
    },
    {
      name: '7-Day Active Users',
      ttl: 'PT1H',
      x: 0,
      y: 1,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'segment_users',
        filter: null,
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
                  operator: 'greaterThan',
                  value: '2019-08-28T14:00:56.369Z',
                },
              ],
            },
          },
        ],
      },
    },
    {
      name: 'By Device',
      ttl: 'PT1H',
      x: 0,
      y: 2,
      h: 1,
      w: 2,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'segment_users',
        filter: null,
        dimensions: [
          {
            name: 'context_device_type',
            modelName: 'segment_users',
            relationName: null,
            postOperation: null,
            pivot: false,
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
    },
    {
      name: 'Total Users',
      ttl: 'PT1H',
      x: 0,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'segment_users',
        filter: null,
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
      ttl: 'PT1H',
      x: 1,
      y: 1,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'segment_users',
        filter: null,
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
                  operator: 'greaterThan',
                  value: '2019-08-28T14:00:56.369Z',
                },
              ],
            },
          },
        ],
      },
    },
  ],
}
