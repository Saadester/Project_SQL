WITH Demand_Skills AS (
    SELECT 
        skills_dim.skills,
        skills_dim.skill_id,
        COUNT(skills_job_dim.job_id) AS Demand_count
    FROM Job_postings_fact
    INNER JOIN skills_job_dim ON Job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short ='Business Analyst' AND job_work_from_home = FALSE AND salary_year_avg is NOT NULL
    GROUP BY skills_dim.skills, skills_dim.skill_id
),
Top_paying_skills AS (
    SELECT 
        skills_dim.skills,
        skills_dim.skill_id,
        ROUND(AVG(salary_year_avg), 1) AS AVG_Salary
    FROM Job_postings_fact
    INNER JOIN skills_job_dim ON Job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short ='Business Analyst' AND job_work_from_home = FALSE AND salary_year_avg is NOT NULL
    GROUP BY skills_dim.skills, skills_dim.skill_id
)

SELECT 
    Demand_Skills.skill_id,
    Demand_Skills.skills,
    Demand_Skills.Demand_count,
    Top_paying_skills.AVG_Salary
FROM Demand_Skills
INNER JOIN Top_paying_skills ON Demand_Skills.skill_id = Top_paying_skills.skill_id
WHERE Demand_count > 10 AND Demand_count < 100
ORDER BY
AVG_Salary DESC
LIMIT 10;