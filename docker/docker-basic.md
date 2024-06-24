# Docker basic

| Version                        |
| ------------------------------ |
| Docker client version 20.10.12 |
| Docker server version 20.10.12 |

[link](https://docs.docker.com/reference/)

`docker version`

`docker info`

`docker top <container>` - list running processes in specific container

`docker container top`

`docker container inspect` - show metadata about the container

`docker container stats` - show live performance data for all containers

`docker run hello-world` - create image if still dont have and run the image

`docker run -d hello-world` - create image if still dont have and run the image in the background

`docker run -it <container> bash` - start container interactively

`docker create hello-world` - create the image, it download from docker hub if still not exist

`docker start hello-world` - start the image without `attach` to it(cannot see the output)

`docker start -a hello-world` - start the image and `attach` to it so the output will show

`docker ps` - list active container

`docker container ls` - list active container

`docker ps --all` - list active and inactive container

`docker system df` - see space usage

`docker image prune -a` - remove unused images

`docker start <container-id>` - start the previous container(with previous image and previous command)

`docker start -a <container-id>` - start the previous container(with previous image and previous command) and able to see the output because of `attach` option

`docker system prune` - delete all stopped containers, delete networks not used, delete dangling images, delete all build cache

`docker logs <container-id>` - check the logs of the container, can use this to see output if running container without `attach` option

`docker stop <container-id>` - stop a container without force (SIGTERM)

`docker kill <container-id>` - stop a container with force (SIGKILL). Immediately kill it

`docker exec -it <container-id> <command>` - execute command inside running container. (-i allow to send input to the container, -t allow to see properly)

`docker exec -it <container-id> sh` - run shell inside the running container

`docker exec -it <container-id> bash` - run bash inside the running container

`docker run -it <container-id> sh` - run container with sh command

`docker container port <container>` - check container port

`docker network ls`

`docker network inspect`

`docker network create --driver`

`docker network connect`

`docker network disconnect`

`docker inspect --format='{{ .NetworkSettings.IPAddress}}' <container>`

`docker image history <repository>` - check image history

`docker image inspect <repository>` - inspect image

`docker images` - list all images

`docker image tag <repository/image>:<tag> <repository/image>:<tag>`

`docker image push <repository/image>:<tag>` - push image to registry(docker hub), need to login with `docker login`

`docker volume create <name>` - create volume

`Dockerfile` to create the image, `Dockerfile` contain FROM, RUN and CMD. below example

```Dockerfile
FROM alpine

RUN apk add --update redis

CMD ["redis-server"]
```

`docker build -t <docker-id>/<project-name>:<version> .` - build a container with tag option, example `docker build -t oyuu/testcontainer:latest`

`docker commit -c 'CMD ["<command>"]' <container-id>` - build a container from another container with new command.

`docker commit -c "CMD '<command>'" <container-id>` - for windows, build a container from another container with new command.

`docker run -p 8080:8080 <container-id>` - running web application with port mapping, docker port mapping change when we running container not inside `Dockerfile`

below example `Dockerfile` webapp

```Dockerfile
#base image
FROM node:alpine
#working directory, any command after this lines will be inside this working directory
WORKDIR /usr/app
#copy files from the build folder to the container(inside working directory location). If the files inside build folder got changing, the build process will rerun the copy and after that instead of using caches.
COPY ./ ./

RUN npm install

CMD [ "npm","start"]
```

below example `Dockerfile` webapp with improvement. the `RUN` command will not take longer time for build if files under `./` except `package.json` got changes.

```Dockerfile
#base image
FROM node:alpine
#working directory, any command after this lines will be inside this working directory
WORKDIR /usr/app

COPY --chown=node:node ./package.json ./

RUN npm install

COPY  --chown=node:node ./ ./

CMD [ "npm","start"]
```

below the output build process after the improvement

```log
PS Y:\work\github\docker-and-kubernetes\simpleweb> docker build -t oyuu/simpleweb .
[+] Building 7.2s (11/11) FINISHED
 => [internal] load build definition from Dockerfile
 => => transferring dockerfile: 174B
 => [internal] load .dockerignore
 => => transferring context: 2B
 => [internal] load metadata for docker.io/library/node:alpine
 => [auth] library/node:pull token for registry-1.docker.io
 => [1/5] FROM docker.io/library/node:alpine@sha256:6f8ae702a7609f6f18d81ac72998e5d6f5d0ace9a13b866318c76340c6d986b2
 => [internal] load build context
 => => transferring context: 233B
 => CACHED [2/5] WORKDIR /usr/app
 => [3/5] COPY ./package.json ./
 => [4/5] RUN npm install
 => [5/5] COPY ./ ./
 => exporting to image
 => => exporting layers
 => => writing image sha256:3adb95dfee69603a642bf9d8fe95aa7c2d978878f16734e59e7c16b86c18220d
 => => naming to docker.io/oyuu/simpleweb
PS Y:\work\github\docker-and-kubernetes\simpleweb> docker build -t oyuu/simpleweb .
[+] Building 1.5s (10/10) FINISHED
 => [internal] load build definition from Dockerfile
 => => transferring dockerfile: 32B
 => [internal] load .dockerignore
 => => transferring context: 2B
 => [internal] load metadata for docker.io/library/node:alpine
 => [1/5] FROM docker.io/library/node:alpine@sha256:6f8ae702a7609f6f18d81ac72998e5d6f5d0ace9a13b866318c76340c6d986b2
 => [internal] load build context
 => => transferring context: 303B
 => CACHED [2/5] WORKDIR /usr/app
 => CACHED [3/5] COPY ./package.json ./
 => CACHED [4/5] RUN npm install
 => [5/5] COPY ./ ./
 => exporting to image
 => => exporting layers
 => => writing image sha256:f9d1d3afb4a6d783abff6a6e3dde9be1cffd08c82ee20a58fc548220cce58318
 => => naming to docker.io/oyuu/simpleweb

```

`docker-compose` - start up multiple docker containers at the same time, automates some of the long arguments that were passing to `docker run`

```yml
version: "3"
services:
  redis-server:
    image: "redis"
  node-app:
    build: . #build the dockerfile in current directory
    ports:
      - "4001:8081" #dash means array because can map many ports.
```

`docker-compose up` - run docker-compose.yml at the current location

`docker-compose up --build` - run docker-compose.yml with the build option at the current location

`docker-compose up -d` - run docker-compose.yml in the background

`docker-compose down` - stop all container in the docker-compose.yml

restart policies in docker-compose, below detail and example nodejs app with `process.exit(0)`, exit with code okay

```txt

"no" - never attemt to restart this container if stops or crashes
"always" - if this container stops for anyreason, always attempt to restart it
"on-failure" - only restart if the container stops with an error code(not "0")
"unless-stopped" - always restart unless the developer forcibly stop it
```

```js
const express = require("express");
const redis = require("redis");

const app = express();
const client = redis.createClient({
  host: "redis-server",
  port: 6379,
});
client.set("visits", 0);

app.get("/", (req, res) => {
  process.exit(0); //exit with 0 means everything is okay, with other value means something went wrong
  client.get("visits", (err, visits) => {
    res.send("Number of visits is " + visits);
    client.set("visits", parseInt(visits) + 1);
  });
});

app.listen(8081, () => {
  console.log("Listening on port 8081");
});
```

`docker build -f Dockerfile.dev .` - run docker build with specific Dockerfile name

`docker run -v $(pwd):/app <image-id>` - create a container with volume mapping current directory to container directory

`docker run -v /app/node_modules -v $(pwd):/app <image-id>` - `-v /app/node_modules` means dont map and keep using the container files

`docker-compose.yml` file with detail on build. for development purpose

```yml
version: "3"
services:
  web:
    build:
      context: . #Dockerfile location
      dockerfile: Dockerfile.dev #file name
    ports:
      - 3300:3000
    volumes:
      - /app/node_modules
      - .:/app
```

`Dockerfile` example for production build

```Dockerfile
FROM node:16-alpine as builder

WORKDIR '/app'

COPY ./package.json .

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
```

complex exercise, below file tree and `docker-compose.yml`

```txt
complex
├── client
│   ├── Dockerfile.dev
│   ├── node_modules
│   ├── package.json
│   ├── public
│   │   ├── favicon.ico
│   │   ├── index.html
│   │   ├── logo192.png
│   │   ├── logo512.png
│   │   ├── manifest.json
│   │   └── robots.txt
│   ├── README.md
│   └── src
│       ├── App.css
│       ├── App.js
│       ├── App.test.js
│       ├── Fib.js
│       ├── index.css
│       ├── index.js
│       ├── logo.svg
│       ├── OtherPage.js
│       ├── serviceWorker.js
│       └── setupTests.js
├── docker-compose.yml
├── nginx
│   ├── default.conf
│   └── Dockerfile.dev
├── server
│   ├── Dockerfile.dev
│   ├── index.js
│   ├── keys.js
│   ├── node_modules
│   └── package.json
└── worker
    ├── Dockerfile.dev
    ├── index.js
    ├── keys.js
    ├── node_modules
    └── package.json

9 directories, 30 files


```

```yml
version: "3"
services:
  postgres:
    image: "postgres:latest"
    environment:
      - POSTGRES_PASSWORD=postgres_password
  redis:
    image: "redis:latest"
  nginx:
    depends_on:
      - api
      - client
    restart: always
    build:
      dockerfile: Dockerfile.dev
      context: ./nginx
    ports:
      - "3300:80"
  api:
    build:
      dockerfile: Dockerfile.dev
      context: ./server
    volumes:
      - /app/node_modules
      - ./server:/app
    environment: #below information for keys.js inside server and worker folder
      - REDIS_HOST=redis #from line no.7
      - REDIS_PORT=6379 #check redis documentation
      - PGUSER=postgres
      - PGHOST=postgres
      - PGDATABASE=postgres
      - PGPASSWORD=postgres_password
      - PGPORT=5432
  client:
    stdin_open: true
    build:
      dockerfile: Dockerfile.dev
      context: ./client
    volumes:
      - /app/node_modules
      - ./client:/app
  worker:
    build:
      dockerfile: Dockerfile.dev
      context: ./worker
    volumes:
      - /app/node_modules
      - ./worker:/app
    environment:
      - REDIS_HOST=redis
      - REDIS_PORT=6379
```
