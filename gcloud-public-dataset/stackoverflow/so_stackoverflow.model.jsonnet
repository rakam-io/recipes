{
  name: 'so_stackoverflow_posts',
  category: 'Stackoverflow',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'stackoverflow_posts' }),
  description: "Don't use this table - use posts_* instead",
  mappings: {},
  relations: {
    so_stackoverflow_posts: {
      relationType: 'oneToOne',
      joinType: 'leftJoin',
      modelName: 'so_stackoverflow_posts',
      sourceColumn: 'id',
      targetColumn: 'id',
    },
    so_tags: {
      relationType: 'oneToMany',
      joinType: 'leftJoin',
      modelName: 'so_tags',
      sourceColumn: 'id',
      targetColumn: 'excerpt_post_id',
    },
  },
  dimensions: {
    title: {
      label: 'Question',
      type: 'string',
      column: 'title',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    community_owned_date: {
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
    last_editor_display_name: {
      type: 'string',
      column: 'last_editor_display_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    owner_display_name: {
      type: 'string',
      column: 'owner_display_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    tags: {
      type: 'string',
      column: 'tags',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    favorite_count: {
      type: 'integer',
      column: 'favorite_count',
      hidden: false,
    },
    comment_count: {
      type: 'integer',
      column: 'comment_count',
      hidden: false,
    },
    answer_count: {
      type: 'integer',
      column: 'answer_count',
      hidden: false,
    },
    accepted_answer_id: {
      type: 'integer',
      column: 'accepted_answer_id',
      hidden: false,
    },
    id: {
      type: 'integer',
      column: 'id',
      hidden: false,
    },
    view_count: {
      type: 'integer',
      column: 'view_count',
      hidden: false,
    },
    last_activity_date: {
      timeframes: [
        'year',
      ],
      type: 'timestamp',
      column: 'last_activity_date',
      hidden: false,
    },
  },
  measures: {
    total_post: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'id',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    total_comments: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'comment_count',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_answers: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'answer_count',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    average_comment: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'comment_count',
      aggregation: 'average',
      type: 'double',
      hidden: false,
    },
    average_view: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'view_count',
      aggregation: 'average',
      type: 'double',
      hidden: false,
    },
    average_answer: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'answer_count',
      aggregation: 'average',
      type: 'double',
      hidden: false,
    },
    total_accepted_answer: {
      label: 'Total_Accepted_Answers',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'accepted_answer_id',
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    answering_ratio: {
      label: 'Answering_Ratio',
      reportOptions: {
        formatNumbers: true,
      },
      sql: "count('Accepted_answer_id')/count('id')",
      type: 'double',
      hidden: false,
    },
    max_view_count: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'view_count',
      aggregation: 'maximum',
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
  },
}
