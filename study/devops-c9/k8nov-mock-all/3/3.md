Name:

Q1:
Task
You are working in a Kubernetes cluster. The security team requires you to implement Role-Based Access Control (RBAC) to restrict access to specific resources in the cluster. Perform the following tasks:

Create a Role named pod-reader in the development namespace that grants read-only access to Pods (get, list, watch).
Create a ServiceAccount named dev-user in the development namespace.
Bind the pod-reader role to the dev-user ServiceAccount using a RoleBinding.
Verify that the dev-user ServiceAccount has read-only access to Pods in the development namespace by performing the following steps:
Switch to the dev-user ServiceAccount.
Try to list Pods in the development namespace (this should succeed).
Try to create a Pod in the development namespace (this should fail).
Validation
Ensure the Role, ServiceAccount, and RoleBinding are correctly configured in the development namespace.
Ensure the dev-user ServiceAccount has the appropriate access restrictions applied.


Q2:
Create a new deployment name lab-deployment in the qq2 namespace. With one replica in the manifest then scale the deployment to 4 replicas.

Q3:
Create a deployment names nginx-deployment in the qq3 namespace. Perform a rolling update to the deployment by setting the image to nginx:alpine.

Q4:
Task
You are tasked with setting up a Deployment in the staging namespace that uses environment-specific configurations securely. Perform the following tasks:

Create a ConfigMap named app-config in the staging namespace with the following data:

Key: APP_ENV, Value: staging
Key: LOG_LEVEL, Value: info
Create a Secret named db-credentials in the staging namespace with the following data (encode the values in base64):

Key: DB_USER, Value: admin
Key: DB_PASSWORD, Value: password123
Create a Deployment named web-app in the staging namespace with the following specifications:

The Deployment should have 3 replicas.
Use the nginx:latest image.
Mount the app-config ConfigMap as environment variables in the Pod.
Mount the db-credentials Secret as environment variables in the Pod.
Verify the following:

Pods should have the APP_ENV and LOG_LEVEL environment variables correctly set.
Pods should have the DB_USER and DB_PASSWORD environment variables correctly set.
All Pods are running successfully.
Validation
Ensure the ConfigMap and Secret are correctly configured in the staging namespace.
Ensure the Deployment mounts the ConfigMap and Secret as environment variables in the Pods.
Verify that all 3 replicas are running and the environment variables are set as expected in each Pod.

Q:5
Create a pod named limit using the redis image in the qq3 namespace with the following resource limits and requests:

Requests CPU: 0.5Memory: 500Mi Limits CPU: 1 Memory: 1Gi


Q6:
Create a Deployment named web in the ca1 namespace with an image of nginx:latest. Create a new Service named web-svc that sits in front of this deployment. Expose the new service publicly by in port 8080. 




Q7:

Execute the following requirements in the prod namespace. Create a new Deployment named app01 using the nginx:latest container image and have it listen on port 80. The deployment should consist of 2 replicas. Create a new Service named app01-svc and expose the newly created deployment using a NodePort. Confirm that you can access the nginx home (index) page using the NodePort service.

Q8:

Here’s a Kubernetes exam-style question involving StatefulSet and Volumes:

Task
You are required to deploy a StatefulSet to manage a stateful application that requires persistent storage. Perform the following tasks:

Create a PersistentVolume named pv-data with the following specifications:

Storage capacity: 5Gi
Access mode: ReadWriteOnce
Host path: /mnt/data
Create a PersistentVolumeClaim named pvc-data in the default namespace with the following specifications:

Request storage: 5Gi
Access mode: ReadWriteOnce
Bind it to the pv-data PersistentVolume.
Create a StatefulSet named web-stateful in the default namespace with the following specifications:

Use the nginx:stable image.
The StatefulSet should have 3 replicas.
Each Pod should have its own volume mounted at /usr/share/nginx/html using the pvc-data PersistentVolumeClaim.
Verify the following:

