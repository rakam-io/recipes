{
  name: 'ad_engagements',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'ad_engagements' }),
  mappings: {
    eventTimestamp: 'created_at',
  },
  relations: {
    campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'campaigns',
      sourceColumn: 'id',
      targetColumn: 'campaign_id',
      hidden: false,
    },
    countries: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'countries',
      sourceColumn: 'code',
      targetColumn: 'country',
    },
    apps: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'apps',
      sourceColumn: 'id',
      targetColumn: 'app_id',
    },
    events: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'events',
      sourceColumn: 'source_uuid',
      targetColumn: 'uuid',
    },
  },
  dimensions: {
    created_at: {
      pivot: false,
      type: 'timestamp',
      column: 'created_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    advertising_id: {
      pivot: false,
      type: 'string',
      column: 'advertising_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    event_type: {
      description: 'either clicks or impressions',
      pivot: false,
      type: 'string',
      column: 'event_type',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    bundle_id: {
      pivot: false,
      type: 'string',
      column: 'bundle_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    platform: {
      pivot: false,
      type: 'string',
      column: 'platform',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    ip_address: {
      pivot: false,
      type: 'string',
      column: 'ip_address',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    site_id: {
      pivot: false,
      type: 'string',
      column: 'site_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    user_agent: {
      pivot: false,
      type: 'string',
      column: 'user_agent',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
  measures: {
    'Unique Devices': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'ip_address',
      aggregation: 'countUnique',
      type: 'double',
      hidden: false,
    },
    'Unique Users': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'advertising_id',
      aggregation: 'countUnique',
      type: 'double',
      hidden: false,
    },
  },
}
