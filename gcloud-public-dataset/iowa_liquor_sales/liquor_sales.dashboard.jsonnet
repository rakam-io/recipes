{
  name: 'Liquor Sales',
  filterSchema: [
    {
      name: 'Date',
      type: 'mappingDimension',
      value: {
        name: 'eventTimestamp',
      },
      defaultValue: 'P14D',
      isRequired: true,
    },
  ],
  reports: [
    {
      name: 'Annual Sales in Bottles of Stores',
      ttl: 'PT1H',
      x: 0,
      y: 2,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'sales',
        dimensions: [
          {
            name: 'date',
            modelName: 'sales',
            relationName: null,
            postOperation: {
              type: 'date',
              value: 'year',
            },
            pivot: false,
          },
          {
            name: 'store_name',
            modelName: 'sales',
            relationName: null,
            postOperation: null,
            pivot: true,
          },
        ],
        measures: [
          {
            name: 'total_bottles_sold',
            modelName: 'sales',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'line',
            columnOptions: [],
          },
          tableOptions: {
            columnOptions: [],
          },
          columnOptions: null,
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null,
      },
    },
    {
      name: 'Total Sales in Years',
      description: 'Total bottles sold of beverage types at years',
      ttl: 'PT1H',
      x: 3,
      y: 2,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'sales',
        dimensions: [
          {
            name: 'date',
            modelName: 'sales',
            relationName: null,
            postOperation: {
              type: 'date',
              value: 'year',
            },
            pivot: false,
          },
          {
            name: 'item_description',
            modelName: 'sales',
            relationName: null,
            postOperation: null,
            pivot: true,
          },
        ],
        measures: [
          {
            name: 'total_bottles_sold',
            modelName: 'sales',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'bar',
            columnOptions: [],
          },
          tableOptions: {
            columnOptions: [],
          },
          columnOptions: null,
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null,
      },
    },
    // {
    //     "name": "Most Sold Bevarage per Month",
    //     "ttl": "PT1H",
    //     "x": 3,
    //     "y": 6,
    //     "h": 2,
    //     "w": 3,
    //     "component": "r-sql-table",
    //     "type": 4,
    //     "reportOptions": {
    //         "query": "SELECT t1.item_description, DATE_TRUNC(t1.date,MONTH) AS date\nFROM(\n\tSELECT item_description, DATE_TRUNC(date, MONTH) AS date, SUM(bottles_sold) AS totalSold\n\tFROM sales\n\tGROUP BY date, item_description\n\t) AS t1\nJOIN(\n\tSELECT  DATE_TRUNC(date, MONTH) AS date, MAX(totalSold) AS maxSold\n\tFROM(\n\t\t\tSELECT DATE_TRUNC(date, MONTH) AS date, item_description,  SUM(bottles_sold) AS totalSold\n\t\t\tFROM sales\n\t\t\tGROUP BY date, item_description\n\t\t)\n\tGROUP BY date\n\t)AS t2\nON \tt1.date = t2.date AND\n\tt1.totalSold = t2.maxSold\nGROUP BY t1.date, t1.item_description",
    //         "queryOptions": {
    //             "limit": 1000,
    //             "defaultSchema": null,
    //             "useCache": false
    //         },
    //         "variables": [],
    //         "reportOptions": {
    //             "measures": [],
    //             "dimensions": [],
    //             "pivots": [],
    //             "chartOptions": {
    //                 "type": null,
    //                 "columnOptions": []
    //             },
    //             "tableOptions": {
    //                 "enableFilter": true,
    //                 "columnOptions": []
    //             },
    //             "columnOptions": [],
    //             "segmentedColumnOptions": null,
    //             "enableStatistics": null
    //         },
    //         "version": null
    //     }
    // },
    // {
    //     "name": "Most Sold Bevarage per Year",
    //     "ttl": "PT1H",
    //     "x": 3,
    //     "y": 4,
    //     "h": 2,
    //     "w": 3,
    //     "component": "r-sql-table",
    //     "type": 4,
    //     "reportOptions": {
    //         "query": "SELECT t1.item_description, DATE_TRUNC(t1.date,YEAR) AS date\nFROM(\n\tSELECT item_description, DATE_TRUNC(date, YEAR) AS date, SUM(bottles_sold) AS totalSold\n\tFROM sales\n\tGROUP BY date, item_description\n\t) AS t1\nJOIN(\n\tSELECT  DATE_TRUNC(date, YEAR) AS date, MAX(totalSold) AS maxSold\n\tFROM(\n\t\t\tSELECT DATE_TRUNC(date, YEAR) AS date, item_description,  SUM(bottles_sold) AS totalSold\n\t\t\tFROM sales\n\t\t\tGROUP BY date, item_description\n\t\t)\n\tGROUP BY date\n\t)AS t2\nON \tt1.date = t2.date AND\n\tt1.totalSold = t2.maxSold\nGROUP BY t1.date, t1.item_description",
    //         "queryOptions": {
    //             "limit": 5000,
    //             "defaultSchema": null,
    //             "useCache": false
    //         },
    //         "variables": [],
    //         "reportOptions": {
    //             "measures": [],
    //             "dimensions": [],
    //             "pivots": [],
    //             "chartOptions": {
    //                 "type": null,
    //                 "columnOptions": []
    //             },
    //             "tableOptions": {
    //                 "enableFilter": true,
    //                 "columnOptions": []
    //             },
    //             "columnOptions": [
    //                 {}
    //             ],
    //             "segmentedColumnOptions": null,
    //             "enableStatistics": null
    //         },
    //         "version": null
    //     }
    // },
    {
      name: 'Total Sales in Months',
      ttl: 'PT1H',
      x: 0,
      y: 4,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'sales',
        dimensions: [
          {
            name: 'date',
            modelName: 'sales',
            relationName: null,
            postOperation: {
              type: 'date',
              value: 'month',
            },
            pivot: false,
          },
          {
            name: 'item_description',
            modelName: 'sales',
            relationName: null,
            postOperation: null,
            pivot: true,
          },
        ],
        measures: [
          {
            name: 'total_bottles_sold',
            modelName: 'sales',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'bar',
            columnOptions: [],
          },
          tableOptions: {
            columnOptions: [],
          },
          columnOptions: null,
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null,
      },
    },
    {
      name: 'Monthly Sales of Stores in Bottle',
      ttl: 'PT1H',
      x: 3,
      y: 0,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'sales',
        dimensions: [
          {
            name: 'date',
            modelName: 'sales',
            relationName: null,
            postOperation: {
              type: 'date',
              value: 'month',
            },
            pivot: false,
          },
          {
            name: 'store_name',
            modelName: 'sales',
            relationName: null,
            postOperation: null,
            pivot: true,
          },
        ],
        measures: [
          {
            name: 'total_bottles_sold',
            modelName: 'sales',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'line',
            columnOptions: [],
          },
          tableOptions: {
            columnOptions: [],
          },
          columnOptions: null,
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null,
      },
    },
    {
      name: 'Total Sales in Dollars per Year',
      ttl: 'PT1H',
      x: 0,
      y: 1,
      h: 1,
      w: 3,
      component: 'r-segmentation-chart',
      type: 1,
      reportOptions: {
        modelName: 'sales',
        dimensions: [
          {
            name: 'date',
            modelName: 'sales',
            relationName: null,
            postOperation: {
              type: 'date',
              value: 'year',
            },
            pivot: false,
          },
          {
            name: 'store_name',
            modelName: 'sales',
            relationName: null,
            postOperation: null,
            pivot: true,
          },
        ],
        measures: [
          {
            name: 'total_sale_dollars',
            modelName: 'sales',
            relationName: null,
          },
        ],
        reportOptions: {
          chartOptions: {
            type: 'bar',
            columnOptions: [],
          },
          tableOptions: {
            columnOptions: [],
          },
          columnOptions: null,
        },
        defaultDateRange: 'P14D',
        limit: 1000,
        filters: null,
      },
    },
    // {
    //     "name": "Most Sold Bevarage in Stores",
    //     "description": "Monthly most sold bevarage in every store",
    //     "ttl": "PT1H",
    //     "x": 0,
    //     "y": 0,
    //     "h": 1,
    //     "w": 3,
    //     "component": "r-sql-table",
    //     "type": 4,
    //     "reportOptions": {
    //         "query": "SELECT DATE_TRUNC(t1.date,MONTH) AS date, t1.store_name, t1.item_description\nFROM(\n\t\t\t\tSELECT DATE_TRUNC(date, MONTH) AS date, store_name, item_description,  SUM(bottles_sold) AS totalSold\n\t\t\t\tFROM sales\n\t\t\t\tGROUP BY date, item_description, store_name\n\t) AS t1\nJOIN(\n\t\tSELECT  DATE_TRUNC(date, MONTH) AS date, store_name, MAX(totalSold) AS maxSold \n\t\tFROM(\n\t\t\t\tSELECT DATE_TRUNC(date, MONTH) AS date, store_name, item_description,  SUM(bottles_sold) AS totalSold\n\t\t\t\tFROM sales\n\t\t\t\tGROUP BY date, item_description, store_name\n\t\t\t)\n\t\tGROUP BY date, store_name\n\t)AS t2\nON \tt1.date = t2.date AND\n\tt1.totalSold = t2.maxSold AND\n\tt1.store_name = t2.store_name\nGROUP BY t1.date, t1.store_name, t1.item_description",
    //         "queryOptions": {
    //             "limit": 1000,
    //             "defaultSchema": null,
    //             "useCache": false
    //         },
    //         "variables": [],
    //         "reportOptions": {
    //             "measures": [],
    //             "dimensions": [],
    //             "pivots": [],
    //             "chartOptions": {
    //                 "type": null,
    //                 "columnOptions": []
    //             },
    //             "tableOptions": {
    //                 "enableFilter": true,
    //                 "columnOptions": []
    //             },
    //             "columnOptions": [],
    //             "segmentedColumnOptions": null,
    //             "enableStatistics": null
    //         },
    //         "version": null
    //     }
    // }
  ],
}
