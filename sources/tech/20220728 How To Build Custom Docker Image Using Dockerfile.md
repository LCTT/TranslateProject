[#]: subject: "How To Build Custom Docker Image Using Dockerfile"
[#]: via: "https://ostechnix.com/a-brief-introduction-to-dockerfile/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Build Custom Docker Image Using Dockerfile
======
Explaining Dockerfile With Example

In this guide, we will see a brief introduction to **Dockerfile** and how to use Dockerfile to automate the process of **building custom docker images** in Linux.

#### Contents

1. What Is Dockerfile?
2. Understanding Dockerfile Format
3. Creating a Dockerfile
4. Build Docker Image Using Dockerfile

### What Is Dockerfile?

Dockerfile is a simple text file with instructions to build docker image. It contains all the commands a user could call on the command line to build an image.

We can use the dockerfile to create our own custom images. We can then share these custom Docker images via Docker Hub.

For those wondering, Docker Hub is a hosted repository service provided by Docker for finding and sharing container images with your team and of course with anyone in the world.

Imagine this scenario. Earlier if we want to use **Nginx**, then we need to install and configure the Nginx with many steps involved. Thanks to Dockerhub, we can now download and run the prebuilt container image of Nginx in couple minutes.

![Nginx Docker Image In Dockerhub][1]

To pull Nginx image from DockerHub, run:

```
# docker pull nginx
```

Once we pulled the docker images, we can use it by running the image using command:

```
# docker run -it -d -p 8080:8080 nginx
```

It is that simple!

To know more about Docker usage, refer the following guide.

* [Getting Started With Docker][2]

There are over 100,000 container images from software vendors, open-source projects, and the community available in Dockerhub.

You can search and download any container image of your choice from Dockerhub and start using it immediately as shown above.

### Understanding Dockerfile Format

Docker can build images automatically by reading the **instructions** from a Dockerfile.

A typical Dockerfile contains the following instructions:

**1.** **FROM** - It will set the base image of the container.

**Example:**

```
FROM ubuntu:22.04
```

It will set the base image of the container as Ubuntu. If tag 22.04 is not specified, it will take a tag as "latest".

**2.** **LABEL** - It is a key-value pair used to specify metadata information of the image.

**Example:**

```
LABEL ENV=”DEVELOPMENT”
```

**3.** **RUN** - It is used to execute the command on the base image and it will create a new layer.

**Example:**

```
RUN apt-get update
RUN apt-get install tomcat
```

**4.** **CMD** - It is used to set a command to execute first when the container starts.

**Example:**

```
CMD [“java”, “-jar”, “app.jar”]
```

**5.** **EXPOSE** - It will expose the port to access the container. Container will listen on this network port. We can access the output using this port.

**Example:**

```
EXPOSE 8080
```

**6.** **MAINTAINER** - It will give the detail of the author who created this Docker image.

**Example:**

```
MAINTAINER info@ostechnix.com
```

**7.** **ENV** - It is used to set environment variables in the key-value pair. These variables are set during the image build and are available after container created.

**Example:**

```
ENV DB_NAME=”MySQL”
ENV DB_VERSION=”8.0”
```

**8.** **COPY** - It is used to copy local files to the container.

**Example:**

```
COPY /target/devops.jar devops.jar
```

**9.** **ADD** - It works same as copy but having some more feature like we can extract local tar and add remote URL.

**Example:**

```
ADD devops.tar.xz / .
ADD http://example.com/abc.git /usr/local/devops/
```

**10.** **ENTRYPOINT** - It is used to set the main command for the image. It works as same as CMD instruction. The only difference between CMD and ENTRYPOINT is instructions are not overwritten in ENTRYPOINT.

**Example:**

```
ENTRYPOINT [“java”, “-jar”, “app.jar”]
```

**11.** **VOLUME** - It will creates a mount point with the specified name.

**Example:**

```
VOLUME /app/devops
```

**12.** **USER** - It will sets the user name and user group to use when running the image.

**Example:**

```
USER dhruv
USER admin
```

**13.** **WORKDIR** - It will set the working directory. It will create the directory if not present.

**Example:**

```
WORKDIR /var/lib/
```

Here is a sample Dockerfile for your reference.

```
FROM ubuntu:latest
MAINTAINER Senthilkumar Palani "info@ostechnix.com"
RUN apt-get install -y software-properties-common python
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ jammy universe" >>
/etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nodejs
RUN mkdir /var/www
ADD app.js /var/www/app.js
CMD ["/usr/bin/node", "/var/www/app.js"]
```

Allow me to show you a simple example to create a sample Dockerfile and build an image using it.

### Creating a Dockerfile

Create a file named **Dockerfile**, :

```
# nano dockerfile
```

Add the following lines. In the this example, we are updating and installing the **vim** and **curl** packages.

```
FROM alpine

RUN apk update
RUN apk add vim
RUN apk add curl
```

![Dockerfile For Alpine Linux][3]

Press **CTRL+O** and **CTRL+X** to save the file and close it.

Now we have the Dockerfile in place. Let us go ahead and build an image using the Dockerfile.

**Heads Up:** If you use **[Docker Desktop][4]**, you can run docker commands as normal user.

### Build Docker Image Using Dockerfile

To build an image from the Dockerfile, simply run:

```
# docker build -t alpine .
```

Please note the **dot** (.) at the end.

**Sample output:**

```
[+] Building 51.2s (8/8) FINISHED                                               
 => [internal] load build definition from Dockerfile                       0.1s
 => => transferring dockerfile: 104B                                       0.0s
 => [internal] load .dockerignore                                          0.1s
 => => transferring context: 2B                                            0.0s
 => [internal] load metadata for docker.io/library/alpine:latest          38.8s
 => [1/4] FROM docker.io/library/alpine@sha256:7580ece7963bfa863801466c0a  2.7s
 => => resolve docker.io/library/alpine@sha256:7580ece7963bfa863801466c0a  0.0s
 => => sha256:d7d3d98c851ff3a95dbcb70ce09d186c9aaf7e25d48 1.47kB / 1.47kB  0.0s
 => => sha256:530afca65e2ea04227630ae746e0c85b2bd1a179379 2.80MB / 2.80MB  2.4s
 => => sha256:7580ece7963bfa863801466c0a488f11c86f85d9988 1.64kB / 1.64kB  0.0s
 => => sha256:9b2a28eb47540823042a2ba401386845089bb7b62a9637d 528B / 528B  0.0s
 => => extracting sha256:530afca65e2ea04227630ae746e0c85b2bd1a179379cbf2b  0.2s
 => [2/4] RUN apk update                                                   4.3s
 => [3/4] RUN apk add vim                                                  3.5s
 => [4/4] RUN apk add curl                                                 1.3s 
 => exporting to image                                                     0.4s 
 => => exporting layers                                                    0.4s 
 => => writing image sha256:14231deceb6e8e6105d2e551799ff174c184e8d9be8af  0.0s 
 => => naming to docker.io/library/alpine                                  0.0s 
                                                                                
Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```

As per the above command, Docker will start to build images automatically by reading the instructions from the **Dockerfile** saved in the current working directory. Remember, we have defined `apk update`, `apk add vim` and `apk add curl` commands in the dockerfile? These actions will be automatically performed as well.

If the Dockerfile is saved in somewhere else, you can mention its path using **-f** flag like below.

```
# docker build -f /path/to/a/Dockerfile .
```

After creating the image, we can run it using command:

```
# docker run -it alpine
```

This command will start the Alpine container and attach to it.

```
/ # uname -a
Linux 8890fec82de8 5.10.104-linuxkit #1 SMP Thu Mar 17 17:08:06 UTC 2022 x86_64 Linux
/ # cat /etc/alpine-release 
3.16.1
/ #
```

If you have Docker Desktop, you can view the running container under the Containers tab.

![View Containers In Docker Desktop][5]

This is how one can build a custom container images using Dockerfile.

We've only covered the basics. There is a lot more you can do with Dockerfile. I recommend you to refer the official [Dockerfile reference][6] guide to learn more about it.

--------------------------------------------------------------------------------

via: https://ostechnix.com/a-brief-introduction-to-dockerfile/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/07/Nginx-Docker-Image-In-Dockerhub.png
[2]: https://ostechnix.com/getting-started-with-docker/
[3]: https://ostechnix.com/wp-content/uploads/2022/07/Dockerfile-For-Alpine-Linux.png
[4]: https://ostechnix.com/docker-desktop-for-linux/
[5]: https://ostechnix.com/wp-content/uploads/2022/07/View-Containers-In-Docker-Desktop-1024x524.png
[6]: https://docs.docker.com/engine/reference/builder/
