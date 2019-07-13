{
  version: 1.1,
  label: 'Segment Event Analytics',
  description: 'It provides session and pageview analytics for Segment Warehouse. For Segment Warehouse users, it provides basic reports similar to Googl Analytics',
  variables: {
    sessionDurationInMinutes: {
      label: 'Session duration',
      type: 'numeric',
      default: 30,
      description: 'The session duration of the user events',
    },
    pages: {
      label: 'Segment Table',
      type: 'table',
      default: {table: 'pages'},
      description: 'The pages table in your Segment Destionation. See: https://segment.com/docs/destinations/#warehouse-schemas',
    }
  },
}
