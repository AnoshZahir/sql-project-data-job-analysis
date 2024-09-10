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
   EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS "month",
   count(job_id) AS "Number of jobs"
FROM
   job_postings_fact
WHERE
   EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') = 2023
GROUP BY
   "month"
ORDER BY
   "month"