{
  label: 'All Segment Users',
  name: 'segment_users',
  category: 'Segment Users',
  target: std.extVar('users_target'),
  mappings: {
    userId: 'user_id',
  },
  measures: {
    total_users: {
      aggregation: 'count',
    },
  },
  dimensions: std.extVar('attributions') {
    last_update: {
      type: 'timestamp',
      column: 'received_at',
    },
    user_id: {
      column: 'id',
    },
  },
}
