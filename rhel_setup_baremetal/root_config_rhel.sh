cat /etc/os-release

subscription-manager register --username $RH_USER --password $RH_PWD

subscription-manager role --set="Red Hat Enterprise Linux Server"

subscription-manager service-level --set="Self-Support"

subscription-manager usage --set="Development/Test"

subscription-manager attach

dnf update --allowerasing --nobest -y

systemctl enable --now cockpit.socket

insights-client --register

dnf install git -y
git --version

dnf install python39 -y
python3.9 --version


id

dnf update --allowerasing --nobest -y

echo 'alias python="python3.9"' >> ~/.bashrc
tail -n1 ~/.bashrc

git config --global user.name $GIT_USERNAME
git config --global user.name

git config --global user.email $GIT_EMAIL
git config --global user.email

dnf install vim -y
# dnf install tmux -y

# Install docker and docker compose
# https://help.hcltechsw.com/bigfix/10.0/mcm/MCM/Config/install_docker_ce_docker_compose_on_rhel_8.html

dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

dnf repolist -v

dnf install --nobest docker-ce -y

dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm

dnf install docker-ce --allowerasing -y

systemctl enable --now docker

systemctl is-active docker

curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose

mv docker-compose /usr/local/bin && chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Check website if encounter container connectivity issues

dnf group install "Development Tools" -y

cd /usr/local/src
wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
tar xzf noip-duc-linux.tar.gz
cd noip-2.1.9-1
make
make install
