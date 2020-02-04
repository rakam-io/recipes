    {
      "name": "VITAL (Revenue)",
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
            "model": "firebase_event_in_app_purchase",
            "dimension": "country"
          },
          "isRequired": false
        },
        {
          "name": "Continent",
          "type": "dimension",
          "value": {
            "model": "firebase_event_in_app_purchase",
            "dimension": "continent"
          },
          "isRequired": false
        },
        {
          "name": "Install Source",
          "type": "dimension",
          "value": {
            "model": "firebase_event_in_app_purchase",
            "dimension": "install_source"
          },
          "isRequired": false
        },
        {
          "name": "Version",
          "type": "dimension",
          "value": {
            "model": "firebase_event_in_app_purchase",
            "dimension": "version"
          },
          "isRequired": false
        },
        {
          "name": "Platform",
          "type": "dimension",
          "value": {
            "model": "firebase_event_in_app_purchase",
            "dimension": "platform"
          },
          "isRequired": false
        }
      ],
      "reports": [
        {
          "name": "Revenue",
          "x": 0,
          "y": 0,
          "h": 2,
          "w": 6,
          "component": "r-table",
          "type": 1,
          "reportOptions": {
            "modelName": "firebase_event_in_app_purchase",
            "dimensions": [
              {
                "name": "event_timestamp",
                "modelName": "firebase_event_in_app_purchase",
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
                "name": "revenue_from_new_users",
                "modelName": "firebase_event_in_app_purchase",
                "relationName": null
              },
              {
                "name": "revenue_from_retained_users",
                "modelName": "firebase_event_in_app_purchase",
                "relationName": null
              },
              {
                "name": "revenue_from_whales",
                "modelName": "firebase_event_in_app_purchase",
                "relationName": null
              },
              {
                "name": "revenue_whales_ratio",
                "modelName": "firebase_event_in_app_purchase",
                "relationName": null
              },
              {
                "name": "revenue",
                "modelName": "firebase_event_in_app_purchase",
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
          "name": "Revenue Conversion",
          "x": 0,
          "y": 2,
          "h": 2,
          "w": 6,
          "component": "r-table",
          "type": 1,
          "reportOptions": {
            "modelName": "firebase_event_in_app_purchase",
            "dimensions": [
              {
                "name": "event_timestamp",
                "modelName": "firebase_event_in_app_purchase",
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
                "name": "average_transaction_per_paying_user",
                "modelName": "firebase_event_in_app_purchase",
                "relationName": null
              },
              {
                "name": "transaction_count_per_paying_user",
                "modelName": "firebase_event_in_app_purchase",
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