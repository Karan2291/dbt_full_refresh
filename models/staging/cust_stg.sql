
{{
  config(
    materialized = 'table',
    )
}}


select * from {{ source('source_raw','customer') }}
{% if adapter.get_relation(database = this.database ,schema = this.schema, identifier=this.table) is not none and not flags.FULL_REFRESH %}
   where load_time > (select max(load_time) from {{ this }})
{% endif %}


