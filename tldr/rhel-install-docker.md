---
tags:
- rhel
- tldr
- 2025-07
---

# RHEL install docker

1. `sudo dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine`
2. `sudo dnf -y install dnf-plugins-core`
3. `sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo` using centos because rhel got issue
4. `sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`
5. `sudo systemctl enable --now docker`
6. test `sudo docker run hello-world`

## Manage docker as non-root user

1. `sudo groupadd docker`
2. `sudo usermod -aG docker $USER`
3. test without sudo `docker run hello-world`

# References

[docker rhel](https://docs.docker.com/engine/install/rhel/)

[docker centos](https://docs.docker.com/engine/install/centos/)