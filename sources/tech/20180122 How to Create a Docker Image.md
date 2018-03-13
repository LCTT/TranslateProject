How to Create a Docker Image
============================================================


![Docker image](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/container-image_0.jpg?itok=G_Gz80R9 "Docker image")
Learn the basic steps for creating Docker images in this tutorial.[Creative Commons Zero][1]Pixabay

In the previous [article][4], we learned about how to get started with Docker on Linux, macOS, and Windows. In this article, we will get a basic understanding of creating Docker images. There are prebuilt images available on DockerHub that you can use for your own project, and you can publish your own image there.

We are going to use prebuilt images to get the base Linux subsystem, as it’s a lot of work to build one from scratch. You can get Alpine (the official distro used by Docker Editions), Ubuntu, BusyBox, or scratch. In this example, I will use Ubuntu.

Before we start building our images, let’s “containerize” them! By this I just mean creating directories for all of your Docker images so that you can maintain different projects and stages isolated from each other.

```
$ mkdir dockerprojects

cd dockerprojects
```

Now create a  _Dockerfile_  inside the  _dockerprojects_  directory using your favorite text editor; I prefer nano, which is also easy for new users.

```
$ nano Dockerfile
```

And add this line:

```
FROM Ubuntu
```

![m7_f7No0pmZr2iQmEOH5_ID6MDG2oEnODpQZkUL7](https://lh6.googleusercontent.com/m7_f7No0pmZr2iQmEOH5_ID6MDG2oEnODpQZkUL7q3GYRB9f1-lvMYLE5f3GBpzIk-ev5VlcB0FHYSxn6NNQjxY4jJGqcgdFWaeQ-027qX_g-SVtbCCMybJeD6QIXjzM2ga8M4l4)

Save it with Ctrl+Exit then Y.

Now create your new image and provide it with a name (run these commands within the same directory):

```
$ docker build -t dockp .
```

(Note the dot at the end of the command.) This should build successfully, so you'll see:

```
Sending build context to Docker daemon  2.048kB

Step 1/1 : FROM ubuntu

---> 2a4cca5ac898

Successfully built 2a4cca5ac898

Successfully tagged dockp:latest
```

It’s time to run and test your image:

```
$ docker run -it Ubuntu
```

You should see root prompt:

```
root@c06fcd6af0e8:/# 
```

This means you are literally running bare minimal Ubuntu inside Linux, Windows, or macOS. You can run all native Ubuntu commands and CLI utilities.

![vpZ8ts9oq3uk--z4n6KP3DD3uD_P4EpG7fX06MC3](https://lh3.googleusercontent.com/vpZ8ts9oq3uk--z4n6KP3DD3uD_P4EpG7fX06MC3uFvj2-WaI1DfOfec9ZXuN7XUNObQ2SCc4Nbiqp-CM7ozUcQmtuzmOdtUHTF4Jq8YxkC49o2k7y5snZqTXsueITZyaLiHq8bT)

Let’s check all the Docker images you have in your directory:

```
$docker images

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

dockp               latest              2a4cca5ac898        1 hour ago          111MB

ubuntu              latest              2a4cca5ac898        1 hour ago          111MB

hello-world         latest              f2a91732366c        8 weeks ago         1.85kB
```

You can see all three images:  _dockp, Ubuntu_  _,_  and _hello-world_ , which I created a few weeks ago when working on the previous articles of this series. Building a whole LAMP stack can be challenging, so we are going create a simple Apache server image with Dockerfile.

Dockerfile is basically a set of instructions to install all the needed packages, configure, and copy files. In this case, it’s Apache and Nginx.

You may also want to create an account on DockerHub and log into your account before building images, in case you are pulling something from DockerHub. To log into DockerHub from the command line, just run:

```
$ docker login
```

Enter your username and password and you are logged in.

Next, create a directory for Apache inside the dockerproject:

```
$ mkdir apache
```

Create a Dockerfile inside Apache folder:

```
$ nano Dockerfile
```

And paste these lines:

```
FROM ubuntu

MAINTAINER Kimbro Staken version: 0.1

RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data

ENV APACHE_RUN_GROUP www-data

ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"] 
```

Then, build the image:

```
docker build -t apache .
```

(Note the dot after a space at the end.)

It will take some time, then you should see successful build like this:

```
Successfully built e7083fd898c7

Successfully tagged ng:latest

Swapnil:apache swapnil$
```

Now let’s run the server:

```
$ docker run –d apache

a189a4db0f7c245dd6c934ef7164f3ddde09e1f3018b5b90350df8be85c8dc98
```

Eureka. Your container image is running. Check all the running containers:

```
$ docker ps

CONTAINER ID  IMAGE        COMMAND                 CREATED            

a189a4db0f7 apache "/usr/sbin/apache2ctl"  10 seconds ago
```

You can kill the container with the  _docker kill_ command:

```
$docker kill a189a4db0f7
```

So, you see the “image” itself is persistent that stays in your directory, but the container runs and goes away. Now you can create as many images as you want and spin and nuke as many containers as you need from those images.

That’s how to create an image and run containers.

To learn more, you can open your web browser and check out the documentation about how to build more complicated Docker images like the whole LAMP stack. Here is a[ Dockerfile][5] file for you to play with.  In the next article, I’ll show how to push images to DockerHub.

 _Learn more about Linux through the free ["Introduction to Linux" ][3]course from The Linux Foundation and edX._

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/1/how-create-docker-image

作者：[SWAPNIL BHARTIYA][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/container-imagejpg-0
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[4]:https://www.linux.com/blog/learn/intro-to-linux/how-install-docker-ce-your-desktop
[5]:https://github.com/fauria/docker-lamp/blob/master/Dockerfile
