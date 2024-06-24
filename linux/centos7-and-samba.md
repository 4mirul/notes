# CentOS 7 and Samba

| Version                       |
| ----------------------------- |
| CentOS Linux release 7.9.2009 |
| Samba version 4.10.16         |

## Install Samba

`sudo yum install samba samba-client`

## Start and enable Samba services

`sudo systemctl start smb.service`

`sudo systemctl start nmb.service`

`sudo systemctl enable smb.service`

`sudo systemctl enable nmb.service`

## Configuring Firewall

`sudo firewall-cmd --permanent --zone=public --add-service=samba`

`sudo firewall-cmd --zone=public --add-service=samba`

## Creating Samba users and Directory Structure

**Or just use any Linux user and directories(security concerns).**

Create new directory for Samba;

`sudo mkdir /samba`

Create new group for all Samba users;

`sudo groupadd sambashare`

Set `/samba` group ownership to `sambashare`;

`sudo chgrp sambashare /samba`

Create new Samba user;

`sudo useradd -M -d /samba/yuu -s /usr/sbin/nologin -G sambashare yuu`

Create directory for samba user and set the ownership;

`sudo mkdir /samba/yuu`

`sudo chown yuu:sambashare /samba/yuu`

Add setgid bit to the `/samba/yuu` directory so the newly created files in this directory will inherit the group of the parent directory;

`sudo chmod 2770 /samba/yuu`

Set samba user password;

`sudo smbpasswd -a yuu`

Enable Samba account;

`sudo smbpasswd -e yuu`

Create admin user and group, anyone inside this group have administrative permissions;

`sudo useradd -M -d /samba/users -s /usr/sbin/nologin -G sambashare sadmin`

`sudo smbpasswd -a sadmin`

`sudo smbpasswd -e sadmin`

`sudo mkdir /samba/users`

`sudo chown sadmin:sambashare /samba/users`

`sudo chmod 2770 /samba/users`

## Configure Samba

Open the file `/etc/samba/smb.conf` for editing, sample [smb.conf](https://gist.githubusercontent.com/4mirul/bebad82a1dfdb10ef1ceb9c4b379d376/raw/d41960d10ee3da28ea4542e2f3232d7548d8490e/smb.conf.sample)

or below sample;

```.conf
[global]
# Most Windows systems default to WORKGROUP
  workgroup = WORKGROUP
  server string = Samba Server Version %v
# netbios name = MYSERVER

  interfaces = lo 10.8.8.0/24
  hosts allow = 127. 10.8.8.
  hostname lookups = yes

  log file = /var/log/samba/log.%m
  max log size = 50

  security = user
  passdb backend = tdbsam
  map to guest = bad user
  guest account = nobody
  load printers = no

# sharing directory with anyone with access can read and edit
[disk1]
  path = /mnt/disk
  writeable = yes
  create mask = 0777
  directory mask = 0777
  public=no
  read only = no
  browsable = yes

```

test `smb.conf` using `testparm`;

`testparm -s`

## SELinux configuration

Enable home directories share;

`sudo setsebool -P samba_enable_home_dirs on`

If anonymous directory created, label with with `samba_share_t` so SELinux able to read and write;

`sudo chcon -t samba_share_t /samba/anonymous_share/`

To disable SELinux, edit file `/etc/sysconfig/selinux` as below

Set SELinux value to disabled;

```.
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
# enforcing - SELinux security policy is enforced.
# permissive - SELinux prints warnings instead of enforcing.
# disabled - No SELinux policy is loaded.
SELINUX=disabled
# SELINUXTYPE= can take one of these two values:
# targeted - Targeted processes are protected,
# mls - Multi Level Security protection.
SELINUXTYPE=targeted
```

Not able to access share folder after above configuration? Try below;

`sudo setsebool -P samba_export_all_rw=1`

## Connecting to Samba from Linux

Make sure Samba client installed;

`sudo yum install samba-client`

`mbclient //samba_hostname_or_server_ip/share_name -U username`

example;

`mbclient //192.168.0.100/disk -U yuu`

## Mounting Samba share

Make sure install `cifs-utils`;

`sudo yum install cifs-utils`

Create mount point;

`sudo mkdir /mnt/smbmount`

Mount the share;

`sudo mount -t cifs -o username=username //samba_hostname_or_server_ip/share_name /mnt/smbmount`

example;

`sudo mount -t cifs -o username=yuu //192.168.0.100/disk /mnt/disk`

## References

[link1](https://linuxize.com/post/how-to-install-and-configure-samba-on-centos-7/)
[link2](https://www.unixmen.com/install-configure-samba-server-centos-7/)
[link3](https://www.lisenet.com/2016/samba-server-on-rhel-7/)
