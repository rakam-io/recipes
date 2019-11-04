{
  name: 'facebook_campaigns',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'campaigns' }),
  category: 'Marketing',
  mappings: {
    eventTimestamp: 'date',
  },
  dimensions: {
    is_active: {
      type: 'boolean',
      sql: 'CASE WHEN {{TABLE}}.effective_status = "ACTIVE" then TRUE else FALSE END',
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
    date: {
      pivot: false,
      type: 'timestamp',
      sql: 'cast(start_time as date)',
      hidden: true,
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
