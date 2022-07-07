#!/bin/bash

apk -U upgrade
apk add sudo
cp /etc/apk/repositories /tmp/
sudo sed -i 's/v3.14/edge/' /etc/apk/repositories
sudo apk -U upgrade
sudo apk add bash \
build-base \
curl \
dos2unix \
git \
git-lfs \
keepassxc \
nano \
neofetch \
openssh \
podman \
python3 \
sudo \
tmux \
vim
sudo mkdir -p /etc/containers
sudo curl -L -o /etc/containers/registries.conf https://src.fedoraproject.org/rpms/containers-common/raw/main/f/registries.conf
sudo curl -L -o /etc/containers/policy.json https://src.fedoraproject.org/rpms/containers-common/raw/main/f/default-policy.json
sudo podman system reset --force
# sudo rm /var/lib/containers/storage/libpod/defaultCNINetExists
git config --global user.name "<user>"
git config --global user.email "<email>"
sudo adduser -G wheel cblock -s /bin/bash
sudo echo "cblock ALL=(ALL) ALL" > /etc/sudoers.d/cblock && sudo chmod 0440 /etc/sudoers.d/cblock
python3 -m ensurepip
python3 -m pip install --upgrade pip
sudo chown cblock /etc/profile
sudo chown cblock /home/cblock/.profile
sudo chown cblock /etc/wsl.conf
sudo chown cblock /etc/apk/repositories
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
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/c/Windows/System32/:/c/Windows/System32/WindowsPowershell/v1.0/:/c/Windows/:/c/tmp/chrome-win/:"
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
