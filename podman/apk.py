import subprocess


def containers_policy_heredoc() -> str:
    script = """ 
    cat << EOF > /etc/containers/policy.json
    {
        "default": [{"type": "insecureAcceptAnything"}]
    }
    """
    return script


def execute_shell(command_string: str) -> int:
    process_instance = subprocess.Popen(command_string, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return_code: int = process_instance.wait()
    standard_output, standard_error = process_instance.communicate()
    print('Standard output is: \n', standard_output, '\n')
    print('Standard error is: \n', standard_error, '\n')
    print('Return code:', return_code, '\n')
    return return_code


def profile_heredoc() -> str:
    script: str = """
    cat << EOF > /home/cblock/.profile
    alias py="python"
    alias python="python3"
    source /etc/profile
    """
    return script


def shell_script() -> str:
    script: str = """
    sudo apk -U upgrade    
    sudo apk add bash dos2unix git git-lfs keepassxc nano neofetch openssh python3 podman py3-pip sudo tmux vim 
    sudo podman system reset --force
    git config --global user.name "<user>"
    git config --global user.email "<email>"
    sudo adduser -G wheel cblock -s /bin/bash
    sudo echo "cblock ALL=(ALL) ALL" > /etc/sudoers.d/cblock && sudo chmod 0440 /etc/sudoers.d/cblock
    python3 -m  pip install --upgrade pip
    # mkdir -p /c
    # test -f /home/cblock/docs
    # ln -s /c/srv/docs/ /home/cblock/docs
    # test -f /home/cblock/scripts
    # ln -s /c/srv/docs/srv/scripts /home/cblock/scripts
    # test -f /home/cblock/podman
    # ln -s /c/srv/docs/srv/podman /home/cblock/podman
    # ln -s /srv /c/srv
    sudo chown cblock /etc/profile
    sudo chown cblock /home/cblock/.profile
    sudo chown cblock /etc/wsl.conf
    """
    return script


def repo_heredoc() -> str:
    script: str = """
    cat << EOF > /etc/apk/repositories
https://dl-cdn.alpinelinux.org/alpine/edge/main/
https://dl-cdn.alpinelinux.org/alpine/edge/community/
EOF
    """
    return script


def system_profile_heredoc() -> str:
    script: str = """
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

    function pi() {
        ssh -p <port> <username>@<hostname>
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
    """
    return script


def wsl_config_heredoc() -> str:
    script: str = """
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
    """
    return script


def main() -> list[int]:
    outputs: list[int] = [execute_shell(repo_heredoc()),
                          execute_shell(shell_script()),
                          execute_shell(profile_heredoc()),
                          execute_shell(system_profile_heredoc()),
                          execute_shell(containers_policy_heredoc()),
                          execute_shell(wsl_config_heredoc())]
    return outputs


if __name__ == "__main__":
    main()
