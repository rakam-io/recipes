local events = import './events.model.jsonnet';

{
  name: 'tenjin_event_purchase',
  label: 'Purchase',
  sql: "SELECT * FROM events WHERE event = 'purchase'",
  mappings: events.mappings,
  relations: events.relations,
  measures: events.measures {
    revenue: {
      label: 'Net Revenue',
      description: 'net revenue for the purchase event in USD cents\t',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'revenue',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    price: {
      label: 'Price',
      description: 'raw purchase price for the purchase event',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'price',
      aggregation: 'sum',
      type: 'double',
    },
    quantity: {
      description: 'purchase quantity for the purchase event\t',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'quantity',
      aggregation: 'sum',
      type: 'double',
    },
    gross_revenue: {
      description: 'gross revenue for the purchase event in USD cents',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'total_revenue',
      aggregation: 'sum',
      type: 'double',
    },
  },
  dimensions: events.dimensions {
    purchase_state: {
      pivot: false,
      sql: "case when purchase_state = 0 then 'Unknowable' when purchase_state = 1 then 'Unverified' when purchase_state = 2 then 'Fraudulent' when purchase_state = 3 then 'Verified' when purchase_state = 4 then 'Sandbox' end",
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    currency: {
      pivot: false,
      type: 'string',
      column: 'currency',
      description: 'Currency code for the purchase event. (i.e. USD)',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
}
