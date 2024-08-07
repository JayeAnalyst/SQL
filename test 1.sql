
SELECT 
    COUNT (job_id) AS nuber_of_jobs,
        CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;




SELECT 
    COUNT (job_id) AS number_of_jobs,
    job_title_short AS job_description,
        CASE
        WHEN salary_year_avg > 100000 THEN 'High'
        WHEN salary_year_avg < 100000 THEN 'Standard'
        ELSE 'Low'
    END AS salary_range
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    salary_range,
    job_title_short
ORDER BY
    number_of_jobs;



