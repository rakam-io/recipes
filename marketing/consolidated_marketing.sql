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