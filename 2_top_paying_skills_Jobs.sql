
WITH Top_Paying_Jobs AS (
Select 
    job_id,
    job_title,
    salary_year_avg,
    company_dim.name AS CompanyName
FROM
    job_postings_fact
LEFT JOIN Company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Business Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg is not NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10)

Select 

    Top_paying_Jobs.*,
    skills
from Top_Paying_Jobs
INNER JOIN skills_job_dim ON Top_Paying_Jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = Skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/* Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs in 2023:
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7.
Tableau is also highly sought after, with a bold count of 6. Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.*/ 