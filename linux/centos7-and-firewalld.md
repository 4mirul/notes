# CentOS 7 and `firewalld`

| Version                       |
| ----------------------------- |
| CentOS Linux release 7.9.2009 |
| firewalld version 0.6.3       |

## Configuration files

Default configuration files. Do not make changes to these files;

`/usr/lib/firewalld`

Changes to the default configuration files stored here;

`/etc/firewalld`

## `firewalld` zones

List predefined firewalld zones;

`ls -lrt /usr/lib/firewalld/zones/`

Zone files contain preset settings, which will be applied to a network interface;

`grep -i service /usr/lib/firewalld/zones/public.xml`

Check default zone;

`sudo grep –i defaultzone /etc/firewalld/firewalld.conf`

Show interfaces that are bound to the public-zone;

`firewall-cmd --get-active-zone`

Change the default zone;

`firewall-cmd --set-default-zone=work`

## `firewalld` services

`sudo systemctl start firewalld`

`sudo systemctl enable firewalld`

`sudo systemctl status firewalld`

`sudo firewall-cmd --state`

## The `firewalld-cmd` utility

`firewall-cmd --help`

`firewall-cmd --list-all-zones`

`sudo firewall-cmd --list-ports`

To permit access by HTTP clients for the public zones;

`sudo firewall-cmd --zone=public --add-service=http`

To list the services;

`firewall-cmd --zone=public --list-services`

To make changes permanent;

`sudo firewall-cmd --permanent --zone=public --add-service=http`

To open port, example port 80/tcp

`sudo firewall-cmd --zone=public --add-port=80/tcp`

`sudo firewall-cmd --zone=public --add-port=123/udp --permanent`

To remove port,

`sudo firewall-cmd --zone=public --remove-port=10050/tcp`

To apply the changes;

`sudo firewall-cmd --reload`

## References

[link](https://www.thegeekdiary.com/centos-rhel-7-beginners-guide-to-firewalld/)
[link](https://firewalld.org/documentation/man-pages/)
