local util = import '../util.libsonnet';

{
  dimensions: {
    product_sku: {
      label: 'Product SKU',
      sql: '{{TABLE}}.hits.product.productSKU',
    },
    product_name: {
      sql: '{{TABLE}}.hits.product.v2ProductName',
    },
    product_revenue: {
      type: 'string',
      sql: '{{TABLE}}.hits.product.productRevenue',
    },
    product_category: {
      sql: '{{TABLE}}.hits.product.v2ProductCategory',
    },
    product_variant: {
      sql: '{{TABLE}}.hits.product.productVariant',
    },
    product_brand: {
      label: 'Product Brand',
      sql: '{{TABLE}}.hits.product.productBrand',
    },
    product_revenue_local: {
      label: 'Product Revenue (Local Currency)',
      sql: '{{TABLE}}.hits.product.localProductRevenue',
    },
    product_price: {
      sql: '{{TABLE}}.hits.product.productPrice',
    },
    product_price_local: {
      label: 'Product Price (Local Currency)',
      sql: '{{TABLE}}.hits.product.localProductPrice',
    },
    product_quantity: {
      sql: '{{TABLE}}.hits.product.ProductQuantity',
    },
    product_refund_amount: {
      sql: '{{TABLE}}.hits.product.productRefundAmount',
    },
    is_impression: {
      sql: '{{TABLE}}.hits.product.isImpression',
    },
    is_click: {
      sql: '{{TABLE}}.hits.product.isClick',
    },
  },
  measures: {
    total_product_revenue: {
      column: '(1.0 * ({{dimension.product_revenue}}/1000000))',
      aggregation: 'sum',
    },
  },
}
