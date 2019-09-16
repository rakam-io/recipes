{
  name: 'reporting_cohort_metrics',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'reporting_cohort_metrics' }),
  mappings: {
    eventTimestamp: 'install_date',
  },
  relations: {
    App: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'apps',
      sourceColumn: 'app_id',
      targetColumn: 'id',
      hidden: false,
    },
    ad_networks: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'ad_networks',
      sourceColumn: 'ad_network_id',
      targetColumn: 'id',
    },
    campaign_buckets: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'campaign_buckets',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
    apps: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'apps',
      sourceColumn: 'app_id',
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
    event_date: {
      label: 'Event Date',
      pivot: false,
      type: 'date',
      column: 'event_date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    install_date: {
      label: 'Install Date',
      pivot: false,
      type: 'date',
      column: 'install_date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    platform: {
      label: 'Platform',
      pivot: false,
      type: 'string',
      column: 'platform',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    site_id: {
      label: 'Site',
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
    'Average Daily Active Users': {
      label: 'Daily Active Users',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'daily_active_users',
      aggregation: 'average',
      type: 'double',
      hidden: false,
    },
    Revenue: {
      label: 'In-app Purchase Revenue',
      description: 'sum of in-app purchase revenue in USD cents\t',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'iap_revenue',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    'Day 1 LTV': {
      label: 'Day 1 LTV',
      reportOptions: {
        formatNumbers: true,
      },
      sql: 'SUM(CASE WHEN "days_since_install" <= 1 THEN ("publisher_ad_revenue" + "iap_revenue") / 100.0 ELSE 0 END)',
      type: 'double',
      hidden: false,
    },
    'Day 2 LTV': {
      reportOptions: {
        formatNumbers: true,
      },
      sql: 'SUM(CASE WHEN "days_since_install" <= 2 THEN ("publisher_ad_revenue" + "iap_revenue") / 100.0 ELSE 0 END)',
      type: 'double',
      hidden: false,
    },
    'Day 3 LTV': {
      reportOptions: {
        formatNumbers: true,
      },
      sql: 'SUM(CASE WHEN "days_since_install" <= 3 THEN ("publisher_ad_revenue" + "iap_revenue") / 100.0 ELSE 0 END)',
      type: 'double',
      hidden: false,
    },
    'Day 1 Retained Users': {
      reportOptions: {
        formatNumbers: true,
      },
      sql: 'SUM(CASE WHEN "days_since_install" = 1 THEN "daily_active_users" ELSE 0 END)',
      type: 'double',
      hidden: false,
    },
    'Day 2 Retained Users': {
      reportOptions: {
        formatNumbers: true,
      },
      sql: 'SUM(CASE WHEN "days_since_install" = 2 THEN "daily_active_users" ELSE 0 END)',
      type: 'double',
      hidden: false,
    },
    'Day 3 Retained Users': {
      reportOptions: {
        formatNumbers: true,
      },
      sql: 'SUM(CASE WHEN "days_since_install" = 3 THEN "daily_active_users" ELSE 0 END)',
      type: 'double',
      hidden: false,
    },
  },
}
