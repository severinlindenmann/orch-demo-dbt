-- grain: one row per meter type
select *
from {{ ref('stg_meters') }}
