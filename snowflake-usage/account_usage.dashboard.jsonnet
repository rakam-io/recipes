{
  name: 'Snowflake Account Usage',
  filterSchema: [
    {
      name: 'Date',
      type: 'mappingDimension',
      value: {
        name: 'eventTimestamp',
      },
      defaultValue: 'P1W',
      isRequired: true,
    },
  ],
  reports: [
    {
      name: 'Snowflake Snowpipe Daily Cost',
      ttl: 'PT24H',
      x: 3,
      y: 1,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'snowflake_pipe_usage',
        dimensions: [
          {
            name: 'start_time',
            modelName: 'snowflake_pipe_usage',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'day',
            },
          },
        ],
        measures: [
          {
            name: 'total_credits_used_usd',
            modelName: 'snowflake_pipe_usage',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'area',
            showLabels: true,
            showLegend: true,
            interactive: true,
            columnOptions: [],
          },
          tableOptions: {
            columnOptions: [],
          },
          columnOptions: null,
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: [],
        orders: null,
      },
    },
    {
      name: 'Snowflake Pipe Daily Usage',
      ttl: 'PT24H',
      x: 0,
      y: 3,
      h: 2,
      w: 6,
      component: 'r-segmentation-table',
      type: 1,
      reportOptions: {
        modelName: 'snowflake_pipe_usage',
        dimensions: [
          {
            name: 'end_time',
            modelName: 'snowflake_pipe_usage',
            relationName: null,
            postOperation: {
              type: 'timestamp',
              value: 'day',
            },
          },
        ],
        measures: [
          {
            name: 'total_bytes_inserted',
            modelName: 'snowflake_pipe_usage',
            relationName: null,
          },
          {
            name: 'total_files_inserted',
            modelName: 'snowflake_pipe_usage',
            relationName: null,
          },
          {
            name: 'total_credits_used_usd',
            modelName: 'snowflake_pipe_usage',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'area',
            showLabels: true,
            showLegend: true,
            interactive: true,
            columnOptions: [],
          },
          tableOptions: {
            columnOptions: [],
          },
          columnOptions: null,
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: [],
        orders: null,
      },
    },
    {
      name: 'Snowflake Billable Storage TB',
      ttl: 'PT24H',
      x: 4,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 1,
      reportOptions: {
        modelName: 'snowflake_storage_metrics',
        dimensions: [],
        measures: [
          {
            name: 'billable_tb',
            modelName: 'snowflake_storage_metrics',
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
        filters: [],
        orders: null,
      },
    },
  ],
}
