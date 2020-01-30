{
  dimensions: {
    item_transaction_id: {
      category: 'E-commerce Product Item',
      sql: '{{TABLE}}.item.transactionId',
    },
    item_product_name: {
      description: 'Name of product on page when hit type is item',
      sql: '{{TABLE}}.item.productName',
    },
    item_product_category: {
      sql: '{{TABLE}}.item.productCategory',
    },
    item_product_sku: {
      label: 'Product SKU',
      sql: '{{TABLE}}.item.productSku',
    },
    item_quantity: {
      sql: '{{TABLE}}.item.itemQuantity',
    },
    item_revenue: {
      sql: '{{TABLE}}.item.itemRevenue',
    },
    item_currency_code: {
      sql: '{{TABLE}}.item.currencyCode',
    },
    item_local_item_revenue: {
      sql: '{{TABLE}}.item.localItemRevenue',
    },
  },
  measures: {
    total_item_revenue: {
      sql: '{{TABLE}}.item.itemRevenue',
      aggregation: 'sum',
    },
    product_count: {
      sql: '{{TABLE}}.item.productSku',
      aggregation: 'countUnique',
    },
  },
}
