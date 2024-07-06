FROM mcr.microsoft.com/mssql/server:2022-latest

# Environment variables
ENV ACCEPT_EULA=Y
ENV MSSQL_PID=Express
ENV SA_PASSWORD=AD_crouse@1403

# Copy setup script and entrypoint script
COPY setup.sql /usr/src/setup.sql
COPY entrypoint.sh /usr/src/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/src/entrypoint.sh

# Set the entrypoint script as the entrypoint
ENTRYPOINT ["/usr/src/entrypoint.sh"]
