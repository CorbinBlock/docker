container_param=$1

docker cp /home/cblock/WideWorldImporters-Full.bak $container_param:/var/opt/mssql/data/WideWorldImporters-Full.bak

docker cp /home/cblock/WideWorldImportersDW-Full.bak $container_param:/var/opt/mssql/data/WideWorldImportersDW-Full.bak


docker cp /home/cblock/StackOverflow2013_1.mdf $container_param:/var/opt/mssql/data/StackOverflow2013_1.mdf


docker cp /home/cblock/StackOverflow2013_2.ndf $container_param:/var/opt/mssql/data/StackOverflow2013_2.ndf


docker cp /home/cblock/StackOverflow2013_3.ndf $container_param:/var/opt/mssql/data/StackOverflow2013_3.ndf

docker cp /home/cblock/StackOverflow2013_4.ndf $container_param:/var/opt/mssql/data/StackOverflow2013_4.ndf

docker cp /home/cblock/StackOverflow2013_log.ldf $container_param:/var/opt/mssql/data/StackOverflow2013_log.ldf
