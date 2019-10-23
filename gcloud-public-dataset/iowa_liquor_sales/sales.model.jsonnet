{
  name: 'sales',
  hidden: false,
  target: std.extVar('table'),
  label: 'Liquor Sales',
  description: 'Liquor sales in Iowa',
  category: 'Marketing',
  mappings: {},
  dimensions: {
    date: {
      description: 'Date of order',
      pivot: false,
      timeframes: [
        'week',
        'month',
        'year',
        'dayOfWeek',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
      ],
      type: 'date',
      column: 'date',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    store_name: {
      description: 'Name of store who ordered the liquor.',
      pivot: false,
      type: 'string',
      column: 'store_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    city: {
      description: 'City where the store who ordered the liquor is located',
      pivot: false,
      type: 'string',
      sql: 'LOWER(city)',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    county: {
      description: 'County where the store who ordered the liquor is located',
      pivot: false,
      type: 'string',
      column: 'county',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    category: {
      description: 'Category code associated with the liquor ordered',
      pivot: false,
      type: 'string',
      column: 'category',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    category_name: {
      description: 'Category of the liquor ordered.',
      pivot: false,
      type: 'string',
      column: 'category_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    vendor_name: {
      description: 'The vendor name of the company for the brand of liquor ordered',
      pivot: false,
      type: 'string',
      column: 'vendor_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    item_description: {
      description: 'Description of the individual liquor product ordered.',
      pivot: false,
      type: 'string',
      column: 'item_description',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    'Sold in Dollars': {
      pivot: false,
      type: 'double',
      column: 'sale_dollars',
      hidden: false,
    },
    'Sold in Bottles': {
      pivot: false,
      type: 'integer',
      column: 'bottles_sold',
      hidden: false,
    },
    'Sold in Liters': {
      pivot: false,
      type: 'double',
      column: 'volume_sold_liters',
      hidden: false,
    },
  },
  measures: {
    total_bottles_sold: {
      label: 'Total Sales in Bottle',
      description: 'The number of bottles of liquor ordered by the store',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'bottles_sold',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_sale_dollars: {
      label: 'Total Sales in Dollars',
      description: 'Total cost of liquor order (number of bottles multiplied by the state bottle retail)',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'sale_dollars',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    total_volume_sold_liters: {
      label: 'Total Sales in Liters',
      description: 'Total volume of liquor ordered in liters. (i.e. (Bottle Volume (ml) x Bottles Sold)/1,000)',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'volume_sold_liters',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sold_liquor_types: {
      label: 'Count of Sold Liquor Types',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'item_description',
      aggregation: 'countUnique',
      type: 'double',
      hidden: false,
    },
    max_sales_in_bottle: {
      reportOptions: {
        formatNumbers: true,
      },
      sql: 'SUM(bottles_sold)',
      aggregation: 'maximum',
      type: 'double',
      hidden: false,
    },
  },
}
