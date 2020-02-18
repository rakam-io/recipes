{
  name: 'so_tags',
  category: 'Stackoverflow',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'tags' }),
  mappings: {},
  dimensions: {
    tag_name: {
      type: 'string',
      column: 'tag_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    post_id: {
      type: 'integer',
      column: 'excerpt_post_id',
      hidden: false,
    },
    wiki_post_id: {
      type: 'integer',
      column: 'wiki_post_id',
      hidden: false,
    },
    count: {
      type: 'integer',
      column: 'count',
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
    sum_of_count: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'count',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_excerpt_post_id: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'excerpt_post_id',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_wiki_post_id: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'wiki_post_id',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
  },
}
