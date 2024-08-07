/* 
Question: What skills are required for the top-paying business analyst jobs?

- Use the top 10 highest-paying Business Analyst jobs from the first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
  helping job seekers understand which skills to develop that align with top salaries.
*/


WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Business Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 50
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC



/*
The analysis of the skills column reveals the following top skills required for business analyst roles in 2023:
-SQL: 30 occurrences
-Tableau: 21 occurrences
-Excel: 17 occurrences
-Python: 17 occurrences
-Power BI: 9 occurrences
These results indicate that SQL and Tableau are the most demanded skills for these roles, with Excel and Python also being highly significant. 
This suggests a strong emphasis on data manipulation, visualization, and analysis skills.


[
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "sql"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "python"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "excel"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "tableau"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "looker"
  },
  {
    "job_id": 502610,
    "job_title": "Lead Business Intelligence Engineer",
    "salary_year_avg": "220000.0",
    "company_name": "Noom",
    "skills": "chef"
  },
  {
    "job_id": 112859,
    "job_title": "Manager II, Applied Science - Marketplace Dynamics",
    "salary_year_avg": "214500.0",
    "company_name": "Uber",
    "skills": "python"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "salary_year_avg": "190000.0",
    "company_name": "Harnham",
    "skills": "sql"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "salary_year_avg": "190000.0",
    "company_name": "Harnham",
    "skills": "python"
  },
  {
    "job_id": 17458,
    "job_title": "Senior Economy Designer",
    "salary_year_avg": "190000.0",
    "company_name": "Harnham",
    "skills": "r"
  },
  {
    "job_id": 416185,
    "job_title": "Staff Revenue Operations Analyst",
    "salary_year_avg": "170500.0",
    "company_name": "Gladly",
    "skills": "excel"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "sql"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "python"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "bigquery"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "gcp"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "looker"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "word"
  },
  {
    "job_id": 1099753,
    "job_title": "REMOTE - Business Intelligence Analyst (Leadership Role) - GCP",
    "salary_year_avg": "162500.0",
    "company_name": "CyberCoders",
    "skills": "sheets"
  },
  {
    "job_id": 1313937,
    "job_title": "Manager Analytics and Reporting",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "sql"
  },
  {
    "job_id": 1313937,
    "job_title": "Manager Analytics and Reporting",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "excel"
  },
  {
    "job_id": 1313937,
    "job_title": "Manager Analytics and Reporting",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "tableau"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "sql"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "python"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "r"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "sas"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "phoenix"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "excel"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "tableau"
  },
  {
    "job_id": 106225,
    "job_title": "Business Strategy Analyst Senior (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "USAA",
    "skills": "sas"
  },
  {
    "job_id": 661103,
    "job_title": "Marketing Analytics Manager",
    "salary_year_avg": "134550.0",
    "company_name": "Get It Recruit - Marketing",
    "skills": "tableau"
  },
  {
    "job_id": 903695,
    "job_title": "Business Strategy Analyst Senior – Advanced Analytics and Data...",
    "salary_year_avg": "133340.0",
    "company_name": "USAA",
    "skills": "python"
  },
  {
    "job_id": 903695,
    "job_title": "Business Strategy Analyst Senior – Advanced Analytics and Data...",
    "salary_year_avg": "133340.0",
    "company_name": "USAA",
    "skills": "r"
  },
  {
    "job_id": 903695,
    "job_title": "Business Strategy Analyst Senior – Advanced Analytics and Data...",
    "salary_year_avg": "133340.0",
    "company_name": "USAA",
    "skills": "phoenix"
  },
  {
    "job_id": 903695,
    "job_title": "Business Strategy Analyst Senior – Advanced Analytics and Data...",
    "salary_year_avg": "133340.0",
    "company_name": "USAA",
    "skills": "excel"
  },
  {
    "job_id": 903695,
    "job_title": "Business Strategy Analyst Senior – Advanced Analytics and Data...",
    "salary_year_avg": "133340.0",
    "company_name": "USAA",
    "skills": "tableau"
  },
  {
    "job_id": 1745209,
    "job_title": "Sr. Analyst, Business Analytics",
    "salary_year_avg": "130000.0",
    "company_name": "Happier Living",
    "skills": "sql"
  },
  {
    "job_id": 1745209,
    "job_title": "Sr. Analyst, Business Analytics",
    "salary_year_avg": "130000.0",
    "company_name": "Happier Living",
    "skills": "tableau"
  },
  {
    "job_id": 947994,
    "job_title": "Business Intelligence Architect",
    "salary_year_avg": "128500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 947994,
    "job_title": "Business Intelligence Architect",
    "salary_year_avg": "128500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 757837,
    "job_title": "Finance Director",
    "salary_year_avg": "127500.0",
    "company_name": "One Call",
    "skills": "oracle"
  },
  {
    "job_id": 757837,
    "job_title": "Finance Director",
    "salary_year_avg": "127500.0",
    "company_name": "One Call",
    "skills": "excel"
  },
  {
    "job_id": 757837,
    "job_title": "Finance Director",
    "salary_year_avg": "127500.0",
    "company_name": "One Call",
    "skills": "tableau"
  },
  {
    "job_id": 757837,
    "job_title": "Finance Director",
    "salary_year_avg": "127500.0",
    "company_name": "One Call",
    "skills": "powerpoint"
  },
  {
    "job_id": 757837,
    "job_title": "Finance Director",
    "salary_year_avg": "127500.0",
    "company_name": "One Call",
    "skills": "visio"
  },
  {
    "job_id": 1057651,
    "job_title": "Business Intelligence Lead - Remote",
    "salary_year_avg": "124500.0",
    "company_name": "CenterWell Senior Primary Care",
    "skills": "sql"
  },
  {
    "job_id": 1057651,
    "job_title": "Business Intelligence Lead - Remote",
    "salary_year_avg": "124500.0",
    "company_name": "CenterWell Senior Primary Care",
    "skills": "sas"
  },
  {
    "job_id": 1057651,
    "job_title": "Business Intelligence Lead - Remote",
    "salary_year_avg": "124500.0",
    "company_name": "CenterWell Senior Primary Care",
    "skills": "tableau"
  },
  {
    "job_id": 1057651,
    "job_title": "Business Intelligence Lead - Remote",
    "salary_year_avg": "124500.0",
    "company_name": "CenterWell Senior Primary Care",
    "skills": "sas"
  },
  {
    "job_id": 1057651,
    "job_title": "Business Intelligence Lead - Remote",
    "salary_year_avg": "124500.0",
    "company_name": "CenterWell Senior Primary Care",
    "skills": "qlik"
  },
  {
    "job_id": 1226037,
    "job_title": "Business Intelligence Analyst -Remote",
    "salary_year_avg": "121500.0",
    "company_name": "NRG",
    "skills": "sql"
  },
  {
    "job_id": 1226037,
    "job_title": "Business Intelligence Analyst -Remote",
    "salary_year_avg": "121500.0",
    "company_name": "NRG",
    "skills": "excel"
  },
  {
    "job_id": 1226037,
    "job_title": "Business Intelligence Analyst -Remote",
    "salary_year_avg": "121500.0",
    "company_name": "NRG",
    "skills": "power bi"
  },
  {
    "job_id": 145934,
    "job_title": "Analytics Manager, Sales",
    "salary_year_avg": "120000.0",
    "company_name": "MongoDB",
    "skills": "sql"
  },
  {
    "job_id": 145934,
    "job_title": "Analytics Manager, Sales",
    "salary_year_avg": "120000.0",
    "company_name": "MongoDB",
    "skills": "python"
  },
  {
    "job_id": 145934,
    "job_title": "Analytics Manager, Sales",
    "salary_year_avg": "120000.0",
    "company_name": "MongoDB",
    "skills": "r"
  },
  {
    "job_id": 145934,
    "job_title": "Analytics Manager, Sales",
    "salary_year_avg": "120000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 145934,
    "job_title": "Analytics Manager, Sales",
    "salary_year_avg": "120000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 414798,
    "job_title": "Business Intelligence Analyst-Mid-Level (Hybrid)",
    "salary_year_avg": "114500.0",
    "company_name": "United Services Automobile Association",
    "skills": "sql"
  },
  {
    "job_id": 414798,
    "job_title": "Business Intelligence Analyst-Mid-Level (Hybrid)",
    "salary_year_avg": "114500.0",
    "company_name": "United Services Automobile Association",
    "skills": "python"
  },
  {
    "job_id": 414798,
    "job_title": "Business Intelligence Analyst-Mid-Level (Hybrid)",
    "salary_year_avg": "114500.0",
    "company_name": "United Services Automobile Association",
    "skills": "nosql"
  },
  {
    "job_id": 414798,
    "job_title": "Business Intelligence Analyst-Mid-Level (Hybrid)",
    "salary_year_avg": "114500.0",
    "company_name": "United Services Automobile Association",
    "skills": "java"
  },
  {
    "job_id": 414798,
    "job_title": "Business Intelligence Analyst-Mid-Level (Hybrid)",
    "salary_year_avg": "114500.0",
    "company_name": "United Services Automobile Association",
    "skills": "db2"
  },
  {
    "job_id": 414798,
    "job_title": "Business Intelligence Analyst-Mid-Level (Hybrid)",
    "salary_year_avg": "114500.0",
    "company_name": "United Services Automobile Association",
    "skills": "oracle"
  },
  {
    "job_id": 414798,
    "job_title": "Business Intelligence Analyst-Mid-Level (Hybrid)",
    "salary_year_avg": "114500.0",
    "company_name": "United Services Automobile Association",
    "skills": "snowflake"
  },
  {
    "job_id": 414798,
    "job_title": "Business Intelligence Analyst-Mid-Level (Hybrid)",
    "salary_year_avg": "114500.0",
    "company_name": "United Services Automobile Association",
    "skills": "hadoop"
  },
  {
    "job_id": 414798,
    "job_title": "Business Intelligence Analyst-Mid-Level (Hybrid)",
    "salary_year_avg": "114500.0",
    "company_name": "United Services Automobile Association",
    "skills": "tableau"
  },
  {
    "job_id": 1202207,
    "job_title": "Sr. Financial Business Intelligence Analyst",
    "salary_year_avg": "111500.0",
    "company_name": "Glocomms",
    "skills": "sql"
  },
  {
    "job_id": 1202207,
    "job_title": "Sr. Financial Business Intelligence Analyst",
    "salary_year_avg": "111500.0",
    "company_name": "Glocomms",
    "skills": "excel"
  },
  {
    "job_id": 1202207,
    "job_title": "Sr. Financial Business Intelligence Analyst",
    "salary_year_avg": "111500.0",
    "company_name": "Glocomms",
    "skills": "tableau"
  },
  {
    "job_id": 1202207,
    "job_title": "Sr. Financial Business Intelligence Analyst",
    "salary_year_avg": "111500.0",
    "company_name": "Glocomms",
    "skills": "power bi"
  },
  {
    "job_id": 1202207,
    "job_title": "Sr. Financial Business Intelligence Analyst",
    "salary_year_avg": "111500.0",
    "company_name": "Glocomms",
    "skills": "powerpoint"
  },
  {
    "job_id": 1202207,
    "job_title": "Sr. Financial Business Intelligence Analyst",
    "salary_year_avg": "111500.0",
    "company_name": "Glocomms",
    "skills": "ssrs"
  },
  {
    "job_id": 41537,
    "job_title": "Senior Marketing Operations Analyst",
    "salary_year_avg": "111500.0",
    "company_name": "Get It Recruit - Marketing",
    "skills": "sql"
  },
  {
    "job_id": 41537,
    "job_title": "Senior Marketing Operations Analyst",
    "salary_year_avg": "111500.0",
    "company_name": "Get It Recruit - Marketing",
    "skills": "looker"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "sas"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "javascript"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "postgresql"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "elasticsearch"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "databricks"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "oracle"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "kafka"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "tensorflow"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "pytorch"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "mxnet"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "chainer"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "node.js"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "tableau"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "power bi"
  },
  {
    "job_id": 160165,
    "job_title": "Head, Research and Innovation",
    "salary_year_avg": "110000.0",
    "company_name": "Vendease",
    "skills": "sas"
  },
  {
    "job_id": 933221,
    "job_title": "Business Intelligence Analyst II - Service",
    "salary_year_avg": "106479.0",
    "company_name": "Edward Jones",
    "skills": "sql"
  },
  {
    "job_id": 933221,
    "job_title": "Business Intelligence Analyst II - Service",
    "salary_year_avg": "106479.0",
    "company_name": "Edward Jones",
    "skills": "nosql"
  },
  {
    "job_id": 933221,
    "job_title": "Business Intelligence Analyst II - Service",
    "salary_year_avg": "106479.0",
    "company_name": "Edward Jones",
    "skills": "oracle"
  },
  {
    "job_id": 933221,
    "job_title": "Business Intelligence Analyst II - Service",
    "salary_year_avg": "106479.0",
    "company_name": "Edward Jones",
    "skills": "hadoop"
  },
  {
    "job_id": 90903,
    "job_title": "Marketing Analyst",
    "salary_year_avg": "106000.0",
    "company_name": "Blend",
    "skills": "sql"
  },
  {
    "job_id": 90903,
    "job_title": "Marketing Analyst",
    "salary_year_avg": "106000.0",
    "company_name": "Blend",
    "skills": "excel"
  },
  {
    "job_id": 1353405,
    "job_title": "Business Intelligence (BI) Developer/Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 1353405,
    "job_title": "Business Intelligence (BI) Developer/Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "power bi"
  },
  {
    "job_id": 1268310,
    "job_title": "Business Intelligence Analyst",
    "salary_year_avg": "100000.0",
    "company_name": "Stepped Care Solutions",
    "skills": "excel"
  },
  {
    "job_id": 1268310,
    "job_title": "Business Intelligence Analyst",
    "salary_year_avg": "100000.0",
    "company_name": "Stepped Care Solutions",
    "skills": "tableau"
  },
  {
    "job_id": 473688,
    "job_title": "Business Analyst - Data Quality (REMOTE)",
    "salary_year_avg": "100000.0",
    "company_name": "Armavel, LLC",
    "skills": "sql"
  },
  {
    "job_id": 473688,
    "job_title": "Business Analyst - Data Quality (REMOTE)",
    "salary_year_avg": "100000.0",
    "company_name": "Armavel, LLC",
    "skills": "python"
  },
  {
    "job_id": 473688,
    "job_title": "Business Analyst - Data Quality (REMOTE)",
    "salary_year_avg": "100000.0",
    "company_name": "Armavel, LLC",
    "skills": "excel"
  },
  {
    "job_id": 473688,
    "job_title": "Business Analyst - Data Quality (REMOTE)",
    "salary_year_avg": "100000.0",
    "company_name": "Armavel, LLC",
    "skills": "flow"
  },
  {
    "job_id": 1010586,
    "job_title": "Business Intelligence Analyst",
    "salary_year_avg": "98500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 1010586,
    "job_title": "Business Intelligence Analyst",
    "salary_year_avg": "98500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 1010586,
    "job_title": "Business Intelligence Analyst",
    "salary_year_avg": "98500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 1010586,
    "job_title": "Business Intelligence Analyst",
    "salary_year_avg": "98500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "power bi"
  },
  {
    "job_id": 1185068,
    "job_title": "SQL Business Systems Analyst",
    "salary_year_avg": "96500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 1185068,
    "job_title": "SQL Business Systems Analyst",
    "salary_year_avg": "96500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "c#"
  },
  {
    "job_id": 1185068,
    "job_title": "SQL Business Systems Analyst",
    "salary_year_avg": "96500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql server"
  },
  {
    "job_id": 1185068,
    "job_title": "SQL Business Systems Analyst",
    "salary_year_avg": "96500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "azure"
  },
  {
    "job_id": 1185068,
    "job_title": "SQL Business Systems Analyst",
    "salary_year_avg": "96500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sharepoint"
  },
  {
    "job_id": 1185068,
    "job_title": "SQL Business Systems Analyst",
    "salary_year_avg": "96500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "jira"
  },
  {
    "job_id": 1185068,
    "job_title": "SQL Business Systems Analyst",
    "salary_year_avg": "96500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "confluence"
  },
  {
    "job_id": 1417154,
    "job_title": "Business Intelligence Analytics Consultant",
    "salary_year_avg": "96000.0",
    "company_name": "Get It Recruit - Professional Services",
    "skills": "sql"
  },
  {
    "job_id": 1417154,
    "job_title": "Business Intelligence Analytics Consultant",
    "salary_year_avg": "96000.0",
    "company_name": "Get It Recruit - Professional Services",
    "skills": "python"
  },
  {
    "job_id": 1417154,
    "job_title": "Business Intelligence Analytics Consultant",
    "salary_year_avg": "96000.0",
    "company_name": "Get It Recruit - Professional Services",
    "skills": "r"
  },
  {
    "job_id": 1417154,
    "job_title": "Business Intelligence Analytics Consultant",
    "salary_year_avg": "96000.0",
    "company_name": "Get It Recruit - Professional Services",
    "skills": "tableau"
  },
  {
    "job_id": 819233,
    "job_title": "Business Intelligence Analyst II",
    "salary_year_avg": "95850.0",
    "company_name": "Guidehouse",
    "skills": "tableau"
  },
  {
    "job_id": 819233,
    "job_title": "Business Intelligence Analyst II",
    "salary_year_avg": "95850.0",
    "company_name": "Guidehouse",
    "skills": "qlik"
  },
  {
    "job_id": 370581,
    "job_title": "Analyst",
    "salary_year_avg": "95000.0",
    "company_name": "Keebo",
    "skills": "sql"
  },
  {
    "job_id": 370581,
    "job_title": "Analyst",
    "salary_year_avg": "95000.0",
    "company_name": "Keebo",
    "skills": "python"
  },
  {
    "job_id": 370581,
    "job_title": "Analyst",
    "salary_year_avg": "95000.0",
    "company_name": "Keebo",
    "skills": "bash"
  },
  {
    "job_id": 370581,
    "job_title": "Analyst",
    "salary_year_avg": "95000.0",
    "company_name": "Keebo",
    "skills": "postgresql"
  },
  {
    "job_id": 370581,
    "job_title": "Analyst",
    "salary_year_avg": "95000.0",
    "company_name": "Keebo",
    "skills": "bigquery"
  },
  {
    "job_id": 370581,
    "job_title": "Analyst",
    "salary_year_avg": "95000.0",
    "company_name": "Keebo",
    "skills": "gcp"
  },
  {
    "job_id": 370581,
    "job_title": "Analyst",
    "salary_year_avg": "95000.0",
    "company_name": "Keebo",
    "skills": "unix"
  },
  {
    "job_id": 1341535,
    "job_title": "Senior Business Intelligence (BI) Analyst",
    "salary_year_avg": "93500.0",
    "company_name": "Get It Recruit - Hospitality",
    "skills": "sql"
  },
  {
    "job_id": 1341535,
    "job_title": "Senior Business Intelligence (BI) Analyst",
    "salary_year_avg": "93500.0",
    "company_name": "Get It Recruit - Hospitality",
    "skills": "redshift"
  },
  {
    "job_id": 1341535,
    "job_title": "Senior Business Intelligence (BI) Analyst",
    "salary_year_avg": "93500.0",
    "company_name": "Get It Recruit - Hospitality",
    "skills": "excel"
  },
  {
    "job_id": 1341535,
    "job_title": "Senior Business Intelligence (BI) Analyst",
    "salary_year_avg": "93500.0",
    "company_name": "Get It Recruit - Hospitality",
    "skills": "tableau"
  },
  {
    "job_id": 1341535,
    "job_title": "Senior Business Intelligence (BI) Analyst",
    "salary_year_avg": "93500.0",
    "company_name": "Get It Recruit - Hospitality",
    "skills": "sharepoint"
  },
  {
    "job_id": 1195476,
    "job_title": "Business Analyst - Work from Home with Data Analytics and Tableau...",
    "salary_year_avg": "90500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 569743,
    "job_title": "Staff Business Analyst - Finance",
    "salary_year_avg": "90000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "sql"
  },
  {
    "job_id": 569743,
    "job_title": "Staff Business Analyst - Finance",
    "salary_year_avg": "90000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "python"
  },
  {
    "job_id": 569743,
    "job_title": "Staff Business Analyst - Finance",
    "salary_year_avg": "90000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "r"
  },
  {
    "job_id": 569743,
    "job_title": "Staff Business Analyst - Finance",
    "salary_year_avg": "90000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "windows"
  },
  {
    "job_id": 569743,
    "job_title": "Staff Business Analyst - Finance",
    "salary_year_avg": "90000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "tableau"
  },
  {
    "job_id": 1226197,
    "job_title": "Business Analyst ( Entry Level )",
    "salary_year_avg": "90000.0",
    "company_name": "TEKtalent Inc",
    "skills": "excel"
  },
  {
    "job_id": 1226197,
    "job_title": "Business Analyst ( Entry Level )",
    "salary_year_avg": "90000.0",
    "company_name": "TEKtalent Inc",
    "skills": "word"
  },
  {
    "job_id": 1226197,
    "job_title": "Business Analyst ( Entry Level )",
    "salary_year_avg": "90000.0",
    "company_name": "TEKtalent Inc",
    "skills": "powerpoint"
  },
  {
    "job_id": 1226197,
    "job_title": "Business Analyst ( Entry Level )",
    "salary_year_avg": "90000.0",
    "company_name": "TEKtalent Inc",
    "skills": "outlook"
  },
  {
    "job_id": 1547314,
    "job_title": "Business Analytics Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "sql"
  },
  {
    "job_id": 1547314,
    "job_title": "Business Analytics Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "python"
  },
  {
    "job_id": 1547314,
    "job_title": "Business Analytics Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "bigquery"
  },
  {
    "job_id": 1547314,
    "job_title": "Business Analytics Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "gcp"
  },
  {
    "job_id": 1547314,
    "job_title": "Business Analytics Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Get It Recruit - Finance",
    "skills": "looker"
  },
  {
    "job_id": 1594680,
    "job_title": "Hospitality Operations Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Goodwin Recruiting",
    "skills": "sql"
  },
  {
    "job_id": 1594680,
    "job_title": "Hospitality Operations Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Goodwin Recruiting",
    "skills": "excel"
  },
  {
    "job_id": 1594680,
    "job_title": "Hospitality Operations Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Goodwin Recruiting",
    "skills": "powerpoint"
  },
  {
    "job_id": 1594680,
    "job_title": "Hospitality Operations Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "Goodwin Recruiting",
    "skills": "outlook"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "company_name": "Summit Consulting",
    "skills": "sharepoint"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "company_name": "Summit Consulting",
    "skills": "powerpoint"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "company_name": "Summit Consulting",
    "skills": "visio"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "company_name": "Summit Consulting",
    "skills": "flow"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "company_name": "Summit Consulting",
    "skills": "confluence"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "sql"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "python"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "java"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "shell"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "go"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "bash"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "c++"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "mysql"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "postgresql"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "sql server"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "oracle"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "spark"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "hadoop"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "kafka"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "node"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "linux"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "git"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "kubernetes"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "docker"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "github"
  },
  {
    "job_id": 784279,
    "job_title": "ClickHouse Solutions Engineer / DBA",
    "salary_year_avg": "85000.0",
    "company_name": "Altinity",
    "skills": "ansible"
  },
  {
    "job_id": 781213,
    "job_title": "Senior  Business Analyst  Data Visualization",
    "salary_year_avg": "84500.0",
    "company_name": "Z&A Recruiting",
    "skills": "sql"
  },
  {
    "job_id": 781213,
    "job_title": "Senior  Business Analyst  Data Visualization",
    "salary_year_avg": "84500.0",
    "company_name": "Z&A Recruiting",
    "skills": "tableau"
  },
  {
    "job_id": 781213,
    "job_title": "Senior  Business Analyst  Data Visualization",
    "salary_year_avg": "84500.0",
    "company_name": "Z&A Recruiting",
    "skills": "power bi"
  },
  {
    "job_id": 84476,
    "job_title": "Business Intelligence Analyst",
    "salary_year_avg": "82500.0",
    "company_name": "Hausch & Company",
    "skills": "sql"
  },
  {
    "job_id": 84476,
    "job_title": "Business Intelligence Analyst",
    "salary_year_avg": "82500.0",
    "company_name": "Hausch & Company",
    "skills": "power bi"
  },
  {
    "job_id": 84476,
    "job_title": "Business Intelligence Analyst",
    "salary_year_avg": "82500.0",
    "company_name": "Hausch & Company",
    "skills": "dax"
  },
  {
    "job_id": 84476,
    "job_title": "Business Intelligence Analyst",
    "salary_year_avg": "82500.0",
    "company_name": "Hausch & Company",
    "skills": "flow"
  },
  {
    "job_id": 103442,
    "job_title": "Business Intelligence Analyst",
    "salary_year_avg": "82500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 1662605,
    "job_title": "BI Business Analytics and Process Engineer - Remote",
    "salary_year_avg": "82500.0",
    "company_name": "Ryder System",
    "skills": "sql"
  },
  {
    "job_id": 1662605,
    "job_title": "BI Business Analytics and Process Engineer - Remote",
    "salary_year_avg": "82500.0",
    "company_name": "Ryder System",
    "skills": "excel"
  },
  {
    "job_id": 1662605,
    "job_title": "BI Business Analytics and Process Engineer - Remote",
    "salary_year_avg": "82500.0",
    "company_name": "Ryder System",
    "skills": "tableau"
  },
  {
    "job_id": 1662605,
    "job_title": "BI Business Analytics and Process Engineer - Remote",
    "salary_year_avg": "82500.0",
    "company_name": "Ryder System",
    "skills": "power bi"
  },
  {
    "job_id": 1662605,
    "job_title": "BI Business Analytics and Process Engineer - Remote",
    "salary_year_avg": "82500.0",
    "company_name": "Ryder System",
    "skills": "microstrategy"
  },
  {
    "job_id": 1662605,
    "job_title": "BI Business Analytics and Process Engineer - Remote",
    "salary_year_avg": "82500.0",
    "company_name": "Ryder System",
    "skills": "flow"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "sql"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "excel"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "power bi"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "word"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "outlook"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "jira"
  },
  {
    "job_id": 674136,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "80000.0",
    "company_name": "Coders Data",
    "skills": "confluence"
  },
  {
    "job_id": 48376,
    "job_title": "Enterprise Analyst, Senior",
    "salary_year_avg": "79050.0",
    "company_name": "Blackbaud",
    "skills": "sql"
  },
  {
    "job_id": 48376,
    "job_title": "Enterprise Analyst, Senior",
    "salary_year_avg": "79050.0",
    "company_name": "Blackbaud",
    "skills": "python"
  },
  {
    "job_id": 48376,
    "job_title": "Enterprise Analyst, Senior",
    "salary_year_avg": "79050.0",
    "company_name": "Blackbaud",
    "skills": "r"
  },
  {
    "job_id": 48376,
    "job_title": "Enterprise Analyst, Senior",
    "salary_year_avg": "79050.0",
    "company_name": "Blackbaud",
    "skills": "javascript"
  },
  {
    "job_id": 48376,
    "job_title": "Enterprise Analyst, Senior",
    "salary_year_avg": "79050.0",
    "company_name": "Blackbaud",
    "skills": "excel"
  },
  {
    "job_id": 48376,
    "job_title": "Enterprise Analyst, Senior",
    "salary_year_avg": "79050.0",
    "company_name": "Blackbaud",
    "skills": "tableau"
  },
  {
    "job_id": 48376,
    "job_title": "Enterprise Analyst, Senior",
    "salary_year_avg": "79050.0",
    "company_name": "Blackbaud",
    "skills": "spss"
  }
]
*/