{
  dimensions: {
    dfp_clicks: {
      category: 'Publisher',
      sql: '{{TABLE}}.publisher.dfpClicks',

    },
    dfp_impressions: {
      category: 'Publisher',
      sql: '{{TABLE}}.publisher.dfpImpressions',

    },
    dfp_matched_queries: {
      category: 'Publisher',

      sql: '{{TABLE}}.publisher.dfpMatchedQueries',
    },
    dfp_measurable_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.dfpMeasurableImpressions',

    },
    dfp_queries: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.dfpQueries',

    },
    dfp_revenue_cpm: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.dfpRevenueCpm',

    },
    dfp_revenue_cpc: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.dfpRevenueCpc',

    },
    dfp_viewable_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.dfpViewableImpressions',

    },
    dfp_pages_viewed: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.dfpPagesViewed',

    },
    adsense_backfill_dfp_clicks: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adsenseBackfillDfpClicks',

    },
    adsense_backfill_dfp_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adsenseBackfillDfpImpressions',

    },
    adsense_backfill_dfp_matched_queries: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adsenseBackfillDfpMatchedQueries',

    },
    adsense_backfill_dfp_measurable_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adsenseBackfillDfpMeasurableImpressions',

    },
    adsense_backfill_dfp_queries: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adsenseBackfillDfpQueries',

    },
    adsense_backfill_dfp_revenue_cpm: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adsenseBackfillDfpRevenueCpm',

    },
    adsense_backfill_dfp_revenue_cpc: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adsenseBackfillDfpRevenueCpc',

    },
    adsense_backfill_dfp_viewable_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adsenseBackfillDfpViewableImpressions',

    },
    adsense_backfill_dfp_pages_viewed: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adsenseBackfillDfpPagesViewed',

    },
    adx_backfill_dfp_clicks: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adxBackfillDfpClicks',

    },
    adx_backfill_dfp_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adxBackfillDfpImpressions',

    },
    adx_backfill_dfp_matched_queries: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adxBackfillDfpMatchedQueries',

    },
    adx_backfill_dfp_measurable_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adxBackfillDfpMeasurableImpressions',

    },
    adx_backfill_dfp_queries: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adxBackfillDfpQueries',

    },
    adx_backfill_dfp_revenue_cpm: {
      category: 'Publisher',


      sql: '{{TABLE}}.publisher.adxBackfillDfpRevenueCpm',

    },
    adx_backfill_dfp_revenue_cpc: {
      category: 'Publisher',
      sql: '{{TABLE}}.publisher.adxBackfillDfpRevenueCpc',

    },
    adx_backfill_dfp_viewable_impressions: {
      category: 'Publisher',
      sql: '{{TABLE}}.publisher.adxBackfillDfpViewableImpressions',
    },
    adx_backfill_dfp_pages_viewed: {
      category: 'Publisher',
      sql: '{{TABLE}}.publisher.adxBackfillDfpPagesViewed',
    },
    dfp_ad_units: {
      category: 'Publisher',
      sql: '{{TABLE}}.publisher.dfpAdUnits',
    },
    dfp_network_id: {
      category: 'Publisher',
      sql: '{{TABLE}}.publisher.dfpNetworkId',
    },
  },
  measures: {
    total_dfp_clicks: {
      sql: '{{TABLE}}.publisher.dfpClicks',
      aggregation: 'sum',

    },
    total_dfp_impressions: {
      sql: '{{TABLE}}.publisher.dfpImpressions',
      aggregation: 'sum',
    },
    total_dfp_revenue: {
      sql: '{{TABLE}}.publisher.dfpRevenueCpm',
      aggregation: 'sum',
    },
  },
}
