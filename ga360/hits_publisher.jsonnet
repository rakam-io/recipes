{
  dimensions: {
    dfp_clicks: {

      sql: '{{TABLE}}.hits.publisher.dfpClicks',

    },
    dfp_impressions: {

      sql: '{{TABLE}}.hits.publisher.dfpImpressions',

    },
    dfp_matched_queries: {
      sql: '{{TABLE}}.hits.publisher.dfpMatchedQueries',
    },
    dfp_measurable_impressions: {

      sql: '{{TABLE}}.hits.publisher.dfpMeasurableImpressions',

    },
    dfp_queries: {

      sql: '{{TABLE}}.hits.publisher.dfpQueries',

    },
    dfp_revenue_cpm: {

      sql: '{{TABLE}}.hits.publisher.dfpRevenueCpm',

    },
    dfp_revenue_cpc: {

      sql: '{{TABLE}}.hits.publisher.dfpRevenueCpc',

    },
    dfp_viewable_impressions: {

      sql: '{{TABLE}}.hits.publisher.dfpViewableImpressions',

    },
    dfp_pages_viewed: {

      sql: '{{TABLE}}.hits.publisher.dfpPagesViewed',

    },
    adsense_backfill_dfp_clicks: {

      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpClicks',

    },
    adsenseBackfillDfpImpressions: {

      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpImpressions',

    },
    adsenseBackfillDfpMatchedQueries: {

      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpMatchedQueries',

    },
    adsenseBackfillDfpMeasurableImpressions: {

      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpMeasurableImpressions',

    },
    adsenseBackfillDfpQueries: {

      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpQueries',

    },
    adsenseBackfillDfpRevenueCpm: {

      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpRevenueCpm',

    },
    adsenseBackfillDfpRevenueCpc: {

      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpRevenueCpc',

    },
    adsenseBackfillDfpViewableImpressions: {

      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpViewableImpressions',

    },
    adsenseBackfillDfpPagesViewed: {

      sql: '{{TABLE}}.hits.publisher.adsenseBackfillDfpPagesViewed',

    },
    adxBackfillDfpClicks: {

      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpClicks',

    },
    adxBackfillDfpImpressions: {

      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpImpressions',

    },
    adxBackfillDfpMatchedQueries: {

      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpMatchedQueries',

    },
    adxBackfillDfpMeasurableImpressions: {

      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpMeasurableImpressions',

    },
    adxBackfillDfpQueries: {

      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpQueries',

    },
    adxBackfillDfpRevenueCpm: {

      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpRevenueCpm',

    },
    adxBackfillDfpRevenueCpc: {

      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpRevenueCpc',

    },
    adxBackfillDfpViewableImpressions: {

      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpViewableImpressions',

    },
    adxBackfillDfpPagesViewed: {

      sql: '{{TABLE}}.hits.publisher.adxBackfillDfpPagesViewed',

    },
    adxClicks: {

      sql: '{{TABLE}}.hits.publisher.adxClicks',

    },
    adxImpressions: {

      sql: '{{TABLE}}.hits.publisher.adxImpressions',

    },
    adxMatchedQueries: {

      sql: '{{TABLE}}.hits.publisher.adxMatchedQueries',

    },
    adxMeasurableImpressions: {

      sql: '{{TABLE}}.hits.publisher.adxMeasurableImpressions',

    },
    adxQueries: {

      sql: '{{TABLE}}.hits.publisher.adxQueries',

    },
    adxRevenue: {

      sql: '{{TABLE}}.hits.publisher.adxRevenue',

    },
    adxViewableImpressions: {

      sql: '{{TABLE}}.hits.publisher.adxViewableImpressions',

    },
    adxPagesViewed: {

      sql: '{{TABLE}}.hits.publisher.adxPagesViewed',

    },
    adsViewed: {

      sql: '{{TABLE}}.hits.publisher.adsViewed',

    },
    adsUnitsViewed: {

      sql: '{{TABLE}}.hits.publisher.adsUnitsViewed',

    },
    adsUnitsMatched: {

      sql: '{{TABLE}}.hits.publisher.adsUnitsMatched',

    },
    viewable_ads_viewed: {
      sql: '{{TABLE}}.hits.publisher.viewableAdsViewed',
    },
    measurable_ads_viewed: {
      sql: '{{TABLE}}.hits.publisher.measurableAdsViewed',
    },
    ads_pages_viewed: {
      sql: '{{TABLE}}.hits.publisher.adsPagesViewed',
    },
    ads_clicked: {
      sql: '{{TABLE}}.hits.publisher.adsClicked',
    },
    ads_revenue: {
      sql: '{{TABLE}}.hits.publisher.adsRevenue',
    },
    dfp_ad_group: {
      sql: '{{TABLE}}.hits.publisher.dfpAdGroup',
    },
    dfp_ad_units: {
      sql: '{{TABLE}}.hits.publisher.dfpAdUnits',
    },
    dfp_network_id: {
      sql: '{{TABLE}}.hits.publisher.dfpNetworkId',
    },
  },
  measures: {
    total_dfp_clicks: {
      sql: 'dfpClicks',
      aggregation: 'sum',
      type: 'double',

    },
    total_dfp_impressions: {
      sql: 'dfpImpressions',
      aggregation: 'sum',
      type: 'double',

    },
    total_dfp_revenue: {
      sql: 'dfpRevenueCpm',
      aggregation: 'sum',
      type: 'double',

    },
    total_ads_clicks: {
      sql: 'adsClicked',
      aggregation: 'sum',
      type: 'double',

    },
  },
}
