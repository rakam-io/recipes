[
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
  },
]
+
if std.extVar('identifies_target') != null then [{
  label: '[Segment] User Attributions',
  name: 'identifies',
  target: std.extVar('identifies_target'),
  category: 'Segment Events',
  mappings: {
    userId: 'id',
    eventTimestamp: 'received_at',
  },
  measures: {
    distinct_users: {
      aggregation: 'countUnique',
      column: 'id',
    },
    total_identify: {
      label: 'Total Update',
      aggregation: 'count',
    },
  },
  dimensions: std.extVar('attributions') {
    received_at: {
      label: 'Date',
      column: 'received_at',
    },
    id: {
      column: 'id',
    },
  },
}] else []
