Name:

Q1:

You are tasked with deploying a simple Nginx application and exposing it using a Service.

Create a Deployment named nginx-deployment using the nginx:1.21 image. The Deployment should have 3 replicas and each Pod should expose port 80.
Create a ClusterIP Service named nginx-service that targets the nginx-deployment Pods on port 80.
Save the YAML manifests for both the Deployment and Service to /tmp/nginx-deployment.yaml.

Q2:

Deploy a multi-tier application consisting of a backend and a frontend. Follow these requirements:

Create a Deployment named backend-deployment using the redis:6.2 image. The Deployment should:

Run 3 replicas.
Use a custom environment variable REDIS_PASSWORD set to securepassword.
Expose port 6379.
Create a ClusterIP Service named backend-service to expose the backend-deployment Pods on port 6379.

Create a Deployment named frontend-deployment using the nginx:1.21 image. The Deployment should:

Run 2 replicas.
Configure the nginx Pods to communicate with the backend using the service name backend-service.
Create a NodePort Service named frontend-service to expose the frontend-deployment Pods on port 30000.

Ensure all YAML manifests are saved to /tmp/multi-tier-app.yaml.

Q3:

Deploy a Pod with specific scheduling and resource constraints.

Create a Pod named resource-pod using the busybox:1.34 image. Configure it to:

Run a command that keeps the Pod alive (e.g., sleep 3600).
Request 200m CPU and 128Mi memory.
Limit CPU to 500m and memory to 256Mi.
Schedule the Pod only on nodes labeled with tier=critical.
Add the label tier=critical to one of the nodes in the cluster.

Verify that the Pod is scheduled correctly and save the YAML manifest for the Pod to /tmp/resource-pod.yaml.

Q4:

Implement a canary release for an existing application.

Create a Deployment named myapp-stable using the nginx:1.20 image with 5 replicas.

Create a new Deployment named myapp-canary using the nginx:1.21 image with 1 replica.

Create a Service named myapp-service that uses the app=myapp label selector. Initially, the Service should:

Route traffic to only the myapp-stable Deployment.
Update the Service to route 80% of the traffic to myapp-stable and 20% to myapp-canary using weighted selectors or by manually updating the Service multiple times.

Verify traffic routing using the appropriate commands (e.g., curl or logs).

Save all YAML manifests to /tmp/canary-deployment.yaml.

Q5:

A Pod running an application is repeatedly failing. Perform the following tasks:

Create a Pod named failing-pod using the busybox:1.34 image. Configure it to execute the command sh -c "echo Hello && exit 1".
Investigate why the Pod is failing and identify the root cause using kubectl describe and kubectl logs.
Fix the issue by modifying the command to sh -c "echo Hello && sleep 3600" and ensure the Pod runs successfully.
Save the YAML manifest for the corrected Pod to /tmp/failing-pod.yaml.

Q6:

A Pod cannot be scheduled due to resource constraints. Your task is to:

Create a Pod named pending-pod using the nginx:1.21 image. Configure it to:

Request 4 CPU and 8Gi memory.
Limit CPU to 5 CPU and memory to 10Gi.
Verify that the Pod remains in the Pending state due to insufficient cluster resources using kubectl describe pod.

Resolve the issue by modifying the Pod’s resource requests and limits to 100m CPU and 128Mi memory and ensure it schedules successfully.

Save the corrected YAML manifest for the Pod to /tmp/pending-pod.yaml.

Q7:

An application is not accessible due to a Service misconfiguration. Perform the following tasks:

Create a Deployment named broken-service-deployment with 2 replicas using the nginx:1.21 image. The Deployment should expose port 80.
Create a Service named broken-service but intentionally configure it to:
Use the wrong port mapping (e.g., target port 8080 instead of 80).
Diagnose why the Service is not working correctly using kubectl describe service and kubectl logs on the Pods.
Correct the Service configuration to target the correct port (80) and ensure the application becomes accessible.
Save the corrected YAML manifest for the Deployment and Service to /tmp/fixed-service.yaml.

Q8:

Deploy an application that requires persistent storage for data persistence.

Create a PersistentVolume named pv-data with the following specifications:

Capacity: 1Gi
Access Modes: ReadWriteOnce
Host Path: /mnt/data
Create a PersistentVolumeClaim named pvc-data to request:

Storage: 500Mi
Access Modes: ReadWriteOnce
Create a Deployment named storage-app with 2 replicas using the nginx:1.21 image. Configure it to:

Mount the volume pvc-data at the path /usr/share/nginx/html.
Create a ClusterIP Service named storage-app-service to expose the storage-app Pods on port 80.

Save all YAML manifests to /tmp/storage-deployment.yaml.

Q9:

Deploy a stateful application using a StatefulSet and configure persistent storage for each Pod.

Create a StatefulSet named stateful-app using the mysql:5.7 image. Ensure the StatefulSet:

Runs 3 replicas.
Configures each Pod to use a unique PersistentVolumeClaim for its data storage.
Create a StorageClass named fast-storage with the following specifications:


ReclaimPolicy: Retain
VolumeBindingMode: WaitForFirstConsumer
Define a PersistentVolumeClaim template in the StatefulSet to request:

