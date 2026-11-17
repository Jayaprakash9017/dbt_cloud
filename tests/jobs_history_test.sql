select * from {{ ref('jobs_history') }} where job_id is null
                                 or start_date is null
                                 or end_date is null
                                 or start_date > end_date

