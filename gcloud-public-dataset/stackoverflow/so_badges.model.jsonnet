{
  name: 'so_badges',
  category: "Stackoverflow",
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'badges' }),
  mappings: {
    eventTimestamp: 'date',
  },
  dimensions: {
    name: {
      pivot: false,
      type: 'string',
      column: 'name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    date: {
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
      column: 'date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    id: {
      pivot: false,
      type: 'integer',
      column: 'id',
      hidden: false,
    },
    user_id: {
      pivot: false,
      type: 'integer',
      column: 'user_id',
      hidden: false,
    },
    badge_type: {
      pivot: false,
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
