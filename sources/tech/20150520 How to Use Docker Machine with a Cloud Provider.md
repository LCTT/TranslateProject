Translating by goreliu ...

How to Use Docker Machine with a Cloud Provider
================================================================================
Hi everyone, today we'll learn how we can use Docker Machine to deploy Docker host in various Cloud Provider Platforms. Docker Machine is an application that helps to create Docker hosts on our computer, on cloud providers and inside our own data center. It provides easy solution for creating servers, installing Docker on them and then configuring the Docker client according the users configuration and requirements. The driver APIs works for provisioning Docker on a local machine, on a virtual machine in the data center, or on a public cloud instance. Docker Machine is supported on Windows, OSX, and Linux and is available for installation as one standalone binary. It enables us to take full advantage of ecosystem partners providing Docker-ready infrastructure, while still accessing everything through the same interface. It makes people able to deploy the docker containers in the respective cloud platform pretty fast and in pretty easy way with just a single command.

### 1. Installing Docker Machine ###

Docker Machine supports awesome on every Linux Operating System. First of all, we'll need to download the latest version of Docker Machine from the Github site . Here, we'll use curl to download the latest version of Docker Machine ie 0.2.0 .

For 64 Bit Operating System

    # curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-amd64 > /usr/local/bin/docker-machine

For 32 Bit Operating System

    # curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-i386 > /usr/local/bin/docker-machine

After downloading the latest release of Docker Machine, we'll make the file named docker-machine under /usr/local/bin/ executable using the command below.

    # chmod +x /usr/local/bin/docker-machine

After doing the above, we'll wanna ensure that we have successfully installed docker-machine. To check it, we can run the docker-machine -v which will give output of the version of docker-machine installed in our system.

    # docker-machine -v

![Installing Docker Machine](http://blog.linoxide.com/wp-content/uploads/2015/05/installing-docker-machine.png)

To enable Docker commands on our machines, make sure to install the Docker client as well by running the command below.

        # curl -L https://get.docker.com/builds/linux/x86_64/docker-latest > /usr/local/bin/docker
        # chmod +x /usr/local/bin/docker

### 2. Creating Machine ###

After finish installing Docker Machine in our Linux box, we'll wanna deploy a docker host into the cloud server. Docker Machine includes drivers for several popular Cloud Platforms such as Digital Ocean, Amazon Web Services (AWS), Microsoft Azure, Google Cloud Computing and many other which enables us to create same interface of docker deployment in different platforms. So, here in this tutorial we'll gonna deploy the Docker Host into the Digital Ocean server using digitalocean driver API. Here, we'll need to run command docker-machine create followed by --driver flag as digitalocean with --digitalocean-access-token flag as the API Token provided by the [Digital Ocean Control Panel][1] and at last the name of the docker host we just created. To do so, we'll need to run the following command as.

    # docker-machine create --driver digitalocean --digitalocean-access-token <API-Token> linux-dev

    # eval "$(docker-machine env linux-dev)"

![Docker Machine Digitalocean Cloud](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-digitalocean-cloud.png)

**Note**: Here, linux-dev is the name of the machine we are wanting to create. <API-Token> is a security key which can be generated from the Digital Ocean Control Panel of the account holder of Digital Ocean Cloud Platform. To retrieve that key, we simply need to login to our Digital Ocean Control Panel then click on API, then click on Generate New Token and give it a name tick on both Read and Write. Then we'll get a long hex key, thats the <API-Token> now, simply replace it into the command above.

After running the above command, we can see in our Digital Ocean Droplet Panel that a droplet has been created with default configuration.

![DigitalOcean Droplet Panel](http://blog.linoxide.com/wp-content/uploads/2015/05/digitalocean-droplet-panel.png)

For ease and convenience, docker-machine deploys the droplet with default configuration choosing setting such as images that the VPS is based on we can override the default configuration as our need. We can do that by simply adding the flags respective to our need and requirement of the Droplet. Here are some flags for digitalocean that we can add to override the default configuration of the Docker Machine.

    --digitalocean-image "ubuntu-14-04-x64" for Choosing Droplet Image
    --digitalocean-ipv6 enable to enable IPv6 Networking
    --digitalocean-private-networking enable to enable Private Networking
    --digitalocean-region "nyc3" to choose Region to deploy the Droplet
    --digitalocean-size "512mb" to select the RAM size and type of deployment.

If you are wanting to use docker-machine with other cloud providers and need to override the default configuration, we can run following command to get the list of flags for every platforms supported by Docker Machine by default.

    # docker-machine create -h

### 3. Selecting Active Host ###

After deploying the droplet, we wanna run a docker container straight away but before that, we'll need to check whether the active host is the required machine or not. To see that, we can run the following command.

    # docker-machine ls

![Docker Machine List](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-ls.png)

The active host can be identified by "*" in the ACTIVE column.

Now, if we need to switch the active host to the required machine, we can simply run the following command.

    # docker-machine active linux-dev

**Note**: Here, linux-dev is the Machine name that we are wanting to make as ACTIVE and run Docker Container on top of it.

### 4. Running a Docker Container ###

Now, after selecting our active host, we'll wanna finally run a docker container out of the box. Now, to give it a test, we'll run a busybox container out of it by running docker run busybox command with echo hello world so that we can get the output of the container.

    # docker run busybox echo hello world

Note: If you are trying to deploy a docker container using a 32 Bit Operating System running in the host, its good idea to use SSH to run the docker commands. So, you can simply skip this step and follow the SSH step.

### 5. SSH with Docker Machine ###

If we want to control over the machine or the droplet that we just deployed with Docker Machine, we can ssh into the server using docker-machine ssh as command.

    # docker-machine ssh

![Docker Machine SSH](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-ssh.png)

Now, after ssh into the machine, we can run any docker containers into it. Here we'll run an nginx server into it.

    # docker run -itd -p 80:80 nginx

After finishing up with SSH, we need to run exit to exit from the droplet or server.

    # exit

### 5. Removing Hosts ###

In order to remove the active host and all its images, containers, we can use docker-machine rm command as shown below.

    # docker-machine rm linux-dev

![Docker Machine Remove All](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-remove-machine.png)

To check whether the host has been removed or not, we can run docker-machine ls command.

    # docker-machine ls

![Docker Machine Remove Check](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-remove-check.png)

### 6. Adding a host without a driver ###

We can add a host to Docker which only has a URL and no driver. It can be used an alias for an existing host, so we don’t have to type out the URL every time we run a Docker command.

    $ docker-machine create --url=tcp://104.131.50.36:2376 custombox

### 7. Managing the Hosts ###

If you are finished working with the running docker, we can simply run **docker-machine stop** command to stop the whole hosts which are Active and if wanna start again, we can run **docker-machine start**.

    # docker-machine stop
    # docker-machine start

You can also specify a machine name to stop or start using the host name as an argument.

    $ docker-machine stop linux-dev
    $ docker-machine start linux-dev

### Conclusion ###

Docker Machine is really and awesome tool for deploying servers with Docker Container running. In this article we demostrated with Digital Ocean Platform but there are other platforms also available like Amazon Web Service, Google Cloud Computing and more which is supported by Docker Machine and includes driver APIs of them. It has made easy for fast and secure deployment of Docker Containers into several different Platforms with Docker Machine. As Docker Machine is still under Beta, so it is recommended not to use docker-machine in production. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/use-docker-machine-cloud-provider/

作者：[Arun Pyasi][a]
译者：[goreliu](https://github.com/goreliu)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://cloud.digitalocean.com/settings/applications