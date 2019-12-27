{
  name: 'tenjin_daily_ad_revenue',
  label: 'Daily Ad Revenue',
  target: std.mergePatch(std.extVar('schema'), { table: 'daily_ad_revenue' }),
  description: 'Includes ad revenue data by publisher campaigns, date, and country',
  mappings: {
    eventTimestamp: 'updated_at',
  },
  relations: {
    countries: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_countries',
      sourceColumn: 'country',
      targetColumn: 'code',
    },
    publisher_apps: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_publisher_apps',
      sourceColumn: 'publisher_app_id',
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
    updated_at: {
      pivot: false,
      type: 'timestamp',
      column: 'updated_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
  measures: {
    total_revenue: {
      column: 'revenue',
      description: 'Ad revenue amount in USD cents',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    total_impressions: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'impressions',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_clicks: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'clicks',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_conversions: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'conversions',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
  },
}
