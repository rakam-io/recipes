{
  name: 'intercom_tags',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'tags' }),
  category: 'Intercom',
  description: 'A tag allows you to label your users and companies and list them using that tag. For more info, check out the Intercom docs\n',
  mappings: {
    eventTimestamp: 'received_at',
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
    name: {
      pivot: false,
      type: 'string',
      column: 'name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    uuid_ts: {
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
      column: 'uuid_ts',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
