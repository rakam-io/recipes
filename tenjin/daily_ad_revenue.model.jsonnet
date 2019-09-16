{
  name: 'daily_ad_revenue',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'daily_ad_revenue' }),
  mappings: {
    eventTimestamp: 'updated_at',
  },
  relations: {
    countries: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'countries',
      sourceColumn: 'country',
      targetColumn: 'code',
    },
    publisher_apps: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'publisher_apps',
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
    'Total Revenue': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'revenue',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    'Total Impressions': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'impressions',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    'Total Clicks': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'clicks',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    'Total Conversions': {
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
