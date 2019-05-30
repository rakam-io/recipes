{
  version: 1.1,
  name: 'Segment Recipe',
  description: 'It provides session and pageview analytics for Segment Warehouse. For Segment Warehouse users, it provides basic reports similar to Googl Analytics',
  image: '',
  variables: {
    sessionDurationInMinutes: {
      label: 'Session duration',
      type: 'numeric',
      default: 30,
      description: 'The session duration of the user events',
    },
    addToBasket: {
      type: 'table-select',
      default: 30,
      description: 'The session duration of the user events',
    },
  },
}
