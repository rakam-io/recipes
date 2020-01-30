{
  domainLookupTime: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.domainLookupTime',
    description: 'The total time (in milliseconds) all samples spent in DNS lookup for this page.',
  },
  domContentLoadedTime: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.domContentLoadedTime',
    description: "The time (in milliseconds), including the network time from users' locations to the site's server, the browser takes to parse the document and execute deferred and parser-inserted scripts (DOMContentLoaded).",
  },
  domInteractiveTime: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.domInteractiveTime',
    description: "The time (in milliseconds), including the network time from users' locations to the site's server, the browser takes to parse the document (DOMInteractive).",
  },
  domLatencyMetricsSample: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.domLatencyMetricsSample',
    description: 'Sample set (or count) of pageviews used to calculate the averages for site speed DOM metrics.',
  },
  pageDownloadTime: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.pageDownloadTime',
    description: 'The total time (in milliseconds) to download this page among all samples.',
  },
  pageLoadSample: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.pageLoadSample',
    description: 'The sample set (or count) of pageviews used to calculate the average page load time.',
  },
  pageLoadTime: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.pageLoadTime',
    description: 'Total time (in milliseconds), from pageview initiation (e.g., a click on a page link) to page load completion in the browser, the pages in the sample set take to load.',
  },
  redirectionTime: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.redirectionTime',
    description: 'The total time (in milliseconds) all samples spent in redirects before fetching this page. If there are no redirects, this is 0.',
  },
  serverConnectionTime: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.serverConnectionTime',
    description: 'Total time (in milliseconds) all samples spent in establishing a TCP connection to this page.',
  },
  serverResponseTime: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.serverResponseTime',
    description: "The total time (in milliseconds) the site's server takes to respond to users' requests among all samples; this includes the network time from users' locations to the server",
  },
  speedMetricsSample: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.speedMetricsSample',
    description: 'The sample set (or count) of pageviews used to calculate the averages of site speed metrics.',
  },
  userTimingCategory: {
    type: 'string',
    sql: '{{TABLE}}.hits.latencyTracking.userTimingCategory',
    description: 'For easier reporting purposes, this is used to categorize all user timing variables into logical groups.',
  },
  userTimingLabel: {
    type: 'string',
    sql: '{{TABLE}}.hits.latencyTracking.userTimingLabel',
    description: "The name of the resource's action being tracked.",
  },
  userTimingSample: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.userTimingSample',
    description: 'The number of hits sent for a particular userTimingCategory, userTimingLabel, or userTimingVariable.',
  },
  userTimingValue: {
    type: 'integer',
    sql: '{{TABLE}}.hits.latencyTracking.userTimingValue',
    description: 'Total number of milliseconds for user timing.',
  },
  userTimingVariable: {
    type: 'string',
    sql: '{{TABLE}}.hits.latencyTracking.userTimingVariable',
    description: 'Variable used to add flexibility to visualize user timings in the reports.',
  },
}
