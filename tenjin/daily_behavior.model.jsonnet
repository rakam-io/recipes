{
  name: 'daily_behavior',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'daily_behavior' }),
  mappings: {
    eventTimestamp: 'date',
  },
  relations: {
    campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'campaigns',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
    countries: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'countries',
      sourceColumn: 'country',
      targetColumn: 'code',
    },
  },
  dimensions: {
    date: {
      pivot: false,
      type: 'timestamp',
      column: 'date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    site_id: {
      pivot: false,
      type: 'string',
      column: 'site_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
  measures: {
    all_rows: {
      label: 'Weekly Users',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'weekly_users',
      aggregation: 'average',
      type: 'double',
      hidden: false,
    },
    'Monthly Users': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'monthly_users',
      aggregation: 'average',
      type: 'double',
      hidden: false,
    },
    'Total Sessions': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'sessions',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    Revenue: {
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
      column: 'revenue',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    'Total Users': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'users',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    'Total Transactions': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'transactions',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
  },
}
