{
  name: 'tenjin_daily_country_spend',
  label: 'Daily Country Spend',
  category: 'Tenjin Marketing',
  target: std.mergePatch(std.extVar('schema'), { table: 'daily_country_spend' }),
  description: "Includes pre-install metrics(such as imps, clicks, installs, and spend) by date, campaign, and country. “spend” is spend amount converted to USD, and “original_spend” is spend amount in “original_currency”. The model doesn't contain all the spend of daily_spend because some ad-networks don’t have spend by country breakdown.",
  mappings: {
    eventTimestamp: 'date',
  },
  relations: {
    campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_campaigns',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
    countries: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_countries',
      sourceColumn: 'country',
      targetColumn: 'code',
    },
  },
  dimensions: {
    campaign_id: {
      type: 'string',
      column: 'campaign_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
    date: {
      type: 'date',
      column: 'date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    country: {
      type: 'string',
      column: 'country',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
    updated_at: {
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
