select * from {{ ref('departments_cloud') }} where department_name is null 
                          or department_id <= 0