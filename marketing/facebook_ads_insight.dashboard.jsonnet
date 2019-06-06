{
  name: 'Facebook Ads',
  variables: {
    dateRange: {
      type: 'dateRange',
      defaultValue: 'P5Y',
    },
  },
  reports: [
    {
      name: 'Impressions by campaign',
      description: '',
      ttl: 'PT1H',
      x: 0,
      y: 1,
      h: 2,
      w: 2,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        datasets: [
          {
            collection: 'rakam_facebook_ads_insights',
            filter: {
              value: [],
              type: 'simple',
            },
            tableType: 1,
          },
        ],
        dimensions: [
          {
            type: 'column',
            value: {
              column: 'campaign',
            },
            isPivot: false,
          },
        ],
        measures: [
          {
            collection: {
              tableName: 'rakam_facebook_ads_insights',
              tableType: 1,
            },
            label: 'Total Impressions',
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'bar',
            barmode: 'group',
            orientation: 'h',
            columnOptions: [
              {
                dash: 'solid',
                shape: 'linear',
              },
              {
                dash: 'solid',
                shape: 'linear',
              },
            ],
          },
          tableOptions: {
            columnOptions: [
              {
                hide: false,
                enableFilter: false,
              },
              {
                hide: false,
                enableFilter: false,
              },
            ],
          },
        },
        defaultDateRange: 'P14D',
      },
      variableOptions: {
        dateRange: {
          type: 'dynamic',
          value: 'dateRange',
        },
      },
    },
    {
      name: 'Spent vs Acquired Users',
      description: '',
      ttl: 'PT1H',
      x: 0,
      y: 3,
      h: 2,
      w: 6,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        datasets: [
          {
            collection: 'pages',
            filter: {
              value: [],
              type: 'simple',
            },
            tableType: 0,
          },
        ],
        dimensions: [
          {
            type: 'column',
            value: {
              column: 'timestamp',
              postOperation: {
                type: 'timestamp',
                value: 'day',
              },
            },
            isPivot: false,
          },
        ],
        measures: [
          {
            collection: {
              tableName: 'rakam_segment_web_sessions',
              tableType: 1,
            },
            label: 'Distinct Users',
          },
          {
            collection: {
              tableName: 'rakam_ad_insights',
              tableType: 1,
            },
            label: 'Total Spent',
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'line',
            columnOptions: [
              {
                dash: 'solid',
                shape: 'linear',
              },
              {
                dash: 'solid',
                shape: 'linear',
              },
              {
                dash: 'solid',
                shape: 'linear',
              },
            ],
          },
          tableOptions: {
            columnOptions: [
              {},
              {},
              {},
            ],
          },
        },
        defaultDateRange: 'P14D',
      },
      variableOptions: {
        dateRange: {
          type: 'dynamic',
          value: 'dateRange',
        },
      },
    },
    {
      name: 'Spent by campaign',
      description: '',
      ttl: 'PT1H',
      x: 2,
      y: 1,
      h: 2,
      w: 2,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        datasets: [
          {
            collection: 'rakam_facebook_ads_insights',
            filter: {
              value: [],
              type: 'simple',
            },
            tableType: 1,
          },
        ],
        dimensions: [
          {
            type: 'column',
            value: {
              column: 'campaign',
            },
            isPivot: false,
          },
        ],
        measures: [
          {
            collection: {
              tableName: 'rakam_facebook_ads_insights',
              tableType: 1,
            },
            label: 'Total Spent',
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'bar',
            barmode: 'group',
            orientation: 'h',
            columnOptions: [
              {
                dash: 'solid',
                shape: 'linear',
              },
              {
                dash: 'solid',
                shape: 'linear',
              },
            ],
          },
          tableOptions: {
            columnOptions: [
              {
                hide: false,
                enableFilter: false,
              },
              {
                hide: false,
                enableFilter: false,
              },
            ],
          },
        },
        defaultDateRange: 'P14D',
      },
      variableOptions: {
        dateRange: {
          type: 'dynamic',
          value: 'dateRange',
        },
      },
    },
    {
      name: 'Click Through Rate',
      description: '',
      ttl: 'PT1H',
      x: 4,
      y: 0,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        datasets: [
          {
            collection: 'rakam_facebook_ads_insights',
            filter: {
              value: [],
              type: 'simple',
            },
            tableType: 1,
          },
        ],
        dimensions: [],
        measures: [
          {
            collection: {
              tableName: 'rakam_facebook_ads_insights',
              tableType: 1,
            },
            label: 'Click Through Rate',
          },
        ],
        defaultDateRange: 'P14D',
      },
      variableOptions: {
        dateRange: {
          type: 'dynamic',
          value: 'dateRange',
        },
      },
    },
    {
      name: 'Total Impressions',
      description: '',
      ttl: 'PT1H',
      x: 0,
      y: 0,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        datasets: [
          {
            collection: 'rakam_facebook_ads_insights',
            filter: {
              value: [],
              type: 'simple',
            },
            tableType: 1,
          },
        ],
        dimensions: [],
        measures: [
          {
            collection: {
              tableName: 'rakam_facebook_ads_insights',
              tableType: 1,
            },
            label: 'Total Impressions',
          },
        ],
        defaultDateRange: 'P14D',
      },
      variableOptions: {
        dateRange: {
          type: 'dynamic',
          value: 'dateRange',
        },
      },
    },
    {
      name: 'Total Reach',
      description: '',
      ttl: 'PT1H',
      x: 2,
      y: 0,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        datasets: [
          {
            collection: 'rakam_facebook_ads_insights',
            filter: {
              value: [],
              type: 'simple',
            },
            tableType: 1,
          },
        ],
        dimensions: [],
        measures: [
          {
            collection: {
              tableName: 'rakam_facebook_ads_insights',
              tableType: 1,
            },
            label: 'Total Reach',
          },
        ],
        defaultDateRange: 'P14D',
      },
      variableOptions: {
        dateRange: {
          type: 'dynamic',
          value: 'dateRange',
        },
      },
    },
    {
      name: 'Average Frequency',
      description: '',
      ttl: 'PT1H',
      x: 5,
      y: 0,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        datasets: [
          {
            collection: 'rakam_facebook_ads_insights',
            filter: {
              value: [],
              type: 'simple',
            },
            tableType: 1,
          },
        ],
        dimensions: [],
        measures: [
          {
            collection: {
              tableName: 'rakam_facebook_ads_insights',
              tableType: 1,
            },
            label: 'Average Frequency',
          },
        ],
        defaultDateRange: 'P14D',
      },
      variableOptions: {
        dateRange: {
          type: 'dynamic',
          value: 'dateRange',
        },
      },
    },
    {
      name: 'Total Spent',
      description: '',
      ttl: 'PT1H',
      x: 1,
      y: 0,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        datasets: [
          {
            collection: 'rakam_facebook_ads_insights',
            filter: {
              value: [],
              type: 'simple',
            },
            tableType: 1,
          },
        ],
        dimensions: [],
        measures: [
          {
            collection: {
              tableName: 'rakam_facebook_ads_insights',
              tableType: 1,
            },
            label: 'Total Spent',
          },
        ],
        defaultDateRange: 'P14D',
      },
      variableOptions: {
        dateRange: {
          type: 'dynamic',
          value: 'dateRange',
        },
      },
    },
    {
      name: 'Total Clicks',
      description: '',
      ttl: 'PT1H',
      x: 3,
      y: 0,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        datasets: [
          {
            collection: 'rakam_facebook_ads_insights',
            filter: {
              value: [],
              type: 'simple',
            },
            tableType: 1,
          },
        ],
        dimensions: [],
        measures: [
          {
            collection: {
              tableName: 'rakam_facebook_ads_insights',
              tableType: 1,
            },
            label: 'Total Clicks',
          },
        ],
        defaultDateRange: 'P14D',
      },
      variableOptions: {
        dateRange: {
          type: 'dynamic',
          value: 'dateRange',
        },
      },
    },
    {
      name: 'Reach / Spent by campaign',
      description: '',
      ttl: 'PT1H',
      x: 4,
      y: 1,
      h: 2,
      w: 2,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        datasets: [
          {
            collection: 'rakam_facebook_ads_insights',
            filter: {
              value: [],
              type: 'simple',
            },
            tableType: 1,
          },
        ],
        dimensions: [
          {
            type: 'column',
            value: {
              column: 'campaign',
            },
            isPivot: false,
          },
        ],
        measures: [
          {
            collection: {
              tableName: 'rakam_facebook_ads_insights',
              tableType: 1,
            },
            label: 'Total Spent',
          },
          {
            collection: {
              tableName: 'rakam_facebook_ads_insights',
              tableType: 1,
            },
            label: 'Total Reach',
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'bar',
            barmode: 'stack',
            showLabels: false,
            showLegend: false,
            interactive: false,
            orientation: 'h',
            columnOptions: [
              {
                dash: 'solid',
                hide: false,
                shape: 'linear',
              },
              {
                dash: 'solid',
                hide: false,
                shape: 'linear',
              },
              {
                dash: 'solid',
                hide: false,
                shape: 'linear',
              },
            ],
          },
        },
        defaultDateRange: 'P14D',
      },
      variableOptions: {
        dateRange: {
          type: 'dynamic',
          value: 'dateRange',
        },
      },
    },
  ],
}
