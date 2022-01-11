Set-Location C:\wslsources
docker export -o C:\wslsources\debian_dev_env.tar.gz debian_dev_env
wsl --list
wsl --unregister debian_dev_env
wsl --import debian_dev_env .\debian_dev_env C:\wslsources\debian_dev_env.tar.gz
wsl --set-default debian_dev_env
wsl --list
