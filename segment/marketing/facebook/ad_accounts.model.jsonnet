{
  name: 'facebook_ad_accounts',
  hidden: true,
  target: {
    database: 'vpn_segment',
    schema: 'facebook_ads',
    table: 'ad_accounts',
  },
  mappings: {},
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
    name: {
      pivot: false,
      type: 'string',
      column: 'name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
  measures: {
    'Maximum Spend Cap': {
      description: 'The maximum that can be spent by this account after which campaigns will be paused. A value of 0 signifies no spending-cap and setting a new spend cap only applies to spend AFTER the time at which you set it. Value specified in basic unit of the currency, e.g. cents for USD.',
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
      column: 'spend_cap',
      aggregation: 'maximum',
      fieldType: 'double',
      hidden: false,
    },
    Balance: {
      description: 'Bill amount due.',
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
      column: 'balance',
      aggregation: 'sum',
      fieldType: 'double',
      hidden: false,
    },
  },
}
