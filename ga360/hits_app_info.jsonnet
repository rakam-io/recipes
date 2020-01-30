{
  dimensions: {
    app_name: {
      sql: '{{TABLE}}.hits.appInfo.appName',
    },
    app_installer_id: {
      sql: '{{TABLE}}.hits.appInfo.appInstallerId',
    },
    app_version: {
      sql: '{{TABLE}}.hits.appInfo.appVersion',
    },
    app_id: {
      sql: '{{TABLE}}.hits.appInfo.appId',
    },
    screen_name: {
      sql: '{{TABLE}}.hits.appInfo.screenName',
    },
    landing_screen_name: {
      sql: '{{TABLE}}.hits.appInfo.landingScreenName',
    },
    exit_screen_name: {
      sql: '{{TABLE}}.hits.appInfo.exitScreenName',
    },
    screen_depth: {
      sql: '{{TABLE}}.hits.appInfo.screenDepth',
      description: 'The number of screenviews per session reported as a string. Can be useful for histograms.',
    },
  },
}
