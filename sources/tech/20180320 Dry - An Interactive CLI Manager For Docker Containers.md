pinewall translating

Dry – An Interactive CLI Manager For Docker Containers
======
Docker is a software that allows operating-system-level virtualization also known as containerization.

It uses the resource isolation features of the Linux kernel such as cgroups and kernel namespaces, and others to allows independent containers to run within a single Linux instance.

Docker provides a way to run applications securely isolated in a container, packaged with all its dependencies and libraries.

### What Is Dry

[Dry][1] is a command line utility to manage & monitor Docker containers and images.

It shows information about Containers, Images, Name of the containers, Networks, Running commands in the containers, and status, and, if running a Docker Swarm, it also shows all kinds of information about the state of the Swarm cluster.

It can connect to both local or remote Docker daemons. Docker host shows `unix:///var/run/docker.sock` if the local Docker connected.

Docker host shows `tcp://IP Address:Port Number` or `tcp://Host Name:Port Number` if the remote Docker connected.

It could provide you the similar output metrics like `docker ps` but it has more verbose and colored output than “docker ps”.

It also has an additional NAME column which comes handy at times when you have many containers you are not a memory champion.

**Suggested Read :**
**(#)** [Portainer – A Simple Docker Management GUI][2]
**(#)** [Rancher – A Complete Container Management Platform For Production Environment][3]
**(#)** [cTop – A Command-Line Tool For Container Monitoring And Management In Linux][4]

### How To Install Dry On Linux

The latest dry utility can be installed through single shell script on Linux. It does not require external libraries. Most of the Docker commands are available in dry with the same behavior.
```
$ curl -sSf https://moncho.github.io/dry/dryup.sh | sudo sh
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 10 100 10 0 0 35 0 --:--:-- --:--:-- --:--:-- 35
dryup: downloading dry binary
######################################################################## 100.0%
dryup: Moving dry binary to its destination
dryup: dry binary was copied to /usr/local/bin, now you should 'sudo chmod 755 /usr/local/bin/dry'

```

Change the file permission to `755` using the below command.
```
$ sudo chmod 755 /usr/local/bin/dry

```

For Arch Linux users can install from AUR repository with help of **[Packer][5]** or **[Yaourt][6]** package manager.
```
$ yaourt -S dry-bin
or
$ packer -S dry-bin

```

If you wants to run dry as a Docker container, run the following command. Make sure Docker should be installed on your system for this as a prerequisites.

**Suggested Read :**
**(#)** [How to install Docker in Linux][7]
**(#)** [How to play with Docker images on Linux][8]
**(#)** [How to play with Docker containers on Linux][9]
**(#)** [How to Install, Run Applications inside Docker Containers][10]
```
$ docker run -it -v /var/run/docker.sock:/var/run/docker.sock moncho/dry

```

### How To Launch & Use Dry

Simply run the `dry` command from your terminal to launch the utility. The default output for dry is similar to below.
```
$ dry

```

![][12]

### How To Monitor Docker Using Dry

You can open the monitor mode in dry by pressing `m` key.
![][13]

### How To Manage Container Using Dry

To monitor any containers, just hit `Enter` on that. Dry allows you to perform activity such as logs, inspect, kill, remove container, stop, start, restart, stats, and image history.
![][14]

### How To Monitor Container Resource Utilization

Dry allows users to monitor particular container resource utilization using `Stats+Top` option.

We can achieve this by navigating to container management page (Follow the above steps and hit the `Stats+Top` option). Alternatively we can press `s` key to open container resource utilization page.

![][15]

### How To Check Container, Image, & Local Volume Disk Usage

We can check disk usage of containers, images, and local volumes using `F8` key.

This will clearly display the total number of containers, images, and volumes, and how many are active, and total disk usage and reclaimable size details.
![][16]

### How To Check Downloaded Images

Press `2` key to list all the downloaded images.
![][17]

### How To Show Network List

Press `3` key to list all the networks and it’s gateway.
![][18]

### How To List All Docker Containers

Press `F2` key to list all the containers (This output includes Running & Stopped containers).
![][19]

### Dry Keybinds

To view keybinds, navigate to help page or [dry github][1] page.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/dry-an-interactive-cli-manager-for-docker-containers/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://github.com/moncho/dry
[2]:https://www.2daygeek.com/portainer-a-simple-docker-management-gui/
[3]:https://www.2daygeek.com/rancher-a-complete-container-management-platform-for-production-environment/
[4]:https://www.2daygeek.com/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux/
[5]:https://www.2daygeek.com/install-packer-aur-helper-on-arch-linux/
[6]:https://www.2daygeek.com/install-yaourt-aur-helper-on-arch-linux/
[7]:https://www.2daygeek.com/install-docker-on-centos-rhel-fedora-ubuntu-debian-oracle-archi-scentific-linux-mint-opensuse/
[8]:https://www.2daygeek.com/list-search-pull-download-remove-docker-images-on-linux/
[9]:https://www.2daygeek.com/create-run-list-start-stop-attach-delete-interactive-daemonized-docker-containers-on-linux/
[10]:https://www.2daygeek.com/install-run-applications-inside-docker-containers/
[11]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[12]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-1.png
[13]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-2.png
[14]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-3.png
[15]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-4.png
[16]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-5.png
[17]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-6.png
[18]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-7.png
[19]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-8.png
