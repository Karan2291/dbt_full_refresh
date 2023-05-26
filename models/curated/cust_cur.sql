

{{
  config(
    materialized = 'incremental',
    unique_key= ['cust_id'],
    )
}}

SELECT * FROM {{ ref('cust_stg') }}


{# {% if is_incremental() %}
  where load_time > (select max(load_time) from {{ this }})
{% endif %} #}