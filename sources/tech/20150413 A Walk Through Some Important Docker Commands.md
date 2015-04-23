Translating by ictlyh
A Walk Through Some Important Docker Commands
================================================================================
Hi everyone today we'll learn some important Docker Commands that you'll need to learn before you go with Docker. Docker is an Open Source project that provides an open platform to pack, ship and run any application as a lightweight container. It has no boundaries of Language support, Frameworks or packaging system and can be run anywhere, anytime from a small home computers to high-end servers. It makes them great building blocks for deploying and scaling web apps, databases, and back-end services without depending on a particular stack or provider.

Docker commands are easy to learn and easy to implement or take into practice. Here are some easy Docker commands you'll need to know to run Docker and fully utilize it.

### 1. Pulling a Docker Image ###

First of all, we'll need to pull a docker image to get started cause containers are built using Docker Images. We can get the required docker image from the Docker Registry Hub. Before we pull any image using pull command, we'll need to protect our system as there is identified a malicious issue with pull command. To protect our system from this issue, we'll need to add **127.0.0.1 index.docker.io** into /etc/hosts entry. We can do using our favorite text editor.

    # nano /etc/hosts

Now, add the following lines into it and then save and exit.

    127.0.0.1 index.docker.io

![Docker Hosts](http://blog.linoxide.com/wp-content/uploads/2015/04/docker-hosts.png)

To pull a docker image, we'll need to run the following command.

    # docker pull registry.hub.docker.com/busybox

![Docker pull command](http://blog.linoxide.com/wp-content/uploads/2015/04/pulling-image.png)

We can check whether any Docker image is available in our local host for the use or not.

    # docker images

![Docker Images](http://blog.linoxide.com/wp-content/uploads/2015/04/docker-images.png)

### 2. Running a Docker Container ###

Now, after we have successfully pulled a required or desired Docker image. We'll surely want to run that Docker image. We can run a docker container out of the image using docker run command. We have several options and flags to run a docker container on the top of the Docker image. To run a docker image and to get into the container we'll use -t and -i flag as shown below.

    # docker run -it busybox

![Docker Run Shell Command](http://blog.linoxide.com/wp-content/uploads/2015/04/docker-run-shell.png)

From the above command, we'll get entered into the container and can access its content via the interactive shell. We can press **Ctrl-D** in order to exit from the shell access.

Now, to run the container in background, we'll detach the shell using -d flag as shown below.

    # docker run -itd busybox

![Run Container Background](http://blog.linoxide.com/wp-content/uploads/2015/04/run-container-background.png)

If we want to attach into a running container, we can use attach command with the container id. The container id can be fetched using the command **docker ps** .

    # docker attach <container id>

![Docker Attach](http://blog.linoxide.com/wp-content/uploads/2015/04/docker-attach.png)

### 3. Checking Containers ###

It is very easy to check the log whether the container is running or not. We can use the following command to check whether there is any docker container running in the real time or not using the following command.

    # docker ps

Now, to check logs about the running or past running containers we'll need to run the following command.

    # docker ps -a

![View Docker Containers](http://blog.linoxide.com/wp-content/uploads/2015/04/view-docker-containers1.png)

### 4. Inspecting a Docker Container ###

We can check every information about a Docker Container using the inspect command.

    # docker inspect <container id>

![Docker Inspect](http://blog.linoxide.com/wp-content/uploads/2015/04/docker-inspect.png)

### 5. Killing and Deleting Command ###

We can kill or stop process or docker containers using its docker id as shown below.

    # docker stop <container id>

To stop every containers running, we'll need to run the following command.

    # docker kill $(docker ps -q)

Now, if we wanna remove a docker image, run the below command.

    # docker rm <container id>

If we wanna remove all the docker images at once, we can run the below.

    # docker rm $(docker ps -aq)

### Conclusion ###

These docker commands are highly essential to learn to fully utilize and use Docker. Docker gets too simple with these commands providing end users an easy platform for computing. It is extremely easy for anyone to learn about Docker commands with this above tutorial. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve and update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/important-docker-commands/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/