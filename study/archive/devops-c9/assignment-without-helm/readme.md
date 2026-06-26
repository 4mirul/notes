```
kubectl taint nodes minikube app=database:NoSchedule
kubectl taint nodes minikube-m02 app=frontendandbackend:NoSchedule
kubectl taint nodes minikube-m03 app=frontendandbackend:NoSchedule
```