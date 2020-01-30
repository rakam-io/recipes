{
  dimensions: {
    dfp_clicks: {
      category: 'Publisher',
      sql: '{{TABLE}}.hits.publisher.dfpClicks',

    },
    dfp_impressions: {
      category: 'Publisher',
      sql: '{{TABLE}}.hits.publisher.dfpImpressions',

    },
    dfp_matched_queries: {
      category: 'Publisher',

      sql: '{{TABLE}}.hits.publisher.dfpMatchedQueries',
    },
    dfp_measurable_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.dfpMeasurableImpressions',

    },
    dfp_queries: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.dfpQueries',

    },
    dfp_revenue_cpm: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.dfpRevenueCpm',

    },
    dfp_revenue_cpc: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.dfpRevenueCpc',

    },
    dfp_viewable_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.dfpViewableImpressions',

    },
    dfp_pages_viewed: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.dfpPagesViewed',

    },
    adsense_backfill_dfp_clicks: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpClicks',

    },
    adsense_backfill_dfp_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpImpressions',

    },
    adsense_backfill_dfp_matched_queries: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpMatchedQueries',

    },
    adsense_backfill_dfp_measurable_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpMeasurableImpressions',

    },
    adsense_backfill_dfp_queries: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpQueries',

    },
    adsense_backfill_dfp_revenue_cpm: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpRevenueCpm',

    },
    adsense_backfill_dfp_revenue_cpc: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpRevenueCpc',

    },
    adsense_backfill_dfp_viewable_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpViewableImpressions',

    },
    adsense_backfill_dfp_pages_viewed: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpPagesViewed',

    },
    adx_backfill_dfp_clicks: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpClicks',

    },
    adx_backfill_dfp_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpImpressions',

    },
    adx_backfill_dfp_matched_queries: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpMatchedQueries',

    },
    adx_backfill_dfp_measurable_impressions: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpMeasurableImpressions',

    },
    adx_backfill_dfp_queries: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpQueries',

    },
    adx_backfill_dfp_revenue_cpm: {
      category: 'Publisher',


      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpRevenueCpm',

    },
    adx_backfill_dfp_revenue_cpc: {
      category: 'Publisher',
      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpRevenueCpc',

    },
    adx_backfill_dfp_viewable_impressions: {
      category: 'Publisher',
      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpViewableImpressions',
    },
    adx_backfill_dfp_pages_viewed: {
      category: 'Publisher',
      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpPagesViewed',
    },
    dfp_ad_units: {
      category: 'Publisher',
      sql: '{{TABLE}}.hits.publisher.dfpAdUnits',
    },
    dfp_network_id: {
      category: 'Publisher',
      sql: '{{TABLE}}.hits.publisher.dfpNetworkId',
    },
  },
  measures: {
    total_dfp_clicks: {
      sql: '{{TABLE}}.hits.publisher.dfpClicks',
      aggregation: 'sum',

    },
    total_dfp_impressions: {
      sql: '{{TABLE}}.hits.publisher.dfpImpressions',
      aggregation: 'sum',
    },
    total_dfp_revenue: {
      sql: '{{TABLE}}.hits.publisher.dfpRevenueCpm',
      aggregation: 'sum',
    },
  },
}
