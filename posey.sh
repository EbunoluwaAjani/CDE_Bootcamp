#!/bin/bash
#variables declaration from Postgres Server
HOST="localhost"
USERNAME="postgres"
PORT="5432"
PASSWORD="3er4#ER$"


psql -h "$HOST" -U "$USERNAME" -p "$PORT" -c "\q"
if [ $? -eq 0 ]; then 
	echo "Successful Connection"
else 
	echo "Failed"
	exit 1
fi
}
