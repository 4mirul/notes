---
tags:
- kubernetes
- tldr
- 2024-12
---

# How to create non-admin k8s user

- `cat ~/.kube/config` - view the current k8s configuration file

- `openssl genrsa -out yuu.key 2048`
- `openssl req -new -key yuu.key -out yuu.csr -subj "/CN=syafiq/O=dev/O=example.org"`
- `openssl x509 -req -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -days 730 -in yuu.csr -out yuu.crt`

- `kubectl config set-credentials yuu --client-certificate=yuu.crt --client-key=yuu.key`
- `kubectl config set-context yuu-kubernetes --cluster=kubernetes --user=yuu --namespace=default`
 
- `kubectl config get-contexts`
- `kubectl config use-context NAME`
- `kubectl api-resources -o wide | grep pod`
