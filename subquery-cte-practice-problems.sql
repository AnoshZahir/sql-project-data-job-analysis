'''Practice problem 1
Identify the top 5 skills that are most frequently mentioned in job postings. Use a subquery to find the skill IDs with the highest counts in the skills_job_dim table and then join this result with the skills_dim table to get the skill names.
'''

SELECT * FROM skills_job_dim LIMIT 5;
SELECT * FROM skills_dim LIMIT 5;

SELECT 
    skill_id,
    count(job_id)
FROM
    skills_job_dim
GROUP BY
    skill_id
