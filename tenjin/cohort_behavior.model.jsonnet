{
  name: 'cohort_behavior',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'cohort_behavior' }),
  mappings: {
    eventTimestamp: 'date',
  },
  relations: {
    countries: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'countries',
      sourceColumn: 'campaign_id',
      targetColumn: 'code',
    },
    campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'campaigns',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
  },
  dimensions: {
    date: {
      pivot: false,
      type: 'date',
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
    total_users: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'users',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_sessions: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'sessions',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_revenue: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'revenue',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_transactions: {
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
