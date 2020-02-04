{
  name: 'so_users',
  category: "Stackoverflow",
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'users' }),
  mappings: {},
  dimensions: {
    display_name: {
      pivot: false,
      type: 'string',
      column: 'display_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    about_me: {
      pivot: false,
      type: 'string',
      column: 'about_me',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    age: {
      pivot: false,
      type: 'string',
      column: 'age',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    creation_date: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfWeek',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
      ],
      type: 'timestamp',
      column: 'creation_date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    last_access_date: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfWeek',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
      ],
      type: 'timestamp',
      column: 'last_access_date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    location: {
      pivot: false,
      type: 'string',
      column: 'location',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    profile_image_url: {
      pivot: false,
      type: 'string',
      column: 'profile_image_url',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    website_url: {
      pivot: false,
      type: 'string',
      column: 'website_url',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
  measures: {
    count_all_rows: {
      description: 'Counts All Rows',
      reportOptions: {
        formatNumbers: true,
      },
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    sum_of_id: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'id',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_reputation: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'reputation',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_up_votes: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'up_votes',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_down_votes: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'down_votes',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_views: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'views',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
  },
}
