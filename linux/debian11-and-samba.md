# Debian 11 and Samba

| Version                      |
| ---------------------------- |
| Debian 11                    |
| Samba version 4.13.13-Debian |

[1](https://ubuntu.com/tutorials/install-and-configure-samba#1-overview)

`sudo apt-get install samba` - install samba

`sudo vim /etc/samba/smb.conf` - edit samba configuration file and add below.

```conf
[sambashare]
    comment = Samba on Debian
    path = /home/username/foldername
    read only = no
    browsable = yes
```

`sudo systemctl restart smbd.service` - restart the samba service

`sudo smbpasswd -a username` - set password for samba user
