Select 
skills,
COUNT(skills_job_dim.job_id) AS Demand_count


FROM Job_postings_fact
INNER JOIN skills_job_dim ON Job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = Skills_dim.skill_id
WHERE 
job_title_short = 'Data Analyst' AND job_work_from_home = TRUE
Group BY
skills
ORDER BY
Demand_count DESC
LIMIT 10;