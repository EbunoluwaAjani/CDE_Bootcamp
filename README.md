1. README File for ETL Bash Script

The Bash script performs a simple ETL (Extract, Transform, Load) process for managing data infrastructure at CoreDataEngineers. The script downloads a CSV file, transforms the data by renaming a column and selecting specific columns, and loads the transformed data into a designated directory.

Script Details
- Extract: Downloads a CSV file from the provided URL and saves it to the raw folder.
- Transform: Renames the Variable_code column to variable_code, selects the year, Value, Units, and variable_code columns, and saves the transformed data to the Transformed folder as 2023_year_finance.csv.
- Load: Moves the transformed data from the Transformed folder to the Gold folder.

Usage

1. Save this script as a Bash file -cde_ass1.sh
2. Make the script executable by running chmod +x cde_ass1.sh
3. Run the script using ./cde_ass1.sh

Confirmation Messages
The script outputs confirmation messages for each stage:

- "Extraction process done"
- "Transformation process done"
- "Load process done"

Folder Structure
The script assumes the following folder structure:

- raw for extracted data
- Transformed for transformed data
- Gold for loaded data

2. READMEfor Cron Job Daily Script Runner

The Cron Job Schedules cde_ass1.sh script to run daily at 12:00 AM.

Contents:
0 0 * * * /mnt/c/Users/Bluechip/core_data/cde_ass1.sh

Explanation:
- 0 0: minute and hour (0 minute, 0 hour = 12:00 AM)
- * * *: day of the month, month, and day of the week (asterisks mean "any" or "every")
- /mnt/c/Users/Bluechip/core_data/cde_ass1.sh: path to the script to be executed

This cron job runs the cde_ass1.sh script every day at midnight.

3. README for a Script to move JSON and CSV Files

Purpose: 
Moves all JSON and CSV files from the current directory to a new directory named coredata/json_and_csv/.

Usage: 
Save this script as a json_and_csv.sh and run it in the directory containing the JSON and CSV files.

Functionality:
- Creates the coredata/json_and_csv/ directory if it doesn't exist
- Moves all JSON and CSV files from the current directory to coredata/json_and_csv/

4. README for SQL Queries for Data Analysis

Query 1: Orders with Zero Standard Quantity

- Returns orders with zero standard quantity and either gloss or poster quantity over 1000
- Query: SELECT * FROM orders WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000)
- Result: 17 order records

Query 2: Accounts with Specific Company Names and Primary Contact

- Returns accounts with company names starting with 'C' or 'W', primary contact containing 'ana' or 'Ana', and not containing 'eana'
- Query: SELECT * FROM accounts WHERE name LIKE 'C%' OR name LIKE 'W%' AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana') OR primary_poc NOT LIKE '%eana%')
- Result: 49 account records

Query 3: Sales Reps, Accounts, and Regions

- Returns a table with region name, sales rep name, and account name, sorted alphabetically by account name
- Query: SELECT r.name, s.name, a.name FROM region r JOIN sales_reps s ON (link unavailable) = s.region_id JOIN accounts a ON (link unavailable) = a.sales_rep_id ORDER BY a.name
- Result: 351 records


