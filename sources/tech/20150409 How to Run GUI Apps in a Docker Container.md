Translating---geekpi

How to Run GUI Apps in a Docker Container
================================================================================
Hi everyone, today we'll learn how we can run GUI Applications inside a [Docker][1] Container. We can easily run most of the common GUI apps without getting into trouble inside a Docker Container. Docker is an Open Source project that provides an open platform to pack, ship and run any application as a lightweight container. It has no boundaries of Language support, Frameworks or packaging system and can be run anywhere, anytime from a small home computers to high-end servers. It makes them great building blocks for deploying and scaling web apps, databases, and back-end services without depending on a particular stack or provider.

Here are the quick and easy steps on how we can run a GUI App in a Docker Container. In this tutorial, we'll take Firefox for the example.

### 1. Installing Docker ###

First of all, before we start, we must ensure that we have Docker installed in our host Linux Operating System. Here, we are running CentOS 7 as host so, we'll be running yum manager to install docker using the below command.

    # yum install docker

![](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-docker.png)

    # systemctl restart docker.service

### 2. Creating Dockerfile ###

Now, as our Docker Daemon is running, we'll now prepare to create our Firefox Docker Container. We'll create a Dockerfile where we'll enter the required configuration to create a working Firefox Container. We'll fetch latest version of CentOS for our Docker Image. To do so, we'll create a file named Dockerfile using our favorite text editor.

    # nano Dockerfile

Then, we'll add the following lines of configuration into Dockerfile and then save it.

    #!/bin/bash
    FROM centos:7
    RUN yum install -y firefox
    # Replace 0 with your user / group id
    RUN export uid=0 gid=0
    RUN mkdir -p /home/developer
    RUN echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd
    RUN echo "developer:x:${uid}:" >> /etc/group
    RUN echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
    RUN chmod 0440 /etc/sudoers
    RUN chown ${uid}:${gid} -R /home/developer

    USER developer
    ENV HOME /home/developer
    CMD /usr/bin/firefox

![](http://blog.linoxide.com/wp-content/uploads/2015/03/Dockerfile-GUI.png)

**Note: Please replace 0 with your user and group id in 4th line of the configuration. We can get the uid and gid of current user by running the following command in a shell or a terminal.**

    #  id $USER

![](http://blog.linoxide.com/wp-content/uploads/2015/03/user-id.png)

### 3. Building Docker Container ###

We'll now build the container which will work according to the above Dockerfile. It will install firefox web browser and its required packages. It will then set user permission to make it work. Here, the image name is set as firefox, you can name it as your desire.

    # docker build --rm -t firefox .

![](http://blog.linoxide.com/wp-content/uploads/2015/03/building-firefox-docker.png)

### 4. Running Docker Container ###

Now, finally, if everything went cool, we'll be able to run our GUI App ie Mozilla Firefox Browser from inside our firefox Docker Container running in a CentOS 7 Image.

    # docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix firefox

### Conclusion ###

Running GUI Apps in a Docker Container is really an awesome experience which will never harm/use your host Filesystem. It is fully dependent on your Docker Container. In this tutorial, we tried Firefox in our CentOS 7 Docker Image with Firefox installed. We can use many more GUI Apps with this technology. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-) 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/run-gui-apps-docker-container/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://docker.io/
