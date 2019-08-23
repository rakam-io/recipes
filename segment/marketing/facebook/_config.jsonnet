{
  version: 1.0,
  label: 'Segment Facebook Marketing Destination',
  description: 'It provides marketing reports for your Facebook destinations',
  image: 'https://github.com/rakam-io/recipes/raw/master/segment/logo.png',
  variables: {
    schema: {
      label: 'Segment Adwords Schema',
      type: 'schema',
      default: {schema: 'adwords'},
      description: 'The Facebook Schema that you ingest the data. The schema must have tables such as facebook_ads, facebook_ad_accounts, facebook_campaigns etc.',
    }
  },
  tags: ["segment", "marketing"]
}
