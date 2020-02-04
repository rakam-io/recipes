{
  name: 'Sales',
  category: "Firebase",
  filterSchema: [
    {
      name: 'Date',
      type: 'mappingDimension',
      value: {
        name: 'eventTimestamp',
      },
      defaultValue: 'P14D',
      isRequired: true,
    },
    {
      name: 'Country',
      type: 'dimension',
      value: {
        model: 'firebase_event_in_app_purchase',
        dimension: 'country',
      },
      isRequired: false,
    },
    {
      name: 'Install Source',
      type: 'dimension',
      value: {
        model: 'firebase_event_in_app_purchase',
        dimension: 'install_source',
      },
      isRequired: false,
    },
    {
      name: 'App Version',
      type: 'dimension',
      value: {
        model: 'firebase_event_in_app_purchase',
        dimension: 'version',
      },
      isRequired: false,
    },
    {
      name: 'Product ID',
      type: 'dimension',
      value: {
        model: 'firebase_event_in_app_purchase',
        dimension: 'event__product_id',
      },
      isRequired: false,
    },
    {
      name: 'Platform',
      type: 'dimension',
      value: {
        model: 'firebase_event_in_app_purchase',
        dimension: 'platform',
      },
      defaultValue: [
        'IOS',
      ],
      isRequired: false,
    },
  ],
  reports: [
    {
      name: 'Daily sales per country',
      x: 0,
      y: 3,
      h: 2,
      w: 3,
      component: 'r-table',
      type: 1,
      reportOptions: {
        modelName: 'firebase_event_in_app_purchase',
        dimensions: [
          {
            name: 'event_timestamp',
            modelName: 'firebase_event_in_app_purchase',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'day',
            },
            pivot: null,
          },
          {
            name: 'country',
            modelName: 'firebase_event_in_app_purchase',
            relationName: null,
            postOperation: null,
            pivot: true,
          },
        ],
        measures: [
          {
            name: 'total_transactions',
            modelName: 'firebase_event_in_app_purchase',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'area',
            showLabels: true,
            showLegend: false,
            interactive: true,
            columnOptions: [],
          },
          tableOptions: {
            columnOptions: [],
          },
          columnOptions: null,
        },
        defaultDateRange: 'P14D',
        limit: 5000,
        filters: [
          {
            type: 'metricFilter',
            value: {
              metricType: 'measure',
              metricValue: {
                name: 'total_transactions',
                modelName: 'firebase_event_in_app_purchase',
                relationName: null,
              },
              filters: [
                {
                  valueType: 'double',
                  operator: 'greaterThan',
                  value: 1,
                },
              ],
            },
          },
        ],
        orders: null,
      },
    },
    {
      name: 'Most paying countries',
      x: 3,
      y: 3,
      h: 2,
      w: 3,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'firebase_event_in_app_purchase',
        dimensions: [
          {
            name: 'country',
            modelName: 'firebase_event_in_app_purchase',
            relationName: null,
            postOperation: null,
            pivot: null,
          },
        ],
        measures: [
          {
            name: 'paying_users',
            modelName: 'firebase_event_in_app_purchase',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'pie',
            showLabels: true,
            showLegend: false,
            columnOptions: [],
            showPercentage: true,
          },
          tableOptions: {
            columnOptions: [],
          },
          columnOptions: null,
        },
        defaultDateRange: 'P14D',
        limit: 5000,
        filters: [
          {
            type: 'metricFilter',
            value: {
              metricType: 'measure',
              metricValue: {
                name: 'total_transactions',
                modelName: 'firebase_event_in_app_purchase',
                relationName: null,
              },
              filters: [
                {
                  valueType: 'double',
                  operator: 'greaterThan',
                  value: 1,
                },
              ],
            },
          },
        ],
        orders: null,
      },
    },
    {
      name: 'Total Sales (Retained Users)',
      x: 2,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'firebase_event_in_app_purchase',
        dimensions: null,
        measures: [
          {
            name: 'revenue_from_retained_users',
            modelName: 'firebase_event_in_app_purchase',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            columnOptions: [],
          },
          tableOptions: {
            columnOptions: [],
          },
          columnOptions: null,
        },
        defaultDateRange: 'P14D',
        limit: 5000,
        filters: null,
        orders: null,
      },
    },
    {
      name: 'Total Sales',
      x: 0,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'firebase_event_in_app_purchase',
        dimensions: null,
        measures: [
          {
            name: 'revenue',
            modelName: 'firebase_event_in_app_purchase',
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
        limit: 5000,
        filters: null,
        orders: null,
      },
    },
    {
      name: 'Total Sales (New Users)',
      x: 4,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'firebase_event_in_app_purchase',
        dimensions: null,
        measures: [
          {
            name: 'revenue_from_new_users',
            modelName: 'firebase_event_in_app_purchase',
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
        limit: 5000,
        filters: null,
        orders: null,
      },
    },
    {
      name: 'Purchases HOD',
      ttl: 'PT24H',
      x: 3,
      y: 1,
      h: 2,
      w: 3,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'firebase_event_in_app_purchase',
        dimensions: [
          {
            name: 'event_timestamp',
            modelName: 'firebase_event_in_app_purchase',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'hourOfDay',
            },
            pivot: null,
          },
        ],
        measures: [
          {
            name: 'all_users',
            modelName: 'firebase_event_in_app_purchase',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'bar',
            showLabels: true,
            showLegend: false,
            interactive: true,
            columnOptions: [],
          },
          tableOptions: {
            columnOptions: [],
          },
          columnOptions: null,
        },
        defaultDateRange: 'P14D',
        limit: 5000,
        filters: null,
        orders: null,
      },
    },
    {
      name: 'Daily Purchases',
      ttl: 'PT24H',
      x: 0,
      y: 1,
      h: 2,
      w: 3,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'firebase_event_in_app_purchase',
        dimensions: [
          {
            name: 'event_timestamp',
            modelName: 'firebase_event_in_app_purchase',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'day',
            },
            pivot: null,
          },
          {
            name: 'event__product_id',
            modelName: 'firebase_event_in_app_purchase',
            relationName: null,
            postOperation: null,
            pivot: true,
          },
        ],
        measures: [
          {
            name: 'all_users',
            modelName: 'firebase_event_in_app_purchase',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'area',
            showLabels: true,
            showLegend: true,
            interactive: true,
            columnOptions: [],
          },
          tableOptions: {
            columnOptions: [],
          },
          columnOptions: null,
        },
        defaultDateRange: 'P14D',
        limit: 5000,
        filters: null,
        orders: null,
      },
    },
  ],
}
