Howto Manage Host Using Docker Machine in a VirtualBox
================================================================================
Hi all, today we'll learn how to create and manage a Docker host using Docker Machine in a VirtualBox. Docker Machine is an application that helps to create Docker hosts on our computer, on cloud providers and inside our own data center. It provides easy solution for creating servers, installing Docker on them and then configuring the Docker client according the users configuration and requirements. This API works for provisioning Docker on a local machine, on a virtual machine in the data center, or on a public cloud instance. Docker Machine is supported on Windows, OSX, and Linux and is available for installation as one standalone binary. It enables us to take full advantage of ecosystem partners providing Docker-ready infrastructure, while still accessing everything through the same interface. It makes people able to deploy the docker containers in the respective platform pretty fast and in pretty easy way with just a single command.

Here are some easy and simple steps that helps us to deploy docker containers using Docker Machine.

### 1. Installing Docker Machine ###

Docker Machine supports awesome on every Linux Operating System. First of all, we'll need to download the latest version of Docker Machine from the [Github site][1] . Here, we'll use curl to download the latest version of Docker Machine ie 0.2.0 .

**For 64 Bit Operating System**

    # curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-amd64 > /usr/local/bin/docker-machine

**For 32 Bit Operating System**

    # curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-i386 > /usr/local/bin/docker-machine

After downloading the latest release of Docker Machine, we'll make the file named **docker-machine** under **/usr/local/bin/** executable using the command below.

    # chmod +x /usr/local/bin/docker-machine

After doing the above, we'll wanna ensure that we have successfully installed docker-machine. To check it, we can run the docker-machine -v which will give output of the version of docker-machine installed in our system.

    # docker-machine -v

![Installing Docker Machine](http://blog.linoxide.com/wp-content/uploads/2015/05/installing-docker-machine.png)

To enable Docker commands on our machines, make sure to install the Docker client as well by running the command below.

        # curl -L https://get.docker.com/builds/linux/x86_64/docker-latest > /usr/local/bin/docker
        # chmod +x /usr/local/bin/docker

### 2. Creating VirualBox VM ###

After we have successfully installed Docker Machine in our Linux running machine, we'll definitely wanna go for creating a Virtual Machine using VirtualBox. To get started, we need to run docker-machine create command followed by --driver flag with string as virtualbox as we are trying to deploy docker inside of Virtual Box running VM and the final argument is the name of the machine, here we have machine name as "linux". This command will download [boot2docker][2] iso which is a light-weighted linux distribution based on Tiny Core Linux with the Docker daemon installed and will create and start a VirtualBox VM with Docker running as mentioned above.

To do so, we'll run the following command in a terminal or shell in our box.

    # docker-machine create --driver virtualbox linux

![Creating Docker Machine](http://blog.linoxide.com/wp-content/uploads/2015/05/creating-docker-machine.png)

Now, to check whether we have successfully create a Virtualbox running Docker or not, we'll run the command **docker-machine** ls as shown below.

    # docker-machine ls

![Docker Machine List](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-list.png)

If the host is active, we can see * under the ACTIVE column in the output as shown above.

### 3. Setting Environment Variables ###

Now, we'll need to make docker talk with the machine. We can do that by running docker-machine env and then the machine name, here we have named **linux** as above.

    # eval "$(docker-machine env linux)"
    # docker ps

This will set environment variables that the Docker client will read which specify the TLS settings. Note that we'll need to do this every time we reboot our machine or start a new tab. We can see what variables will be set by running the following command.

    # docker-machine env linux

    export DOCKER_TLS_VERIFY=1
    export DOCKER_CERT_PATH=/Users/<your username>/.docker/machine/machines/dev
    export DOCKER_HOST=tcp://192.168.99.100:2376

### 4. Running Docker Containers ###

Finally, after configuring the environment variables and Virtual Machine, we are able to run docker containers in the host running inside the Virtual Machine. To give it a test, we'll run a busybox container out of it run running **docker run busybox** command with **echo hello world** so that we can get the output of the container.

    # docker run busybox echo hello world

![Running Docker Container](http://blog.linoxide.com/wp-content/uploads/2015/05/running-docker-container.png)

### 5. Getting Docker Host's IP ###

We can get the IP Address of the running Docker Host's using the **docker-machine ip** command. We can see any exposed ports that are available on the Docker host’s IP address.

    # docker-machine ip

![Docker IP Address](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-ip-address.png)

### 6. Managing the Hosts ###

Now we can manage as many local VMs running Docker as we desire by running docker-machine create command again and again as mentioned in above steps

If you are finished working with the running docker, we can simply run **docker-machine stop** command to stop the whole hosts which are Active and if wanna start again, we can run **docker-machine start**.

    # docker-machine stop
    # docker-machine start

You can also specify a host to stop or start using the host name as an argument.

    $ docker-machine stop linux
    $ docker-machine start linux

### Conclusion ###

Finally, we have successfully created and managed a Docker host inside a VirtualBox using Docker Machine. Really, Docker Machine enables people fast and easy to create, deploy and manage Docker hosts in different platforms as here we are running Docker hosts using Virtualbox platform. This virtualbox driver API works for provisioning Docker on a local machine, on a virtual machine in the data center. Docker Machine ships with drivers for provisioning Docker locally with Virtualbox as well as remotely on Digital Ocean instances whereas more drivers are in the work for AWS, Azure, VMware, and other infrastructure. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/host-virtualbox-docker-machine/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://github.com/docker/machine/releases
[2]:https://github.com/boot2docker/boot2docker