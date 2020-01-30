{
  dimensions: {
    continent: {
      category: 'Location',
      sql: 'geoNetwork.continent',
      description: 'The continent from which sessions originated, based on IP address.',
    },
    subcontinent: {
      category: 'Location',
      sql: 'geoNetwork.subContinent',
      description: 'The sub-continent from which sessions originated, based on IP address of the visitor.',
    },
    country: {
      category: 'Location',
      sql: 'geoNetwork.country',
      description: 'The country from which sessions originated, based on IP address.',
    },
    region: {
      category: 'Location',
      sql: 'geoNetwork.region',
      description: 'The region from which sessions originate, derived from IP addresses. In the U.S., a region is a state, such as New York.',
    },
    metro: {
      category: 'Location',
      sql: 'geoNetwork.metro',
      description: 'The Designated Market Area (DMA) from which sessions originate.',
    },
    city: {
      category: 'Location',
      sql: 'geoNetwork.city',
      description: "Users' city, derived from their IP addresses or Geographical IDs.",
    },
    network_domain: {
      category: 'Location',
      sql: 'geoNetwork.networkDomain',
      description: "The domain name of user's ISP, derived from the domain name registered to the ISP's IP address.",
    },
    latitude: {
      type: 'double',
      category: 'Location',
      column: 'CAST(geoNetwork.latitude as FLOAT64)',
      description: 'The approximate latitude of user city, derived from their IP addresses or Geographical IDs. Locations north of the equator have positive latitudes and locations south of the equator have negative latitudes.',
    },
    longitude: {
      category: 'Location',
      column: 'CAST(geoNetwork.longitude as FLOAT64)',
      description: 'The approximate longitude of user city, derived from their IP addresses or Geographical IDs. Locations east of the prime meridian have positive longitudes and locations west of the prime meridian have negative longitudes.',
    },
    network_location: {
      category: 'Location',
      sql: 'geoNetwork.networkLocation',
      description: 'The names of the service providers used to reach the property. For example, if most users of the website come via the major cable internet service providers, its value will be these service provider names.',
    },
  },
}
