-- grain: one row per meter and interval
select r.meter_id, r.read_at, r.kwh, m.meter_type
from {{ ref('stg_meter_reads') }} r
join {{ ref('stg_meters') }} m using (meter_id)
where r.kwh >= 0
