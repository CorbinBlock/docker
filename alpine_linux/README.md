How to setup an iSH app Development environment:

1. Download iSH app from Apple App Store

2. Run the App

3. Download Alpine Linux netboot x86 file from source site. Save to "Files" on your iOS device: 
https://dl-cdn.alpinelinux.org/alpine/v3.14/releases/x86/alpine-netboot-3.14.3-x86.tar.gz

4. In iSH app, select Settings > Filesystems > Import

5. Select the .tar.gz file from step 3. Boot iSH from this new filesystem.

6. Run the following commands in the terminal in order to set up your local Dev environment. 
TIP: Before running the export commands, switch out the #### values to configure your git credentials. 

echo "export GIT_EMAIL='#####'" > /etc/profile.d/git_email.sh

echo "export GIT_USERNAME='####'" > /etc/profile.d/git_username.sh

mkdir git && cd git

apk add git && git clone https://github.com/CorbinBlock/alpine_linux.git

cd alpine_linux && sh setup_env.sh


-----------------------------------------------------------------

Enjoy!
