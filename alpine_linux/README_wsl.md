How to setup a WSL Development environment:
TIP: Before running the export commands, switch out the #### values to configure your git credentials. 

# Enter Powershell

cd C: & mkdir wslsources & cd C:\wslsources

Invoke-WebRequest -Uri https://dl-cdn.alpinelinux.org/alpine/v3.13/releases/x86_64/alpine-minirootfs-3.13.4-x86_64.tar.gz -OutFile alpine-minirootfs-3.13.4-x86_64.tar.gz

wsl.exe --import alpine ./alpine c:\wslsources\alpine-minirootfs-3.13.4-x86_64.tar.gz

wsl.exe -d alpine

echo "export GIT_EMAIL='####'" > /etc/profile.d/git_email.sh && echo "export GIT_USERNAME='####'" > /etc/profile.d/git_username.sh

apk add sudo

echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel

adduser -s /bin/sh -G wheel cblock

passwd

# Exit WSL and enter Powershell

alpine config --default-user cblock

alpine

cd ~ && mkdir git && cd git

sudo apk add git && git clone https://github.com/CorbinBlock/alpine_linux.git

cd alpine_linux && sudo sh setup_env_wsl.sh

------------------------------------------------------------------------------------

Enjoy!
