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