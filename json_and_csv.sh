#!/bin/bash
mkdir -p coredata/json_and_csv/
for file in *.csv *.json; do
	  [ -f "$file" ] && mv "$file" json_and_csv/$file
done