Storage: 1Gi
Access Modes: ReadWriteOnce
StorageClass: fast-storage
Verify that each Pod in the StatefulSet has its own persistent storage.

Save all YAML manifests to /tmp/statefulset-app.yaml.

Q10:

Create a dynamic storage provisioning setup for an application.

Create a StorageClass named dynamic-storage with the following specifications:


ReclaimPolicy: Delete.
Create a PersistentVolumeClaim named dynamic-pvc to request:

Storage: 2Gi
Access Modes: ReadWriteOnce
StorageClass: dynamic-storage.
Create a Deployment named dynamic-app with the following configurations:

Image: busybox:1.34.
Replicas: 1.
Command: sh -c "echo 'Hello Kubernetes!' > /data/hello.txt && sleep 3600".
Mount the dynamically provisioned volume at /data.
Create a NodePort Service named dynamic-service to expose the dynamic-app on port 30001.

Save all YAML manifests to /tmp/dynamic-deployment.yaml.

Q11:

Deploy a web application and expose it via an Ingress.

Create a Deployment named web-deployment with the following configuration:

Image: nginx:1.21
Replicas: 3
Expose port 80 on the Pods.
Create a ClusterIP Service named web-service to expose the Pods of web-deployment on port 80.

Configure an Ingress named web-ingress with the following rules:

Host: web.example.com.
Path: / routes traffic to the web-service on port 80.
Ensure that the Ingress controller is properly configured and annotate the Ingress if necessary.

Save all YAML manifests to /tmp/deployment-ingress.yaml.

Q12:

Implement a secure networking policy for an application.

Create a Deployment named secure-app using the nginx:1.21 image with 2 replicas. Expose the application via a ClusterIP Service named secure-service on port 80.

Create a NetworkPolicy named allow-only-ui to allow incoming traffic to the Pods of secure-app only from Pods with the label app=ui.

Verify the NetworkPolicy by ensuring that Pods without the label app=ui cannot communicate with secure-app.

Save all YAML manifests to /tmp/network-policy-secure-app.yaml.

Q13:

Deploy a multi-tier application and secure it using Network Policies and Ingress.

Backend:

Create a Deployment named backend-deployment with 2 replicas using the redis:6.2 image.
Expose the Pods using a ClusterIP Service named backend-service on port 6379.
Frontend:

Create a Deployment named frontend-deployment with 3 replicas using the nginx:1.21 image.
Expose the Pods using a ClusterIP Service named frontend-service on port 80.
Ingress:

Create an Ingress named frontend-ingress with the following rules:
Host: app.example.com.
Path / routes traffic to the frontend-service on port 80.
Network Policies:

Allow traffic to frontend-deployment only from the Ingress controller Pods.
Allow traffic to backend-deployment only from Pods in the frontend-deployment.
Save all YAML manifests to /tmp/multi-tier-network-ingress.yaml.

Q14:

Upgrade your Kubeadm to 1.31.1-x version


Q15:

You are tasked with creating a backup of the etcd cluster and restoring it.

Create a backup of the etcd cluster:

Use the etcdctl tool to create a snapshot named /tmp/etcd-backup.db.
Assume the etcd cluster is running at https://127.0.0.1:2379 with the following credentials:
Certificate Authority: /etc/kubernetes/pki/etcd/ca.crt
Client Certificate: /etc/kubernetes/pki/etcd/server.crt
Client Key: /etc/kubernetes/pki/etcd/server.key.
Verify the backup file is created and contains valid data using the etcdctl snapshot command.

Simulate an issue by deleting a key-value pair in etcd. Then, restore the etcd cluster from the backup and verify that the deleted key-value pair is recovered.

Provide the commands you used for backup, verification, and restoration.

Q16:

You are required to configure RBAC to restrict access to a specific namespace.

Create a namespace named dev-namespace.

Create a ServiceAccount named dev-user in the dev-namespace.

Define a Role named dev-reader in dev-namespace that allows the following actions:

List, get, and watch Pods.
List and get ConfigMaps.
Create a RoleBinding named dev-reader-binding to bind the dev-reader Role to the dev-user ServiceAccount.

Verify the setup:

Use the kubectl auth can-i command to check that dev-user can list Pods in the dev-namespace.
Verify that dev-user cannot list Pods in the default namespace.
Save the YAML manifests for the Role, RoleBinding, and ServiceAccount to /tmp/rbac-dev-namespace.yaml.

Q17:

Deploy a custom scheduler named my-scheduler using the official kube-scheduler image. Configure the scheduler to:

Use a custom scheduler configuration file located at /etc/kubernetes/my-scheduler-config.yaml.
Run as a Deployment named my-scheduler-deployment in the kube-system namespace.
Modify the custom scheduler configuration to:

Only schedule Pods with the label scheduler: my-scheduler.
Use a scheduling policy that prioritizes nodes with the most available CPU resources.
Create a Pod named custom-scheduler-pod using the nginx:1.21 image and ensure it is scheduled by the my-scheduler.

Verify that the Pod is scheduled by my-scheduler by inspecting its events and logs.

Save the custom scheduler configuration and manifests for the Deployment and Pod to /tmp/custom-scheduler.yaml.