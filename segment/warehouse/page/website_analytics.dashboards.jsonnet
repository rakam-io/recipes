if std.extVar('pages_target') != null then [{
  name: 'Website Overview',
  category: 'Segment Events',
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
      name: 'Sessions',
      x: 1,
      y: 0,
      h: 1,
      w: 5,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'segment_rakam_pageview_sessions',
        dimensions: null,
        measures: [
          {
            name: 'users',
            modelName: 'segment_rakam_pageview_sessions',
            relationName: null,
          },
          {
            name: 'new_sessions',
            modelName: 'segment_rakam_pageview_sessions',
            relationName: null,
          },
          {
            name: 'returning_sessions',
            modelName: 'segment_rakam_pageview_sessions',
            relationName: null,
          },
          {
            name: 'sessions',
            modelName: 'segment_rakam_pageview_sessions',
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
      name: 'Pageviews By Day',
      x: 0,
      y: 2,
      h: 2,
      w: 6,
      component: 'r-chart',
      type: 1,
      reportOptions: {
        modelName: 'segment_pages',
        dimensions: [
          {
            name: 'timestamp',
            modelName: 'segment_pages',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'day',
            },
            pivot: null,
          },
        ],
        measures: [
          {
            name: 'pageviews',
            modelName: 'segment_pages',
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
      name: 'Total Pageviews',
      x: 0,
      y: 0,
      h: 1,
      w: 1,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'segment_pages',
        dimensions: null,
        measures: [
          {
            name: 'pageviews',
            modelName: 'segment_pages',
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
      name: 'User Behaviour',
      x: 0,
      y: 1,
      h: 1,
      w: 6,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'segment_rakam_pageview_sessions',
        dimensions: null,
        measures: [
          {
            name: 'average_session_count_per_user',
            modelName: 'segment_rakam_pageview_sessions',
            relationName: null,
          },
          {
            name: 'pages_per_session',
            modelName: 'segment_rakam_pageview_sessions',
            relationName: null,
          },
          {
            name: 'average_duration',
            modelName: 'segment_rakam_pageview_sessions',
            relationName: null,
          },
          {
            name: 'bounce_rate',
            modelName: 'segment_rakam_pageview_sessions',
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
  ],
}] else []
