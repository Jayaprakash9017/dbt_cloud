select *
 from {{ ref('locations_cloud') }} 
 where location_id is null
 or city is null
