{
  name: 'facebook_campaigns',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'campaigns' }),
  mappings: {},
  category: 'Marketing',
  dimensions: {
     is_active: {
        type: 'boolean',
        sql: 'CASE WHEN {{TABLE}}.effective_status = "ACTIVE" then TRUE else FALSE END'
      },
    id: {
      pivot: false,
      type: 'string',
      column: 'id',
      hidden: true,
    },
    name: {
      pivot: false,
      type: 'string',
      column: 'name',
      hidden: false,
    },
    start_time: {
      pivot: false,
      type: 'timestamp',
      column: 'start_time',
      hidden: false,
    },
    stop_time: {
      pivot: false,
      type: 'timestamp',
      column: 'stop_time',
      hidden: false,
    },
    buying_type: {
      pivot: false,
      type: 'string',
      column: 'buying_type',
      hidden: false,
    },
    effective_status: {
      pivot: false,
      type: 'string',
      column: 'effective_status',
      hidden: false,
    },
  },
}
