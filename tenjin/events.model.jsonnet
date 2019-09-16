{
  name: 'events',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'events' }),
  label: 'Raw Events',
  mappings: {
    eventTimestamp: 'created_at',
    incremental: 'created_at',
    userId: 'advertising_id',
  },
  relations: {
    apps: {
      label: 'App',
      relationType: 'oneToOne',
      joinType: 'leftJoin',
      modelName: 'apps',
      sourceColumn: 'app_id',
      targetColumn: 'id',
      hidden: false,
    },
    campaign: {
      label: 'Campaign',
      relationType: 'oneToOne',
      joinType: 'innerJoin',
      modelName: 'campaigns',
      sourceColumn: 'limit_ad_tracking',
      targetColumn: 'id',
      hidden: false,
    },
    ad_engagements: {
      relationType: 'oneToOne',
      joinType: 'innerJoin',
      modelName: 'ad_engagements',
      sourceColumn: 'source_uuid',
      targetColumn: 'uuid',
    },
  },
  dimensions: {
    created_at: {
      label: 'Created',
      description: 'timestamp when the event was created',
      pivot: false,
      type: 'timestamp',
      column: 'created_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    bundle_id: {
      label: 'Bundle',
      description: "App's bundle ID. Ex: com.tenjin.wordfinder",
      pivot: false,
      type: 'string',
      column: 'bundle_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    platform: {
      description: "app's platform (ios or android)",
      pivot: false,
      type: 'string',
      column: 'platform',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    os_version: {
      label: 'Device OS Version',
      pivot: false,
      type: 'string',
      column: 'os_version',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    app_version: {
      label: 'App Version',
      pivot: false,
      type: 'string',
      column: 'app_version',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    event_type: {
      label: 'Custom Event Type',
      pivot: false,
      type: 'string',
      column: 'event',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    event: {
      label: 'internal_event_type',
      pivot: false,
      type: 'string',
      column: 'event_type',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    source_campaign_id: {
      pivot: false,
      type: 'string',
      column: 'source_campaign_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    acquired_at: {
      label: 'User Acquired At',
      pivot: false,
      type: 'timestamp',
      column: 'acquired_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    product_id: {
      pivot: false,
      type: 'string',
      column: 'product_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    currency: {
      pivot: false,
      type: 'string',
      column: 'currency',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    country: {
      pivot: false,
      type: 'string',
      column: 'country',
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
    developer_device_id: {
      pivot: false,
      type: 'string',
      column: 'developer_device_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    uuid: {
      pivot: false,
      type: 'string',
      column: 'uuid',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    device: {
      label: 'Device Type',
      pivot: false,
      type: 'string',
      column: 'device',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    creative_name: {
      label: 'Creative Name',
      pivot: false,
      type: 'string',
      column: 'creative_name',
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
    source_uuid: {
      pivot: false,
      type: 'string',
      column: 'source_uuid',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    purchase_state: {
      pivot: false,
      sql: "case when purchase_state = 0 then 'Unknowable' when purchase_state = 1 then 'Unverified' when purchase_state = 2 then 'Fraudulent' when purchase_state = 3 then 'Verified' when purchase_state = 4 then 'Sandbox' end",
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    advertising_id: {
      description: 'IDFA for iOS or Google advertising ID for Android. Lower case, without hyphen.\t',
      pivot: false,
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
    'Unique Users': {
      label: 'Unique Users',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'advertising_id',
      aggregation: 'countUnique',
      type: 'double',
      hidden: false,
    },
    'Unique Devices': {
      label: 'Unique Devices',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'ip_address',
      aggregation: 'countUnique',
      type: 'double',
      hidden: false,
    },
    Revenue: {
      label: 'Net Revenue',
      description: 'net revenue for the purchase event in USD cents\t',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'revenue',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    Price: {
      label: 'Price',
      description: 'raw purchase price for the purchase event',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'price',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    'Gross Revenue': {
      label: 'Gross Revenue',
      description: 'gross revenue for the purchase event in USD cents',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'total_revenue',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    'Unique Events': {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'uuid',
      aggregation: 'countUnique',
      type: 'double',
      hidden: false,
    },
  },
}
