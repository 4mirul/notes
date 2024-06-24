# ssh

`ssh-keygen` on the client machine.

at the client machine, copy text inside `~/.ssh/id_rsa.pub`, paste the text inside the `~/.ssh/authorized_keys` on the server machine

change the `~/.ssh` folder and files permission using `chmod 700 ~/.ssh` and `chmod 600 ~/.ssh/authorized_keys`

edit the `/etc/ssh/sshd_config`, uncomment/edit as below

```sshd_config
...
#PasswordAuthentication no, if want to deny client without pubkey
PasswordAuthentication yes
AuthorizedKeysFile      .ssh/authorized_keys
PubkeyAuthentication yes
...
```
