{% snapshot emp_snap_check_cloud %}

{{
    config(
        target_schema = 'DBT_SNAPSHOTS',
        unique_key = 'EMPLOYEE_ID',
        strategy = 'check',
        check_cols = ['employee_name','salary']
    )
}}

SELECT
    EMPLOYEE_ID,
    EMPLOYEE_NAME,
    DEPARTMENT,
    SALARY,
    UPDATED_AT

FROM {{ source('hr1', 'EMPLOYEES_snap') }}

{% endsnapshot %}