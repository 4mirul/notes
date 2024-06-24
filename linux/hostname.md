# hostname

## change hostname

[link](https://linuxconfig.org/how-to-change-hostname-on-linux)

```sh
$ hostname
$ hostnamectl
$ sudo hostnamectl set-hostname linux.torqueserver.com
```

edit `/etc/hosts`

```hosts
127.0.0.1 localhost
127.0.1.1 linux.torqueserver.com
...
```
