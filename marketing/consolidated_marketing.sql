{% set str_attrs = ['user_id', 'os_name', 'os_version', 'country', 'city'] %}

{% for channel in channels %}
  {% if loop.counter > 0 %}
    UNION ALL
  {% endif %}

  SELECT
  {% for dimension in dimensions %}
  {% endfor %}

  {% for measure in measures %}
  {% endfor %}

  FROM {{channel.target}}
{% endfor %}