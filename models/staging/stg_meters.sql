-- grain: one row per meter
select meter_id, meterType as meter_type, installed_on
from {{ source('raw', 'meters') }}
