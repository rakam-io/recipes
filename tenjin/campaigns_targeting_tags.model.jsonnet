{
  name: 'tenjin_campaigns_targeting_tags',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'campaigns_targeting_tags' }),
  description: 'Includes targeting tag information for each campaign.',
  mappings: {},
  relations: {
    campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_campaigns',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
    targeting_tags: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'tenjin_targeting_tags',
      sourceColumn: 'targeting_tag_id',
      targetColumn: 'id',
    },
  },
  dimensions: {
    campaign_id: {
      pivot: false,
      type: 'string',
      column: 'campaign_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
  measures: {},
}
