{
  name: 'tenjin_events',
  target: std.mergePatch(std.extVar('schema'), { table: 'events' }),
  label: '[Tenjin] All Events',
  category: 'Tenjin Events',
  description: 'User event data that comes from Tenjin SDK or 3rd party attribution provider',
  mappings: {
    eventTimestamp: 'created_at',
    incremental: 'created_at',
    userId: 'advertising_id',
  },
  relations: {
    app: {
      relationType: 'oneToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_apps',
      sourceColumn: 'app_id',
      targetColumn: 'id',
    },
    campaign: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_campaigns',
      sourceColumn: 'source_campaign_id',
      targetColumn: 'id',
    },
    ad_network: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_ad_networks',
      sql: '{{TARGET}}.id = {{relation.campaign.dimension.ad_network_id}}',
    },
    ad_engagements: {
      relationType: 'oneToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_ad_engagements',
      sourceColumn: 'source_uuid',
      targetColumn: 'uuid',
    },
  },
  dimensions: {
    created_at: {
      description: 'timestamp when the event was created',
      type: 'timestamp',
      column: 'created_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    bundle_id: {
      description: "App's bundle ID. Ex: com.tenjin.wordfinder",
      type: 'string',
      column: 'bundle_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    platform: {
      description: "app's platform (ios or android)",
      type: 'string',
      column: 'platform',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    os_version: {
      type: 'string',
      column: 'os_version',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    app_version: {
      type: 'string',
      column: 'app_version',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    event_type: {
      label: 'Custom Event Type',
      type: 'string',
      column: 'event',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    source_campaign_id: {
      type: 'string',
      column: 'source_campaign_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    acquired_at: {
      label: 'User Acquired At',
      type: 'timestamp',
      column: 'acquired_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    product_id: {
      type: 'string',
      column: 'product_id',
      description: 'Product id for the purchase event\t(ex. com.tenjin.wordfinder.package50)',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    country: {
      type: 'string',
      column: 'country',
      reportOptions: {
        formatNumbers: true,
      },
    },
    site_id: {
      type: 'string',
      column: 'site_id',
      description: "campaign's publisher ID if the campaign is paid campaign",
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    developer_device_id: {
      type: 'string',
      column: 'developer_device_id',
      description: 'IDFV for iOS. Empty for Android. Lower case, without hyphen.',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    uuid: {
      type: 'string',
      column: 'uuid',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
    device: {
      label: 'Device Type',
      type: 'string',
      column: 'device',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    creative_name: {
      label: 'Creative Name',
      type: 'string',
      column: 'creative_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    ip_address: {
      type: 'string',
      column: 'ip_address',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    source_uuid: {
      type: 'string',
      column: 'source_uuid',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: true,
    },
    advertising_id: {
      description: 'IDFA for iOS or Google advertising ID for Android. Lower case, without hyphen.\t',
      type: 'string',
      column: 'advertising_id',
      hidden: false,
    },
  },
  measures: {
    all_rows: {
      label: 'All events',
      reportOptions: {
        formatNumbers: true,
      },
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    unique_users: {
      aggregation: 'countUnique',
      sql: 'coalesce({{TABLE}}.advertising_id, {{TABLE}}.developer_device_id)',
      type: 'double',
    },
    unique_devices: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'ip_address',
      aggregation: 'countUnique',
      type: 'double',
      hidden: false,
    },
    unique_events: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'uuid',
      aggregation: 'countUnique',
    },
    sum_of_value: {
      column: 'value',
      aggregation: 'sum',
    },
  },
}
