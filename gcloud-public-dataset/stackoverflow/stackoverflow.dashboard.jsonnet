{
  name: 'Stackoverflow',
  filterSchema: [
    {
      name: 'Date',
      type: 'mappingDimension',
      value: {
        name: 'eventTimestamp'
      },
      defaultValue: 'P14D',
      isRequired: true
    }
  ],
  reports: [
    {
      name: 'Not Ansered Questions (Q)',
      ttl: 'PT24H',
      x: 0,
      y: 4,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'so_posts_questions',
        dimensions: [
          {
            name: 'creation_date',
            modelName: 'so_posts_questions',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'year'
            },
            pivot: false
          }
        ],
        measures: [
          {
            name: 'count_all_rows',
            modelName: 'so_posts_questions',
            relationName: null
          }
        ],
        reportOptions: {
          chartOptions: {
            type: 'line',
            columnOptions: []
          },
          tableOptions: {
            columnOptions: []
          },
          columnOptions: null
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: [
          {
            type: 'metricFilter',
            value: {
              metricType: 'dimension',
              metricValue: {
                name: 'Accepted_Answer',
                modelName: 'so_posts_questions',
                relationName: null,
                postOperation: null,
                pivot: null
              },
              filters: [
                {
                  valueType: 'unknown',
                  operator: 'isNotSet',
                  value: null
                }
              ]
            }
          }
        ]
      }
    },
    {
      name: 'Question Stats',
      ttl: 'PT24H',
      x: 3,
      y: 6,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'so_posts_questions',
        dimensions: [
          {
            name: 'creation_date',
            modelName: 'so_posts_questions',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'year'
            },
            pivot: false
          }
        ],
        measures: [
          {
            name: 'count_all_rows',
            modelName: 'so_posts_questions',
            relationName: null
          },
          {
            name: 'Total_Answer',
            modelName: 'so_posts_questions',
            relationName: null
          },
          {
            name: 'Total_Accepted_Answer',
            modelName: 'so_posts_questions',
            relationName: null
          },
          {
            name: 'Total_Comment',
            modelName: 'so_posts_questions',
            relationName: null
          }
        ],
        reportOptions: {
          chartOptions: {
            type: 'bar',
            showLabels: true,
            showLegend: true,
            columnOptions: []
          },
          tableOptions: {
            columnOptions: []
          },
          columnOptions: null
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null
      }
    },
    {
      name: 'Total Questions by Year',
      ttl: 'PT24H',
      x: 3,
      y: 0,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'so_posts_questions',
        dimensions: [
          {
            name: 'creation_date',
            modelName: 'so_posts_questions',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'year'
            },
            pivot: false
          }
        ],
        measures: [
          {
            name: 'Total_Questions',
            modelName: 'so_posts_questions',
            relationName: null
          }
        ],
        reportOptions: {
          chartOptions: {
            type: 'line',
            showLabels: true,
            showLegend: true,
            columnOptions: []
          },
          tableOptions: {
            columnOptions: []
          },
          columnOptions: null
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null
      }
    },
    {
      name: 'Total Posts by Year',
      ttl: 'PT24H',
      x: 3,
      y: 4,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'so_stackoverflow_posts',
        dimensions: [
          {
            name: 'creation_date',
            modelName: 'so_stackoverflow_posts',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'year'
            },
            pivot: false
          }
        ],
        measures: [
          {
            name: 'Total_Post',
            modelName: 'so_stackoverflow_posts',
            relationName: null
          }
        ],
        reportOptions: {
          chartOptions: {
            type: 'line',
            showLabels: true,
            showLegend: true,
            columnOptions: []
          },
          tableOptions: {
            columnOptions: []
          },
          columnOptions: null
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null
      }
    },
    {
      name: 'Question Views',
      ttl: 'PT24H',
      x: 0,
      y: 6,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'so_posts_questions',
        dimensions: [
          {
            name: 'last_activity_date',
            modelName: 'so_posts_questions',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'year'
            },
            pivot: null
          }
        ],
        measures: [
          {
            name: 'Total_View',
            modelName: 'so_posts_questions',
            relationName: null
          }
        ],
        reportOptions: {
          chartOptions: {
            type: 'line',
            showLabels: true,
            showLegend: true,
            columnOptions: []
          },
          tableOptions: {
            columnOptions: []
          },
          columnOptions: null
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null
      }
    },
    {
      name: 'Post Views',
      ttl: 'PT24H',
      x: 3,
      y: 2,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'so_stackoverflow_posts',
        dimensions: [
          {
            name: 'last_activity_date',
            modelName: 'so_stackoverflow_posts',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'year'
            },
            pivot: false
          }
        ],
        measures: [
          {
            name: 'Total_View',
            modelName: 'so_stackoverflow_posts',
            relationName: null
          }
        ],
        reportOptions: {
          chartOptions: {
            type: 'line',
            showLabels: true,
            showLegend: true,
            columnOptions: []
          },
          tableOptions: {
            columnOptions: []
          },
          columnOptions: null
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null
      }
    },
    {
      name: 'Avg Answer & Comment',
      ttl: 'PT24H',
      x: 0,
      y: 0,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'so_posts_questions',
        dimensions: [
          {
            name: 'last_activity_date',
            modelName: 'so_posts_questions',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'year'
            },
            pivot: null
          }
        ],
        measures: [
          {
            name: 'Average_Answers',
            modelName: 'so_posts_questions',
            relationName: null
          },
          {
            name: 'Average_Comments',
            modelName: 'so_posts_questions',
            relationName: null
          }
        ],
        reportOptions: {
          chartOptions: {
            type: 'line',
            showLabels: true,
            showLegend: true,
            columnOptions: []
          },
          tableOptions: {
            columnOptions: []
          },
          columnOptions: null
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null
      }
    },
    {
      name: 'Answering Ratio by Years',
      ttl: 'PT24H',
      x: 0,
      y: 2,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'so_stackoverflow_posts',
        dimensions: [
          {
            name: 'creation_date',
            modelName: 'so_stackoverflow_posts',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'year'
            },
            pivot: false
          }
        ],
        measures: [
          {
            name: 'Total_Accepted_Answer',
            modelName: 'so_stackoverflow_posts',
            relationName: null
          },
          {
            name: 'Total_Post',
            modelName: 'so_stackoverflow_posts',
            relationName: null
          }
        ],
        reportOptions: {
          chartOptions: {
            type: 'line',
            showLabels: true,
            showLegend: true,
            columnOptions: []
          },
          tableOptions: {
            columnOptions: []
          },
          columnOptions: null
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null
      }
    }
  ]
}