# DevOps Practitioner notes

19-Nov-24

- install wsl, git, docker desktop
- linux basic command
- `ssh-keygen -t rsa`, put the key inside the github/gitlab for git push/pull
- then test authentication with `git -T git@github.com` or `git -T git@gitlab.com`
- create folder, `init` git
- push to github
- git branch
- git push
- git origin
- git pull
- `git remote add origin ...` make sure use the SSH not HTTPS. because HTTPS will ask for username and password. but SSH will not because already set `git -T git@github.com`

20-Nov-24

- docker container
- different docker images/containers
- public/private images
- docker command. `docker images` `docker ps` `docker ps -a` `docker pull [images:tag]`
- `docker run -d -p 8080:80 --name test nginx`
- `docker run -d --name memysql -e MYSQL_DATABASE=mysql --network devops mysql`
- `docker run -d --name mephpmyadmin -p 8080:80 --network devops phpmyadmin`
- k resolve issue with docker unable to live update/modifying
- `docker network ls` 
- network driver `null` - fully isolate
- network driver `host` - opposite null
- network driver `bridge` - able to connect
- for docker windows, enable host networking at network setting if need to use host network
- assignment: 
- `docker run -d --name mypostgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=devops --network devops postgres:latest`
- `docker run -d --name mypgadmin -e PGADMIN_DEFAULT_EMAIL=amirul@duck.com -e PGADMIN_DEFAULT_PASSWORD=pgadmin --network devops -p 8080:80 elestio/pgadmin:latest`

21-Nov-24

- Group
- do project and must have 3 microservices; 1 database, 1 programming language middleware, 1 frontend 
- 1 presentation
- sign up, miro, jira, confluence, bitbucket, create board, containerize all microservices, at least 2, one database and one fullstack, run CI/CD, and provide reports there
- do `Dockerfile`
- `FROM`, `COPY`, `EXPOSE`
- `docker build -t nginxfront .` then `docker run ..`
- `.dockerignore`

```Dockerfile
FROM python:3.9
WORKDIR /app
COPY . /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 8000
CMD ["sh", "-c", "python manage.py makemigrations DockerDevops && python manage.py migrage && ..."]
```

- do `do httpd`
- docker compose

22-Nov-24

- CI/CD - continues integration/container delivery
- CD - gitlab, github action, etc
- BUILD
- TEST
- DEPLOY

26-Nov-24

| Feature                  | Docker                                   | Kubernetes                            |
|--------------------------|------------------------------------------|---------------------------------------|
| **Primary Purpose**       | Containerization (Build, Ship, Run)      | Container Orchestration (Manage, Scale, Deploy) |
| **Scope**                 | Manages containers on a single host      | Manages containers across clusters of machines |
| **Usage**                 | Ideal for creating and running containers locally or on a single host | Ideal for managing containers in large, production environments |
| **Core Component**        | Docker Engine, Docker CLI, Docker Hub    | Kubernetes Cluster, Pods, Deployments, Services |
| **Scaling**               | Manually scale containers                | Auto-scaling of containers based on load |
| **Self-Healing**          | No built-in self-healing                 | Automatically restarts failed containers, reschedules them |
| **Networking**            | Basic networking (bridge, host, etc.)    | Advanced networking, with services, ingress, DNS |
| **Rolling Updates**       | Manual updates with downtime             | Fully automated rolling updates with zero downtime |
| **Storage**               | Limited to volumes or bind mounts        | Persistent Volumes (with more flexibility and orchestration) |
| **Dependency**            | Requires container runtimes (Docker, containerd, etc.) | Uses container runtimes (e.g., Docker, containerd) but can work with multiple runtimes |
| **Configuration**         | Dockerfile for image creation            | YAML files for defining infrastructure (Deployments, Services, etc.) |
| **Example Use Case**      | Running a single app locally or in small scale | Managing microservices at scale, automated deployments in the cloud |

- manifest = yml file
- pod?
- service?
- deployment?
- `minikube service nginx-service` to expose the network because minikube is a container
- create pod
- create service
- check the clusterip, nodeport, etc
- create deployment
- put pod inside deployment
- check pod inside deployment, check service inside deployment
- assignment: 