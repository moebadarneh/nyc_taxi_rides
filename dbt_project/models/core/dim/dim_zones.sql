{{
  config(
    materialized = 'table',
    )
}}

select 
    location_id, 
    borough, 
    zone 

from {{ ref('raw_zones') }}