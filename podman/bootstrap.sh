#!/bin/bash

apt-get update && apt-get upgrade -y; apt-get install python3 sudo -y
cp /etc/apt/sources.list /tmp/
cat << EOF > /etc/apt/sources.list
deb http://deb.debian.org/debian/ unstable main
deb-src http://deb.debian.org/debian/ unstable main
EOF
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get autoremove -y
# sudo apt-get install firefox xfce4 -y
echo "Build podman container mgmt package manually"
sudo apt-get install \
btrfs-progs \
curl \
dos2unix \
git \
git-lfs \
golang-go \
go-md2man \
iptables \
keepassxc \
less \
libassuan-dev \
libbtrfs-dev \
libc6-dev \
libdevmapper-dev \
libglib2.0-dev \
libgpgme-dev \
libgpg-error-dev \
libprotobuf-dev \
libprotobuf-c-dev \
libseccomp-dev \
libselinux1-dev \
libsystemd-dev \
nano \
neofetch \
openssh-server \
pkg-config \
runc \
sudo \
tmux \
vim \
uidmap -y
sudo apt-get autoremove -y
sudo mkdir -p /etc/containers
sudo curl -L -o /etc/containers/registries.conf https://src.fedoraproject.org/rpms/containers-common/raw/main/f/registries.conf
sudo curl -L -o /etc/containers/policy.json https://src.fedoraproject.org/rpms/containers-common/raw/main/f/default-policy.json
sudo podman system reset --force
# sudo rm /var/lib/containers/storage/libpod/defaultCNINetExists
sudo apt-get install python3 python3-pip python3-venv -y
git config --global user.name "<user>"
git config --global user.email "<email>"
sudo useradd -m -G wheel cblock -s /bin/bash
sudo echo "cblock ALL=(ALL) ALL" > /etc/sudoers.d/cblock && sudo chmod 0440 /etc/sudoers.d/cblock
python3 -m pip install --upgrade pip
sudo chown cblock /etc/profile
sudo chown cblock /home/cblock/.profile
sudo chown cblock /etc/wsl.conf
sudo chown cblock /etc/apt/sources.list
cat << EOF > /home/cblock/.profile
alias py="python"
alias python="python3"
source /etc/profile
EOF
    cat << EOF > /etc/profile
# Purpose: Define functions

function config() {
    export EDITOR=/usr/bin/vim
    export PAGER=/usr/bin/less
    export LIBGL_ALWAYS_INDIRECT=1
    export DONT_PROMPT_WSL_INSTALL=1
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/c/Windows/System32/:/c/Windows/System32/WindowsPowershell/v1.0/:/c/Windows/:/c/srv/chrome-win/chrome-win/:/c/Program Files/Powershell/7/"
    export PS1="\\s-\\v$ "
    alias docker="podman"
    alias fir="firefox"
    alias po="podman"
    alias py="python3"
    alias python="python3"
    # cd ~
}

function gpl() {
    secret git
    git pull --no-rebase
}

function gp() {
    secret git
    git add *
    message="git commit -m \\""\$@"\\""
    eval \$message
    git push
}

function pw() {
    command_string="powershell.exe -c \\""\$@"\\""
    echo \$command_string
    eval \$command_string
}

function pwkill() {
    echo \$1
    shell_command="Get-Process \$1 | Stop-Process"
    pw \$shell_command
}

function secret() {
    secret_path=\$1
    database=/c/srv/docs/work/secrets.kdbx
    key_file=/c/srv/docs/work/secrets.keyx
    password=/home/cblock/.data/.keepassxc.txt
    command="cat \$password | keepassxc-cli show -sa password -k \$key_file \$database \$secret_path | clip.exe"
    eval \$command
}

function tu() {
    tmux new-session \; split-window -h \; split-window -v \; attach
}

function wts() {
    pwkill WindowsTerminal
}

# Purpose: Call functions

config
EOF
cat << EOF > /etc/wsl.conf
[automount]
enabled = true
root = /
# options = "metadata,uid=1003,gid=1003,umask=077,fmask=11,case=off"
# mountFsTab = false
[network]
# hostname = WIN-02-ASUS
generateHosts = true
generateResolvConf = true
[interop]
enabled = true
appendWindowsPath = true
[user]
default = cblock
[boot]
command = source /etc/profile
EOF
cd /tmp/
git clone https://github.com/containers/podman/
cd podman
make BUILDTAGS="selinux seccomp"
sudo make install PREFIX=/usr