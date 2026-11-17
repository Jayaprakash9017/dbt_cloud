select * from {{ ref('jobs_cloud') }} where min_salary > max_salary
                             or job_id is null