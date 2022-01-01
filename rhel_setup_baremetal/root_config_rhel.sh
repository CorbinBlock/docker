cat /etc/os-release

cd ~
pwd
ls
id

dnf update -y

subscription-manager register --username $RH_USER --password $RH_PWD
subscription-manager role --set="Red Hat Enterprise Linux Server"
subscription-manager service-level --set="Self-Support"
subscription-manager usage --set="Development/Test"
subscription-manager attach

systemctl enable --now cockpit.socket
insights-client --register

dnf install git -y
git --version
dnf install python39 -y
python3.9 --version

git config --global user.name CorbinBlock
git config --global user.name
git config --global user.email williamcorbinblock@gmail.com
git config --global user.email

dnf install vim -y

dnf remove buildah skopeo podman containers-common atomic-registries docker container-tools -y
rm -rf /etc/containers/* /var/lib/containers/* /etc/docker /etc/subuid* /etc/subgid*
cd ~ && rm -rf /.local/share/containers/

dnf remove podman.x86_64 -y
dnf autoremove

dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf repolist -v
dnf install docker-ce -y
dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm -y
systemctl enable --now docker
systemctl is-active docker

curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose
mv docker-compose /usr/local/bin && chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

dnf group install "Development Tools" -y
