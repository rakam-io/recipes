{
  name: 'campaigns_targeting_tags',
  hidden: true,
  target: std.mergePatch(std.extVar('schema'), { table: 'campaigns_targeting_tags' }),
  mappings: {},
  relations: {
    campaigns: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'campaigns',
      sourceColumn: 'campaign_id',
      targetColumn: 'id',
    },
    targeting_tags: {
      relationType: 'manyToOne',
      joinType: 'leftJoin',
      modelName: 'targeting_tags',
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
