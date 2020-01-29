{
  name: 'User Detail',
  category: 'Segment Users',
  filterSchema: [
    {
      name: 'Date',
      type: 'mappingDimension',
      value: {
        name: 'eventTimestamp',
      },
      defaultValue: 'P1Y',
      isRequired: true,
    },
    {
      name: 'User',
      type: 'mappingDimension',
      value: {
        name: 'userId',
      },
      defaultValue: ['NJKJ0HU20P'],
      isRequired: true,
    },
  ],
  reports: [
    {
      name: 'Events By Day',
      ttl: 'PT1H',
      x: 0,
      y: 0,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'tracks',
        dimensions: [
          {
            name: 'received_at',
            modelName: 'tracks',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'day',
            },
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
        reportOptions: null,
        defaultDateRange: 'P14D',
        limit: 1000,
      },
    },
    {
      name: 'New segmentation',
      ttl: 'PT1H',
      x: 0,
      y: 2,
      h: 2,
      w: 6,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'segment_users',
        dimensions: [
          {
            name: 'context_device_type',
            modelName: 'segment_users',
            relationName: null,
            postOperation: null,
            pivot: false,
          },
          {
            name: 'context_network_wifi',
            modelName: 'segment_users',
            relationName: null,
            postOperation: null,
            pivot: false,
          },
          {
            name: 'context_device_model',
            modelName: 'segment_users',
            relationName: null,
            postOperation: null,
            pivot: false,
          },
          {
            name: 'last_update',
            modelName: 'segment_users',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'hour',
            },
            pivot: false,
          },
        ],
        measures: [],
        reportOptions: null,
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: [
          {
            type: 'metricFilter',
            value: {
              metricType: 'dimension',
              metricValue: {
                name: 'user_id',
                modelName: 'segment_users',
                relationName: null,
                postOperation: null,
                pivot: null,
              },
              filters: [
                {
                  valueType: 'string',
                  operator: 'equals',
                  value: 'ahmet',
                },
              ],
            },
          },
        ],
      },
    },
    {
      name: 'Event Distribution',
      ttl: 'PT1H',
      x: 3,
      y: 0,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'tracks',
        dimensions: [
          {
            name: 'event_text',
            modelName: 'tracks',
            relationName: null,
            postOperation: null,
            pivot: null,
          },
        ],
        measures: [
          {
            name: 'total_events',
            modelName: 'tracks',
            relationName: null,
          },
        ],
        reportOptions: null,
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: [
          {
            type: 'metricFilter',
            value: {
              metricType: 'dimension',
              metricValue: {
                name: 'user_id',
                modelName: 'tracks',
                relationName: null,
                postOperation: null,
                pivot: null,
              },
              filters: [
                {
                  valueType: 'string',
                  operator: 'equals',
                  value: 'fsdf',
                },
              ],
            },
          },
        ],
      },
    },
  ],
}
