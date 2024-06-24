# VSCODE SERVER AND DEBIAN

| Tested on           |
| ------------------- |
| Debian 11           |
| Code version 1.74.2 |

## Installing Visual Studio Code on Debian

Run below commands or go to below link.

[![Debian](https://img.shields.io/badge/Debian-VisualStudioCode-red?logo=debian&logoColor=red)](https://wiki.debian.org/VisualStudioCode)

[![VSCode Tunnel](https://img.shields.io/badge/VSCode-Remote%20Tunnels-blue?logo=visualstudiocode&logoColor=blue)](https://code.visualstudio.com/docs/remote/tunnels#_using-the-code-cli)

```sh
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft-archive-keyring.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
```

```sh
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code # or code-insiders
```

## Running code tunnel

Run below one time to accept terms. 6 character code showing up, open the link and enter the 6 character code.

`code tunnel --accept-server-license-terms`

Run below for the next time.

`code tunnel`

## Running at boot with systemd

Create `vscode-tunnel.service` in `/etc/systemd/system/` with below detail.

```service
[Unit]
Description=vscode tunnel
After=network.target

[Service]
Type=simple
User=amirul
Group=amirul
ExecStart=/usr/bin/code tunnel

[Install]
WantedBy=multi-user.target
```

Run below after changes to start and start on boot.

```sh
sudo systemctl daemon-reload
sudo systemctl start vscode-tunnel.service
sudo systemctl enable vscode-tunnel.service
```
