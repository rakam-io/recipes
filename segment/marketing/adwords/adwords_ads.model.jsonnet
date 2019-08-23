{
  name: 'adwords_ads',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), {table: 'ads'}),
  mappings: {},
  relations: {
    adwords_ad_groups: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'adwords_ad_groups',
      sourceColumn: 'ad_group_id',
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
      hidden: true,
    },
    type: {
      pivot: false,
      type: 'string',
      column: 'type',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    status: {
      pivot: false,
      type: 'string',
      column: 'status',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    final_urls: {
      pivot: false,
      type: 'string',
      column: 'final_urls',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    original_id: {
      pivot: false,
      type: 'string',
      column: 'original_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    ad_group_id: {
      pivot: false,
      type: 'string',
      column: 'ad_group_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
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
  },
}
