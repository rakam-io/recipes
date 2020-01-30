{
  dimensions: {
    referral_path: {
      category: 'Traffic Source',
      sql: 'trafficSource.referralPath',
      description: 'If trafficSource.medium is "referral", then this is set to the path of the referrer. (The host name of the referrer is in trafficSource.source.)',
    },
    campaign: {
      category: 'Traffic Source',
      sql: 'trafficSource.campaign',
      description: 'The campaign value. Usually set by the utm_campaign URL parameter.',
    },
    source: {
      category: 'Traffic Source',
      sql: 'trafficSource.source',
      description: 'The source of the traffic source. Could be the name of the search engine, the referring hostname, or a value of the utm_source URL parameter.',
    },
    medium: {
      category: 'Traffic Source',
      sql: 'trafficSource.medium',
      description: 'The medium of the traffic source. Could be "organic", "cpc", "referral", or the value of the utm_medium URL parameter.',
    },
    keyword: {
      category: 'Traffic Source',
      sql: 'trafficSource.keyword',
      description: 'The keyword of the traffic source, usually set when the trafficSource.medium is "organic" or "cpc". Can be set by the utm_term URL parameter.',
    },
    ad_content: {
      category: 'Traffic Source',
      sql: 'trafficSource.adContent',
      description: 'The ad content of the traffic source. Can be set by the utm_content URL parameter.',
    },
    ad_network_type: {
      category: 'Traffic Source',
      sql: 'trafficSource.adwordsClickInfo.adNetworkType',
      description: 'Takes one of the following values: {“Google Search", "Content", "Search partners", "Ad Exchange", "Yahoo Japan Search", "Yahoo Japan AFS", “unknown”}',
    },
    campaign_id: {
      category: 'Traffic Source',
      sql: 'trafficSource.adwordsClickInfo.campaignId',
    },
    customer_id: {
      category: 'Traffic Source',
      sql: 'trafficSource.adwordsClickInfo.customerId',
    },
    gcl_id: {
      category: 'Traffic Source',
      sql: 'trafficSource.adwordsClickInfo.gclId',
      description: 'The Google Click ID.',
    },
    is_video_ad: {
      category: 'Traffic Source',
      sql: 'trafficSource.adwordsClickInfo.isVideoAd',
    },
    page: {
      category: 'Traffic Source',
      sql: 'trafficSource.adwordsClickInfo.page',
      description: 'Page number in search results where the ad was shown.',
    },
    slot: {
      category: 'Traffic Source',
      sql: 'trafficSource.adwordsClickInfo.slot',
      description: 'Position of the Ad. Takes one of the following values:{“RHS", "Top"}',
    },
    adwords_boom_user_list_id: {
      category: 'Traffic Source',
      sql: 'trafficSource.adwordsClickInfo.targetingCriteria.boomUserlistId',
      description: 'Page number in search results where the ad was shown.',
    },
  },
}
