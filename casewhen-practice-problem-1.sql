''' CASE WHEN Practice Problem 1
Categorize the salaries from each job posting to see if it fits in my desired salary range.
 - Put salary into different buckets.
 - Define what is a high, standard or low salary with our own conditions.
 - Why? It is easy to determine which postings are worth looking at based on salary.
 - Look at data analyst roles only.
 - Order from highest to lowest.

 NOTES:
- Three fields are related to salary: "salary_rate", "salary_year_avg", "salary_hour_avg".
- The problem does not specify which salary field to use or provide salary ranges.
- Decision: Use "salary_year_avg" for categorizing, as it provides a more standard yearly view of salaries.
- Handling NULL values:
   - Instead of categorizing NULL salaries as "Unknown", I have decided to remove those rows entirely from the result set for cleaner output.
   - This ensures that the analysis focuses only on job postings with defined yearly salaries.
'''
SELECT
   salary_year_avg as "Annual Salary",
   CASE
      -- Categorize salaries based on yearly salary
      -- Assumes no negative values in salary_year_avg field. 
      WHEN salary_year_avg < 50000 THEN 'Low'
      WHEN salary_year_avg >= 50000 AND salary_year_avg <= 100000 THEN 'Standard'
      ELSE 'High'
   END AS salary_buckets
FROM
   job_postings_fact
WHERE
   -- Filter by 'Data Analyst' roles and remove rows where salary_year_avg is NULL
   job_title_short = 'Data Analyst' AND
   salary_year_avg IS NOT NULL
ORDER BY
   salary_year_avg DESC -- Order from highest to lowest salary
LIMIT 30

'''Dynamic salary ranges
The problem does not define the salary ranges. So instead of using magic numbers we use POSTgres DO blocks to define local variables.
'''
DO $$
DECLARE
    low_salary INTEGER := 50000;
    high_salary INTEGER := 100000;
BEGIN
    -- Your query using dynamic salary ranges
    PERFORM salary_year_avg, CASE
        WHEN salary_year_avg < low_salary THEN 'Low'
        WHEN salary_year_avg >= low_salary AND salary_year_avg <= high_salary THEN 'Standard'
        ELSE 'High'
    END AS salary_buckets
    FROM job_postings_fact
    WHERE
       job_title_short = 'Data Analyst' AND
       salary_year_avg IS NOT NULL
    ORDER BY
       salary_year_avg DESC;
END $$;

'''Use CTEs to simulate variables for range values.'''
-- CTE to simulate variables
WITH salary_ranges AS (
   SELECT 50000 AS low_salary, 100000 AS high_salary
)
SELECT
   salary_year_avg AS "Annual Salary",
   CASE
      WHEN salary_year_avg < (SELECT low_salary FROM salary_ranges) THEN 'Low'
      WHEN salary_year_avg >= (SELECT low_salary FROM salary_ranges) AND salary_year_avg <= (SELECT high_salary FROM salary_ranges) THEN 'Standard'
      ELSE 'High'
   END AS salary_buckets
FROM
   job_postings_fact
WHERE
   job_title_short = 'Data Analyst' AND
   salary_year_avg IS NOT NULL
ORDER BY
   salary_year_avg DESC

'''Using functions that take the salary ranges as parameters'''
CREATE OR REPLACE FUNCTION categorize_salaries(low_salary INTEGER, high_salary INTEGER)
RETURNS TABLE (
    "Annual Salary" NUMERIC,
    salary_buckets TEXT
) AS $$
BEGIN
   RETURN QUERY
   SELECT
      salary_year_avg AS "Annual Salary",
      CASE
         WHEN salary_year_avg < low_salary THEN 'Low'
         WHEN salary_year_avg >= low_salary AND salary_year_avg <= high_salary THEN 'Standard'
         ELSE 'High'
      END AS salary_buckets
   FROM
      job_postings_fact
   WHERE
      job_title_short = 'Data Analyst' AND
      salary_year_avg IS NOT NULL
   ORDER BY
      salary_year_avg DESC
   LIMIT 30;
END;
$$ LANGUAGE plpgsql;
