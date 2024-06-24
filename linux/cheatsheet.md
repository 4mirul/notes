# Cheatsheet for me

`ps aux` - list all running processes

`lsof -Pi TCP -a -c dockerd`

`ip addr show docker0`

`sudo lsof -i -P -n | grep LISTEN`

`sudo netstat -tulpn | grep LISTEN`

`sudo ss -tulpn | grep LISTEN`

`sudo lsof -i:22` ## see a specific port such as 22 ##

`sudo nmap -sTU -O <ip-addr>`

```sh
sudo ss -tulw
sudo ss -tulwn
sudo ss -tulwn | grep LISTEN
```

```sh
man lsof
man ss
man netstat
man nmap
man 5 services
```
