#!/bin/bash
# #variables declaration from Postgres Server
 
HOST="localhost"
USERNAME="postgres"
PORT="5432"
PASSWORD="3er4#ER$"
 
export PGPASSWORD="$PASSWORD"
 
 
psql -h "$HOST" -U "$USERNAME" -p "$PORT" -c "\q"
if [ $? -eq 0 ]; then
    echo "Successful connection"
else     
    echo "Failed Connection"
    exit 1
fi
 
 
psql -h "$HOST" -U "$USERNAME" -p "$PORT" -c "CREATE DATABASE POSEY;"
if [ $? -eq 0 ]; then
     echo "POSEY database created successfully"
else
     echo "Failed to create"
    exit 1
fi

# Iterate over the CSV files in the cde_ass4 directory
for file in cde_ass4/*.csv; do
# Get the file name without the directory path
filename=$(basename "$file" .csv)
echo "file loading $file into table $filename"


  # Copy the CSV data into the database
  #psql -U postgres -d POSEY -c
   psql -h "$HOST" -U "$USERNAME" -p "$PORT" -c "copy $filename from '$file' with (format csv, header true);" 
   
   #"\copy ${filename%.*} FROM '$file' DELIMITER ',' CSV HEADER;"

if [ $? -eq 0 ]; then
    echo "file successfully loaded"
else
    echo "Failed to load"
    exit 1
fi
done
 