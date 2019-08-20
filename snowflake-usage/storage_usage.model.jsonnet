{
 name: "snowflake_storage_usage",
 target: {database: "FIVETRAN", schema: "ACCOUNT_USAGE", table: "STORAGE_USAGE"},
 label: "storage_usage",
 measures: {},
 dimensions: {
    database_id: {
        column: "database_id"
    },
    deleted: {
        column: "deleted"
    },
    database_name: {
        column: "database_name"
    },
    usage: {
        column: "USAGE_DATE",
        timeframes: []
    },
    database_id: {
        column: "database_id"
    },
    database_id: {
        column: "database_id"
    }
 },
}