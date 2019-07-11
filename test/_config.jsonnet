{
  version: 1.1,
  label: 'Segment Event Analytics',
  description: 'It provides session and pageview analytics for Segment Warehouse. For Segment Warehouse users, it provides basic reports similar to Googl Analytics',
  variables: {
      sessionDuration: {
        "default": 30,
        "description": "The session duration of the user events",
        "label": "Session duration",
        "type": "numeric",
      },
      testTableName: {
        "default": 30,
        "description": "The session duration of the user events",
        "label": "Session duration",
        "type": "string"
      },
      model: {
        type: "model"
      },
      dimension: {
        type: "dimension",
        parent: "model"
      },
      measure: {
        type: "measure",
        parent: "model"
      }
  }
}
