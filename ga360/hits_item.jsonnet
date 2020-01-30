{
  dimensions: {
    item_transaction_id: {
      sql: '{{TABLE}}.hits.item.transactionId',
    },
    item_product_name: {
      description: 'Name of product on page when hit type is item',
      sql: '{{TABLE}}.hits.item.productName',
    },
    item_product_category: {
      sql: '{{TABLE}}.hits.item.productCategory',
    },
    item_product_sku: {
      label: 'Product SKU',
      sql: '{{TABLE}}.hits.item.productSku',
    },
    item_quantity: {
      sql: '{{TABLE}}.hits.item.itemQuantity',
    },
    item_revenue: {
      sql: '{{TABLE}}.hits.item.itemRevenue',
    },
    item_currency_code: {
      sql: '{{TABLE}}.hits.item.currencyCode',
    },
    item_local_item_revenue: {
      sql: '{{TABLE}}.hits.item.localItemRevenue',
    },
  },
  measures: {
    total_item_revenue: {
      sql: '{{TABLE}}.hits.item.itemRevenue',
      aggregation: 'sum',
    },
    product_count: {
      sql: '{{TABLE}}.hits.item.productSku',
      aggregation: 'countUnique',
    },
  },
}
