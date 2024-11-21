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