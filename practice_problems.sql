'''Practice Problem 1
Write a query to find the average salary both yearly(salary_year_avg) and hourly (salary_hour_avg) 
for job postings that were posted after June 1, 2023. Group the results by job schedule type.
'''
SELECT 
   AVG(salary_year_avg) AS "Average yearly salary",
   AVG(salary_hour_avg) AS "Average hourly salary",
   job_schedule_type
FROM
   job_postings_fact
WHERE
   job_posted_date > '2023-06-01'
GROUP BY
   job_schedule_type

'''Practice Problem 2
Write a query to count the number of job postings for each month in 2023, adjusting the job_posted_date to be in "America/New_York" time zone before extracting (hint) the month.Assume the job_posted_date is stored in UTC. Group by order by the month.
'''
SELECT 
   EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'America/New_York') AS "month",
   count(job_id) AS "Number of jobs"
FROM
   job_postings_fact
WHERE
   EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'America/New_York') = 2023
GROUP BY
   "month"
ORDER BY
   "month"

'''Practice Problem 3
Write a query to find companies (include company name) that have posted jobs offering health insurance, where these postings were made in the second quarter of 2023. Use date extraction to filter quarter.
'''
SELECT 
   companies.name AS "Company name"
FROM
   company_dim AS companies
JOIN
   job_postings_fact AS jobs
ON
   companies.company_id = jobs.company_id
WHERE
   jobs.job_health_insurance = TRUE AND
   EXTRACT(QUARTER FROM jobs.job_posted_date) = 2 AND
   EXTRACT(YEAR FROM jobs.job_posted_date) = 2023

'''Practice Problem 6: Create Tables from other tables.
Create three tables
* Jan 2023 jobs
* Feb 2023 jobs
* Mar 2023 jobs
'''
-- Create a table for jobs posted in January 2023
CREATE TABLE jan_2023_jobs AS
   SELECT
      *
   FROM
      job_postings_fact
   WHERE
      EXTRACT(MONTH FROM job_posted_date) = 1 AND
      EXTRACT(YEAR FROM job_posted_date) = 2023;

-- Create a table for jobs posted in February 2023
CREATE TABLE feb_2023_jobs AS
   SELECT
      *
   FROM
      job_postings_fact
   WHERE 
      EXTRACT(MONTH FROM job_posted_date) = 2 AND
      EXTRACT(YEAR FROM job_posted_date) = 2023;

-- Create a table for jobs posted in March 2023
CREATE TABLE mar_2023_jobs AS
   SELECT
      *
   FROM
      job_postings_fact
   WHERE
      EXTRACT(MONTH FROM job_posted_date) = 3 AND
      EXTRACT(YEAR FROM job_posted_date) = 2023;

-- Quick sanity check to make sure the tables were created and correct data loaded.
SELECT * FROM jan_2023_jobs LIMIT 5;

''' CASE WHEN Practice Problem 1
Categorize the salaries from each job posting to see if it fits in my desired salary range.
 - Put salary into different buckets.
 - Define what is a high, standard or low salary with our own conditions.
 - Why? It is easy to determine which postings are worth looking at based on salary.
 - Look at data analyst roles only.
 - Order from highest to lowest.

 NOTES: The following are not clear from the problem instructions:
 - There are three fields related to salary. "salary_rate", "salary_year_avg", "salary_hour_avg".
 - The ranges for the salary are not given.
 - If the ranges were given then it be easy to pick the appropriate salary column.
 - What to do?
'''
SELECT
