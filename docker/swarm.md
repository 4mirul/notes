# Swarm

| Version                 |
| ----------------------- |
| Docker version 20.10.14 |

[link](https://docs.docker.com/engine/reference/commandline/service/)

`docker service create --name <name> <image>` - create a service

`docker service inspect <service-id>` - inspect a service

`docker service ls` - list the services

`docker service ps <service-id>` - list the tasks of service

`docker service rm <service-id>` - delete a service

`docker stack deploy -c <compose-name> <stack-name>` - deploy a stack

`docker stack ls` - list stack

`docker stack ps <stack-name>` - list tasks in the stack

`docker stack rm <stack-name>` - delete stack

`docker stack services <stack-name>` - list services in the stack
