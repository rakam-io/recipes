{
  name: 'so_comments',
  hidden: false,
  category: 'Stackoverflow',
  target: std.mergePatch(std.extVar('schema'), { table: 'comments' }),
  mappings: {
    eventTimestamp: 'creation_date',
  },
  dimensions: {
    text: {
      type: 'string',
      column: 'text',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    creation_date: {
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
    user_display_name: {
      type: 'string',
      column: 'user_display_name',
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
    sum_of_post_id: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'post_id',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_user_id: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'user_id',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_score: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'score',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
  },
}
