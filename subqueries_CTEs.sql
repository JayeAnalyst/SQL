SELECT *
FROM (--subquery to get January
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1 TO 3 AND 
    job_title_short = 'Data Analyst'
    ) AS january_jobs;
 -- subquery ends


-- CTEs Expression
WITH january_jobs AS (-- CTE definition starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1
)
SELECT *
FROM job_postings_fact;


WITH company_jobs_count AS (
    SELECT
    company_id,
    job_title_short,
    COUNT (company_id) AS total_jobs
FROM
    job_postings_fact
GROUP BY
    company_id, job_title_short
)
SELECT 
    name AS company_name,
    job_title_short,
    total_jobs
FROM company_dim 
LEFT JOIN company_jobs_count ON company_jobs_count.company_id = company_dim.company_id
GROUP BY
    name, job_title_short, total_jobs


WITH company_jobs_count AS (
    SELECT
    company_id,
    COUNT (company_id) AS total_jobs
FROM
    job_postings_fact
GROUP BY
    company_id
)
SELECT 
    name AS company_name,
    total_jobs
FROM company_dim 
LEFT JOIN company_jobs_count ON company_jobs_count.company_id = company_dim.company_id
GROUP BY
    total_jobs



WITH skills_required AS (
SELECT 
    skill_id,
    COUNT (skill_id)
FROM 
    skills_job_dim
INNER JOIN job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_postings_fact.job_work_from_home = TRUE AND job_title_short = 'Data Analyst'
GROUP BY skills_job_dim.skill_id
)
SELECT 
skills,
skills_required.skill_id
FROM skills_dim
INNER JOIN skills_required ON skills_dim.skill_id = skills_required.skill_id




WITH skills_required AS (
SELECT 
    skill_id,
    COUNT (skill_id) AS skill_count
FROM 
    skills_job_dim
INNER JOIN job_postings_fact on skills_job_dim.job_id = job_postings_fact.job_id
WHERE 
    job_postings_fact.job_work_from_home = TRUE AND 
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY skills_job_dim.skill_id
)
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    skill_count
FROM skills_required
INNER JOIN skills_dim ON skills_dim.skill_id = skills_required.skill_id
ORDER BY
    skill_count DESC
LIMIT 10;
12345