# Dell PowerEdge R610 and Debian 11 "bullseye"

| Version                                |
| -------------------------------------- |
| Dell PowerEdge R610                    |
| Broadcom NetXtreme II Gigabit Ethernet |
| PERC H700 Raid Controller              |
| Debian 11 "bullseye"                   |

## Install and configure

Download Debian 11(amd64,standard) iso at [link](https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/)

Download Broadcom NetXtremeII firmware at [link](https://packages.debian.org/source/bullseye/firmware-nonfree)

Create bootable USB drive using Rufus and boot the USB to install the OS. During installation, skip the network setup and skip the mirror setup.

After done installation, remove USB drive and let it restart to boot the OS.

Login, then login as root using `su` then `sudo usermod -aG sudo $USER` and exit then relogin

Then install Broadcom NetXtremeII firmware from USB drive using `sudo dpkg -i <package.deb>`. need to mount the USB drive `mount /dev/<usb-partition> /mnt/<any-folder>`

Use `ip a` to check the interfaces names. Enable DHCP on `enp1s0f0` for ethernet port #1 by adding below using `sudo nano /etc/network/interfaces`

```interfaces
auto enp1s0f0
iface enp1s0f0 inet dhcp
```

Ping google to test the connection, `ping google.com`

Update the `sources.list` by adding below to `/etc/apt/sources.list`; then `sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade`

```sources.list
deb http://deb.debian.org/debian bullseye main contrib non-free
deb-src http://deb.debian.org/debian bullseye main contrib non-free

deb http://deb.debian.org/debian-security bullseye-security/updates main contrib non-free
deb-src http://deb.debian.org/debian-security bullseye-security/updates main contrib non-free

deb http://deb.debian.org/debian bullseye-updates main contrib non-free
deb-src http://deb.debian.org/debian bullseye-updates main contrib non-free
```

## Optional

Enable sudo for main user `sudo usermod -aG sudo <user>`

Install git and zsh using `sudo apt-get -y install git zsh` and install ohmyzsh at [link](https://ohmyz.sh/#install)
