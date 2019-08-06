{
  type: 'view',
  name: 'stripe_charges',
  label: 'Stripe Charges',
  query: |||
    SELECT charges.id,
      charges.received_at,
      charges.customer_id,
      charges.description,
      charges.failure_message,
      charges.receipt_number,
      charges.card_id,
      charges.receipt_email,
      charges.refunded,
      charges.uuid_ts,
      charges.invoice_id,
      (charges.amount / 100) AS amount,
      (charges.amount_refunded / 100) AS amount_refunded,
      charges.balance_transaction_id,
      charges.captured,
      charges.created,
      charges.currency,
      charges.failure_code,
      charges.paid,
      charges.statement_descriptor,
      charges.status
     FROM %(stripeSchema)s.charges;
  ||| % variables,
  mappings: {
    eventTimestamp: 'created',
    incremental: null,
    userId: null,
    deviceId: null,
    sessionId: null,
  },
  measures: {
    'Total Net Charges': {
      sql: 'SUM("amount") - SUM("amount_refunded")',
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
    },
    'Total Gross Charges': {
      aggregation: 'sum',
      column: 'amount',
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
    },
    'Charges Count': {
      aggregation: 'count',
      column: 'id',
      reportOptions: {},
    },
    'Total Amount Refunded': {
      aggregation: 'sum',
      column: 'amount_refunded',
      reportOptions: {
        prefix: '$',
        formatNumbers: true,
      },
    },
  },
}
