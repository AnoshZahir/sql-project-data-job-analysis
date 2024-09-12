'''Practice problem 1
Identify the top 5 skills that are most frequently mentioned in job postings. Use a subquery to find the skill IDs with the highest counts in the skills_job_dim table and then join this result with the skills_dim table to get the skill names.
'''

-- Step 1: View the data from the two tables to know what I am working with.
-- SELECT * FROM skills_job_dim LIMIT 5;
-- SELECT * FROM skills_dim LIMIT 5;

-- Step 2: Write the main subquery to get the top 5 most frequent skills.

SELECT
    skills_dim.skills as skill_name, -- Get the skill name from the skills_dim table.
    jobs_per_skill.number_of_jobs -- Get the number of jobs from the subquery.
FROM (
    -- Subquery starts here
    SELECT 
        skills_job_dim.skill_id,
        count(skills_job_dim.job_id) AS number_of_jobs
    FROM
        skills_job_dim
    GROUP BY
        skills_job_dim.skill_id
    ORDER BY
        number_of_jobs DESC -- List the skills based on number of jobs from highest to lowest.
    LIMIT 5 -- Only need the top 5 skills
) AS jobs_per_skill
JOIN
    skills_dim
ON
    skills_dim.skill_id = jobs_per_skill.skill_id