/*
Find job postings from the first quarter that have a salary greater than $70k
- combine job posting tables from the first quarter of 2023 (Jan - Mar)
- Gets job postings with an average yearly salary > $70,000
- Modify the search result to have only Data Analyst jobs
*/


-- Combine all data by using subquery and defining the new data as 'Quarter_one_jobs'
-- Restrict the data to the most important ones
SELECT 
    Quarter_one_jobs.job_id,
    Quarter_one_jobs.job_title_short,
    Quarter_one_jobs.job_location,
    Quarter_one_jobs.job_posted_date:: DATE, 
    Quarter_one_jobs.salary_year_avg
FROM (
        -- Get data from the first quarter
        SELECT *
        FROM 
            january_jobs
        UNION ALL 
        SELECT *
        FROM 
            february_jobs
        UNION ALL
        SELECT *
        FROM 
            march_jobs
) AS Quarter_one_jobs
WHERE 
    Quarter_one_jobs.salary_year_avg > 70000 AND 
    Quarter_one_jobs.job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC