# cannot change hostname as this is set to the name of your IOS device on ish app
# echo "" > /etc/hostname

apk update
apk upgrade

# If using ish Alpine Linux, install bash

# apk add bash
# bash --version

# If using Alpine Linux from source, install zsh
# Source URL: https://dl-cdn.alpinelinux.org/alpine/v3.14/releases/x86/alpine-netboot-3.14.3-x86.tar.gz

apk add zsh
zsh --version

apk add python3
python3 --version

# set alias
echo 'alias python="python3"' >> /etc/profile
tail -n1 /etc/profile

apk add vim

apk add curl
curl --version

apk add wget
wget --version

apk add git
git --version

# Read from environment variables

git config --global user.name $GIT_USERNAME
git config --global user.name

git config --global user.email $GIT_EMAIL
git config --global user.email

# Install terminal-based web browser
apk add lynx
lynx --version

apk add openssh
