{
  name: 'daily_spend',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'daily_spend' }),
  mappings: {
    eventTimestamp: 'date',
    incremental: 'updated_at',
  },
  relations: {
    campaigns: {
      relationType: 'oneToOne',
      joinType: 'leftJoin',
      modelName: 'campaigns',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
  },
  dimensions: {
    updated_at: {
      pivot: false,
      type: 'timestamp',
      column: 'updated_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
    date: {
      pivot: false,
      type: 'date',
      column: 'date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    campaign_id: {
      pivot: false,
      type: 'string',
      column: 'campaign_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
  },
  measures: {
    total_spent: {
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
      column: 'spend',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_installs: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'installs',
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
    total_impressions: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'impressions',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
  },
}
