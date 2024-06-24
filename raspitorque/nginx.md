## nginx

[1](https://www.raspberrypi.org/documentation/remote-access/web-server/nginx.md)
[2](https://docs.nginx.com/nginx/admin-guide/security-controls/controlling-access-proxied-tcp/)

**small, powerful, scalable web/proxy server**

Nginx ("engine X") is a high-performance web and reverse proxy server created by Igor Sysoev. It can be used both as a standalone web server and as a proxy to reduce the load on back-end HTTP or mail servers.

This is a dependency package to install either nginx-full (by default), nginx-light or nginx-extras.

Install:

`sudo apt install nginx -y`

Useful commands:

`sudo service nginx start | stop | restart | status | reload`

`sudo nginx -t`

[back to Table of Contents](https://gist.github.com/4mirul/31567683d3f5490f0161b62fbb98849f#table-of-contents)
