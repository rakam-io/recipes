{
    name: 'snowplow_id_map'
    dimensions: {
        domain_userid: {
            description: 'User ID set by Snowplow using 1st party cookie'
        },
        user_id: {
            description: 'Unique ID set by business'
        },
        max_tstamp: {
            description: 'Timestamp that this `user_id` was most recently seen on this `domain_userid`'
        },
        idx: {
            hidden: true,
            description: 'Used for dedupliation; not for use in analysis.'
        }
    },
}
