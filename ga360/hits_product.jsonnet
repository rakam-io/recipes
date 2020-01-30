local util = import '../util.libsonnet';

{
  dimensions: {
    product_sku: {
      label: 'Product SKU',
      sql: '{{TABLE}}.product.productSKU',
    },
    product_name: {
      sql: '{{TABLE}}.product.v2ProductName',
    },
    product_revenue: {
      type: 'string',
      sql: '{{TABLE}}.product.productRevenue',
    },
    product_category: {
      sql: '{{TABLE}}.product.v2ProductCategory',
    },
    product_variant: {
      sql: '{{TABLE}}.product.productVariant',
    },
    product_brand: {
      label: 'Product Brand',
      sql: '{{TABLE}}.product.productBrand',
    },
    product_revenue_local: {
      label: 'Product Revenue (Local Currency)',
      sql: '{{TABLE}}.product.localProductRevenue',
    },
    product_price: {
      sql: '{{TABLE}}.product.productPrice',
    },
    product_price_local: {
      label: 'Product Price (Local Currency)',
      sql: '{{TABLE}}.product.localProductPrice',
    },
    product_quantity: {
      sql: '{{TABLE}}.product.ProductQuantity',
    },
    product_refund_amount: {
      sql: '{{TABLE}}.product.productRefundAmount',
    },
    is_impression: {
      sql: '{{TABLE}}.product.isImpression',
    },
    is_click: {
      sql: '{{TABLE}}.product.isClick',
    },
  },
  measures: {
    total_product_revenue: {
      column: '(1.0 * ({{dimension.product_revenue}}/1000000))',
      aggregation: 'sum',
    },
  },
}
