import subprocess


def execute_shell(command_string: str) -> int:
    print(command_string)
    output = subprocess.call(command_string, shell=True)
    return output


def main() -> list[int]:
    outputs: list[int] = [execute_shell("wsl.exe podman system --force prune"),
                          execute_shell("wsl.exe podman build -f /c/srv/docs/srv/podman/podmanDebian"),
                          execute_shell("wsl.exe podman build -f /c/srv/docs/srv/podman/podmanAlpine"),
                          execute_shell("wsl.exe podman build -f /c/srv/docs/srv/podman/podmanGentoo")]
    return outputs


if __name__ == "__main__":
    main()
