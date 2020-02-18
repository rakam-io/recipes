{
  name: 'so_badges',
  category: 'Stackoverflow',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'badges' }),
  mappings: {
    eventTimestamp: 'date',
  },
  dimensions: {
    name: {
      type: 'string',
      column: 'name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    date: {
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
      column: 'date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    id: {
      type: 'integer',
      column: 'id',
      hidden: false,
    },
    user_id: {
      type: 'integer',
      column: 'user_id',
      hidden: false,
    },
    badge_type: {
      type: 'integer',
      column: 'class',
      hidden: false,
    },
  },
  measures: {
    total_badge: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'id',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    user_count: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'user_id',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
  },
}
