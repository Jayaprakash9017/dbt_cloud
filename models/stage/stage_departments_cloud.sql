{{
    config(
        materialized = 'table',
        database = 'HR',
        unique_key = 'department_id',
        on_schema_change = 'append_new_columns'
    )
}}

select 
    d.department_name,
    d.department_id,
    l.city,
    c.country_name
from {{ ref('departments_cloud')}} d join {{ ref('locations_cloud')}} l 
    on d.location_id = l.location_id 
    join {{ source('hr1', 'COUNTRIES') }} c
    on l.country_id = c.country_id
    