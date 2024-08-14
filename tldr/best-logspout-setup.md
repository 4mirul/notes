---
tags:
- work-in-progress
- tldr
- linux
- setup
- 2024-08
---

# Best `logspout` Setup

> Logspout is a log router for Docker containers that runs inside Docker. It attaches to all containers on a host, then routes their logs wherever you want. It also has an extensible module system.

> It's a mostly stateless log appliance. It's not meant for managing log files or looking at history. It is just a means to get your logs out to live somewhere else, where they belong.

Refer [link](https://github.com/gliderlabs/logspout) for the app details.

## Getting Started

Create `.env` and `docker-compose.yml` below. Proceed to run `docker compose up` to run the container.

.env
```env
LOGSPOUT_IP=172.18.0.100
```

docker-compose.yml
```yml
services:
  logspout:
    container_name: logspout
    image: gliderlabs/logspout:latest
    environment:
      - ALLOW_TTY=true
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    restart: unless-stopped
    labels:
      - com.centurylinklabs.watchtower.enable=true # watchtower auto-update image
      - flame.type=app # flame label https://github.com/pawelmalak/flame
      - flame.name=logspout
      - flame.url=http://${LOGSPOUT_IP}:80/logs
      - flame.icon=math-log
    networks:
      default:
        ipv4_address: ${LOGSPOUT_IP}
networks:
  default:
    external: true
    name: main-network
```

## Usage

Run `curl http://172.18.0.100:80/logs` to use it. Or add below to `.bashrc` or `.zshrc` for the alias `dlogs` or add any container name after it; `dlogs flame` for the specific container.

```bashrc
...
dlogs() {
        if [ "$#" -eq 0 ]; then
                curl http://172.18.0.100:80/logs
        else
                curl http://172.18.0.100:80/logs/name:$1 # specific contianer name
        fi
}
```