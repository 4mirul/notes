---
tags:
- proxmox
- linux
- tldr
- 2025-07
---

# Post install Proxmox

[link](https://github.com/CarmineCodes/Proxmox-No-Subscription-No-Problem)

## Removing enterprise repo

[link](https://pve.proxmox.com/wiki/Package_Repositories)

Comment `deb https://enterprise.proxmox.com/debian/pve bookworm pve-enterprise` in `/etc/apt/sources.list.d/pve-enterprise.list`

## Add no-subscription repository

[link](https://pve.proxmox.com/wiki/Package_Repositories)

Below example `/etc/apt/sources.list`

```sources.list
deb http://ftp.debian.org/debian bookworm main contrib
deb http://ftp.debian.org/debian bookworm-updates main contrib

# Proxmox VE pve-no-subscription repository provided by proxmox.com,
# NOT recommended for production use
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription

# security updates
deb http://security.debian.org/debian-security bookworm-security main contrib
```

## Remove Nag box on login

1. ` cd /usr/share/javascript/proxmox-widget-toolkit`
2. `cp proxmoxlib.js proxmoxlib.js.bak`
3. `nano proxmoxlib.js` and modify like below

Before:-

```.js
Ext.Msg.show({
 title: gettext('No valid subscription'),
```
After:-

```.js
void({
 title: gettext('No valid subscription'),
```
4. `systemctl restart pveproxy.service`