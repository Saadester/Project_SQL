Select 
skills,
ROUND(AVG(salary_year_avg), 1) AS AVG_Salary
FROM Job_postings_fact
INNER JOIN skills_job_dim ON Job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = Skills_dim.skill_id
WHERE salary_year_avg is not NULL AND job_title_short = 'Data Analyst'
Group BY
skills
ORDER BY
AVG_Salary DESC
LIMIT 10;