container_param=$1

podman cp ~/git/docker/sql_server_container/WideWorldImporters-Full.bak $container_param:/var/opt/mssql/data/WideWorldImporters-Full.bak

podman cp ~/git/docker/sql_server_container/WideWorldImportersDW-Full.bak $container_param:/var/opt/mssql/data/WideWorldImportersDW-Full.bak
