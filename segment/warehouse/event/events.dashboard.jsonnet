{
  name: 'Events Overview',
  category: 'Segment Events',
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
      name: 'Events by Last Seen App Version',
      ttl: 'PT1H',
      x: 0,
      y: 3,
      h: 2,
      w: 6,
      component: 'r-segmentation-table',
      type: 1,
      reportOptions: {
        modelName: 'segment_events',
        dimensions: [
          {
            name: 'event_text',
            modelName: 'segment_events',
            relationName: null,
            postOperation: null,
          },
        ],
        measures: [
          {
            name: 'context_app_version',
            modelName: 'segment_events',
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
      name: 'Top Events',
      ttl: 'PT1H',
      x: 0,
      y: 1,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'segment_events',
        dimensions: [
          {
            name: 'event_text',
            modelName: 'segment_events',
            relationName: null,
            postOperation: null,
          },
        ],
        measures: [
          {
            name: 'total_events',
            modelName: 'segment_events',
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
        limit: 1000,
        filters: null,
      },
    },
    {
      name: 'Top Events by Unique Users',
      ttl: 'PT1H',
      x: 3,
      y: 1,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'segment_events',
        dimensions: [
          {
            name: 'event_text',
            modelName: 'segment_events',
            relationName: null,
            postOperation: null,
          },
        ],
        measures: [
          {
            name: 'unique_users',
            modelName: 'segment_events',
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
        limit: 1000,
        filters: null,
      },
    },
    {
      name: 'Total Events',
      ttl: 'PT1H',
      x: 0,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'segment_events',
        dimensions: [],
        measures: [
          {
            name: 'total_events',
            modelName: 'segment_events',
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
        limit: 1000,
        filters: null,
      },
    },
    {
      name: 'Total Users',
      ttl: 'PT1H',
      x: 2,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'segment_events',
        dimensions: [],
        measures: [
          {
            name: 'unique_users',
            modelName: 'segment_events',
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
        limit: 1000,
        filters: null,
      },
    },
    {
      name: 'Total Devices',
      ttl: 'PT1H',
      x: 4,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'segment_events',
        dimensions: [],
        measures: [
          {
            name: 'unique_devices',
            modelName: 'segment_events',
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
        limit: 1000,
        filters: null,
      },
    },
  ],
}
