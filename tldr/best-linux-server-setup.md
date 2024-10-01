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
  - `/etc/fstab` for automount disk during boot
  - below example

```fstab
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# systemd generates mount units based on this file, see systemd.mount(5).
# Please run 'systemctl daemon-reload' after making changes here.
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda1 during installation
UUID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx /               ext4    errors=remount-ro 0       1
# swap was on /dev/sda5 during installation
UUID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx none            swap    sw              0       0
UUID=xxxxxxxxxxxxxxxxx	/mnt/disk0	ntfs	defaults,noatime,uid=1000,gid=1000,umask=022	0	2
UUID=xxxxxxxxxxxxxxxxx	/mnt/disk1	ntfs	defaults,noatime,uid=1000,gid=1000,umask=022	0	2
```

- `code tunnel` at [link](https://github.com/4mirul/notes/blob/ac3bbb164bcd7fc1991562d2d3f1837eb900bcb2/linux/vscode-tunnel.md)  

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