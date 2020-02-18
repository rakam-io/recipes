{
  name: 'adwords_click_performance_reports',
  target: std.mergePatch(std.extVar('schema'), { table: 'click_performance_reports' }),
  label: 'Adwords Click Performance',
  description: 'Includes stats at the click level, including both valid and invalid clicks.',
  category: 'Marketing',
  relations: {
    adwords_campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'adwords_campaigns',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
    adwords_ad_groups: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'adwords_ad_groups',
      sourceColumn: 'ad_group_id',
      targetColumn: 'id',
    },
  },
  measures: {
    page_shown: {
      description: 'Page number in search results where the ad was shown.',
      column: 'page',
      aggregation: 'average',
    },
  },
  dimensions: {
    id: {
      type: 'string',
      column: 'id',
      hidden: false,
    },
    slot: {
      description: 'The position of the Ad.',
      type: 'string',
      column: 'slot',
      hidden: false,
    },
    aoi_most_specific_target_id: {
      description: 'The most specific location target.',
      type: 'string',
      column: 'aoi_most_specific_target_id',
      hidden: false,
    },
    creative_id: {
      type: 'string',
      column: 'creative_id',
      hidden: false,
    },
    criteria_parameters: {
      type: 'string',
      column: 'criteria_parameters',
      hidden: false,
    },
    ad_group_id: {
      type: 'string',
      column: 'ad_group_id',
      hidden: true,
    },
    date: {
      sql: 'cast(date_start as date)',
      timeframes: [],
    },
    ad_format: {
      column: 'ad_format',
    },
    ad_network_type_2: {
      column: 'ad_network_type_2',
    },
    click_type: {
      column: 'click_type',
    },
    device: {
      description: 'Device type where the impression was shown.',
      column: 'device',
    },
    gcl_id: {
      description: 'The Google Click ID.',
      column: 'gcl_id',
    },
    ad_network_type_1: {
      column: 'ad_network_type_1',
    },
    campaign_id: {
      column: 'campaign_id',
    },
    page: {
      description: 'Page number in search results where the ad was shown.',
      column: 'page',
    },
  },
}
