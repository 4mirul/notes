---
tags:
- work-in-progress
- tldr
- linux
- setup
- 2024-08
---

# Best linux server setup

- proxmox at [link](https://www.proxmox.com/en/proxmox-virtual-environment/)
- [pve-nag-buster](https://github.com/foundObjects/pve-nag-buster/)
- create debian vm, download debian at [link](https://www.debian.org/distrib/)
- enable admin right for user, enable ssh on debian and proxmox
- remote ssh with key, disable password
- ohmyzsh with plugins (wakatime git sudo docker docker-compose history z colored-man-pages debian command-not-found cp themes)
- ufw
- docker install on debian [link](https://docs.docker.com/engine/install/debian/)
- enable `metrics-address` and `journald` for docker
- mount other disk to vm refer [link](https://pve.proxmox.com/wiki/Passthrough_Physical_Disk_to_Virtual_Machine_(VM))
  - install ntfs-3g for ntfs disk
  

  
- docker enable journald for netdata and enable metric, perfect .env file
  - webtop for vscode remotely and for remote ssh
  - metube for download youtube
  - database and webui?, mysql mariadb postgres mongodb redis elasticsearchdb and other db
  - swag/traefik
  - dozzle
  - grafana
  - servarr
  - wordpress
  - flame
  - webtop
  - prometheus and all exporter? alertmanager
  - logspout
  - ntfy
  - dufs/filebrowser
  - ttrss
  - drawio
  - authentik propersetup
  - asf
  - znc
  - autoheal
  - rustdesk server
  - hedgedoc
  - watchtower
  - pihole
  - discord irc
  - portainer
  - cloudflare-ddns
  - jellyfin
- wireguard manual setup or https://github.com/angristan/wireguard-install and manual setup on client
- glances, netdata or just cacti munin or just full grafana
- pihole
- pterodactyl
- samba
- wakatime
- webmin
- check installed list txt file
- jellyfin not docker
- shell in a box