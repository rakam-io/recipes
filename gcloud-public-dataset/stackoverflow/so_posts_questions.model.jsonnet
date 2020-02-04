{
  name: 'so_posts_questions',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'posts_questions' }),
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
    parent_id: {
      pivot: false,
      type: 'string',
      column: 'parent_id',
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
    accepted_answer: {
      pivot: false,
      type: 'integer',
      column: 'accepted_answer_id',
      hidden: false,
    },
  },
  measures: {
    count_all_rows: {
      label: 'Total Questions',
      description: 'Counts All Rows',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'id',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    sum_of_favorite_count: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'favorite_count',
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
    accepted_answers_count: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'accepted_answer_id',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    total_comment: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'comment_count',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_answer: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'answer_count',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_accepted_answer: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'accepted_answer_id',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    total_questions: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'id',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    total_view: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'view_count',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    average_answers: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'answer_count',
      aggregation: 'average',
      type: 'double',
      hidden: false,
    },
    average_comments: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'comment_count',
      aggregation: 'average',
      type: 'double',
      hidden: false,
    },
  },
}
