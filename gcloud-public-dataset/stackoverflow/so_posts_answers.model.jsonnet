{
  name: 'so_posts_answers',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'posts_answers' }),
  mappings: {},
  dimensions: {
    title: {
      pivot: false,
      type: 'string',
      column: 'title',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    body: {
      pivot: false,
      type: 'string',
      column: 'body',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    accepted_answer_id: {
      pivot: false,
      type: 'string',
      column: 'accepted_answer_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    answer_count: {
      pivot: false,
      type: 'string',
      column: 'answer_count',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    community_owned_date: {
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
      column: 'community_owned_date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    creation_date: {
      label: 'Event_Timestamp',
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
    favorite_count: {
      pivot: false,
      type: 'string',
      column: 'favorite_count',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    last_activity_date: {
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
      column: 'last_activity_date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    last_edit_date: {
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
      column: 'last_edit_date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    last_editor_display_name: {
      pivot: false,
      type: 'string',
      column: 'last_editor_display_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    owner_display_name: {
      pivot: false,
      type: 'string',
      column: 'owner_display_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    tags: {
      pivot: false,
      type: 'string',
      column: 'tags',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    view_count: {
      pivot: false,
      type: 'string',
      column: 'view_count',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    user_id: {
      pivot: false,
      type: 'integer',
      column: 'owner_user_id',
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
    sum_of_comment_count: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'comment_count',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_last_editor_user_id: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'last_editor_user_id',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_owner_user_id: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'owner_user_id',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_parent_id: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'parent_id',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_post_type_id: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'post_type_id',
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
