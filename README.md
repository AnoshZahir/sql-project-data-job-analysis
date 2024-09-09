# SQL Project: Data Job Analysis

## Project Description
This project focuses on analyzing job listing data from the tech industry using PostgreSQL. The goal is to extract insights such as the number of jobs per category, average salaries, and the most popular programming languages required by employers. The queries provided in this project are designed to help understand job market trends and requirements for data-related positions.

## Setup Instructions
To set up and run the queries in this project, follow the steps below:

1. **Clone the repository**:
```bash
git clone https://github.com/AnoshZahir/sql-project-data-job-analysis.git
```

2. **Download or use the required files for this project**:

   - The files are included in this repository:
     - CSV files are in the `csv_files/` folder.
     - SQL scripts are in the `sql_load/` folder.
   
   - Alternatively, you can download the files from the original source:
     - [Download csv files and SQL scripts](lukeb.co/sql_project_csvs)

3. **Set up the database**: Follow these steps in order to set up the PostgreSQL database and load the data:
   1. Run the script in **_create_database.sql** to create the database.
   2. Run the script in **_create_tables.sql** to create the four tables.
   3. Update the filepaths in **_modify_tables.sql** script to point to the correct locations of your CSV files in the 'csv_files/' folder.
   4. Run the script in **_modify_tables.sql** to load the data into their respective tables.

4. **Check the tables**: After completing the setup, verify that the following four tables have been created and loaded with data:
   - job_postings_fact
   - skills_job_dim
   - skills_dim
   - company_dim

## Usage
Here are some examples of the SQL queries included in this project:
-- Count of Job Postings by Month
-- This query extracts the month from the `job_posted_date` column and returns the count of job postings for each month.
```sql
SELECT COUNT(job_id),
       EXTRACT(MONTH FROM job_posted_date) AS month
FROM job_postings_fact
GROUP BY month
LIMIT 5;
```

Average salary per job category: This query calculates the average salary for each job category:
--'''To be updated'''

Top 5 customers by total order value (complex query): This query retrieves the top customers based on their total order value:
--'''To be updated'''

## Project Status
This project is currently in progress. The next steps include further analysis of job trends by location and company size.

## Future Improvements
- Add queries to analyze job trends based on geographical location.
- Perform salary trend analysis over time and across various job categories.
- Integrate external data sources to enrich job listing information.

## License
[MIT License](https://opensource.org/licenses/MIT)