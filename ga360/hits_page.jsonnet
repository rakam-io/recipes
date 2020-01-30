local util = import '../util.libsonnet';

{
  dimensions: {
    page_path: {
      sql: '{{TABLE}}.page.pagePath',
    },
    host_hame: {
      sql: '{{TABLE}}.page.hostName',
    },
    page_title: {
      sql: '{{TABLE}}.page.pageTitle',
    },
    page_search_keyword: {
      sql: '{{TABLE}}.page.searchKeyword',
    },
    page_search_category: {
      sql: '{{TABLE}}.page.searchCategory',
    },
  },
}
