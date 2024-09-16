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

'''Practice Problem 2
Determine the size category ("Small", "Medium" or "Large") for each company by first identifying the number of job postings they have. Use a subquery to calculate the total job postings per company. A company is considered:
    "small" if it has less than 10 job postings
    "Medium" if the number of job postings is between 10 and 50
    "Large" if it has more than 50 job postings.
Implement a subquery to aggregate job counts per company before classifying them based on size.
'''
-- Step 1: View the data from the two tables to know what I am working with.
--SELECT * FROM company_dim LIMIT 5;
--SELECT * FROM job_postings_fact LIMIT 5;

-- Step 2: Write the main subquery to get the size of each company.
-- First write the subquery that aggregates the postings per company.
-- Then query that and classify the company based on the no of postings.
SELECT
    company_dim.name AS company_name,
    CASE
        WHEN job_postings_per_company_id.no_of_job_postings < 10 THEN 'Small'
        WHEN job_postings_per_company_id.no_of_job_postings BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS size_of_company
FROM
    (-- Subquery starts here
    SELECT
        company_id,
        count(company_id) as no_of_job_postings
    FROM
        job_postings_fact
    GROUP BY
        company_id
    ) AS job_postings_per_company_id
JOIN
    company_dim
ON
    company_dim.company_id = job_postings_per_company_id.company_id
ORDER BY -- Ordering of the results was not asked for in the problem specs.
    job_postings_per_company_id.no_of_job_postings, company_name

-- For this problem a 'regular' query is sufficient, as below.
SELECT
    company_dim.name AS company_name,
    count(job_postings_fact.company_id) as no_of_job_postings,
    CASE
        WHEN count(job_postings_fact.company_id) < 10 THEN 'Small'
        WHEN count(job_postings_fact.company_id) BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS size_of_company
FROM
    company_dim
JOIN
    job_postings_fact
ON
    company_dim.company_id = job_postings_fact.company_id
GROUP BY
    company_name
ORDER BY -- Ordering of the results was not asked for in the problem specs.
    no_of_job_postings, company_name
:
-- First get the no of job_ids per skill_id
SELECT
    skills_job_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as skill_count
FROM
    skills_job_dim
JOIN
    skills_dim
ON
    skills_job_dim.skill_id = skills_dim.skill_id
JOIN
    job_postings_fact
ON
    skills_job_dim.job_id = job_postings_fact.job_id
WHERE
    job_postings_fact.job_location = 'Anywhere' AND
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skills_job_dim.skill_id,
    skills_dim.skills
ORDER BY
    skill_count DESC
LIMIT 5
