translating wi-cuckoo
How to Configure Apache Containers with Docker on Fedora 22
================================================================================
In this article we are going to learn about Docker, how to use it to deploy Apache httpd and how can you share it on Docker Hub. First we are going to learn how to pull and use images hosted on Docker Hub, and then install Apache on an image of Fedora 22 interactively, after that we are going to learn how to use a Dockerfile to make an image in a faster and more elegant way, finally we are going to publish the image we've created in Docker Hub, so anyone will be able download and use it later.

### Installing Docker and saying hello world ###

**Requirements**

You will need atleast these things to run Docker:

- You need a 64bit Kernel version 3.10 or higher
- Iptables 1.4 - This will be used by Docker to make the network wizardry, such as Network Address Translation.
- Git 1.7 - Docker uses Git to make it transactions to repositories, like Docker Hub
- ps - This utility is present in most environments and is provided in the procps package.
- root - despite normal users can run docker client by TCP and other means, we will assume that you are root, for sake of simplicity

#### Install docker using dnf ####

The following commands will install Docker

    dnf update && dnf install docker

**Note**: You can still use Yum in Fedora 22, but it's deprecated in favor of DNF and is not present in a clean install.

#### Check your install ####

The first command we are going to use is docker info, this give you many information:

    docker info

Also try **docker version**:

    docker version

#### Starting Docker as daemon ####

You should start a docker instance that will take care of our requests.

    docker -d

Now set docker to start with the system, so you don't need to run the previous command every time you reboot.

    chkconfig docker on

Let's say hello world with Busybox:

    docker run -t busybox /bin/echo "hello world"

In this command, we tell Docker to execute /bin/echo "hello world" in an instance/container of the Busybox image, which is a minimal POSIX environment based in a single binary and links to it.

If Docker can't find a local image of Busybox on your system, it will pull the image automatically from Docker Hub, as you can see in the following screenshot:

