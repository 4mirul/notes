# k8s

| Version                        |
| ------------------------------ |
| Docker client version 20.10.12 |
| Docker server version 20.10.12 |

---

## cert-manager

---

`kubectl version` - check the client and server version

`kubectl cluster-info` - check cluster info

`kubectl api-resources` - list available objects/kind

`kubectl api-versions` - list all api version

`kubectl get pods` - to list all the pods

`kubectl get services` - to list all the services

`kubectl get deployments` - to list all the deployments

`kubectl get events` - to list all events/logs

`kubectl get all` - list pods, services, deployments, statefulsets, etc

`kubectl get all --all-namespaces` - list pods, services, deployments, statefulsets, etc in all namespaces

`kubectl get all --namespace <namespace-name>` - list for specific name

`kubectl run <pod-name> --image nginx` - create a pod using cli

`kubectl create deployment <deployment-name> --image <image-name>` - create deployment

`kubectl scale deployments <deployment-name> --replicas n` - scale the deployment to the number

`kubectl describe pods <pod-name> -n <namespace-name>` - show pod detail in specific namespace

`kubectl describe pods -n <namespace-name>` - show pods details of specific namespace

`kubectl describe nodes -n <namespace-name>` - show nodes details of specific namespace

`kubectl get namespaces` - list all namespaces

`kubectl expose deployment <deployment-name> --port 8001 --name <name> --type NodePort` - create clusterIP service for specific deployment/expose the specific port to other deployment/pod. type nodeport

`kubectl apply -f <config-file>` - to apply the configuration and create the object(pod,service .. etc), below example files to create the pod and the service

`kubectl delete -f <config-file>` - delete the object

`kubectl create <job/deployment> <name> --image <image-name> --dry-run=<none/server/client> -o yaml` - generate the deployment details in yaml form

`kubectl expose /deployment/<name> --port <port> --dry-run=<none/server/client> -o yaml` - generate the expose details in yaml form

`kubectl explain <kind> --recursive` - get all the keys each that specific kind supports

`kubectl explain <kind>.<key>` - get the key details for that kind

`kubectl explain <kind>.<key>.<key>` - get the specific key detail for that key for that kind

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: client-pod
  labels:
    component: web #labeling for nodeport/service to identify
    #tier: frontend #example
spec:
  containers:
    - name: client-pod
      image: stephengrider/multi-client
      ports:
        - containerPort: 3000
```

```yaml
apiVersion: v1
kind: Service
metadata:
  name: client-node-port
spec:
  type: NodePort
  ports:
    - port: 3050 #port for outside container(or other pod) use to connect
      targetPort: 3000 #container port
      nodePort: 31515 #for outside world to connect
  selector:
    component: web
    #tier: frontend #example another option. the name not reserved
```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: client-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      component: web
  template:
    metadata:a
      labels:
        component: web
    spec:
      containers:
      - name: client
        image: stephengrider/multi-client
        resources: # suggested
          limits: # suggested
            memory: "128Mi" # suggested
            cpu: "500m" # suggested
        ports:
        - containerPort: 3

```

`kubectl set image <object_type>/<object_name> <container_name>=<new_image_to_use>` - set Imperatively updating deployment image. set version on the image to use.

`kubectl create secret generic <secret_name> --from-literal key=value` - create secret information for kubectl files

[link](https://kubernetes.github.io/ingress-nginx/) - refer this for ingress configuration

`minikube dashboard` - minikube dashboard for localhost only

`kubectl proxy --address 0.0.0.0 --port 8002 --disable-filter=true` - use this to access kubectl dashboard remotely and gog to [link](http://192.168.0.105:8002/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/cronjob?namespace=default)

`helm` - [link](https://helm.sh/) k8s package manager

---

## Labels

labels goes under `metadata:`. simple list of `key: value` for identifying.

`kubectl get pods -l <key>=<value>` - find pods with this label

`kubectl apply -f <yaml-files> -l <key>=<value>` - apply only matching labels

### Label Selectores

- telling services and deploymens which pods are their
- use label selectors to "link" resource dependencies
- user labels and selectors to control which pods go to which nodes
- selectors goes under `selector:`

---

## microk8s

[link](https://microk8s.io/)
