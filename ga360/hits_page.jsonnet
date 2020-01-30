local util = import '../util.libsonnet';

{
  dimensions: {
    page_path: {
      sql: '{{TABLE}}.hits.page.pagePath',
    },
    host_hame: {
      sql: '{{TABLE}}.hits.page.hostName',
    },
    page_title: {
      sql: '{{TABLE}}.hits.page.pageTitle',
    },
    page_search_keyword: {
      sql: '{{TABLE}}.hits.page.searchKeyword',
    },
    page_search_category: {
      sql: '{{TABLE}}.hits.page.searchCategory',
    },
  },
}
