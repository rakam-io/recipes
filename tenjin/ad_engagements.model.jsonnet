{
  name: 'tenjin_ad_engagements',
  label: 'Ad Engagements',
  hidden: false,
  category: 'Tenjin Marketing',
  target: std.mergePatch(std.extVar('schema'), { table: 'ad_engagements' }),
  description: 'Includes click or impression data for each device. It only has data for non-self attributing ad-networks. We don’t store click or impression data for Google or Facebook.',
  mappings: {
    eventTimestamp: 'created_at',
  },
  relations: {
    campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_campaigns',
      sourceColumn: 'id',
      targetColumn: 'campaign_id',
      hidden: false,
    },
    countries: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_countries',
      sourceColumn: 'code',
      targetColumn: 'country',
    },
    apps: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_apps',
      sourceColumn: 'id',
      targetColumn: 'app_id',
    },
    events: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_events',
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
      description: 'IDFA for iOS or Google advertising ID for Android. Lower case, without hyphen.',
      column: 'advertising_id',
    },
    attributable: {
      description: 'if the click/impression is used for attribution or not. true or false\t',
      column: 'attributable',
    },
    event_type: {
      description: 'either clicks or impressions',
      type: 'string',
      column: 'event_type',
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
      type: 'string',
      description: 'ios or android',
      column: 'platform',
    },
    ip_address: {
      type: 'string',
      description: 'ex. 71.165.85.114',
      column: 'ip_address',
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
      description: 'ex. Dalvik/2.1.0 (Linux; U; Android 8.0.0; SM-G570M Build/R16NW)',
      column: 'user_agent',
    },
  },
  measures: {
    unique_devices: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'ip_address',
      aggregation: 'countUnique',
      type: 'double',
      hidden: false,
    },
    unique_users: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'advertising_id',
      aggregation: 'countUnique',
      type: 'double',
      hidden: false,
    },
    unique_clicks: {
      column: 'remote_click_id',
      aggregation: 'countUnique',
      description: 'DSGfaa',
      type: 'double',
    },
  },
}
