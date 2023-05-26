{% macro check_model_exists(model_name, schema_name) %}
  SELECT EXISTS (
    SELECT 1
    FROM information_schema.tables
    WHERE table_schema = '{{ schema_name }}'
    AND table_name = '{{ model_name }}'
  ) AS model_exists;
{% endmacro %}
