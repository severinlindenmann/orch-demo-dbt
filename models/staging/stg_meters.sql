-- grain: one row per meter
select meter_id, meter_type, installed_on
from {{ source('raw', 'meters_v2') }}
