{
  name: 'Pageview Overview',
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
      h: 2,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'ga_pageviews',
        dimensions: null,
        measures: [
          {
            name: 'total_pageviews',
            modelName: 'ga_pageviews',
            relationName: null,
          },
          {
            name: 'unique_visitors',
            modelName: 'ga_pageviews',
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
      name: 'Pageviews Over Time',
      x: 2,
      y: 2,
      h: 2,
      w: 2,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'ga_pageviews',
        dimensions: [
          {
            name: 'pageview_time',
            modelName: 'ga_pageviews',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'month',
            },
            pivot: null,
          },
        ],
        measures: [
          {
            name: 'total_pageviews',
            modelName: 'ga_pageviews',
            relationName: null,
          },
          {
            name: 'unique_visitors',
            modelName: 'ga_pageviews',
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
        limit: 5000,
        filters: null,
        orders: null,
      },
    },
    {
      name: 'Total E-commerce',
      x: 2,
      y: 0,
      h: 2,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'ga_pageviews',
        dimensions: null,
        measures: [
          {
            name: 'total_item_revenue',
            modelName: 'ga_pageviews',
            relationName: null,
          },
          {
            name: 'product_count',
            modelName: 'ga_pageviews',
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
      name: 'Top Paths',
      x: 4,
      y: 2,
      h: 2,
      w: 2,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'ga_pageviews',
        dimensions: [
          {
            name: 'page_path',
            modelName: 'ga_pageviews',
            relationName: null,
            postOperation: null,
            pivot: null,
          },
        ],
        measures: [
          {
            name: 'total_pageviews',
            modelName: 'ga_pageviews',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'bar',
            orientation: 'h',
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
      name: 'Channel',
      x: 0,
      y: 2,
      h: 2,
      w: 2,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'ga_pageviews',
        dimensions: [
          {
            name: 'data_source',
            modelName: 'ga_pageviews',
            relationName: null,
            postOperation: null,
            pivot: null,
          },
        ],
        measures: [
          {
            name: 'total_pageviews',
            modelName: 'ga_pageviews',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'pie',
            orientation: 'h',
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
      name: 'Total Dpf',
      x: 4,
      y: 0,
      h: 2,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'ga_pageviews',
        dimensions: null,
        measures: [
          {
            name: 'dfp_clicks',
            modelName: 'ga_pageviews',
            relationName: null,
          },
          {
            name: 'dfp_pages_viewed',
            modelName: 'ga_pageviews',
            relationName: null,
          },
          {
            name: 'dfp_revenue_cpc',
            modelName: 'ga_pageviews',
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
  ],
}
