-- grain: one row per meter and interval
{{ config(materialized='incremental', unique_key=['meter_id', 'read_at']) }}
select meter_id, read_at, kwh
from {{ ref('stg_meter_reads') }}
{% if is_incremental() %}
where read_at > (select max(read_at) from {{ this }})
{% endif %}
