{
  name: 'intercom_admins',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'admins' }),
  label: 'Admins',
  category: 'Intercom',
  description: 'Admins are how you can view your teams and team members. For more info, check out the [Intercom docs](https://developers.intercom.io/docs/admin-model#section-admin-object)',
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
    received_at: {
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
      column: 'received_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    email: {
      type: 'string',
      column: 'email',
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
    type: {
      type: 'string',
      column: 'type',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    uuid_ts: {
      type: 'timestamp',
      column: 'uuid_ts',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
