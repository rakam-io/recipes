{
  type: 'table',
  table: 'pages',
  label: 'Pages',
  description: 'test',
  hide: false,
  columnMapping: {
    eventTimestamp: 'received_at',
    incremental: null,
    userId: 'user_id',
    deviceId: null,
    sessionId: null,
  },
  relations: [{
    relationType: 'oneToOne',
    type: 'column',
    target: {
      name: 'session_tracks',
      type: 'view',
    },
    value: {
      sourceColumn: 'context_campaign_term',
      targetColumn: 'rakam_visitor_id',
    },
  }],
  columns: {
    anonymous_id: {
      hide: false,
      groupable: true,
      filterable: true,
      reportOptions: {
        prefix: '$',
        suffix: '&',
      },
    },
  },
}
