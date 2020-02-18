{
  name: 'intercom_users',
  hidden: false,
  target: std.mergePatch(std.extVar('schema'), { table: 'users' }),
  category: 'Intercom',
  label: 'Users',
  description: 'The Users resource is the primary way of interacting with Intercom. You can create, update and delete your users, and add custom attributes describing them. Users can be viewed individually or as a list, and can queried using tags or segments. For more info, check out the [Intercom docs](https://developers.intercom.io/docs/users).',
  mappings: {
    incremental: 'user_id',
    userId: 'user_id',
  },
  dimensions: {
    id: {
      label: 'Intercom Id',
      pivot: false,
      type: 'string',
      column: 'id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    email: {
      pivot: false,
      type: 'string',
      column: 'email',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    location_postal_code: {
      pivot: false,
      type: 'string',
      column: 'location_postal_code',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    pseudonym: {
      pivot: false,
      type: 'string',
      column: 'pseudonym',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    location_country_name: {
      pivot: false,
      type: 'string',
      column: 'location_country_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    remote_created_at: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
        'dayOfWeek',
      ],
      type: 'timestamp',
      column: 'remote_created_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    user_agent_data: {
      pivot: false,
      type: 'string',
      column: 'user_agent_data',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    avatar_image_url: {
      pivot: false,
      type: 'string',
      column: 'avatar_image_url',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    unsubscribed_from_emails: {
      pivot: false,
      type: 'boolean',
      column: 'unsubscribed_from_emails',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    last_seen_ip: {
      pivot: false,
      type: 'string',
      column: 'last_seen_ip',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    user_id: {
      pivot: false,
      type: 'string',
      column: 'user_id',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    location_continent_code: {
      pivot: false,
      type: 'string',
      column: 'location_continent_code',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    signed_up_at: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
        'dayOfWeek',
      ],
      type: 'timestamp',
      column: 'signed_up_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    updated_at: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
        'dayOfWeek',
      ],
      type: 'timestamp',
      column: 'updated_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    created_at: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
        'dayOfWeek',
      ],
      type: 'timestamp',
      column: 'created_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    location_city_name: {
      pivot: false,
      type: 'string',
      column: 'location_city_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    location_region_name: {
      pivot: false,
      type: 'string',
      column: 'location_region_name',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    uuid_ts: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
        'dayOfWeek',
      ],
      type: 'timestamp',
      column: 'uuid_ts',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    last_request_at: {
      pivot: false,
      timeframes: [
        'hour',
        'day',
        'week',
        'month',
        'year',
        'hourOfDay',
        'dayOfMonth',
        'weekOfYear',
        'monthOfYear',
        'quarterOfYear',
        'dayOfWeek',
      ],
      type: 'timestamp',
      column: 'last_request_at',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    segments: {
      pivot: false,
      type: 'string',
      column: 'segments',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
    location_country_code: {
      pivot: false,
      type: 'string',
      column: 'location_country_code',
      reportOptions: {
        formatNumbers: true,
      },
      hidden: false,
    },
  },
  measures: {
    count_all_rows: {
      description: 'Counts All Rows',
      reportOptions: {
        formatNumbers: true,
      },
      aggregation: 'count',
      type: 'double',
      hidden: false,
    },
    sum_of_custom_active_project_id: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'custom_active_project_id',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_session_count: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'session_count',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_location_latitude: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'location_latitude',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_location_longitude: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'location_longitude',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_custom_stripe_account_balance: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'custom_stripe_account_balance',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_custom_stripe_last_charge_amount: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'custom_stripe_last_charge_amount',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_custom_stripe_subscription_period_start_at: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'custom_stripe_subscription_period_start_at',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_custom_stripe_card_expires_at: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'custom_stripe_card_expires_at',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_custom_stripe_last_charge_at: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'custom_stripe_last_charge_at',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_custom_stripe_plan_price: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'custom_stripe_plan_price',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_custom_user_id: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'custom_user_id',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_custom_clearbit_enriched_at: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'custom_clearbit_enriched_at',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_custom_clearbit_company_indexed_at: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'custom_clearbit_company_indexed_at',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    sum_of_custom_clearbit_person_indexed_at: {
      reportOptions: {
        formatNumbers: true,
      },
      column: 'custom_clearbit_person_indexed_at',
      aggregation: 'sum',
      type: 'double',
      hidden: false,
    },
    count_unique_users: {
      description: 'Counts Unique Users',
      reportOptions: {
        formatNumbers: true,
      },
      column: 'user_id',
      aggregation: 'countUnique',
      type: 'double',
      hidden: false,
    },
  },
}
