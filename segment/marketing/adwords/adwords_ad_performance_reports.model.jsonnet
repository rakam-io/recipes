{
  name: 'adwords_ad_performance_reports',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), {table: 'ad_performance_reports'}),
  mappings: {},
  relations: {
    adwords_ads: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'adwords_ads',
      sourceColumn: 'ad_id',
      targetColumn: 'id',
    },
  },
  dimensions: {
    id: {
      pivot: false,
      type: 'string',
      column: 'id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    received_at: {
      pivot: false,
      type: 'timestamp',
      column: 'received_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    date_stop: {
      pivot: false,
      type: 'timestamp',
      column: 'date_stop',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    ad_id: {
      pivot: false,
      type: 'string',
      column: 'ad_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    date_start: {
      pivot: false,
      type: 'timestamp',
      column: 'date_start',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    uuid_ts: {
      pivot: false,
      type: 'timestamp',
      column: 'uuid_ts',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    adwords_customer_id: {
      pivot: false,
      type: 'string',
      column: 'adwords_customer_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    interaction_types: {
      pivot: false,
      type: 'string',
      column: 'interaction_types',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    account_currency_code: {
      pivot: false,
      type: 'string',
      column: 'account_currency_code',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    account_descriptive_name: {
      pivot: false,
      type: 'string',
      column: 'account_descriptive_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}