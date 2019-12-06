{
  name: 'daily_behavior',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'daily_behavior' }),
  description: 'Pre-aggregated view from events table. It includes non-cohort metrics(such as dau, arpdau) by date, campaign, country, and site',
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
    weekly_users: {
      column: 'weekly_users',
      aggregation: 'average',
      description: 'the number of unique users in the week',
      type: 'double',
    },
    monthly_users: {
      column: 'monthly_users',
      description: 'the number of unique users in the month',
      aggregation: 'average',
      type: 'double',
    },
    total_sessions: {
      column: 'sessions',
      aggregation: 'sum',
      description: 'the number of sessions',
      type: 'double',
    },
    revenue: {
      reportOptions: {
        prefix: '$',
      },
      column: 'revenue',
      aggregation: 'sum',
      description: 'revenue amount in USD cents',
      type: 'double',
    },
    total_users: {
      column: 'users',
      description: 'the number of unique users',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_transactions: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'transactions',
      description: 'the number of purchase transactions',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
  },
}
