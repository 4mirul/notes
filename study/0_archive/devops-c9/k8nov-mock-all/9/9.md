1. Create a Deployment with Rolling Update Strategy
Create a Deployment named web-app in the default namespace with:

Image: nginx:1.23
Replicas: 3
Rolling update with max 1 unavailable and 2 surge Pods
The container should listen on port 80
Ensure the update strategy is applied correctly.

2. Create a StatefulSet with a Headless Service
Create a StatefulSet named db-cluster in the database namespace with:

Image: mysql:8
Replicas: 3
Storage: 5Gi PersistentVolumeClaims named db-storage
Headless Service (db-service) for peer-to-peer communication
Ensure the Pods get unique hostnames.

3. Expose an Application Using a NodePort Service
Deploy a Pod named api-server running httpd:latest.

Create a NodePort Service named api-service
The Service should expose port 80 with a NodePort in range 30000-32767
Ensure it is accessible from outside the cluster
4. Create a ConfigMap and Inject it into a Pod
Create a ConfigMap named app-config with:

Key: LOG_LEVEL, Value: debug
Key: MAX_RETRIES, Value: 5
Then, deploy a Pod named config-pod running busybox where:

LOG_LEVEL should be set as an environment variable
MAX_RETRIES should be mounted as a file inside /etc/config/
5. Secure Database Credentials Using a Secret
Create a Secret named db-secret with:

username=db_user
password=SecureP@ss123
Deploy a Pod db-client running mysql:8 where:

The Secret values should be used as environment variables
Ensure the Pod can read and print the values
6. Implement NetworkPolicies to Restrict Traffic
Create a NetworkPolicy named deny-external for the backend namespace that:

Allows incoming traffic only from Pods labeled app=frontend
Blocks all other ingress traffic
Ensure that:

Backend Pods cannot be accessed from outside
Frontend Pods can still reach Backend Pods
7. Perform an etcd Backup and Restore
Your cluster needs an etcd backup.

Take a snapshot using etcdctl and store it at /opt/backup/etcd-snapshot.db
Simulate a failure by deleting an important Kubernetes resource
Restore etcd from the backup
Ensure the cluster state is restored correctly.

8. Configure RBAC to Grant Read-Only Access
Create a Role named pod-reader in the development namespace that:

Grants read access to Pods only
Create a ServiceAccount developer-sa and bind it using a RoleBinding.
Ensure developer-sa can list Pods but cannot delete them.

9. Schedule a Pod on a Specific Node Using NodeSelector
Create a Pod named custom-pod that should run only on nodes labeled disk=ssd.

Ensure the node has the label
The container should run alpine:latest
Verify the Pod schedules on the correct node.

10. Implement a Pod Disruption Budget (PDB)
For a Deployment named critical-app with 5 replicas:

Ensure at least 3 Pods must remain available during disruptions
Create a PodDisruptionBudget named pdb-critical
Test the budget by attempting to drain a node.

11. Configure a Horizontal Pod Autoscaler (HPA)
Deploy a Deployment named cpu-app with:

Image: nginx:latest
Requests: 100m CPU
Replicas: 2
Create an HPA (cpu-hpa) that:

Scales between 2-10 replicas
Increases replicas when CPU exceeds 50% utilization
Ensure it scales correctly under load.

12. Implement Pod Affinity for Better Scheduling
Deploy a cache Deployment where:

All cache Pods should schedule on the same node as web Pods
Use PodAffinity to enforce this
Ensure the scheduling rule works correctly.

13. Deploy a DaemonSet for System Monitoring
Create a DaemonSet named node-monitor that runs busybox on every worker node.

It should not run on control-plane nodes
The container should log uptime every 5 seconds
Verify it runs on all worker nodes.

14. Configure an Ingress to Expose Multiple Services
Deploy two services:

service-frontend (exposes /frontend)
service-backend (exposes /backend)
Configure an Ingress named web-ingress that:

Routes /frontend traffic to service-frontend
Routes /backend traffic to service-backend
Ensure both paths work.

15. Bind a Pod to a PersistentVolume Using StorageClass
Create a StorageClass fast-storage with:

Reclaim Policy: Retain
Deploy a PersistentVolumeClaim fast-pvc that:

Requests 5Gi storage
Uses fast-storage
Deploy a Pod storage-test that writes to the volume.

16. Deploy a CronJob for Automated Backups
Create a CronJob named backup-job that:

Runs every 6 hours
Executes tar -czf /backup/data.tar.gz /data
Uses alpine:latest
Ensure the job runs on schedule.

17. Debug a Failing Pod with Liveness and Readiness Probes
Deploy a Pod named probe-test that:

Uses nginx:latest
Has a Liveness probe checking http://localhost/healthz
Has a Readiness probe checking http://localhost/ready
Simulate failures and verify Kubernetes restarts the container.