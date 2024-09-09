# SQL Project: Data Job Analysis

## Project Description
This project focuses on analyzing job listing data from the tech industry using SQL. The goal is to extract insights such as the number of jobs per category, average salaries, and the most popular programming languages required by employers. The queries provided in this project are designed to help understand job market trends and requirements for data-related positions.

## Setup Instructions
To set up and run the queries in this project, follow the steps below:

1. Clone the repository:
'''bash
git clone https://github.com/AnoshZahir/sql-project-data-job-analysis.git
'''

2. Download or use the required files for this project:

   - The files are included in this repository:
     - CSV files are in the `csv_files/` folder.
     - SQL scripts are in the `sql_load/` folder.
   
   - Alternatively, you can download the files from the original source:
     - [Download csv files and SQL scripts](lukeb.co/sql_project_csvs)

3. To set up the database:
   - Execute the SQL scripts from the `sql_load/` folder (or the downloaded files) to create the necessary tables.
   - Load the data into the database using the CSV files from the `csv_files/` folder (or the downloaded files).

5. Check that you now have the following 4 tables and they are loaded with the relevant data.
   - job_postings_fact
   - skills_job_dim
   - skills_dim
   - company_dim

## Usage
Here are some examples of the SQL queries included in this project:
Total number of jobs per category: This query returns the number of jobs available in each category:
'''
To be updated
'''

Average salary per job category: This query calculates the average salary for each job category:
'''
To be updated
'''

Top 5 customers by total order value (complex query): This query retrieves the top customers based on their total order value:
'''
To be updated
'''
## Project Status
This project is currently in progress. The next steps include further analysis of job trends by location and company size.

## Future Improvements
Add queries to analyze job trends based on geographical location.
Perform salary trend analysis over time and across various job categories.
Integrate external data sources to enrich job listing information.

## License
[MIT License](https://opensource.org/licenses/MIT)