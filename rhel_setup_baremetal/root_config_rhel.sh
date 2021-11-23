cat /etc/os-release

subscription-manager register --username $RH_USER --password $RH_PWD

subscription-manager role --set="Red Hat Enterprise Linux Workstation"

subscription-manager service-level --set="Self-Support"

subscription-manager usage --set="Development/Test"

subscription-manager attach

dnf update -y

systemctl enable --now cockpit.socket

insights-client --register

dnf install git -y
git --version

dnf install python39 -y
python3.9 --version
