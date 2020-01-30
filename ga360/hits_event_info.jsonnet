{
  dimensions: {
    event_category: {
      sql: '{{TABLE}}.hits.eventInfo.eventCategory',
    },
    event_action: {
      sql: '{{TABLE}}.hits.eventInfo.eventAction',
    },
    event_label: {
      sql: '{{TABLE}}.hits.eventInfo.eventLabel',
    },
    event_value: {
      sql: '{{TABLE}}.hits.eventInfo.eventValue',
    },
  },
}
