{
  name: 'reporting_cohort_metrics',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'reporting_cohort_metrics' }),
  descriptions: 'Includes all cohorted metrics that are synced with dashboard data',
  mappings: {
    eventTimestamp: 'install_date',
  },
  relations: {
    app: {
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
      pivot: false,
      type: 'date',
      column: 'event_date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    install_date: {
      pivot: false,
      type: 'date',
      column: 'install_date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    platform: {
      pivot: false,
      type: 'string',
      column: 'platform',
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
    daily_active_users: {
      label: 'Daily Active Users',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'daily_active_users',
      aggregation: 'average',
      type: 'double',
      hidden: false,
    },
    revenue: {
      label: 'In-app Purchase Revenue',
      description: 'sum of in-app purchase revenue in USD cents\t',
      reportOptions: {
        prefix: '$',
      },
      column: 'iap_revenue',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    publisher_ad_revenue: {
      column: 'publisher_ad_revenue',
      description: 'allocated sum of publisher ad revenue from ad network reporting API in USD cents',
      aggregation: 'sum',
      reportOptions: {
        prefix: '$',
      },
      type: 'double',
      hidden: false,
    },
    day1_ltv: {
      label: 'Day 1 LTV',
      reportOptions: {
        prefix: '$',
      },
      sql: 'SUM(CASE WHEN "days_since_install" <= 1 THEN ("publisher_ad_revenue" + "iap_revenue") / 100.0 ELSE 0 END)',
      type: 'double',
      hidden: false,
    },
    day2_ltv: {
      label: 'Day 2 LTV',
      reportOptions: {
        prefix: '$',
      },
      sql: 'SUM(CASE WHEN "days_since_install" <= 2 THEN ("publisher_ad_revenue" + "iap_revenue") / 100.0 ELSE 0 END)',
      type: 'double',
      hidden: false,
    },
    day3_ltv: {
      label: 'Day 3 LTV',
      reportOptions: {
        prefix: '$',
      },
      sql: 'SUM(CASE WHEN "days_since_install" <= 3 THEN ("publisher_ad_revenue" + "iap_revenue") / 100.0 ELSE 0 END)',
      type: 'double',
      hidden: false,
    },
    day1_retained_users: {
      reportOptions: {
        prefix: '$',
      },
      sql: 'SUM(CASE WHEN "days_since_install" = 1 THEN "daily_active_users" ELSE 0 END)',
      type: 'double',
      hidden: false,
    },
    day2_retained_users: {
      reportOptions: {
        prefix: '$',
      },
      sql: 'SUM(CASE WHEN "days_since_install" = 2 THEN "daily_active_users" ELSE 0 END)',
      type: 'double',
      hidden: false,
    },
    day3_retained_users: {
      reportOptions: {
        prefix: '$',
      },
      sql: 'SUM(CASE WHEN "days_since_install" = 3 THEN "daily_active_users" ELSE 0 END)',
      type: 'double',
      hidden: false,
    },
  },
}
