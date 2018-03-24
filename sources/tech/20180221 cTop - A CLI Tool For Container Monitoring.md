translating by kimii
cTop - A CLI Tool For Container Monitoring
======
Recent days Linux containers are famous, even most of us already working on it and few of us start learning about it.

We have already covered article about the famous GUI (Graphical User Interface) tools such as Portainer & Rancher. This will help us to manage containers through GUI.

This tutorial will help us to understand and monitor Linux containers through cTop command. It’s a command-line tool like top command.

### What’s cTop

[ctop][1] provides a concise and condensed overview of real-time metrics for multiple containers. It’s Top-like interface for container metrics.

It displays containers metrics such as CPU utilization, Memory utilization, Disk I/O Read & Write, Process ID (PID), and Network Transmit(TX – Transmit FROM this server) and receive(RX – Receive TO this server).

ctop comes with built-in support for Docker and runC; connectors for other container and cluster systems are planned for future releases.
It doesn’t requires any arguments and uses Docker host variables by default.

**Suggested Read :**
**(#)** [Portainer – A Simple Docker Management GUI][2]
**(#)** [Rancher – A Complete Container Management Platform For Production Environment][3]

### How To Install cTop

Developer offers a simple shell script, which help us to use ctop instantly. What we have to do, just download the ctop shell file at `/bin` directory for global access. Finally assign the execute permission to ctop shell file.

Download the ctop shell file @ `/usr/local/bin` directory.
```
$ sudo wget https://github.com/bcicen/ctop/releases/download/v0.7/ctop-0.7-linux-amd64 -O /usr/local/bin/ctop

```

Set execute permission to ctop shell file.
```
$ sudo chmod +x /usr/local/bin/ctop

```

Alternatively you can install and run ctop through docker. Make sure you should have installed docker as a pre-prerequisites for this. To install docker, refer the following link.

**Suggested Read :**
**(#)** [How to install Docker in Linux][4]
**(#)** [How to play with Docker images on Linux][5]
**(#)** [How to play with Docker containers on Linux][6]
**(#)** [How to Install, Run Applications inside Docker Containers][7]
```
$ docker run --rm -ti \
 --name=ctop \
 -v /var/run/docker.sock:/var/run/docker.sock \
 quay.io/vektorlab/ctop:latest

```

### How To Use cTop

Just launch the ctop utility without any arguments. By default it’s bind with `a` key which display of all containers (running and non-running).
ctop header shows your system time and total number of containers.
```
$ ctop

```

You might get the output similar to below.
![][9]

### How To Manage Containers

You can able to administrate the containers using ctop. Select a container that you want to manage then hit `Enter` button and choose required options like start, stop, remove, etc,.
![][10]

### How To Sort Containers

By default ctop sort the containers using state field. Hit `s` key to sort the containers in the different aspect.
![][11]

### How To View the Containers Metrics

If you want to view more details & metrics about the container, just select the corresponding which you want to view then hit `o` key.
![][12]

### How To View Container Logs

Select the corresponding container which you want to view the logs then hit `l` key.
![][13]

### Display Only Active Containers

Run ctop command with `-a` option to show active containers only.
![][14]

### Open Help Dialog Box

Run ctop, just hit `h`key to open help section.
![][15]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux/

作者：[2DAYGEEK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/2daygeek/
[1]:https://github.com/bcicen/ctop
[2]:https://www.2daygeek.com/portainer-a-simple-docker-management-gui/
[3]:https://www.2daygeek.com/rancher-a-complete-container-management-platform-for-production-environment/
[4]:https://www.2daygeek.com/install-docker-on-centos-rhel-fedora-ubuntu-debian-oracle-archi-scentific-linux-mint-opensuse/
[5]:https://www.2daygeek.com/list-search-pull-download-remove-docker-images-on-linux/
[6]:https://www.2daygeek.com/create-run-list-start-stop-attach-delete-interactive-daemonized-docker-containers-on-linux/
[7]:https://www.2daygeek.com/install-run-applications-inside-docker-containers/
[8]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[9]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-1.png
[10]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-2.png
[11]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-3.png
[12]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-4a.png
[13]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-7.png
[14]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-5.png
[15]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-6.png