![Hello world with Busybox](http://blog.linoxide.com/wp-content/uploads/2015/06/docker-hello-world-busybox-complete.png)

Hello world with Busybox

Try the same command again, this time as Docker already have the Busybox image locally, all you will see is the output of echo:

    docker run -t busybox /bin/echo "hello world"

Try also the following to enter in the container environment:

    docker run -it busybox /bin/sh

To leave and stop the container use the **exit** command

### Dockerizing Apache interactively ###

Pull/Download the Fedora image:

    docker pull fedora:22

Run a container dettached from the console:

    docker run -d -t fedora:22 /bin/bash

List running containers and identify by name as follows

    docker ps

![listing with docker ps and attaching with docker attach](http://blog.linoxide.com/wp-content/uploads/2015/06/docker-ps-with-docker-attach-highlight.png)

listing with docker ps and attaching with docker attach

The name angry_nobel was given to our instance, so let's attach:

    docker attach angry_nobel

Note: Every time you run a container a new name will be given, if you need a constant name for you container you should use the -name parameter to docker run command.

#### Installing Apache ####

The following command will update DNF database, download install Apache (httpd package) and clean DNF cache to make the image small

    dnf -y update && dnf -y install httpd && dnf -y clean all

Configuring Apache

The only thing we are going to change httpd.conf is the ServerName, this makes Apache stops to complain.

    sed -i.orig 's/#ServerName/ServerName/' /etc/httpd/conf/httpd.conf

**Set the environment**

To make Apache run in standalone mode, you must provide some information in the form of enviroenment variables, and also you will need the directories set in these variables, so we are going to make this with a small shell script that will also start Apache

    vi /etc/httpd/run_apache_foreground

----------

    #!/bin/bash

    #set variables
    APACHE_LOG_DI=R"/var/log/httpd"
    APACHE_LOCK_DIR="/var/lock/httpd"
    APACHE_RUN_USER="apache"
    APACHE_RUN_GROUP="apache"
    APACHE_PID_FILE="/var/run/httpd/httpd.pid"
    APACHE_RUN_DIR="/var/run/httpd"

    #create directories if necessary
    if ! [ -d /var/run/httpd ]; then mkdir /var/run/httpd;fi
    if ! [ -d /var/log/httpd ]; then mkdir /var/log/httpd;fi
    if ! [ -d /var/lock/httpd ]; then mkdir /var/lock/httpd;fi

    #run Apache
    httpd -D FOREGROUND

**Alternatively**, you can past and run this snippet on the container shell:

    dnf -y install git && git clone https://github.com/gaiada/run-apache-foreground.git && cd run-apach* && ./install && dnf erase git

The inline script above will, install Git, clone [this repository][1], put the script in place and ask you if you want uninstall Git.

**Saving your container state**

Your container is now ready to run Apache, now it is time to save the current state of this container in an image to be able use whenever you need.

To leave the container environment, you must press **Ctrl+p** followed by **Ctrl+q**, if you just call exit in the shell, you will also stop the container and lost what you have done so far.

Once you are back to the Docker host, use **docker commit** followed by the container and the repository name/tag you desire:

    docker commit angry_nobel gaiada/apache

Now that you saved the container status into a image, you can use **docker stop** on the running container:

    docker stop angry_nobel

**Run and test your image**

Finally, run a container from your new image and redirect connections on port 80 to it with:

    docker run -p 80:80 -d -t gaiada/apache /etc/httpd/run_apache_foreground

     

At this point, you are already running Apache in your container, open your browser to access the service in [http://localhost][2] and you will see the Apache default page as follows

![Apache default page running from Docker container](http://blog.linoxide.com/wp-content/uploads/2015/06/docker-apache-running.png)

Apache default page running from Docker container

### Dockerizing Apache with a Dockerfile ###

Now we are going to create a new Apache image, this time the steps will be written in a Dockerfile, that will be processed to form the image.

First, create a directory on which we will put the Dockerfile and enter this directory:

    mkdir apachedf; cd apachedf

And then create a file named Dockerfile with the following content:

    FROM fedora:22

    MAINTAINER Carlos Alberto
    LABEL version="0.1"

    RUN dnf -y update && dnf -y install httpd && dnf -y clean all

    RUN [ -d /var/log/httpd ] || mkdir /var/log/httpd
    RUN [ -d /var/run/httpd ] || mkdir /var/run/httpd
    RUN [ -d /var/lock/httpd ] || mkdir /var/lock/httpd

    RUN sed -i.orig 's/#ServerName/ServerName/' /etc/httpd/conf/httpd.conf

    ENV APACHE_RUN_USER apache
    ENV APACHE_RUN_GROUP apache
    ENV APACHE_LOG_DIR /var/log/httpd
    ENV APACHE_LOCK_DIR /var/lock/httpd
    ENV APACHE_RUN_DIR /var/run/httpd
    ENV APACHE_PID_FILE /var/run/httpd/httpd.pid

    EXPOSE 80

    CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

 

Let's see what is on this Dockerfile:

**FROM** - This tells docker that we are going to use Fedora 22 as base image

**MANTAINER** and **LABEL** - these commands are informative and have no direct influence on the image

**RUN** - Automate the steps we've done interactively, install Apache, create directories and edit httpd.conf

**ENV** - Set the environment variables, now we don't need the run_apache_foreground script anymore.

**EXPOSE** - Expose the port 80 to the world

**CMD** - Set the default command to httpd, so we don't need to do this every time we start a new container

**Build the image**

Now we are going to build the image and put the TAG gaiada/apachedf on it:

    docker build -t gaiada/apachedf:0.1 .

![docker build complete](http://blog.linoxide.com/wp-content/uploads/2015/06/docker-build-complete.png)

docker build complete

Use **docker images** list the local images and see if your new image is there:

    docker images

And then run you new image:

    docker run -t -p 80:80 gaiada/apachedf

That is it for the Dockerfile, using this feature make things much easier, faster and reproducible.

### Publishing your images ###

Until now, you just pulled images from Docker Hub, but you can also push you image and pull them later as needed. In fact other can also download your image and use it in their systems without the need of change anything and now we are going to learn how to make our image available for others worldwide.

**Creating account**

For you to be able to push your image on Docker Hub, you need to create an account. Access [https://hub.docker.com/account/signup/][3] and fill the following form:

![Docker Hub signup page](http://blog.linoxide.com/wp-content/uploads/2015/06/docker-hub-signup.png)

Docker Hub signup page

**Login**

Enter the following command and proceed with the login name, password and email you provided in your account creation

    docker login

After you do the first login, your account information will be recorded in **~/.dockercfg**

**Pushing**

Push the page to the server with the **docker push [registry/]your_login/repository_name[:tag]**

    docker push docker.io/gaiada/apachedf

You might see something like this on your console:

![Docker push Apache image complete](http://blog.linoxide.com/wp-content/uploads/2015/06/docker-pushing-apachedf-complete.png)

Docker push Apache image complete

### Conclusion ###

Now that you know how to Dockerize Apache, try to include some modules, Perl, PHP, proxy, HTTPS, or whatever you need. I hope you guys liked it, and push your own images on Docker Hub.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/configure-apache-containers-docker-fedora-22/

作者：[Carlos Alberto][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/carlosal/
[1]:https://github.com/gaiada/run-apache-foreground
[2]:http://localhost/
[3]:https://hub.docker.com/account/signup/
