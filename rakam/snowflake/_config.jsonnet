{
  version: 1.1,
  label: 'Rakam Event Type Extractor',
  variables: {
    session_duration_in_minutes: {
      label: 'Session duration',
      type: 'query',
      default: 30,
      description: 'The session duration in minutes',
      options: {
          sql: "SELECT DISTINCT event_type FROM EVENTS"
      }
    }
  },
  tags: ["segment"]
}
