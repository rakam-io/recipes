{
  name: 'Website Analytics',
  variables: {
    dateRange: {
      type: 'dateRange',
      defaultValue: 'P5Y',
    },
  },
  reports: [
    {
      name: 'Total Pageviews',
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
            collection: 'pages',
            filter: {
              value: [],
              type: 'simple',
            },
            tableType: 0,
          },
        ],
        dimensions: [],
        measures: [
          {
            collection: {
              tableName: 'pages',
              tableType: 0,
            },
            label: 'Total Pageviews',
          },
        ],
        reportOptions: null,
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
      name: 'Total Sessions',
      description: '',
      x: 2,
      y: 0,
      h: 1,
      w: 1,
      component: 'r-number',
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
        dimensions: [],
        measures: [
          {
            collection: null,
            label: 'Total Events',
          },
        ],
        reportOptions: null,
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
      name: 'Total Users',
      description: '',
      x: 1,
      y: 0,
      h: 1,
      w: 1,
      component: 'r-number',
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
        dimensions: [],
        measures: [
          {
            collection: {
              tableName: 'rakam_segment_web_sessions',
              tableType: 1,
            },

            label: 'Unique users',
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
      name: 'Sessions / Users',
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
              joinCollection: null,
              column: 'timestamp',
              postOperation: ['day'],
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
              tableName: 'rakam_segment_web_sessions',
              tableType: 1,
            },
            label: 'Total Sessions',
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'line',
            showLabels: null,
            showLegend: null,
            interactive: null,
            columnOptions: [
              {
                dash: 'solid',
                fill: null,
                hide: null,
                type: null,
                shape: 'linear',
                yAxis: null,
              },
              {
                dash: 'solid',
                fill: null,
                hide: null,
                type: null,
                shape: 'linear',
                yAxis: null,
              },
              {
                dash: 'solid',
                fill: null,
                hide: null,
                type: null,
                shape: 'linear',
                yAxis: null,
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
      name: 'Average Duration',
      description: '',
      ttl: 'PT1H',
      x: 4,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
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
        dimensions: [],
        measures: [
          {
            collection: {
              tableName: 'rakam_segment_web_sessions',
              tableType: 1,
            },
            label: 'Average Duration',
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
      name: 'Average Session Per User',
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
            collection: 'pages',
            filter: {
              value: [],
              type: 'simple',
            },
            tableType: 0,
          },
        ],
        dimensions: [],
        measures: [
          {
            collection: {
              tableName: 'rakam_segment_web_sessions',
              tableType: 1,
            },
            label: 'Average Session Per User',
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
      name: 'Daily Session Count / Bounce Analysis',
      description: '',
      ttl: 'PT1H',
      x: 0,
      y: 3,
      h: 2,
      w: 4,
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
              joinCollection: {
                tableName: 'rakam_segment_web_sessions',
                tableType: 1,
              },
              column: 'session_start_tstamp',
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
            label: 'Total Sessions',
          },
          {
            collection: {
              tableName: 'rakam_segment_web_sessions',
              tableType: 1,
            },
            label: 'Returning Sessions',
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'area',
            showLabels: null,
            showLegend: null,
            interactive: null,
          },
          tableOptions: {
            columnOptions: [
              {
                hide: false,
                statistics: null,
                enableFilter: false,
              },
              {
                hide: false,
                statistics: null,
                enableFilter: false,
              },
              {
                hide: false,
                statistics: null,
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
      name: 'Bounced Sessions',
      description: '',
      ttl: 'PT1H',
      x: 4,
      y: 3,
      h: 2,
      w: 2,
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
        dimensions: [],
        measures: [
          {
            collection: {
              tableName: 'rakam_segment_web_sessions',
              tableType: 1,
            },
            label: 'New Sessions',
          },
          {
            collection: {
              tableName: 'rakam_segment_web_sessions',
              tableType: 1,
            },
            label: 'Total Sessions',
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'pie',
            showLabels: null,
            showLegend: null,
            columnOptions: [
              {},
              {},
            ],
            showPercentage: true,
            showLabelOutside: null,
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
      name: 'Daily Sessions / Users',
      description: '',
      ttl: 'PT1H',
      x: 0,
      y: 1,
      h: 2,
      w: 4,
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
              joinCollection: {
                tableName: 'rakam_segment_web_sessions',
                tableType: 1,
              },
              column: 'session_start_tstamp',
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
              tableName: 'rakam_segment_web_sessions',
              tableType: 1,
            },
            label: 'Total Sessions',
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'area',
            showLabels: null,
            showLegend: null,
            interactive: null,
            columnOptions: [
              {
                dash: 'solid',
                fill: null,
                hide: null,
                type: null,
                shape: 'linear',
                yAxis: null,
              },
              {
                dash: 'solid',
                fill: null,
                hide: null,
                type: null,
                shape: 'linear',
                yAxis: null,
              },
              {
                dash: 'solid',
                fill: null,
                hide: false,
                type: null,
                shape: 'linear',
                yAxis: null,
              },
            ],
          },
          tableOptions: {
            columnOptions: [
              {
                hide: null,
                statistics: null,
                enableFilter: null,
              },
              {
                hide: null,
                statistics: null,
                enableFilter: null,
              },
              {
                hide: false,
                statistics: null,
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
  ],
}
