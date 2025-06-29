select  locationid as location_id, 
        borough, 
        zone  
     
from {{ source('raw', 'zones') }}

  