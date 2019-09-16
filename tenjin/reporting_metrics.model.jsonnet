{
  name: 'reporting_metrics',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'reporting_metrics' }),
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
    date: {
      pivot: false,
      type: 'date',
      column: 'date',
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
    'Total Sessions': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'sessions',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    'Total Installs': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'tracked_installs',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    'Total Impressions': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'tracked_impressions',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    'Total Spend': {
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
      column: 'reported_spend',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    'Total In-App Purchase': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'iap_revenue',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
  },
}
