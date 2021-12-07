FROM mcr.microsoft.com/mssql/server:2019-latest

# Create work directory

RUN mkdir -p /usr/work
WORKDIR /usr/work

# Copy all scripts into working directory

COPY *.s* /usr/work/

COPY *.bak /var/opt/mssql/data/

# Grant permissions for the import-data script to be executable
# This is not needed as podman is rootless
# RUN chmod +x /usr/work/import_data.sh

EXPOSE 1433
CMD /bin/bash ./entrypoint.sh
