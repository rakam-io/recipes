local util = import '../util.libsonnet';
local channels = import './channels.libsonnet';

local map_values = function(channel, options) {
          model: std.extVar(channel + '_model'),
          mapping: std.extVar(channel + '_mapping'),
          options: options
        };

local channel_mapping = std.mapWithKey(map_values, channels.options);

local data = std.mapWithKey(function(channel, mapping) mapping, channels.options);

{
  name: 'marketing',
  label: 'All campaigns',
  description: 'Consolidated marketing data',
  sql: util.generate_jinja_header({channels: channel_mapping}) + |||
  {% for key, channel in channels.items() %}
    {% if loop.counter > 1 %}
    UNION ALL
    {% endif %}

    SELECT
      '{{channel.options.label}}' as channel
      {% for name, value in channel.mapping.dimensions.items() %}
        , {% if value %} {{model[channel.model].dimension[value]}} {% else %} null {% endif %} as {{name}}
      {% endfor %}

    FROM {{model[channel.model]}}
  {% endfor %}
|||,
  measures: {
    click_though_rate: {
        label: "CTR",
        description: "The percent of people that click on an ad.",
        sql: "{{measure.total_clicks}}*1.0/nullif({{measure.total_impressions}},0)"
    },
    average_cost_per_conversion: {
        label: "Cost per conversion",
        description: "Cost per conversion",
        sql: "{{dimension.total_cost}}*1.0 / NULLIF({{dimension.total_conversions}},0)",
        reportOptions: {
            prefix: '$'
          },
    },
     average_value_per_conversion: {
        label: "Value per Conversion",
        sql: "sql: {{measure.total_conversion_value}*1.0 / NULLIF({{dimension.total_conversions}},0)"
      },
      average_cost_per_click: {
        label: "Cost per Click",
        sql: "{{measure.total_cost}}*1.0 / NULLIF({{measure.total_clicks}},0)"
      },
      average_value_per_click: {
        label: "Value per Click",
        sql: "{{measure.total_conversion_value}*1.0 / NULLIF({{measure.total_clicks}},0)",
        reportOptions: {
                    prefix: '$'
                  },
      },
      average_cost_per_impression: {
        label: "CPM",
            description: "Average cost per ad impression viewed.",
            sql: "{{measure.total_cost}}*1.0 / NULLIF({{measure.total_impressions}},0) * 1000.0",
             reportOptions: {
                                prefix: '$'
                              },
      },
      average_value_per_impression: {
          label: "Value per Impression",
          description: "Average value per ad impression viewed.",
          sql: "{{measure.total_conversion_value}*1.0 / NULLIF({{measure.total_impressions}},0)",
          reportOptions: {prefix: '$'},
        },

      average_value_per_cost: {
          label: "ROAS",
          description: "Average Return on Ad Spend.",
          sql: "{{measure.total_conversion_value}*1.0 / NULLIF({{measure.total_cost}},0)"
        },

         average_conversion_rate : {
          label: "Conversion Rate",
          description: "Percent of people that convert after they interact with an ad.",
          sql: "{{measure.total_conversions}*1.0 / NULLIF({{measure.total_clicks}},0)",
          reportOptions: {prefix: '%'},
        },

//         cumulative_spend : {
//          type: running_total
//          sql: ${total_cost} ;;
//          value_format_name: usd_0
//          direction: "column"
//        }
//
//         cumulative_conversions : {
//          type: running_total
//          sql: ${total_conversions} ;;
//          drill_fields: [fact.date_date, campaign.name, fact.total_cost]
//          value_format_name: decimal_0
//          direction: "column"
//        }

         total_clicks : {
          label: "Clicks",
          description: "Total ad clicks.",
          aggregation: "sum",
          sql: "{{dimension.clicks}}"
        },

         total_conversions : {
          label: "Conversions",
          description: "Total conversions.",
          aggregation: "sum",
          sql: "{{dimension.conversions}}?"
        },

         total_conversion_value :{
          label: "Conv. Value",
          description: "Total conversion value.",
          aggregation: "sum",
          sql: "{{dimension.conversion_value}}",
          reportOptions: {prefix: '$'},
        },

        total_cost : {
          label: "Cost",
          description: "Total cost.",
          aggregation: "sum",
          sql: "{{dimension.cost}}"
        },

        total_impressions : {
          label: "Impressions",
          description: "Total ad impressions.",
          aggregation:  "sum",
          sql:  "{{dimension.impressions}}"
        }
  },
  dimensions: std.mapWithKey(function(key, value) value.dimension, channels.mapping) + {
    click_through_rate: {
        description: "The percent of people that click on an ad.",
        sql: "{{dimension.clicks}}*1.0/nullif({{dimension.clicks}},0)"
    },
    cost_per_conversion: {
        sql: "{{dimension.cost}}*1.0 / NULLIF({{dimension.conversions}},0)",
        reportOptions: {prefix: '$'},
    },
    cost_per_click: {
        label: "CPC",
        description: "Cost per click",
        sql: "{{dimension.cost}}*1.0 / NULLIF({{dimension.clicks}},0)",
        reportOptions: {prefix: '$'},
    },
    cost_per_impression: {
        label: "CPM",
        description: "Average cost per 1000 ad impressions.",
        sql: "{{dimension.cost}}*1.0 / NULLIF({{dimension.impressions}},0) * 1000.0"
    },
    conversion_rate: {
        sql: "{{dimension.conversions}}*1.0 / NULLIF({{dimension.clicks}},0)"
    },
    value_per_cost: {
        label: 'ROAS',
        description: "Return on ad spend",
        sql: "{{dimension.conversion_value}}*1.0 / NULLIF(${cost},0) "
    }
  },
}
