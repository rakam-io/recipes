{
  dimensions: {
    app_name: {
      sql: '{{TABLE}}.appInfo.appName',
    },
    app_installer_id: {
      sql: '{{TABLE}}.appInfo.appInstallerId',
    },
    app_version: {
      sql: '{{TABLE}}.appInfo.appVersion',
    },
    app_id: {
      sql: '{{TABLE}}.appInfo.appId',
    },
    screen_name: {
      sql: '{{TABLE}}.appInfo.screenName',
    },
    landing_screen_name: {
      sql: '{{TABLE}}.appInfo.landingScreenName',
    },
    exit_screen_name: {
      sql: '{{TABLE}}.appInfo.exitScreenName',
    },
    screen_depth: {
      sql: '{{TABLE}}.appInfo.screenDepth',
      description: 'The number of screenviews per session reported as a string. Can be useful for histograms.',
    },
  },
}
