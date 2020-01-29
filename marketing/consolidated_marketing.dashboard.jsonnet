{
  name: 'Marketing Overview',
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
      name: 'Overall Cost per Click',
      ttl: 'PT1H',
      x: 5,
      y: 0,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'consolidated_marketing',
        dimensions: [],
        measures: [
          {
            name: 'average_cost_per_click',
            modelName: 'consolidated_marketing',
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
      name: 'Total Campaigns',
      ttl: 'PT1H',
      x: 4,
      y: 1,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'consolidated_marketing',
        dimensions: [],
        measures: [
          {
            name: 'total_campaigns',
            modelName: 'consolidated_marketing',
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
      name: 'Total Clicks',
      ttl: 'PT1H',
      x: 1,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'consolidated_marketing',
        dimensions: [],
        measures: [
          {
            name: 'total_clicks',
            modelName: 'consolidated_marketing',
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
      name: 'Total Ads',
      ttl: 'PT1H',
      x: 5,
      y: 1,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'consolidated_marketing',
        dimensions: [],
        measures: [
          {
            name: 'total_ads',
            modelName: 'consolidated_marketing',
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
      name: 'Cost Breakdown',
      ttl: 'PT1H',
      x: 2,
      y: 2,
      h: 2,
      w: 2,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'consolidated_marketing',
        dimensions: [{ modelName: 'consolidated_marketing', relationName: null, postOperation: null, name: 'date' }],
        measures: [
          {
            name: 'total_cost',
            modelName: 'consolidated_marketing',
            relationName: null,
          },
        ],
        reportOptions: { chartOptions: { columnOptions: [], type: 'line' }, tableOptions: { columnOptions: [] } },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null,
      },
    },
    {
      name: 'ROAS Breakdown',
      ttl: 'PT1H',
      x: 0,
      y: 3,
      h: 2,
      w: 2,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'consolidated_marketing',
        dimensions: [{ modelName: 'consolidated_marketing', relationName: null, postOperation: null, name: 'date' }],
        measures: [
          {
            name: 'total_cost',
            modelName: 'consolidated_marketing',
            relationName: null,
          },
        ],
        defaultDateRange: 'P14D',
        limit: 1000,
        reportOptions: { chartOptions: { columnOptions: [], type: 'line' }, tableOptions: { columnOptions: [] } },
        filters: null,
      },
    },
    {
      name: 'Conversion Breakdown',
      ttl: 'PT1H',
      x: 4,
      y: 2,
      h: 2,
      w: 2,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'consolidated_marketing',
        dimensions: [{ modelName: 'consolidated_marketing', relationName: null, postOperation: null, name: 'date' }],
        measures: [
          {
            name: 'total_cost',
            modelName: 'consolidated_marketing',
            relationName: null,
          },
        ],
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null,
        reportOptions: { chartOptions: { columnOptions: [], type: 'line' }, tableOptions: { columnOptions: [] } },
      },
    },
    {
      name: 'Total Spend',
      ttl: 'PT1H',
      x: 0,
      y: 0,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'consolidated_marketing',
        dimensions: [],
        measures: [
          {
            name: 'total_cost',
            modelName: 'consolidated_marketing',
            relationName: null,
          },
        ],
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null,
      },
    },
    {
      name: 'Overall Conversion Rate',
      ttl: 'PT1H',
      x: 0,
      y: 2,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'consolidated_marketing',
        dimensions: [],
        measures: [
          {
            name: 'average_conversion_rate',
            modelName: 'consolidated_marketing',
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
      name: 'Total Impressions',
      ttl: 'PT1H',
      x: 3,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'consolidated_marketing',
        dimensions: [],
        measures: [
          {
            name: 'total_impressions',
            modelName: 'consolidated_marketing',
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
      name: 'Overall ROAS',
      ttl: 'PT1H',
      x: 2,
      y: 1,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'consolidated_marketing',
        dimensions: [],
        measures: [
          {
            name: 'average_value_per_cost',
            modelName: 'consolidated_marketing',
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
  ],
}
