{
  name: 'events',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'events' }),
  label: 'Raw Events',
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
      modelName: 'apps',
      sourceColumn: 'app_id',
      targetColumn: 'id',
    },
    campaign: {
      relationType: 'oneToOne',
      joinType: 'innerJoin',
      modelName: 'campaigns',
      sourceColumn: 'source_campaign_id',
      targetColumn: 'id',
    },
    ad_network: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'ad_networks',
      sql: '{{TARGET}}.id = {{relation.campaign.dimension.ad_network_id}}',
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
      pivot: false,
      type: 'string',
      column: 'os_version',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    app_version: {
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
    is_purchase: {
      type: 'boolean',
      sql: "CASE WHEN {{TABLE}}.event_type = 'purchase' THEN TRUE ELSE FALSE END",
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
      description: 'Product id for the purchase event\t(ex. com.tenjin.wordfinder.package50)',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    currency: {
      pivot: false,
      type: 'string',
      column: 'currency',
      description: 'Currency code for the purchase event. (i.e. USD)',
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
    },
    site_id: {
      pivot: false,
      type: 'string',
      column: 'site_id',
      description: "campaign's publisher ID if the campaign is paid campaign",
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    developer_device_id: {
      pivot: false,
      type: 'string',
      column: 'developer_device_id',
      description: 'IDFV for iOS. Empty for Android. Lower case, without hyphen.',
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
    revenue: {
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
    price: {
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
    gross_revenue: {
      description: 'gross revenue for the purchase event in USD cents',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'total_revenue',
      aggregation: 'sum',
      type: 'double',
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
