# cannot change hostname as this is set to the name of your IOS device on ish app
# echo "" > /etc/hostname

sudo apk update
sudo apk upgrade

# If using ish Alpine Linux, install bash

sudo apk add bash
bash --version

# If using Alpine Linux from source, install zsh
# Source URL: https://dl-cdn.alpinelinux.org/alpine/v3.14/releases/x86/alpine-netboot-3.14.3-x86.tar.gz

sudo apk add zsh
zsh --version

sudo apk add python3
python3 --version

# set alias
sudo echo 'alias python="python3"' >> /etc/profile
tail -n1 /etc/profile

sudo apk add vim

sudo apk add curl
curl --version

sudo apk add wget
wget --version

sudo apk add git
git --version

# Read from environment variables

git config --global user.name $GIT_USERNAME
git config --global user.name

git config --global user.email $GIT_EMAIL
git config --global user.email

# Install terminal-based web browser
sudo apk add lynx
lynx --version

sudo apk add openssh
