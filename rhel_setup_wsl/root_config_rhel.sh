cat /etc/os-release

subscription-manager register --username $RH_USER --password $RH_PWD

subscription-manager role --set="Red Hat Enterprise Linux Workstation"

subscription-manager service-level --set="Self-Support"

subscription-manager usage --set="Development/Test"

subscription-manager attach

dnf update -y

dnf upgrade --refresh rpm glibc

rm /var/lib/rpm/.rpm.lock

dnf upgrade dnf

dnf install -y sudo cracklib-dicts

useradd -m -s /bin/bash -G wheel cblock

passwd cblock

passwd

echo "[automount]
enabled = true
mountfstab = true
root = /mnt/
options = metadata,uid=1000,gid=1000,umask=0022,fmask=11,case=off     

[network]
generatehosts = true
generateresolvconf = true
hostname = rhel8

[interop]
enabled = true
appendwindowspath = true

[user]
default = cblock" > /etc/wsl.conf

cat /etc/wsl.conf

subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms
