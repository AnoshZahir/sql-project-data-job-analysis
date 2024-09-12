'''Practice problem 1
Identify the top 5 skills that are most frequently mentioned in job postings. Use a subquery to find the skill IDs with the highest counts in the skills_job_dim table and then join this result with the skills_dim table to get the skill names.
'''

SELECT * FROM skills_job_dim LIMIT 5;
SELECT * FROM skills_dim LIMIT 5;


SELECT
    skills_dim.skills as skill_name,
    jobs_per_skill.number_of_jobs
FROM (-- Subquery starts here
    -- Get the number of jobs for each skill
    SELECT 
        skill_id,
        count(job_id) AS number_of_jobs
    FROM
        skills_job_dim
    GROUP BY
        skill_id
) AS jobs_per_skill
JOIN
    skills_dim
ON
    skills_dim.skill_id = jobs_per_skill.skill_id
LIMIT 5 