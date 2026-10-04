-- grain: one row per meter and interval
select meter_id, read_at, kwh
from {{ source('raw', 'meter_reads') }}