Each Pod created by the StatefulSet should have a unique ordinal index (e.g., web-stateful-0, web-stateful-1, web-stateful-2).
Each Pod has its own persistent storage using the pvc-data PersistentVolumeClaim.
The data written to the volume by one Pod is not shared with other Pods.
Validation
Ensure the PersistentVolume and PersistentVolumeClaim are correctly configured and bound.
Verify that the StatefulSet creates Pods with unique ordinal indices.
Verify that the volume mounted to each Pod is persistent and isolated.


Q9:
Create a StorageClass named class configured with the following settings:

rancher.io/local-path
 gp2 volume typeretain Reclaim policy do not allow for volume expansion



Q10:
Create a PersistentVolume named pv in the qq3 Namespace. The PersistentVolume must be configured with the following settings:

storageClassName: gp21Gi of storage capacityallow a single Node read-write accessuse a hostPath of /mnt/data
The PersistentVolume must be claimed by a PersistentVolumeClaim named pvc. The PersistentVolume must request 1Gi of storage capacity.



Q11:

Create a Pod named pod with one nginx container in the qq2 namespace. The Pod must use the podpvc PersistentVolumeClaim to mount a volume at /data. The pod must have read-only access to the pvc. 


Q12:
Deploy a pod named nginx using the nginx image in the qq3 namespace with a liveness and readiness probe for port 80.

Pod: nginx Namespace: qq3Image: nginx Liveness Probe: port: 80 Readiness Probe: port: 80

Q13:

Create a deployment names nginx with 3 replicas. Get a backup using the etcd. Delete the deployment and restore using your etcd backup 

Q14:

Task
You are tasked with exposing a Deployment via a Kubernetes Service for external access. Perform the following tasks:

Create a Deployment named app-deployment in the production namespace with the following specifications:

Image: nginx:1.21
Replicas: 3
Label for Pods: app=web-app
Create a ClusterIP Service named web-service in the production namespace with the following specifications:

Selector: app=web-app
Expose port 80 on the Service and forward it to port 80 of the Pods.
Verify the following:

All Pods in the Deployment are reachable through the web-service Service.
Use the kubectl port-forward command to test the Service locally.
Validation
Ensure the Deployment and Service are correctly configured.
Verify that the Service forwards traffic to all Pods in the Deployment.

Q15:
Create a new deployment name apache-deployment with an image of caleed httpd:latest

 in the qq3 namespace. Perform rolling update to the image httpd:bookworm and then a rollback of the deployment to restore the original image.


Q16:
Task
You are required to deploy a containerized application with resource restrictions to ensure stability. Perform the following tasks:

Create a Deployment named resource-demo in the default namespace with the following specifications:

Image: busybox
Command: ["/bin/sh", "-c", "sleep 3600"]
Replicas: 2
Set resource requests and limits for the Pods as follows:

CPU request: 100m
Memory request: 128Mi
CPU limit: 200m
Memory limit: 256Mi
Verify the following:

All Pods are running.
Resource requests and limits are correctly applied to the Pods.
Validation
Use kubectl describe pod to verify resource requests and limits.
Ensure the Pods are running and adhere to the configured resources.


Q17:
Task
You are required to deploy an application and expose it to external traffic using a NodePort Service. Perform the following tasks:

Create a Deployment named nodeport-app in the staging namespace with the following specifications:

Image: httpd:latest
Replicas: 2
Label for Pods: app=nodeport-demo
Create a NodePort Service named nodeport-service in the staging namespace with the following specifications:

Selector: app=nodeport-demo
Expose port 80 on the Service and forward it to port 80 of the Pods.
Assign a NodePort in the range 30000-32767.
Verify the following:

The application is accessible on the Node’s external IP and NodePort.
All Pods in the Deployment are reachable through the Service.
Validation
Use kubectl get svc to verify the NodePort assigned.
Access the application using http://<Node-IP>:<NodePort> in your browser or via curl.
