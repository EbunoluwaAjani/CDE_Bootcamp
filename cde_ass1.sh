#!/bin/bash
URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
Input_File="raw/my_download.csv"
Transformed_File="Transformed/2023_year_finance.csv"
Output_File="gold/new_file.csv"
curl $URL > $Input_File
echo "Extraction process done"

# Transformation process
awk -F, '{print $1, $9, $5, tolower($6)}' "$Input_File" > $Transformed_File
echo "Transformation process done"

#Load Process
mv $Transformed_File $Output_File
echo "Load process done"