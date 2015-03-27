How to Interactively Create a Docker Container
================================================================================
Hi everyone, today we'll learn how we can interactively create a docker container using a docker image. Once we start a process in Docker from an Image, Docker fetches the image and its Parent Image, and repeats the process until it reaches the Base Image. Then the Union File System adds a read-write layer on top. That read-write layer, the information about its Parent Image and some other information like its unique id, networking configuration, and resource limits is called a **Container**. Containers has states as they can change from **running** to **exited** state. A container with state as **running** includes a tree of processes running on the CPU, isolated from the other processes running on the host where as **exited** is the state of the file system and its exit value is preserved. You can start, stop, and restart a container with it.

Docker Technology has brought a remarkable change in the field of IT enabling cloud service for sharing applications and automating workflows, enabling apps to be quickly assembled from components and eliminates the friction between development, QA, and production environments. In this article, we'll build CentOS Instance in which we'll host a website running under Apache Web Server.

Here is quick and easy tutorial on how we can create a container in an interactive method using an interactive shell.

### 1. Running a Docker Instance ###

Docker initially tries to fetch and run the required image locally and if its not found in local host the it pulls from the [Docker Public Registry Hub][1] . Here. we'll fetch and create a fedora instance in a Docker Container and attach a bash shell to the tty.

    # docker run -i -t fedora bash

![Downloading Fedora Base Image](http://blog.linoxide.com/wp-content/uploads/2015/03/downloading-fedora-base-image.png)

### 2. Installing Apache Web Server ###

Now, after our Fedora base image with instance is ready, we'll now gonna install Apache Web Server interactively without creating a Dockerfile for it. To do so, we'll need to run the following commands in a terminal or shell.

    # yum update

![Updating Fedora Base Image](http://blog.linoxide.com/wp-content/uploads/2015/03/updating-fedora-base-image.png)

    # yum install httpd

![Installing httpd](http://blog.linoxide.com/wp-content/uploads/2015/03/installing-httpd2.png)
    
    # exit

### 3. Saving the Image ###

Now, we'll gonna save the changes we made into the Fedora Instance. To do that, we'll first gonna need to know the Container ID of the Instance. To get that we'll need to run the following command.

    # docker ps -a

![Docker Running Container](http://blog.linoxide.com/wp-content/uploads/2015/03/docker-running-container.png)

Then, we'll save the changes as a new image by running the below command.

    # docker commit c16378f943fe fedora-httpd

![committing fedora httpd](http://blog.linoxide.com/wp-content/uploads/2015/03/committing-fedora-httpd.png)

Here, the changes are saved using the Container ID  and image name fedora-httpd. To make sure that the new image is running or not, we'll run the following command.

    # docker images

![view docker images](http://blog.linoxide.com/wp-content/uploads/2015/03/view-docker-images.png)

### 4. Adding the Contents to the new image ###

As we have our new Fedora Apache image running successfully, now we'll want to add the web contents which includes our website to Apache Web Server so that our website will run successfully out of the box. To do so, we'll need to create a new Dockerfile which will handle the operation from copying web contents to allowing port 80. To do so, we'll need to create a file Dockerfile using our favorite text editor as shown below.

    # nano Dockerfile

Now, we'll need to add the following lines into that file.

    FROM fedora-httpd
    ADD mysite.tar /tmp/
    RUN mv /tmp/mysite/* /var/www/html
    EXPOSE 80
    ENTRYPOINT [ "/usr/sbin/httpd" ]
    CMD [ "-D", "FOREGROUND" ]

![configuring Dockerfile](http://blog.linoxide.com/wp-content/uploads/2015/03/configuring-Dockerfile.png)

Here, in above Dockerfile, the web content which we have in mysite.tar will get automatically extracted to /tmp/ folder. Then, the entire site will move to the Apache Web root ie /var/www/html/ and the expose 80 will open port 80 so that the website will be available normally. Then, the entrypoint is set to /usr/sbin/httpd so that the Apache Server will execute.

### 5. Building and running a Container ###

Now, we'll build our Container using the Dockerfile we just created in order to add our website on it. To do so, we'll need to run the following command.

    # docker build -rm -t mysite .

![Building mysite Image](http://blog.linoxide.com/wp-content/uploads/2015/03/building-mysite-image.png)

After building our new container, we'll want to run the container using the command below.

    # docker run -d -P mysite

![Running mysite Container](http://blog.linoxide.com/wp-content/uploads/2015/03/running-mysite-container.png)

### Conclusion ###

Finally, we've successfully built a Docker Container interactively. In this method, we build our containers and image directly via interactive shell commands. This method is quite easy and quick to build and deploy our images and containers. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/interactively-create-docker-container/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://registry.hub.docker.com/