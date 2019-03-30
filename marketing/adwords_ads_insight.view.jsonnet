{
  label: 'Adwords Ads Insights',
  columnMapping: {
    eventTimestamp: 'received_at',
    incremental: null,
    userId: null,
    deviceId: null,
    sessionId: null,
  },
  type: 'view',
  query: |||
    SELECT c.id AS campaign_id,
        c.name AS campaign,
        cpr.received_at,
        cpr.interactions,
        cpr.active_view_impressions,
        cpr.amount,
        cpr.clicks,
        cpr.impressions,
        cpr.interaction_types,
        cpr.cost,
        cpr.conversions
       FROM (adwords.campaign_performance_reports cpr
         LEFT JOIN adwords.campaigns c ON (((c.id)::text = cpr.campaign_id)));
  |||
}
