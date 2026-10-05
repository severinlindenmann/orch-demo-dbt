{% macro cents_to_chf(column) %}({{ column }} / 100.0){% endmacro %}
