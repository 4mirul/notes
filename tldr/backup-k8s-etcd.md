---
tags:
- kubernetes
- tldr
- 2024-12
---

# Backup in K8s using `etcd`

[link](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/)

1. install `etcd-client`, `apt install etcd-client`
2. `mkdir ~/etcd-backup`
3. `export ETCDCTL_API=3`
4. 

```sh
etcdctl --endpoints 127.0.0.1:2379 \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
snapshot save ./etcd-backup/etcdbackup.db
```
5. `etcdctl snapshot restore etcd-backup/etcdbackup.db`
6. `mkdir ~/temp_yaml_files`
7. `mv /etc/kubernetes/manifest/* temp_yaml_files`
8. `mv ~/member/ /var/lib/etcd/`
9. `systemctl stop kubelet`
10. `mv ~/temp_yaml_files/* /etc/kubernetes/manifests/`
11. `systemctl start kubelet`