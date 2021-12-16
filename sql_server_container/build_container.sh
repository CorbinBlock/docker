# sudo chown -R cblock /mnt/wslg/runtime-dir/

docker pull mcr.microsoft.com/mssql/server:2019-latest

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=<YourStrong@Passw0rd>" \
	-p 1433:1433 --name sql1 -h sql1 \
	-d mcr.microsoft.com/mssql/server:2019-latest
