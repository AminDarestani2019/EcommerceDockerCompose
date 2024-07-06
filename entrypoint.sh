#!/bin/bash

# Create necessary directories if they do not exist
mkdir -p /var/opt/mssql/data
mkdir -p /var/opt/mssql/log
mkdir -p /var/opt/mssql/secrets

# Set ownership and permissions
chown -R mssql:mssql /var/opt/mssql/data
chmod -R 770 /var/opt/mssql/data

chown -R mssql:mssql /var/opt/mssql/log
chmod -R 770 /var/opt/mssql/log

chown -R mssql:mssql /var/opt/mssql/secrets
chmod -R 770 /var/opt/mssql/secrets

# Start SQL Server
/opt/mssql/bin/sqlservr &

# Wait for SQL Server to start
echo "Waiting for SQL Server to start..."
sleep 30

# Run the setup script to create the DB and the schema in the DB
echo "Running the setup script..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "AD_crouse@1403" -i /usr/src/setup.sql

# Prevent the container from exiting
tail -f /dev/null
