{
  name: 'Customer Data Dashboard',
  variableOptions: { dateRange: { type: 'dateRange', defaultValue: 'P5Y' } },
  items: [{
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
            collection: {name: 'session_durations', type: 'view'},
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
            }
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
  }, {
    name: 'Daily Sessions by New Users',
    description: '',
    ttl: 'PT24H',
    location: [0, 3, 2, 4],
    component: 'r-sql-chart',
    report: 'daily_sessions_by_new_users',
    variableOptions: {},
    attributes: {},
  }, {
    name: 'Distinct Visitors',
    description: '',
    ttl: 'PT1H',
    location: [1, 0, 1, 1],
    component: 'r-number',
    report: 'distinct_visitors',
    variableOptions: { dateRange: { type: 'static', value: 'P1M' } },
    attributes: {},
  }, {
    name: 'Daily Session Count - Bounce Analysis',
    description: 'segment',
    ttl: 'PT24H',
    location: [0, 1, 2, 4],
    component: 'r-sql-chart',
    report: 'daily_session_count_-_bounce_analysis',
    variableOptions: {},
    attributes: {},
  }, {
    name: 'Total Sessions',
    description: '',
    ttl: 'PT1H',
    location: [0, 0, 1, 1],
    component: 'r-number',
    report: 'total_sessions',
    variableOptions: { dateRange: { type: 'static', value: 'P1M' } },
    attributes: {},
  }, {
    name: 'Bounced Session Percentage',
    description: 'segment',
    ttl: 'PT24H',
    location: [4, 1, 2, 2],
    component: 'r-sql-chart',
    report: 'bounced_session_percentage',
    variableOptions: {},
    attributes: {},
  }, {
    name: 'New User Session Percentage',
    description: '',
    ttl: 'PT24H',
    location: [4, 3, 2, 2],
    component: 'r-sql-chart',
    report: 'new_user_session_percentage',
    variableOptions: {},
    attributes: {},
  }, {
    name: 'Avg Session per User',
    description: '',
    ttl: 'PT1H',
    location: [4, 0, 1, 2],
    component: 'r-number',
    report: 'avg_session_per_user',
    variableOptions: {},
    attributes: {},
  }],
}
