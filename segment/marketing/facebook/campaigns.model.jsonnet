{
  name: 'facebook_campaigns',
  hidden: true,
  target: {
    database: 'vpn_segment',
    schema: 'facebook_ads',
    table: 'campaigns',
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
    start_time: {
      pivot: false,
      type: 'timestamp',
      column: 'start_time',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    stop_time: {
      pivot: false,
      type: 'timestamp',
      column: 'stop_time',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    buying_type: {
      pivot: false,
      type: 'string',
      column: 'buying_type',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    effective_status: {
      pivot: false,
      type: 'string',
      column: 'effective_status',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
