# docker-compose

| Version                                      |
| -------------------------------------------- |
| Docker client version 20.10.12               |
| Docker server version 20.10.12               |
| docker-compose version 1.29.2, build 5becea4 |
| docker-py version: 5.0.0                     |

[link](https://docs.docker.com/compose/)

reusing existing volume with docker compose, below example. [link](https://stackoverflow.com/questions/60148581/re-using-existing-volume-with-docker-compose)

```yml
version: "3.5"
services:
  transmission:
    image: linuxserver/transmission
    container_name: transmission
    volumes:
      - transmission-config:/config
      - /path/to/downloads:/downloads
    ports:
      - 51413:51413
      - 51413:51413/udp
    networks:
      - rede
    restart: always

networks:
  rede:
    external: true
    name: rede
volumes:
  transmission-config:
    external: true
    name: transmission-config
```
