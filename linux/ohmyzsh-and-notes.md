# ohmyzsh-and-notes

[link](https://github.com/ohmyzsh/ohmyzsh)

# Docker-compose

This plugin provides completion for [docker-compose](https://docs.docker.com/compose/) as well as some
aliases for frequent docker-compose commands.

To use it, add docker-compose to the plugins array of your zshrc file:

```zsh
plugins=(... docker-compose)
```

## Aliases

| Alias     | Command                     | Description                                                      |
| --------- | --------------------------- | ---------------------------------------------------------------- |
| dco       | `docker-compose`            | Docker-compose main command                                      |
| dcb       | `docker-compose build`      | Build containers                                                 |
| dce       | `docker-compose exec`       | Execute command inside a container                               |
| dcps      | `docker-compose ps`         | List containers                                                  |
| dcrestart | `docker-compose restart`    | Restart container                                                |
| dcrm      | `docker-compose rm`         | Remove container                                                 |
| dcr       | `docker-compose run`        | Run a command in container                                       |
| dcstop    | `docker-compose stop`       | Stop a container                                                 |
| dcup      | `docker-compose up`         | Build, (re)create, start, and attach to containers for a service |
| dcupb     | `docker-compose up --build` | Same as `dcup`, but build images before starting containers      |
| dcupd     | `docker-compose up -d`      | Same as `dcup`, but starts as daemon                             |
| dcdn      | `docker-compose down`       | Stop and remove containers                                       |
| dcl       | `docker-compose logs`       | Show logs of container                                           |
| dclf      | `docker-compose logs -f`    | Show logs and follow output                                      |
| dcpull    | `docker-compose pull`       | Pull image of a service                                          |
| dcstart   | `docker-compose start`      | Start a container                                                |
| dck       | `docker-compose kill`       | Kills containers                                                 |

# Kubectl plugin

This plugin adds completion for the [Kubernetes cluster manager](https://kubernetes.io/docs/reference/kubectl/kubectl/),
as well as some aliases for common kubectl commands.

To use it, add `kubectl` to the plugins array in your zshrc file:

```zsh
plugins=(... kubectl)
```

## Aliases

| Alias    | Command                                            | Description                                                                                      |
| :------- | :------------------------------------------------- | :----------------------------------------------------------------------------------------------- |
| k        | `kubectl`                                          | The kubectl command                                                                              |
| kca      | `kubectl --all-namespaces`                         | The kubectl command targeting all namespaces                                                     |
| kaf      | `kubectl apply -f`                                 | Apply a YML file                                                                                 |
| keti     | `kubectl exec -ti`                                 | Drop into an interactive terminal on a container                                                 |
|          |                                                    | **Manage configuration quickly to switch contexts between local, dev and staging**               |
| kcuc     | `kubectl config use-context`                       | Set the current-context in a kubeconfig file                                                     |
| kcsc     | `kubectl config set-context`                       | Set a context entry in kubeconfig                                                                |
| kcdc     | `kubectl config delete-context`                    | Delete the specified context from the kubeconfig                                                 |
| kccc     | `kubectl config current-context`                   | Display the current-context                                                                      |
| kcgc     | `kubectl config get-contexts`                      | List of contexts available                                                                       |
|          |                                                    | **General aliases**                                                                              |
| kdel     | `kubectl delete`                                   | Delete resources by filenames, stdin, resources and names, or by resources and label selector    |
| kdelf    | `kubectl delete -f`                                | Delete a pod using the type and name specified in -f argument                                    |
|          |                                                    | **Pod management**                                                                               |
| kgp      | `kubectl get pods`                                 | List all pods in ps output format                                                                |
| kgpw     | `kgp --watch`                                      | After listing/getting the requested object, watch for changes                                    |
| kgpwide  | `kgp -o wide`                                      | Output in plain-text format with any additional information. For pods, the node name is included |
| kep      | `kubectl edit pods`                                | Edit pods from the default editor                                                                |
| kdp      | `kubectl describe pods`                            | Describe all pods                                                                                |
| kdelp    | `kubectl delete pods`                              | Delete all pods matching passed arguments                                                        |
| kgpl     | `kgp -l`                                           | Get pods by label. Example: `kgpl "app=myapp" -n myns`                                           |
| kgpn     | `kgp -n`                                           | Get pods by namespace. Example: `kgpn kube-system`                                               |
|          |                                                    | **Service management**                                                                           |
| kgs      | `kubectl get svc`                                  | List all services in ps output format                                                            |
| kgsw     | `kgs --watch`                                      | After listing all services, watch for changes                                                    |
| kgswide  | `kgs -o wide`                                      | After listing all services, output in plain-text format with any additional information          |
| kes      | `kubectl edit svc`                                 | Edit services(svc) from the default editor                                                       |
| kds      | `kubectl describe svc`                             | Describe all services in detail                                                                  |
| kdels    | `kubectl delete svc`                               | Delete all services matching passed argument                                                     |
|          |                                                    | **Ingress management**                                                                           |
| kgi      | `kubectl get ingress`                              | List ingress resources in ps output format                                                       |
| kei      | `kubectl edit ingress`                             | Edit ingress resource from the default editor                                                    |
| kdi      | `kubectl describe ingress`                         | Describe ingress resource in detail                                                              |
| kdeli    | `kubectl delete ingress`                           | Delete ingress resources matching passed argument                                                |
|          |                                                    | **Namespace management**                                                                         |
| kgns     | `kubectl get namespaces`                           | List the current namespaces in a cluster                                                         |
| kcn      | `kubectl config set-context --current --namespace` | Change current namespace                                                                         |
| kens     | `kubectl edit namespace`                           | Edit namespace resource from the default editor                                                  |
| kdns     | `kubectl describe namespace`                       | Describe namespace resource in detail                                                            |
| kdelns   | `kubectl delete namespace`                         | Delete the namespace. WARNING! This deletes everything in the namespace                          |
|          |                                                    | **ConfigMap management**                                                                         |
| kgcm     | `kubectl get configmaps`                           | List the configmaps in ps output format                                                          |
| kecm     | `kubectl edit configmap`                           | Edit configmap resource from the default editor                                                  |
| kdcm     | `kubectl describe configmap`                       | Describe configmap resource in detail                                                            |
| kdelcm   | `kubectl delete configmap`                         | Delete the configmap                                                                             |
|          |                                                    | **Secret management**                                                                            |
| kgsec    | `kubectl get secret`                               | Get secret for decoding                                                                          |
| kdsec    | `kubectl describe secret`                          | Describe secret resource in detail                                                               |
| kdelsec  | `kubectl delete secret`                            | Delete the secret                                                                                |
|          |                                                    | **Deployment management**                                                                        |
| kgd      | `kubectl get deployment`                           | Get the deployment                                                                               |
| kgdw     | `kgd --watch`                                      | After getting the deployment, watch for changes                                                  |
| kgdwide  | `kgd -o wide`                                      | After getting the deployment, output in plain-text format with any additional information        |
| ked      | `kubectl edit deployment`                          | Edit deployment resource from the default editor                                                 |
| kdd      | `kubectl describe deployment`                      | Describe deployment resource in detail                                                           |
| kdeld    | `kubectl delete deployment`                        | Delete the deployment                                                                            |
| ksd      | `kubectl scale deployment`                         | Scale a deployment                                                                               |
| krsd     | `kubectl rollout status deployment`                | Check the rollout status of a deployment                                                         |
| kres     | `kubectl set env $@ REFRESHED_AT=...`              | Recreate all pods in deployment with zero-downtime                                               |
|          |                                                    | **Rollout management**                                                                           |
| kgrs     | `kubectl get rs`                                   | To see the ReplicaSet `rs` created by the deployment                                             |
| krh      | `kubectl rollout history`                          | Check the revisions of this deployment                                                           |
| kru      | `kubectl rollout undo`                             | Rollback to the previous revision                                                                |
|          |                                                    | **Port forwarding**                                                                              |
| kpf      | `kubectl port-forward`                             | Forward one or more local ports to a pod                                                         |
|          |                                                    | **Tools for accessing all information**                                                          |
| kga      | `kubectl get all`                                  | List all resources in ps format                                                                  |
| kgaa     | `kubectl get all --all-namespaces`                 | List the requested object(s) across all namespaces                                               |
|          |                                                    | **Logs**                                                                                         |
| kl       | `kubectl logs`                                     | Print the logs for a container or resource                                                       |
| klf      | `kubectl logs -f`                                  | Stream the logs for a container or resource (follow)                                             |
|          |                                                    | **File copy**                                                                                    |
| kcp      | `kubectl cp`                                       | Copy files and directories to and from containers                                                |
|          |                                                    | **Node management**                                                                              |
| kgno     | `kubectl get nodes`                                | List the nodes in ps output format                                                               |
| keno     | `kubectl edit node`                                | Edit nodes resource from the default editor                                                      |
| kdno     | `kubectl describe node`                            | Describe node resource in detail                                                                 |
| kdelno   | `kubectl delete node`                              | Delete the node                                                                                  |
|          |                                                    | **Persistent Volume Claim management**                                                           |
| kgpvc    | `kubectl get pvc`                                  | List all PVCs                                                                                    |
| kgpvcw   | `kgpvc --watch`                                    | After listing/getting the requested object, watch for changes                                    |
| kepvc    | `kubectl edit pvc`                                 | Edit pvcs from the default editor                                                                |
| kdpvc    | `kubectl describe pvc`                             | Describe all pvcs                                                                                |
| kdelpvc  | `kubectl delete pvc`                               | Delete all pvcs matching passed arguments                                                        |
|          |                                                    | **StatefulSets management**                                                                      |
| kgss     | `kubectl get statefulset`                          | List the statefulsets in ps format                                                               |
| kgssw    | `kgss --watch`                                     | After getting the list of statefulsets, watch for changes                                        |
| kgsswide | `kgss -o wide`                                     | After getting the statefulsets, output in plain-text format with any additional information      |
| kess     | `kubectl edit statefulset`                         | Edit statefulset resource from the default editor                                                |
| kdss     | `kubectl describe statefulset`                     | Describe statefulset resource in detail                                                          |
| kdelss   | `kubectl delete statefulset`                       | Delete the statefulset                                                                           |
| ksss     | `kubectl scale statefulset`                        | Scale a statefulset                                                                              |
| krsss    | `kubectl rollout status statefulset`               | Check the rollout status of a deployment                                                         |
|          |                                                    | **Service Accounts management**                                                                  |
| kdsa     | `kubectl describe sa`                              | Describe a service account in details                                                            |
| kdelsa   | `kubectl delete sa`                                | Delete the service account                                                                       |
|          |                                                    | **DaemonSet management**                                                                         |
| kgds     | `kubectl get daemonset`                            | List all DaemonSets in ps output format                                                          |
| kgdsw    | `kgds --watch`                                     | After listing all DaemonSets, watch for changes                                                  |
| keds     | `kubectl edit daemonset`                           | Edit DaemonSets from the default editor                                                          |
| kdds     | `kubectl describe daemonset`                       | Describe all DaemonSets in detail                                                                |
| kdelds   | `kubectl delete daemonset`                         | Delete all DaemonSets matching passed argument                                                   |
|          |                                                    | **CronJob management**                                                                           |
| kgcj     | `kubectl get cronjob`                              | List all CronJobs in ps output format                                                            |
| kecj     | `kubectl edit cronjob`                             | Edit CronJob from the default editor                                                             |
| kdcj     | `kubectl describe cronjob`                         | Describe a CronJob in details                                                                    |
| kdelcj   | `kubectl delete cronjob`                           | Delete the CronJob                                                                               |

## Wrappers

This plugin provides 3 wrappers to colorize kubectl output in JSON and YAML using various tools (which must be installed):

- `kj`: JSON, colorized with [`jq`](https://stedolan.github.io/jq/).
- `kjx`: JSON, colorized with [`fx`](https://github.com/antonmedv/fx).
- `ky`: YAML, colorized with [`yh`](https://github.com/andreazorzetto/yh).

# FirewallD Plugin

This plugin adds some aliases and functions for FirewallD using the `firewalld-cmd` command. To use it, add firewalld to your plugins array.

```zsh
plugins=(... firewalld)
```

## Aliases

| Alias | Command                                    | Description                  |
| :---- | :----------------------------------------- | :--------------------------- |
| fw    | `sudo firewall-cmd`                        | Shorthand                    |
| fwr   | `sudo firewall-cmd --reload`               | Reload current configuration |
| fwp   | `sudo firewall-cmd --permanent`            | Create permanent rule        |
| fwrp  | `sudo firewall-cmd --runtime-to-permanent` | Save current configuration   |

## Functions

| Function | Description                                                |
| :------- | :--------------------------------------------------------- |
| fwl      | Lists configuration from all active zones and direct rules |

# debian

This plugin provides Debian-related aliases and functions for zsh.

To use it add `debian` to the plugins array in your zshrc file.

```zsh
plugins=(... debian)
```

## Settings

- `$apt_pref`: use aptitude or apt if installed, fallback is apt-get.
- `$apt_upgr`: use upgrade or safe-upgrade (for aptitude).

Set `$apt_pref` and `$apt_upgr` to whatever command you want (before sourcing Oh My Zsh) to override this behavior.

## Common Aliases

| Alias  | Command                                                                | Description                                                |
| ------ | ---------------------------------------------------------------------- | ---------------------------------------------------------- |
| `age`  | `apt-get`                                                              | Command line tool for handling packages                    |
| `api`  | `aptitude`                                                             | Same functionality as `apt-get`, provides extra options    |
| `acs`  | `apt-cache search`                                                     | Command line tool for searching apt software package cache |
| `aps`  | `aptitude search`                                                      | Searches installed packages using aptitude                 |
| `as`   | `aptitude -F '* %p -> %d \n(%v/%V)' --no-gui --disable-columns search` | Print searched packages using a custom format              |
| `afs`  | `apt-file search --regexp`                                             | Search file in packages                                    |
| `asrc` | `apt-get source`                                                       | Fetch source packages through `apt-get`                    |
| `app`  | `apt-cache policy`                                                     | Displays priority of package sources                       |

## Superuser Operations Aliases

| Alias    | Command                                                                               | Description                                                                                 |
| -------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `aac`    | `sudo $apt_pref autoclean`                                                            | Clears out the local repository of retrieved package files                                  |
| `aar`    | `sudo $apt_pref autoremove`                                                           | Removes packages installed automatically that are no longer needed                          |
| `abd`    | `sudo $apt_pref build-dep`                                                            | Installs all dependencies for building packages                                             |
| `ac`     | `sudo $apt_pref clean`                                                                | Clears out the local repository of retrieved package files except lock files                |
| `ad`     | `sudo $apt_pref update`                                                               | Updates the package lists for upgrades for packages                                         |
| `adg`    | `sudo $apt_pref update && sudo $apt_pref $apt_upgr`                                   | Update and upgrade packages                                                                 |
| `ads`    | `sudo apt-get dselect-upgrade`                                                        | Installs packages from list and removes all not in the list                                 |
| `adu`    | `sudo $apt_pref update && sudo $apt_pref dist-upgrade`                                | Smart upgrade that handles dependencies                                                     |
| `afu`    | `sudo apt-file update`                                                                | Update the files in packages                                                                |
| `ai`     | `sudo $apt_pref install`                                                              | Command-line tool to install package                                                        |
| `ail`    | `sed -e 's/ */ /g' -e 's/ *//' \| cut -s -d ' ' -f 1 \| xargs sudo $apt_pref install` | Install all packages given on the command line while using only the first word of each line |
| `alu`    | `sudo apt update && apt list -u && sudo apt upgrade`                                  | Update, list and upgrade packages                                                           |
| `ap`     | `sudo $apt_pref purge`                                                                | Removes packages along with configuration files                                             |
| `ar`     | `sudo $apt_pref remove`                                                               | Removes packages, keeps the configuration files                                             |
| `au`     | `sudo $apt_pref $apt_upgr`                                                            | Install package upgrades                                                                    |
| `di`     | `sudo dpkg -i`                                                                        | Install all .deb files in the current directory                                             |
| `dia`    | `sudo dpkg -i ./*.deb`                                                                | Install all .deb files in the current directory                                             |
| `kclean` | `sudo aptitude remove -P ?and(~i~nlinux-(ima\|hea) ?not(~n$(uname -r)))`              | Remove ALL kernel images and headers EXCEPT the one in use                                  |

## Aliases - Commands using `su`

| Alias | Command                                                   |
| ----- | --------------------------------------------------------- |
| `aac` | `su -ls "$apt_pref autoclean" root`                       |
| `aar` | `su -ls "$apt_pref autoremove" root`                      |
| `ac`  | `su -ls "$apt_pref clean" root`                           |
| `ad`  | `su -lc "$apt_pref update" root`                          |
| `adg` | `su -lc "$apt_pref update && aptitude $apt_upgr" root`    |
| `adu` | `su -lc "$apt_pref update && aptitude dist-upgrade" root` |
| `afu` | `su -lc "apt-file update"`                                |
| `au`  | `su -lc "$apt_pref $apt_upgr" root`                       |
| `dia` | `su -lc "dpkg -i ./*.deb" root`                           |

## Miscellaneous Aliases

| Alias     | Command                                        | Description                    |
| --------- | ---------------------------------------------- | ------------------------------ |
| `allpkgs` | `aptitude search -F "%p" --disable-columns ~i` | Display all installed packages |
| `mydeb`   | `time dpkg-buildpackage -rfakeroot -us -uc`    | Create a basic .deb package    |

## Functions

| Function            | Description                                                     |
| ------------------- | --------------------------------------------------------------- |
| `apt-copy`          | Create a simple script that can be used to 'duplicate' a system |
| `apt-history`       | Displays apt history for a command                              |
| `apt-list-packages` | List packages by size                                           |
| `kerndeb`           | Builds kernel packages                                          |

## Authors

- [@AlexBio](https://github.com/AlexBio)
- [@dbb](https://github.com/dbb)
- [@Mappleconfusers](https://github.com/Mappleconfusers)
