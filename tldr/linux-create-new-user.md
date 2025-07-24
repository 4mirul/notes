---
tags:
- linux
- tldr
- 2025-07
---

# Linux - Create New User with sudo

## Debian

[link](https://wiki.debian.org/UserAccounts)

1. `adduser username`
2. `usermod -aG sudo username` add user to sudo group
3. `getent group sudo` check user in group sudo
4. `visudo` to edit sudoers file, add `username ALL=(ALL:ALL) ALL` in the file

### Additional

1. `getent group`
2. `groups username`