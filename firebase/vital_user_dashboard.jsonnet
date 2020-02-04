    {
      "name": "VITAL (User)",
      "category": "Firebase",
      "filterSchema": [
        {
          "name": "Date",
          "type": "mappingDimension",
          "value": {
            "name": "eventTimestamp"
          },
          "defaultValue": "P14D",
          "isRequired": true
        },
        {
          "name": "Country",
          "type": "dimension",
          "value": {
            "model": "firebase_events",
            "dimension": "country"
          },
          "isRequired": false
        },
        {
          "name": "Continent",
          "type": "dimension",
          "value": {
            "model": "firebase_events",
            "dimension": "continent"
          },
          "isRequired": false
        },
        {
          "name": "Install Source",
          "type": "dimension",
          "value": {
            "model": "firebase_events",
            "dimension": "install_source"
          },
          "isRequired": false
        },
        {
          "name": "Version",
          "type": "dimension",
          "value": {
            "model": "firebase_events",
            "dimension": "version"
          },
          "isRequired": false
        },
        {
          "name": "Platform",
          "type": "dimension",
          "value": {
            "model": "firebase_events",
            "dimension": "platform"
          },
          "isRequired": false
        }
      ],
      "reports": [
        {
          "name": "Users",
          "x": 0,
          "y": 0,
          "h": 2,
          "w": 6,
          "component": "r-table",
          "type": 1,
          "reportOptions": {
            "modelName": "firebase_events",
            "dimensions": [
              {
                "name": "event_timestamp",
                "modelName": "firebase_events",
                "relationName": null,
                "postOperation": {
                  "type": "timestamp",
                  "value": "day"
                },
                "pivot": false
              }
            ],
            "measures": [
              {
                "name": "active_users",
                "modelName": "firebase_events",
                "relationName": null
              },
              {
                "name": "all_users",
                "modelName": "firebase_events",
                "relationName": null
              },
              {
                "name": "new_users",
                "modelName": "firebase_events",
                "relationName": null
              },
              {
                "name": "paying_users",
                "modelName": "firebase_events",
                "relationName": null
              },
              {
                "name": "whales_playing",
                "modelName": "firebase_events",
                "relationName": null
              }
            ],
            "reportOptions": {
              "chartOptions": {
                "type": null,
                "columnOptions": []
              },
              "tableOptions": {
                "columnOptions": []
              },
              "columnOptions": null
            },
            "defaultDateRange": "P14D",
            "limit": 1000,
            "filters": null,
            "orders": null
          }
        },
        {
          "name": "ARPU",
          "x": 0,
          "y": 2,
          "h": 2,
          "w": 3,
          "component": "r-table",
          "type": 1,
          "reportOptions": {
            "modelName": "firebase_events",
            "dimensions": [
              {
                "name": "event_timestamp",
                "modelName": "firebase_events",
                "relationName": null,
                "postOperation": {
                  "type": "timestamp",
                  "value": "day"
                },
                "pivot": false
              }
            ],
            "measures": [
              {
                "name": "average_revenue_per_new_user",
                "modelName": "firebase_events",
                "relationName": null
              },
              {
                "name": "average_revenue_per_user",
                "modelName": "firebase_events",
                "relationName": null
              },
              {
                "name": "average_revenue_per_retained_user",
                "modelName": "firebase_events",
                "relationName": null
              }
            ],
            "reportOptions": {
              "chartOptions": {
                "type": null,
                "columnOptions": []
              },
              "tableOptions": {
                "columnOptions": []
              },
              "columnOptions": null
            },
            "defaultDateRange": "P14D",
            "limit": 1000,
            "filters": null,
            "orders": null
          }
        },
        {
          "name": "User Conversion",
          "x": 3,
          "y": 2,
          "h": 2,
          "w": 3,
          "component": "r-table",
          "type": 1,
          "reportOptions": {
            "modelName": "firebase_events",
            "dimensions": [
              {
                "name": "event_timestamp",
                "modelName": "firebase_events",
                "relationName": null,
                "postOperation": {
                  "type": "timestamp",
                  "value": "day"
                },
                "pivot": false
              }
            ],
            "measures": [
              {
                "name": "percent_new_users_paying",
                "modelName": "firebase_events",
                "relationName": null
              },
              {
                "name": "percent_retained_users_paying",
                "modelName": "firebase_events",
                "relationName": null
              }
            ],
            "reportOptions": {
              "chartOptions": {
                "type": null,
                "columnOptions": []
              },
              "tableOptions": {
                "columnOptions": []
              },
              "columnOptions": null
            },
            "defaultDateRange": "P14D",
            "limit": 1000,
            "filters": null,
            "orders": null
          }
        }
      ]
    }