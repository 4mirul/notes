## fail2ban

[1](https://packages.debian.org/stable/net/fail2ban)
[2](https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-14-04)
[3](https://www.digitalocean.com/community/tutorials/how-to-protect-an-nginx-server-with-fail2ban-on-ubuntu-14-04)
[4](https://technicalramblings.com/blog/adding-ban-unban-notifications-from-fail2ban-to-discord/)
[5](https://raspberrytips.com/install-fail2ban-raspberry-pi/)

**ban hosts that cause multiple authentication errors**

Fail2ban monitors log files (e.g. /var/log/auth.log, /var/log/apache/access.log) and temporarily or persistently bans failure-prone addresses by updating existing firewall rules. Fail2ban allows easy specification of different actions to be taken such as to ban an IP using iptables or hostsdeny rules, or simply to send a notification email.

By default, it comes with filter expressions for various services (sshd, apache, qmail, proftpd, sasl etc.) but configuration can be easily extended for monitoring any other text file. All filters and actions are given in the config files, thus fail2ban can be adopted to be used with a variety of files and firewalls. Following recommends are listed:

- iptables/nftables -- default installation uses iptables for banning.
  nftables is also suported. You most probably need it
- whois -- used by a number of _mail-whois_ actions to send notification
  emails with whois information about attacker hosts. Unless you will use
  those you don't need whois
- python3-pyinotify -- unless you monitor services logs via systemd, you
  need pyinotify for efficient monitoring for log files changes

Install:

`sudo apt install fail2ban -y`

Useful commands:

`sudo service fail2ban start | stop | restart | status | reload`

`sudo fail2ban-server start | stop | restart | status | reload`

`sudo fail2ban-client <COMMAND>` [command list](https://www.fail2ban.org/wiki/index.php/Commands)

[back to Table of Contents](https://gist.github.com/4mirul/31567683d3f5490f0161b62fbb98849f#table-of-contents)
