{
  name: 'daily_country_spend',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'daily_country_spend' }),
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
    campaign_id: {
      pivot: false,
      type: 'string',
      column: 'campaign_id',
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
    country: {
      pivot: false,
      type: 'string',
      column: 'country',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
    updated_at: {
      pivot: false,
      type: 'timestamp',
      column: 'updated_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
  },
  measures: {
    all_rows: {
      label: 'Total Clicks',
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
    total_installs: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'installs',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_spent: {
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
      column: 'spend',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
  },
}
