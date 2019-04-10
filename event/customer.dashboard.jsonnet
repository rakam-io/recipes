{
  name: 'Customer Data Dashboard',
  variableOptions: { dateRange: { type: 'dateRange', defaultValue: 'P5Y' } },
  reports: [
    {
      name: 'Avg Session Duration',
      description: '',
      ttl: 'PT24H',
      location: [2, 0, 1, 2],
      component: 'r-number',
      report: {
        name: 'Avg Session Duration',
        description: '',
        type: 'segmentation',
        options: {
          datasets: [
            {
              collection: { name: 'session_durations', type: 'view' },
              filter: {
                value: [
                  {
                    collection: null,
                    column: 'session_duration_minute',
                    type: 'double',
                    connector: 'and',
                    operator: 'greaterThan',
                    value: 1,
                  },
                ],
                type: 'simple',
              },
            },
          ],
          dimensions: [],
          measures: [
            1048,
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
              ],
            },
            tableOptions: {
              enableFilter: true,
              columnOptions: [
                {
                  hide: null,
                  statistics: null,
                  enableFilter: null,
                },
              ],
            },
          },
          defaultDateRange: 'P5Y',
        },
        isHidden: false,
      },
      variableOptions: { dateRange: { type: 'dynamic', value: 'dateRange' } },
    },
  ],
}
