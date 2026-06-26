1. Create a Deployment with Rolling Update Strategy
Create a Deployment named app-server in the production namespace with:

Image: nginx:1.25
Replicas: 5
Rolling update with max 2 unavailable and 3 surge Pods
The container should listen on port 8080
Ensure the Deployment updates correctly without downtime.

2. Deploy a StatefulSet with Persistent Storage
Create a StatefulSet named redis-cluster in the caching namespace with:

Image: redis:7
Replicas: 4
Storage: 10Gi PersistentVolumeClaims named redis-data
Headless Service (redis-headless)
Ensure the StatefulSet maintains unique identities for each Pod.

3. Expose an Application Using a LoadBalancer Service
Deploy a Pod named flask-app running python:3.9-alpine.

Create a LoadBalancer Service named flask-service
The Service should expose port 5000
Ensure it gets an external IP (if supported in the cluster)
4. Create a ConfigMap and Mount it as a Volume
Create a ConfigMap named web-config with:

Key: APP_MODE, Value: production
Key: CACHE_TIMEOUT, Value: 60
Deploy a Pod named config-volume-pod running busybox where:

Mount the entire ConfigMap into /etc/app-config/
Ensure the values are accessible inside the Pod.

5. Secure API Credentials Using a Secret
Create a Secret named api-credentials with:

api_key=MY_SECRET_KEY_1234
api_token=SuperSecureToken9876
Deploy a Pod api-client running python:3.8 where:

The Secret values should be mounted as a file inside /etc/secrets/
Ensure the Pod can read the secrets.

6. Implement NetworkPolicies to Allow Only Intra-Namespace Traffic
Create a NetworkPolicy named internal-only for the payments namespace that:

Allows traffic only from other Pods within the same namespace
Blocks all external ingress traffic
Ensure the NetworkPolicy is enforced.

7. Perform an etcd Backup and Restore
Your cluster needs a new etcd backup.

Take a snapshot using etcdctl and store it at /var/backups/etcd.db
Simulate a failure by deleting all Pods in the monitoring namespace
Restore the etcd snapshot
Ensure the deleted resources are recovered.

8. Configure RBAC to Grant Admin Access to a Namespace
Create a Role named admin-role in the staging namespace that:

Grants full admin rights over all resources
Create a ServiceAccount admin-user and bind it using a RoleBinding.
Ensure admin-user can create, delete, and modify resources in staging but not in other namespaces.

9. Schedule a Pod Using Taints and Tolerations
Label a node with key=dedicated, value=critical
Taint the node with key=dedicated:NoSchedule
Deploy a Pod named critical-service running ubuntu:latest that tolerates the taint
Ensure the Pod schedules only on the tainted node.

10. Implement a Pod Disruption Budget (PDB)
For a Deployment named payments-service with 4 replicas:

Ensure at least 2 Pods must remain available during disruptions
Create a PodDisruptionBudget named pdb-payments
Test by draining a node.

11. Configure a Horizontal Pod Autoscaler (HPA)
Deploy a Deployment named autoscale-app with:

Image: httpd:2.4
Requests: 200m CPU
Replicas: 3
Create an HPA (autoscale-hpa) that:

Scales between 3-15 replicas
Increases replicas when CPU exceeds 65% utilization
Test by applying CPU load.

12. Implement Pod Affinity to Distribute Workloads
Deploy a worker Deployment where:

Pods should be scheduled on different nodes
Use PodAntiAffinity to enforce this
Ensure workloads are spread out.

13. Deploy a DaemonSet for Log Collection
Create a DaemonSet named log-agent that runs fluentd on every worker node.

Ensure it does not run on master nodes
The container should log Node Logs Running every 10 seconds
Verify all worker nodes have one instance.

14. Configure an Ingress with TLS
Deploy a Service my-app-service on port 80.

Create an Ingress named secure-ingress
Configure it to:
Use a TLS certificate (my-cert)
Route /app traffic to my-app-service
Ensure HTTPS traffic works.

15. Bind a Pod to a PersistentVolume Using Dynamic Storage
Create a StorageClass fast-storage with:

Provisioner: kubernetes.io/aws-ebs (or appropriate for your cloud)
Reclaim Policy: Delete
Deploy a PersistentVolumeClaim storage-pvc that:

Requests 8Gi storage
Uses fast-storage
Deploy a Pod storage-user that writes to the volume.

16. Deploy a CronJob to Archive Logs
Create a CronJob named log-archiver that:

Runs every 12 hours
Executes tar -czf /var/logs/archive.tar.gz /var/logs/
Uses debian:latest
Ensure logs are archived properly.

17. Debug a Failing Pod with Startup and Liveness Probes
Deploy a Pod named probe-test that:

Uses nginx:1.21
Has a Startup probe checking http://localhost/startup
Has a Liveness probe checking http://localhost/healthz
Introduce a failure and ensure the Pod is restarted.