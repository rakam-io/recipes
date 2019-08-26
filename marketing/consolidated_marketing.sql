{% for key, channel in channels.items() %}
  {% if loop.counter > 1 %}
  UNION ALL
  {% endif %}

  SELECT
  '{{channel.options.label}}' as channel
  {% for name, dimension in channel.mapping.items() %}
    , {{model[channel.model].dimension[dimension]}} as {{name}}
  {% endfor %}

  FROM {{model[channel.model]}}
{% endfor %}