{{
    config(
        materialized = 'table',
        database = 'HR',
        unique_key = 'employee_id',
        on_schema_change = 'append_new_columns'
    )
}}

select e.*
    from {{ ref('stage_employees_cloud') }} e join {{ ref('employees_seed')}} d
    on e.employee_id = d.employee_id

    