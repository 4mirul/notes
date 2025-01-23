1- Kubeadm upgrade to upgrade the Minikube nodes (Optional)
2- Make at least 3 nodes

3- Lable one of the nodes for the database
4- Make storageclass, persistent volume and persistent volume claim for at least 1 GB
5- Deploy Mariadb and PhpMyadmin using stateful set, deployment, configmap, secret, and services with the proper type. For Mariadb use nodeaffinity and for PhpMyadmin use podaffinity
https://hub.docker.com/_/phpmyadmin
6- Take a backup using etcd

7- Taint your nodes
8- Create a new role which can create, edit, and delete the deployment 
9- Deploy wordpress use configmap, secret, deployment, and proper services, use toleration to let node access it use the new role
10- Assign ingress so the wordpress is going to be portrayed on example.org/
11- Make network policy which allows the people from outside can access the wordpress with port 80 and 443
12- Take another backup use etcd
13- Delete one of the resources and restore the resource using the backup file