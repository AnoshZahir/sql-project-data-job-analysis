# SQL Project: Data Job Analysis (Practice Problems)

## Project Description
This project is based on a tutorial video that covered job market analysis using SQL. However, the purpose here is not to duplicate the tutorial’s analysis but rather to focus on solving SQL practice problems that were presented without solutions in the video. The solutions provided in this project are my own work, without verification against the original author's answers. The motivation for this project is to practice SQL, showcase problem-solving skills, and demonstrate Git version control proficiency.

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
   - **Count of Job Postings by Month**: This query returns the number of job postings for "Data Analyst" roles, grouped by the month of posting. It extracts the month from the `job_posted_date` field and counts the number of postings in each month.
```sql
SELECT 
   COUNT(job_id) AS job_posted_count,
   EXTRACT(MONTH FROM job_posted_date) AS month
FROM
   job_postings_fact
WHERE
   job_title_short = 'Data Analyst'
GROUP BY
   month
ORDER BY
   job_posted_count DESC;
```

## Project Status
This project is complete and includes all practice problems that were not presented with solutions in the video tutorial. Additional solutions were created independently and reflect my approach to problem-solving in SQL.

## Future Improvements
- Although the project focused on solving the SQL practice problems from the tutorial, additional analyses, such as trends by geographical location or salary, could be explored if the scope were expanded.
- Integrating external data sources could further enrich the dataset, providing more comprehensive and up-to-date insights.

## Lessons Learned
Throughout this project, I gained valuable experience in solving SQL practice problems and using version control with Git. I refined my skills in writing complex queries using JOINs, subqueries, CASE WHEN statements, and Common Table Expressions (CTEs). Additionally, I learned how to handle real-world data scenarios, such as managing missing values and categorizing data. Effective branching and merging in Git was crucial for version control, helping me maintain clean code and organize changes efficiently.

## License
[MIT License](https://opensource.org/licenses/MIT)