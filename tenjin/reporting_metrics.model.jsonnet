{
  name: 'reporting_metrics',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'reporting_metrics' }),
  description: 'Includes all non-cohorted metrics that are synced with dashboard data',
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
    },
    platform: {
      pivot: false,
      type: 'string',
      column: 'platform',
    },
    site_id: {
      pivot: false,
      type: 'string',
      column: 'site_id',
    },
  },
  measures: {
    total_sessions: {
      column: 'sessions',
      aggregation: 'sum',
      type: 'double',
    },
    reported_clicks: {
      column: 'reported_clicks',
      description: 'allocated clicks from ad network reporting APIs',
      aggregation: 'sum',
    },
    reported_installs: {
      column: 'reported_installs',
      description: 'allocated installs from ad network reporting APIs',
      aggregation: 'sum',
    },
    total_installs: {
      column: 'tracked_installs',
      aggregation: 'sum',
      description: 'count of installs tracked by Tenjin attribution',
      type: 'double',
    },
    total_impressions: {
      column: 'tracked_impressions',
      description: 'count of impressions tracked by Tenjin attribution',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    tracked_clicks: {
      column: 'tracked_clicks',
      description: 'count of clicks tracked by Tenjin attribution',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_spent: {
      reportOptions: {
        prefix: '$',
      },
      column: 'reported_spend',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    in_app_purchase: {
      reportOptions: {
        prefix: '$',
      },
      column: 'iap_revenue',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    publisher_ad_revenue: {
      reportOptions: {
        prefix: '$',
      },
      column: 'publisher_ad_revenue',
      aggregation: 'sum',
      description: 'allocated sum of publisher ad revenue from ad network reporting API in USD cents',
    },
  },
}
