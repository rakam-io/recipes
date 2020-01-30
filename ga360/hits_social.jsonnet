{
  dimensions: {
    social_interaction_network: {
      sql: '{{TABLE}}.hits.social.socialInteractionNetwork',
    },
    social_interaction_action: {
      sql: '{{TABLE}}.hits.social.socialInteractionAction',
    },
    social_interactions: {
      sql: '{{TABLE}}.hits.social.socialInteractions',
    },
    social_interaction_target: {
      sql: '{{TABLE}}.hits.social.socialInteractionTarget',
    },
    unique_social_interactions: {
      sql: '{{TABLE}}.hits.social.uniqueSocialInteractions',
    },
    social_interaction_network_action: {
      sql: '{{TABLE}}.hits.social.socialInteractionNetworkAction',
    },
  },
}
