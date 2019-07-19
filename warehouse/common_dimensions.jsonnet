{
  id: {
    description: 'An ID attached to the event at execution time and used for deduplication at the server level.',
        column : 'id'
,postOperations: []
  },
  sent_at: {
    description: 'The UTC timestamp set by library when the Segment API call was sent. This timestamp can be affected by device clock skew.',
        column : 'sent_at'
,postOperations: []

  },
  event_text: {
    description: 'The name of the event.',
        column : 'event_text'
,postOperations: []

  },
  anonymous_id: {
    description: 'The anonymous ID of the user',
    category: 'Event',
    type: 'string',
    column : 'anonymous_id'
    ,postOperations: []

  },
  context_campaign_content: {
    label: 'Campaign Content',
    category: 'Marketing',
    type: 'string',
        column : 'context_campaign_content'
        ,postOperations: []


  },
  context_campaign_medium: {
    label: 'Campaign Medium',
    category: 'Marketing',
    type: 'string',
        column : 'context_campaign_medium'
,postOperations: []

  },
  context_campaign_name: {
    label: 'Campaign Name',
    category: 'Marketing',
    type: 'string',
        column : 'context_campaign_name'
,postOperations: []

  },
  context_campaign_source: {
    label: 'Campaign Source',
    category: 'Marketing',
    type: 'string',
        column : 'context_campaign_source'
,postOperations: []

  },
  context_campaign_term: {
    label: 'Campaign Term',
    category: 'Marketing',
    type: 'string',
        column : 'context_campaign_term'
,postOperations: []

  },
  context_ip: {
    label: 'User Ip',
    category: 'Event',
    type: 'string',
        column : 'context_ip'
,postOperations: []

  },
  context_library_name: {
    label: 'Segment Library Name',
    category: 'Event',
    type: 'string',
        column : 'context_library_name'
,postOperations: []

  },
  context_library_version: {
    label: 'Segment Library Version',
    category: 'Event',
    type: 'string',
        column : 'context_library_version'
,postOperations: []

  },
  context_page_path: {
    category: 'Website',
    type: 'string',
        column : 'context_page_path'
,postOperations: []

  },
  context_page_referrer: {
    category: 'Marketing',
    type: 'string',
        column : 'context_page_referrer'
,postOperations: []

  },
  context_page_search: {
    category: 'Website',
    type: 'string',
        column : 'context_page_search'
,postOperations: []

  },
  context_page_title: {
    category: 'Website',
    type: 'string',
        column : 'context_page_title'
,postOperations: []

  },
  context_page_url: {
    category: 'Website',
    type: 'string',
        column : 'context_page_url'
,postOperations: []

  },
  context_user_agent: {
    category: 'Website',
    type: 'string',
        column : 'context_user_agent'
,postOperations: []

  },
  original_timestamp: {
    description: 'The original timestamp set by the Segment library at the time the event is created. Keep in mind, this timestamp can be affected by device clock skew.',
    category: 'Event',
    type: 'timestamp',
    column : 'original_timestamp'
,postOperations: []

  },
  received_at: {
    description: 'The UTC timestamp set by the Segment API when the API receives the payload from client or server.',
    category: 'Event',
    type: 'timestamp',
    column : 'received_at'
,postOperations: []

  },
  timestamp: {
    description: 'UTC-converted timestamp which is set by the Segment library.',
    category: 'Event',
    type: 'timestamp',
    column : 'timestamp'
,postOperations: []

  },
  title: {
    label: 'Page Title',
    category: 'Website',
    type: 'string',
        column : 'title'
,postOperations: []

  },
  url: {
    label: 'Page URL',
    category: 'Website',
    type: 'string',
        column : 'url'
,postOperations: []

  },
  user_id: {
    category: 'Event',
    type: 'string',
    column : 'user_id'
,postOperations: []

  },
}
