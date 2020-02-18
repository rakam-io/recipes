{
  name: 'Facebook Ads',
  category: 'Marketing',
  filterSchema: [
    {
      name: 'dateRange',
      type: 'dimension',
      value: {
        model: 'facebook_ad_sets',
        dimension: 'end_time',
      },
      defaultValue: 'P14D',
      isRequired: true,
    },
  ],
  reports: [
    {
      name: 'Average Frequency',
      ttl: 'PT1H',
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'facebook_insights',
        dimensions: [],
        measures: [
          {
            name: 'frequency',
            modelName: 'facebook_insights',
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
      name: 'Total Impressions',
      ttl: 'PT1H',
      x: 2,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'facebook_insights',
        dimensions: [],
        measures: [
          {
            name: 'impressions',
            modelName: 'facebook_insights',
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
      name: 'Campaign Performance',
      ttl: 'PT1H',
      x: 0,
      y: 2,
      h: 1,
      w: 6,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'facebook_insights',
        dimensions: [
          {
            name: 'name',
            modelName: 'facebook_campaigns',
            relationName: 'facebook_campaigns',
            postOperation: null,
            pivot: null,
          },
        ],
        measures: [
          {
            name: 'total_spend',
            modelName: 'facebook_insights',
            relationName: null,
          },
          {
            name: 'clicks',
            modelName: 'facebook_insights',
            relationName: null,
          },
          {
            name: 'impressions',
            modelName: 'facebook_insights',
            relationName: null,
          },
          {
            name: 'click_through_rate',
            modelName: 'facebook_insights',
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
        filters: [
          {
            type: 'metricFilter',
            value: {
              metricType: 'dimension',
              metricValue: {
                name: 'is_active',
                modelName: 'facebook_ads',
                relationName: 'facebook_ads',
                postOperation: null,
                pivot: null,
              },
              filters: [
                {
                  valueType: 'boolean',
                  operator: 'is',
                  value: true,
                },
              ],
            },
          },
        ],
      },
    },
    {
      name: 'Total Spend',
      ttl: 'PT1H',
      x: 0,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'facebook_insights',
        dimensions: [],
        measures: [
          {
            name: 'total_spend',
            modelName: 'facebook_insights',
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
      name: 'Total Clicks',
      ttl: 'PT1H',
      x: 2,
      y: 1,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'facebook_insights',
        dimensions: [],
        measures: [
          {
            name: 'clicks',
            modelName: 'facebook_insights',
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
      name: 'Total Reach',
      ttl: 'PT1H',
      x: 0,
      y: 1,
      h: 1,
      w: 4,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'facebook_insights',
        dimensions: [],
        measures: [
          {
            name: 'reach',
            modelName: 'facebook_insights',
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
      name: 'Click Through Rate',
      ttl: 'PT1H',
      x: 4,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'facebook_insights',
        dimensions: [],
        measures: [
          {
            name: 'click_through_rate',
            modelName: 'facebook_insights',
            relationName: null,
          },
        ],
        reportOptions: null,
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null,
      },
    },
    {
      name: 'Impressions by campaign type',
      ttl: 'PT1H',
      x: 4,
      y: 2,
      h: 2,
      w: 2,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'facebook_insights',
        dimensions: [
          {
            name: 'buying_type',
            modelName: 'facebook_campaigns',
            relationName: 'facebook_campaigns',
            postOperation: null,
          },
        ],
        measures: [
          {
            name: 'impressions',
            modelName: 'facebook_insights',
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
        limit: 1000,
        filters: null,
      },
    },
  ],
}
