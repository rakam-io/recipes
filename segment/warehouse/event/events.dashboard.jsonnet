{
  name: 'Events Overview',
  filterSchema: [
    {
      name: 'Date',
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
        modelName: 'tracks',
        filter: null,
        dimensions: [
          {
            name: 'event_text',
            modelName: 'tracks',
            relationName: null,
            postOperation: null,
            pivot: false,
          },
        ],
        measures: [
          {
            name: 'context_app_version',
            modelName: 'tracks',
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
        modelName: 'tracks',
        filter: null,
        dimensions: [
          {
            name: 'event_text',
            modelName: 'tracks',
            relationName: null,
            postOperation: null,
            pivot: false,
          },
        ],
        measures: [
          {
            name: 'total_events',
            modelName: 'tracks',
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
        modelName: 'tracks',
        filter: null,
        dimensions: [
          {
            name: 'event_text',
            modelName: 'tracks',
            relationName: null,
            postOperation: null,
            pivot: false,
          },
        ],
        measures: [
          {
            name: 'unique_users',
            modelName: 'tracks',
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
        modelName: 'tracks',
        filter: null,
        dimensions: [],
        measures: [
          {
            name: 'total_events',
            modelName: 'tracks',
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
        modelName: 'tracks',
        filter: null,
        dimensions: [],
        measures: [
          {
            name: 'unique_users',
            modelName: 'tracks',
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
        modelName: 'tracks',
        filter: null,
        dimensions: [],
        measures: [
          {
            name: 'unique_devices',
            modelName: 'tracks',
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
