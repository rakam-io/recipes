{
  name: 'adwords_campaigns',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), {table: 'campaigns'}),
  category: 'Marketing',
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
    serving_status: {
      pivot: false,
      type: 'string',
      column: 'serving_status',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    end_date: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
        'dayOfWeek',
      ],
      type: 'timestamp',
      column: 'end_date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
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
    start_date: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
        'dayOfWeek',
      ],
      type: 'timestamp',
      column: 'start_date',
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
