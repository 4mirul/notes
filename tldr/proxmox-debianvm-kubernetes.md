---
tags:
- tldr
- proxmox
- debian
- kubernetes
- setup
- 2024-12
---

# Proxmox + Debian VM + Kubernetes

## Setting up VM in Proxmox

- Qemu Agent: Enabled (optional)
- Disk size: 20GB+
- CPU: 2 cores+
- Memory: 4096MB+
- Start at boot: yes (optional)
- Startup delay: 15s (optional)

## Installation Fedora

- headless (optional)
- Make sure static IP
- create admin account (sudo access)
- setting up os
- check /etc/hostname and /etc/hosts file

## Kubernetes

- install `containerd`
- generate default config file for `containerd` with command `containerd config default | sudo tee /etc/containerd/config.toml`
- modify `config.toml` at `[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]`, make sure `SystemdCgroup = true`
- disable swap at `/etc/fstab` or in fedora disable zram; `sudo nano /etc/default/grub` and `GRUB_CMDLINE_LINUX="... systemd.zram=0"`
- enable packet forwarding for IPv4 at `/etc/sysctl.conf` or any place; `net.ipv4.ip_forward = 1`
- `sudo vim /etc/modules-load.d/k8s.conf` put br_netfilter
- install k8s at https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl
- for control-plain use `sudo kubeadm init --control-plane-endpoint=xxx.xxx.xxx.xxx --node-name xxxx --pod-network-cidr=10.244.0.0/16`, this will take sometime follow instruction to create some files/folder at the end of the command
- check `kubectl get pods --all-namespaces` and some will not running
- kubectl apply -f `https://github.com/flannel-io/flannel/blob/master/Documentation/kube-flannel.yml` to make sure all pods running
- for workers, use link to join the control plane. the master can generate the link at command `kubeadm token create --print-join-command`
- 3 command from controlplane also need to do for workers. `.kube/config`
- for single controlplane do `kubectl taint nodes <node_name> node-role.kubernetes.io/control-plane:NoSchedule-`

```sh
mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
# or 
scp ~/.kube/config <worker-node-username>@<worker-node-ip>:~/.kube/config
# ...
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```