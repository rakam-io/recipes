{
  dimensions: {
    domain_lookup_time: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.domainLookupTime',
      description: 'The total time (in milliseconds) all samples spent in DNS lookup for this page.',
    },
    dom_content_loaded_time: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.domContentLoadedTime',
      description: "The time (in milliseconds), including the network time from users' locations to the site's server, the browser takes to parse the document and execute deferred and parser-inserted scripts (DOMContentLoaded).",
    },
    dom_interactive_time: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.domInteractiveTime',
      description: "The time (in milliseconds), including the network time from users' locations to the site's server, the browser takes to parse the document (DOMInteractive).",
    },
    dom_latency_metrics_sample: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.domLatencyMetricsSample',
      description: 'Sample set (or count) of pageviews used to calculate the averages for site speed DOM metrics.',
    },
    page_download_time: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.pageDownloadTime',
      description: 'The total time (in milliseconds) to download this page among all samples.',
    },
    page_load_sample: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.pageLoadSample',
      description: 'The sample set (or count) of pageviews used to calculate the average page load time.',
    },
    page_load_time: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.pageLoadTime',
      description: 'Total time (in milliseconds), from pageview initiation (e.g., a click on a page link) to page load completion in the browser, the pages in the sample set take to load.',
    },
    redirection_time: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.redirectionTime',
      description: 'The total time (in milliseconds) all samples spent in redirects before fetching this page. If there are no redirects, this is 0.',
    },
    server_connection_time: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.serverConnectionTime',
      description: 'Total time (in milliseconds) all samples spent in establishing a TCP connection to this page.',
    },
    server_response_time: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.serverResponseTime',
      description: "The total time (in milliseconds) the site's server takes to respond to users' requests among all samples; this includes the network time from users' locations to the server",
    },
    speed_metrics_sample: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.speedMetricsSample',
      description: 'The sample set (or count) of pageviews used to calculate the averages of site speed metrics.',
    },
    user_timing_category: {
      category: 'Latency',
      type: 'string',
      sql: '{{TABLE}}.latencyTracking.userTimingCategory',
      description: 'For easier reporting purposes, this is used to categorize all user timing variables into logical groups.',
    },
    user_timing_label: {
      category: 'Latency',
      type: 'string',
      sql: '{{TABLE}}.latencyTracking.userTimingLabel',
      description: "The name of the resource's action being tracked.",
    },
    user_timing_sample: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.userTimingSample',
      description: 'The number of hits sent for a particular userTimingCategory, userTimingLabel, or userTimingVariable.',
    },
    user_timing_value: {
      category: 'Latency',
      type: 'integer',
      sql: '{{TABLE}}.latencyTracking.userTimingValue',
      description: 'Total number of milliseconds for user timing.',
    },
    user_timing_variable: {
      category: 'Latency',
      type: 'string',
      sql: '{{TABLE}}.latencyTracking.userTimingVariable',
      description: 'Variable used to add flexibility to visualize user timings in the reports.',
    },
  },
}
