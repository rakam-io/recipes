{
  name: 'intercom_companies',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'companies' }),
  label: 'Companies',
  category: 'Intercom',
  description: 'Companies allow you to represent commercial organizations using your product. For more info, check out the [Intercom docs](https://developers.intercom.io/docs/companies).',
  mappings: {},
  dimensions: {
    id: {
      type: 'string',
      column: 'id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    name: {
      type: 'string',
      column: 'name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    company_id: {
      type: 'string',
      column: 'company_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    last_request_at: {
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
      column: 'last_request_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    remote_created_at: {
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
      column: 'remote_created_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    updated_at: {
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
      column: 'updated_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    uuid_ts: {
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
      column: 'uuid_ts',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    created_at: {
      type: 'timestamp',
      column: 'created_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    segments: {
      type: 'string',
      column: 'segments',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
  measures: {
    session_count: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'session_count',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    monthly_spend: {
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
      column: 'monthly_spend',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    all_users: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'user_count',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    all_companies: {
      reportOptions: {
        formatNumbers: true,
      },
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
  },
}
