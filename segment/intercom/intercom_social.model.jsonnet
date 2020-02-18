{
  name: 'intercom_social_profiles',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'social_profiles' }),
  category: 'Intercom',
  description: 'Social data about the user. For more info, check out the [Intercom docs](https://developers.intercom.com/intercom-api-reference/reference#section-social-profile-object)',
  mappings: {
    eventTimestamp: 'received_at',
    incremental: 'user_id',
    userId: 'user_id',
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
    username: {
      pivot: false,
      type: 'string',
      column: 'username',
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
    name: {
      pivot: false,
      type: 'string',
      column: 'name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    url: {
      pivot: false,
      type: 'string',
      column: 'url',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    user_id: {
      pivot: false,
      type: 'string',
      column: 'user_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    contact_id: {
      pivot: false,
      type: 'string',
      column: 'contact_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
