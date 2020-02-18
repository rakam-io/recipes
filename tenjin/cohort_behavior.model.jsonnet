{
  name: 'tenjin_cohort_behavior',
  label: 'Cohort Behavior',
  category: 'Tenjin Marketing',
  target: std.mergePatch(std.extVar('schema'), { table: 'cohort_behavior' }),
  description: |||
    Pre-aggregated view from events table. It includes cohort metrics(such as ltv, retained users) by date, campaign, country, and site. 
    “xday” is day of user's lifetime (relative to acquisition timestamp, starting with 0). So “revenue” on xday = 1 means revenue generated on day 1 after the acquisition.
  |||,
  mappings: {
    eventTimestamp: 'date',
  },
  relations: {
    countries: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_countries',
      sourceColumn: 'campaign_id',
      targetColumn: 'code',
    },
    campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_campaigns',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
  },
  measures: {
    total_users: {
      column: 'users',
      aggregation: 'sum',
      description: 'The number of unique users',
      type: 'double',
      hidden: false,
    },
    weekly_users: {
      column: 'weekly_users',
      aggregation: 'sum',
      description: 'the number of unique users in the week',
      type: 'double',
      hidden: false,
    },
    monthly_users: {
      column: 'monthly_users',
      aggregation: 'sum',
      description: 'the number of unique users in the month',
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
  dimensions: {
    date: {
      type: 'date',
      column: 'date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    xday: {
      label: "User's Lifetime In days",
      description: 'Relative to acquisition timestamp, starting with 0',
      column: 'xday',
      reportOptions: {
        suffix: ' days',
      },
      hidden: false,
    },
    site_id: {
      type: 'string',
      column: 'site_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
