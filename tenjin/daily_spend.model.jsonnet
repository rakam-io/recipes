{
  name: 'tenjin_daily_spend',
  label: 'Daily Spend',
  target: std.mergePatch(std.extVar('schema'), { table: 'daily_spend' }),
  description: 'Includes pre-install metrics(such as imps, clicks, installs, and spend) by campaign and date. “spend” is spend amount converted to USD, and “original_spend” is spend amount in “original_currency”',
  mappings: {
    eventTimestamp: 'date',
    incremental: 'updated_at',
  },
  relations: {
    campaigns: {
      relationType: 'oneToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_campaigns',
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
      },
      column: 'spend',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_installs: {
      column: 'installs',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_clicks: {
      column: 'clicks',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_impressions: {
      column: 'impressions',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
  },
}
