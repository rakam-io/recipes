{
  name: 'Sessions Overview',
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
  ],
  reports: [
    {
      name: 'Totals',
      x: 0,
      y: 0,
      h: 1,
      w: 6,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'ga_sessions',
        dimensions: null,
        measures: [
          {
            name: 'count_of_sessions',
            modelName: 'ga_sessions',
            relationName: null,
          },
          {
            name: 'new_users',
            modelName: 'ga_sessions',
            relationName: null,
          },
          {
            name: 'returning_visitors',
            modelName: 'ga_sessions',
            relationName: null,
          },
          {
            name: 'average_time_on_site_per_session',
            modelName: 'ga_sessions',
            relationName: null,
          },
          {
            name: 'average_pageviews_per_user',
            modelName: 'ga_sessions',
            relationName: null,
          },
          {
            name: 'average_sessions_per_user',
            modelName: 'ga_sessions',
            relationName: null,
          },
          {
            name: 'bounce_rate',
            modelName: 'ga_sessions',
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
      name: 'Revenue Totals',
      x: 0,
      y: 1,
      h: 1,
      w: 6,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'ga_sessions',
        dimensions: null,
        measures: [
          {
            name: 'total_revenue',
            modelName: 'ga_sessions',
            relationName: null,
          },
          {
            name: 'average_revenue_per_transaction',
            modelName: 'ga_sessions',
            relationName: null,
          },
          {
            name: 'average_revenue_per_user',
            modelName: 'ga_sessions',
            relationName: null,
          },
          {
            name: 'average_transactions_per_user',
            modelName: 'ga_sessions',
            relationName: null,
          },
          {
            name: 'total_transactions',
            modelName: 'ga_sessions',
            relationName: null,
          },
          {
            name: 'transaction_conversion_rate',
            modelName: 'ga_sessions',
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
      name: 'Channels',
      x: 4,
      y: 2,
      h: 2,
      w: 2,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'ga_sessions',
        dimensions: [
          {
            name: 'channel',
            modelName: 'ga_sessions',
            relationName: null,
            postOperation: null,
            pivot: null,
          },
        ],
        measures: [
          {
            name: 'count_of_sessions',
            modelName: 'ga_sessions',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'pie',
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
      name: 'Browsers',
      x: 2,
      y: 2,
      h: 2,
      w: 2,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'ga_sessions',
        dimensions: [
          {
            name: 'browser',
            modelName: 'ga_sessions',
            relationName: null,
            postOperation: null,
            pivot: null,
          },
        ],
        measures: [
          {
            name: 'count_of_sessions',
            modelName: 'ga_sessions',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'pie',
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
      name: 'Device Category',
      x: 0,
      y: 2,
      h: 2,
      w: 2,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'ga_sessions',
        dimensions: [
          {
            name: 'device_category',
            modelName: 'ga_sessions',
            relationName: null,
            postOperation: null,
            pivot: null,
          },
        ],
        measures: [
          {
            name: 'count_of_sessions',
            modelName: 'ga_sessions',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'pie',
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
