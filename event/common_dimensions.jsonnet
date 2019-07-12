{
  id: {
    description: 'An ID attached to the event at execution time and used for deduplication at the server level.',
    groupable: false,
  },
  sent_at: {
    description: 'The UTC timestamp set by library when the Segment API call was sent. This timestamp can be affected by device clock skew.',
  },
  event_text: {
    description: 'The name of the event.',
    groupable: true,
    filterable: true,
  },
  anonymous_id: {
    description: 'The anonymous ID of the user',
    category: 'Event',
    type: 'string',

  },
  context_campaign_content: {
    label: 'Campaign Content',
    category: 'Marketing',
    type: 'string',
  },
  context_campaign_medium: {
    label: 'Campaign Medium',
    category: 'Marketing',
    type: 'string',
    
  },
  context_campaign_name: {
    label: 'Campaign Name',
    category: 'Marketing',
    type: 'string',
    
  },
  context_campaign_source: {
    label: 'Campaign Source',
    category: 'Marketing',
    type: 'string',
    
  },
  context_campaign_term: {
    label: 'Campaign Term',
    category: 'Marketing',
    type: 'string',
    
  },
  context_ip: {
    label: 'User Ip',
    category: 'Event',
    type: 'string',
    
  },
  context_library_name: {
    label: 'Segment Library Name',
    category: 'Event',
    type: 'string',
    
  },
  context_library_version: {
    label: 'Segment Library Version',
    category: 'Event',
    type: 'string',
    
  },
  context_page_path: {
    category: 'Website',
    type: 'string',
    
  },
  context_page_referrer: {
    category: 'Marketing',
    type: 'string',
    
  },
  context_page_search: {
    category: 'Website',
    type: 'string',
    
  },
  context_page_title: {
    category: 'Website',
    type: 'string',
    
  },
  context_page_url: {
    category: 'Website',
    type: 'string',
    
  },
  context_user_agent: {
    category: 'Website',
    type: 'string',
    
  },
  original_timestamp: {
    description: 'The original timestamp set by the Segment library at the time the event is created. Keep in mind, this timestamp can be affected by device clock skew.',
    category: 'Event',
    type: 'timestamp',

  },
  received_at: {
    description: 'The UTC timestamp set by the Segment API when the API receives the payload from client or server.',
    category: 'Event',
    type: 'timestamp',

  },
  timestamp: {
    description: 'UTC-converted timestamp which is set by the Segment library.',
    category: 'Event',
    type: 'timestamp',

  },
  title: {
    label: 'Page Title',
    category: 'Website',
    type: 'string',
    
  },
  url: {
    label: 'Page URL',
    category: 'Website',
    type: 'string',
    
  },
  user_id: {
    category: 'Event',
    type: 'string',

  },
}
