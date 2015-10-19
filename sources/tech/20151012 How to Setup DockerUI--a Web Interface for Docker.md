translating by Ezio


How to Setup DockerUI - a Web Interface for Docker
================================================================================
Docker is getting more popularity day by day. The idea of running a complete Operating System inside a container rather than running inside a virtual machine is an awesome technology. Docker has made lives of millions of system administrators and developers pretty easy for getting their work done in no time. It is an open source technology that provides an open platform to pack, ship, share and run any application as a lightweight container without caring on which operating system we are running on the host. It has no boundaries of Language support, Frameworks or packaging system and can be run anywhere, anytime from a small home computers to high-end servers. Running docker containers and managing them may come a bit difficult and time consuming, so there is a web based application named DockerUI which is make managing and running container pretty simple. DockerUI is highly beneficial to people who are not much aware of linux command lines and want to run containerized applications. DockerUI is an open source web based application best known for its beautiful design and ease simple interface for running and managing docker containers.

Here are some easy steps on how we can setup Docker Engine with DockerUI in our linux machine.

### 1. Installing Docker Engine ###

First of all, we'll gonna install docker engine in our linux machine. Thanks to its developers, docker is very easy to install in any major linux distribution. To install docker engine, we'll need to run the following command with respect to which distribution we are running.

#### On Ubuntu/Fedora/CentOS/RHEL/Debian ####

Docker maintainers have written an awesome script that can be used to install docker engine in Ubuntu 15.04/14.10/14.04, CentOS 6.x/7, Fedora 22, RHEL 7 and Debian 8.x distributions of linux. This script recognizes the distribution of linux installed in our machine, then adds the required repository to the filesystem, updates the local repository index and finally installs docker engine and required dependencies from it. To install docker engine using that script, we'll need to run the following command under root or sudo mode.

    # curl -sSL https://get.docker.com/ | sh

#### On OpenSuse/SUSE Linux Enterprise ####

To install docker engine in the machine running OpenSuse 13.1/13.2 or SUSE Linux Enterprise Server 12, we'll simply need to execute the zypper command. We'll gonna install docker using zypper command as the latest docker engine is available on the official repository. To do so, we'll run the following command under root/sudo mode.

    # zypper in docker

#### On ArchLinux ####

Docker is available in the official repository of Archlinux as well as in the AUR packages maintained by the community. So, we have two options to install docker in archlinux. To install docker using the official arch repository, we'll need to run the following pacman command.

    # pacman -S docker

But if we want to install docker from the Archlinux User Repository ie AUR, then we'll need to execute the following command.

    # yaourt -S docker-git

### 2. Starting Docker Daemon ###

After docker is installed, we'll now gonna start our docker daemon so that we can run docker containers and manage them. We'll run the following command to make sure that docker daemon is installed and to start the docker daemon.

#### On SysVinit ####

    # service docker start

#### On Systemd ####

    # systemctl start docker

### 3. Installing DockerUI ###

Installing DockerUI is pretty easy than installing docker engine. We just need to pull the dockerui from the Docker Registry Hub and run it inside a container. To do so, we'll simply need to run the following command.

    # docker run -d -p 9000:9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock dockerui/dockerui

![Starting DockerUI Container](http://blog.linoxide.com/wp-content/uploads/2015/09/starting-dockerui-container.png)

Here, in the above command, as the default port of the dockerui web application server 9000, we'll simply map the default port of it with -p flag. With -v flag, we specify the docker socket. The --privileged flag is required for hosts using SELinux.

After executing the above command, we'll now check if the dockerui container is running or not by running the following command.

    # docker ps

![Running Docker Containers](http://blog.linoxide.com/wp-content/uploads/2015/09/running-docker-containers.png)

### 4. Pulling an Image ###

Currently, we cannot pull an image directly from DockerUI so, we'll need to pull a docker image from the linux console/terminal. To do so, we'll need to run the following command.

    # docker pull ubuntu

![Docker Image Pull](http://blog.linoxide.com/wp-content/uploads/2015/10/docker-image-pull.png)

The above command will pull an image tagged as ubuntu from the official [Docker Hub][1]. Similarly, we can pull more images that we require and are available in the hub.

### 4. Managing with DockerUI ###

After we have started the dockerui container, we'll now have fun with it to start, pause, stop, remove and perform many possible activities featured by dockerui with docker containers and images. First of all, we'll need to open the web application using our web browser. To do so, we'll need to point our browser to http://ip-address:9000 or http://mydomain.com:9000 according to the configuration of our system. By default, there is no login authentication needed for the user access but we can configure our web server for adding authentication. To start a container, first we'll need to have images of the required application we want to run a container with.

#### Create a Container ####

To create a container, we'll need to go to the section named Images then, we'll need to click on the image id which we want to create a container of. After clicking on the required image id, we'll need to click on Create button then we'll be asked to enter the required properties for our container. And after everything is set and done. We'll need to click on Create button to finally create a container.

![Creating Docker Container](http://blog.linoxide.com/wp-content/uploads/2015/10/creating-docker-container.png)

#### Stop a Container ####

To stop a container, we'll need to move towards the Containers page and then select the required container we want to stop. Now, we'll want to click on Stop option which we can see under Actions drop-down menu.

![Managing Container](http://blog.linoxide.com/wp-content/uploads/2015/10/managing-container.png)

#### Pause and Resume ####

To pause a container, we simply select the required container we want to pause by keeping a check mark on the container and then click the Pause option under Actions . This is will pause the running container and then, we can simply resume the container by selecting Unpause option from the Actions drop down menu.

#### Kill and Remove ####

Like we had performed the above tasks, its pretty easy to kill and remove a container or an image. We just need to check/select the required container or image and then select the Kill or Remove button from the application according to our need.

### Conclusion ###

DockerUI is a beautiful utilization of Docker Remote API to develop an awesome web interface for managing docker containers. The developers have designed and developed this application in pure HTML and JS language. It is currently incomplete and is under heavy development so we don't recommend it for the use in production currently. It makes users pretty easy to manage their containers and images with simple clicks without needing to execute lines of commands to do small jobs. If we want to contribute DockerUI, we can simply visit its [Github Repository][2]. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you !

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-dockerui-web-interface-docker/

作者：[Arun Pyasi][a]
译者：[oska874](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://hub.docker.com/
[2]:https://github.com/crosbymichael/dockerui/
