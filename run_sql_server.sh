#!/bin/bash

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Password7$" -p 1433:1433 -v $(pwd):/usr/src --name RBC  -d mcr.microsoft.com/mssql/server:2017-latest

sleep 5

id=$(docker ps -aqf "name=RBC")

sleep 10

docker exec -i ${id} /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Password7$ -i /usr/src/sql_scripts/list_db.sql
