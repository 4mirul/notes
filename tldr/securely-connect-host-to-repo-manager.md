---
tags:
- work-in-progress
- tldr
- 2024-11
---

# Securely Connect Host To Repo Manager(Github/Gitlab/etc )

- at the host machine, generate ssh key pair with `ssh-keygen -t rsa` (or other algorithm), this will create `id_rsa` and `id_rsa.pub`
- copy content inside `id_rsa.pub` and put it into SSH keys setting in Github/Gitlab/etc
- test the connection with `git -T git@github.com` for Github or `git -T git@gitlab.com` for Gitlab