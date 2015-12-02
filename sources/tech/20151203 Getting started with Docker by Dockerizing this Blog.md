Getting started with Docker by Dockerizing this Blog
======================
>This article covers the basic concepts of Docker and how to Dockerize an application by creating a custom Dockerfile
>Written by Benjamin Cane on 2015-12-01 10:00:00

Docker is an interesting technology that over the past 2 years has gone from an idea, to being used by organizations all over the world to deploy applications. In today's article I am going to cover how to get started with Docker by "Dockerizing" an existing application. The application in question is actually this very blog!

What is Docker
============
============

Before we dive into learning the basics of Docker let's first understand what Docker is and why it is so popular. Docker, is an operating system container management tool that allows you to easily manage and deploy applications by making it easy to package them within operating system containers.

### Containers vs. Virtual Machines

Containers may not be as familiar as virtual machines but they are another method to provide Operating System Virtualization. However, they differ quite a bit from standard virtual machines.

Standard virtual machines generally include a full Operating System, OS Packages and eventually an Application or two. This is made possible by a Hypervisor which provides hardware virtualization to the virtual machine. This allows for a single server to run many standalone operating systems as virtual guests.

Containers are similar to virtual machines in that they allow a single server to run multiple operating environments, these environments however, are not full operating systems. Containers generally only include the necessary OS Packages and Applications. They do not generally contain a full operating system or hardware virtualization. This also means that containers have a smaller overhead than traditional virtual machines.

Containers and Virtual Machines are often seen as conflicting technology, however, this is often a misunderstanding. Virtual Machines are a way to take a physical server and provide a fully functional operating environment that shares those physical resources with other virtual machines. A Container is generally used to isolate a running process within a single host to ensure that the isolated processes cannot interact with other processes within that same system. In fact containers are closer to BSD Jails and chroot'ed processes than full virtual machines.

### What Docker provides on top of containers

Docker itself is not a container runtime environment; in fact Docker is actually container technology agnostic with efforts planned for Docker to support Solaris Zones and BSD Jails. What Docker provides is a method of managing, packaging, and deploying containers. While these types of functions may exist to some degree for virtual machines they traditionally have not existed for most container solutions and the ones that existed, were not as easy to use or fully featured as Docker.

Now that we know what Docker is, let's start learning how Docker works by first installing Docker and deploying a public pre-built container.

## Starting with Installation
As Docker is not installed by default step 1 will be to install the Docker package; since our example system is running Ubuntu 14.0.4 we will do this using the Apt package manager.

# apt-get install docker.io
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  aufs-tools cgroup-lite git git-man liberror-perl
Suggested packages:
  btrfs-tools debootstrap lxc rinse git-daemon-run git-daemon-sysvinit git-doc
  git-el git-email git-gui gitk gitweb git-arch git-bzr git-cvs git-mediawiki
  git-svn
The following NEW packages will be installed:
  aufs-tools cgroup-lite docker.io git git-man liberror-perl
0 upgraded, 6 newly installed, 0 to remove and 0 not upgraded.
Need to get 7,553 kB of archives.
After this operation, 46.6 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
To check if any containers are running we can execute the docker command using the ps option.

# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
The ps function of the docker command works similar to the Linux ps command. It will show available Docker containers and their current status. Since we have not started any Docker containers yet, the command shows no running containers.

## Deploying a pre-built nginx Docker container
One of my favorite features of Docker is the ability to deploy a pre-built container in the same way you would deploy a package with yum or apt-get. To explain this better let's deploy a pre-built container running the nginx web server. We can do this by executing the docker command again, however, this time with the run option.

# docker run -d nginx
Unable to find image 'nginx' locally
Pulling repository nginx
5c82215b03d1: Download complete 
e2a4fb18da48: Download complete 
58016a5acc80: Download complete 
657abfa43d82: Download complete 
dcb2fe003d16: Download complete 
c79a417d7c6f: Download complete 
abb90243122c: Download complete 
d6137c9e2964: Download complete 
85e566ddc7ef: Download complete 
69f100eb42b5: Download complete 
cd720b803060: Download complete 
7cc81e9a118a: Download complete 
The run function of the docker command tells Docker to find a specified Docker image and start a container running that image. By default, Docker containers run in the foreground, meaning when you execute docker run your shell will be bound to the container's console and the process running within the container. In order to launch this Docker container in the background I included the -d (detach) flag.

By executing docker ps again we can see the nginx container running.

# docker ps
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS               NAMES
f6d31ab01fc9        nginx:latest        nginx -g 'daemon off   4 seconds ago       Up 3 seconds        443/tcp, 80/tcp     desperate_lalande 
In the above output we can see the running container desperate_lalande and that this container has been built from the nginx:latest image.

## Docker Images
Images are one of Docker's key features and is similar to a virtual machine image. Like virtual machine images, a Docker image is a container that has been saved and packaged. Docker however, doesn't just stop with the ability to create images. Docker also includes the ability to distribute those images via Docker repositories which are a similar concept to package repositories. This is what gives Docker the ability to deploy an image like you would deploy a package with yum. To get a better understanding of how this works let's look back at the output of the docker run execution.

# docker run -d nginx
Unable to find image 'nginx' locally
The first message we see is that docker could not find an image named nginx locally. The reason we see this message is that when we executed docker run we told Docker to startup a container, a container based on an image named nginx. Since Docker is starting a container based on a specified image it needs to first find that image. Before checking any remote repository Docker first checks locally to see if there is a local image with the specified name.

Since this system is brand new there is no Docker image with the name nginx, which means Docker will need to download it from a Docker repository.

Pulling repository nginx
5c82215b03d1: Download complete 
e2a4fb18da48: Download complete 
58016a5acc80: Download complete 
657abfa43d82: Download complete 
dcb2fe003d16: Download complete 
c79a417d7c6f: Download complete 
abb90243122c: Download complete 
d6137c9e2964: Download complete 
85e566ddc7ef: Download complete 
69f100eb42b5: Download complete 
cd720b803060: Download complete 
7cc81e9a118a: Download complete 
This is exactly what the second part of the output is showing us. By default, Docker uses the Docker Hub repository, which is a repository service that Docker (the company) runs.

Like GitHub, Docker Hub is free for public repositories but requires a subscription for private repositories. It is possible however, to deploy your own Docker repository, in fact it is as easy as docker run registry. For this article we will not be deploying a custom registry service.

## Stopping and Removing the Container
Before moving on to building a custom Docker container let's first clean up our Docker environment. We will do this by stopping the container from earlier and removing it.

To start a container we executed docker with the run option, in order to stop this same container we simply need to execute the docker with the kill option specifying the container name.

# docker kill desperate_lalande
desperate_lalande
If we execute docker ps again we will see that the container is no longer running.

# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
However, at this point we have only stopped the container; while it may no longer be running it still exists. By default, docker ps will only show running containers, if we add the -a (all) flag it will show all containers running or not.

# docker ps -a
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS                           PORTS               NAMES
f6d31ab01fc9        5c82215b03d1        nginx -g 'daemon off   4 weeks ago         Exited (-1) About a minute ago                       desperate_lalande  
In order to fully remove the container we can use the docker command with the rm option.

# docker rm desperate_lalande
desperate_lalande
While this container has been removed; we still have a nginx image available. If we were to re-run docker run -d nginx again the container would be started without having to fetch the nginx image again. This is because Docker already has a saved copy on our local system.

To see a full list of local images we can simply run the docker command with the images option.

# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
nginx               latest              9fab4090484a        5 days ago          132.8 MB
## Building our own custom image
At this point we have used a few basic Docker commands to start, stop and remove a common pre-built image. In order to "Dockerize" this blog however, we are going to have to build our own Docker image and that means creating a Dockerfile.

With most virtual machine environments if you wish to create an image of a machine you need to first create a new virtual machine, install the OS, install the application and then finally convert it to a template or image. With Docker however, these steps are automated via a Dockerfile. A Dockerfile is a way of providing build instructions to Docker for the creation of a custom image. In this section we are going to build a custom Dockerfile that can be used to deploy this blog.

### Understanding the Application
Before we can jump into creating a Dockerfile we first need to understand what is required to deploy this blog.

The blog itself is actually static HTML pages generated by a custom static site generator that I wrote named; hamerkop. The generator is very simple and more about getting the job done for this blog specifically. All the code and source files for this blog are available via a public GitHub repository. In order to deploy this blog we simply need to grab the contents of the GitHub repository, install Python along with some Python modules and execute the hamerkop application. To serve the generated content we will use nginx; which means we will also need nginx to be installed.

So far this should be a pretty simple Dockerfile, but it will show us quite a bit of the Dockerfile Syntax. To get started we can clone the GitHub repository and creating a Dockerfile with our favorite editor; vi in my case.

# git clone https://github.com/madflojo/blog.git
Cloning into 'blog'...
remote: Counting objects: 622, done.
remote: Total 622 (delta 0), reused 0 (delta 0), pack-reused 622
Receiving objects: 100% (622/622), 14.80 MiB | 1.06 MiB/s, done.
Resolving deltas: 100% (242/242), done.
Checking connectivity... done.
# cd blog/
# vi Dockerfile
### FROM - Inheriting a Docker image
The first instruction of a Dockerfile is the FROM instruction. This is used to specify an existing Docker image to use as our base image. This basically provides us with a way to inherit another Docker image. In this case we will be starting with the same nginx image we were using before, if we wanted to start with a blank slate we could use the Ubuntu Docker image by specifying ubuntu:latest.

## Dockerfile that generates an instance of http://bencane.com

FROM nginx:latest
MAINTAINER Benjamin Cane <ben@bencane.com>
In addition to the FROM instruction, I also included a MAINTAINER instruction which is used to show the Author of the Dockerfile.

As Docker supports using # as a comment marker, I will be using this syntax quite a bit to explain the sections of this Dockerfile.

### Running a test build
Since we inherited the nginx Docker image our current Dockerfile also inherited all the instructions within the Dockerfile used to build that nginx image. What this means is even at this point we are able to build a Docker image from this Dockerfile and run a container from that image. The resulting image will essentially be the same as the nginx image but we will run through a build of this Dockerfile now and a few more times as we go to help explain the Docker build process.

In order to start the build from a Dockerfile we can simply execute the docker command with the build option.

# docker build -t blog /root/blog 
Sending build context to Docker daemon  23.6 MB
Sending build context to Docker daemon 
Step 0 : FROM nginx:latest
 ---> 9fab4090484a
Step 1 : MAINTAINER Benjamin Cane <ben@bencane.com>
 ---> Running in c97f36450343
 ---> 60a44f78d194
Removing intermediate container c97f36450343
Successfully built 60a44f78d194
In the above example I used the -t (tag) flag to "tag" the image as "blog". This essentially allows us to name the image, without specifying a tag the image would only be callable via an Image ID that Docker assigns. In this case the Image ID is 60a44f78d194 which we can see from the docker command's build success message.

In addition to the -t flag, I also specified the directory /root/blog. This directory is the "build directory", which is the directory that contains the Dockerfile and any other files necessary to build this container.

Now that we have run through a successful build, let's start customizing this image.

### Using RUN to execute apt-get
The static site generator used to generate the HTML pages is written in Python and because of this the first custom task we should perform within this Dockerfile is to install Python. To install the Python package we will use the Apt package manager. This means we will need to specify within the Dockerfile that apt-get update and apt-get install python-dev are executed; we can do this with the RUN instruction.

## Dockerfile that generates an instance of http://bencane.com

FROM nginx:latest
MAINTAINER Benjamin Cane <ben@bencane.com>

## Install python and pip
RUN apt-get update
RUN apt-get install -y python-dev python-pip
In the above we are simply using the RUN instruction to tell Docker that when it builds this image it will need to execute the specified apt-get commands. The interesting part of this is that these commands are only executed within the context of this container. What this means is even though python-dev and python-pip are being installed within the container, they are not being installed for the host itself. Or to put it simplier, within the container the pip command will execute, outside the container, the pip command does not exist.

It is also important to note that the Docker build process does not accept user input during the build. This means that any commands being executed by the RUN instruction must complete without user input. This adds a bit of complexity to the build process as many applications require user input during installation. For our example, none of the commands executed by RUN require user input.

### Installing Python modules
With Python installed we now need to install some Python modules. To do this outside of Docker, we would generally use the pip command and reference a file within the blog's Git repository named requirements.txt. In an earlier step we used the git command to "clone" the blog's GitHub repository to the /root/blog directory; this directory also happens to be the directory that we have created the Dockerfile. This is important as it means the contents of the Git repository are accessible to Docker during the build process.

When executing a build, Docker will set the context of the build to the specified "build directory". This means that any files within that directory and below can be used during the build process, files outside of that directory (outside of the build context), are inaccessible.

In order to install the required Python modules we will need to copy the requirements.txt file from the build directory into the container. We can do this using the COPY instruction within the Dockerfile.

## Dockerfile that generates an instance of http://bencane.com

FROM nginx:latest
MAINTAINER Benjamin Cane <ben@bencane.com>

## Install python and pip
RUN apt-get update
RUN apt-get install -y python-dev python-pip

## Create a directory for required files
RUN mkdir -p /build/

## Add requirements file and run pip
COPY requirements.txt /build/
RUN pip install -r /build/requirements.txt
Within the Dockerfile we added 3 instructions. The first instruction uses RUN to create a /build/ directory within the container. This directory will be used to copy any application files needed to generate the static HTML pages. The second instruction is the COPY instruction which copies the requirements.txt file from the "build directory" (/root/blog) into the /build directory within the container. The third is using the RUN instruction to execute the pip command; installing all the modules specified within the requirements.txt file.

COPY is an important instruction to understand when building custom images. Without specifically copying the file within the Dockerfile this Docker image would not contain the requirements.txt file. With Docker containers everything is isolated, unless specifically executed within a Dockerfile a container is not likely to include required dependencies.

### Re-running a build
Now that we have a few customization tasks for Docker to perform let's try another build of the blog image again.

# docker build -t blog /root/blog
Sending build context to Docker daemon 19.52 MB
Sending build context to Docker daemon 
Step 0 : FROM nginx:latest
 ---> 9fab4090484a
Step 1 : MAINTAINER Benjamin Cane <ben@bencane.com>
 ---> Using cache
 ---> 8e0f1899d1eb
Step 2 : RUN apt-get update
 ---> Using cache
 ---> 78b36ef1a1a2
Step 3 : RUN apt-get install -y python-dev python-pip
 ---> Using cache
 ---> ef4f9382658a
Step 4 : RUN mkdir -p /build/
 ---> Running in bde05cf1e8fe
 ---> f4b66e09fa61
Removing intermediate container bde05cf1e8fe
Step 5 : COPY requirements.txt /build/
 ---> cef11c3fb97c
Removing intermediate container 9aa8ff43f4b0
Step 6 : RUN pip install -r /build/requirements.txt
 ---> Running in c50b15ddd8b1
Downloading/unpacking jinja2 (from -r /build/requirements.txt (line 1))
Downloading/unpacking PyYaml (from -r /build/requirements.txt (line 2))
<truncated to reduce noise>
Successfully installed jinja2 PyYaml mistune markdown MarkupSafe
Cleaning up...
 ---> abab55c20962
Removing intermediate container c50b15ddd8b1
Successfully built abab55c20962
From the above build output we can see the build was successful, but we can also see another interesting message; ---> Using cache. What this message is telling us is that Docker was able to use its build cache during the build of this image.

#### Docker build cache

When Docker is building an image, it doesn't just build a single image; it actually builds multiple images throughout the build processes. In fact we can see from the above output that after each "Step" Docker is creating a new image.

 Step 5 : COPY requirements.txt /build/
  ---> cef11c3fb97c
The last line from the above snippet is actually Docker informing us of the creating of a new image, it does this by printing the Image ID; cef11c3fb97c. The useful thing about this approach is that Docker is able to use these images as cache during subsequent builds of the blog image. This is useful because it allows Docker to speed up the build process for new builds of the same container. If we look at the example above we can actually see that rather than installing the python-dev and python-pip packages again, Docker was able to use a cached image. However, since Docker was unable to find a build that executed the mkdir command, each subsequent step was executed.

The Docker build cache is a bit of a gift and a curse; the reason for this is that the decision to use cache or to rerun the instruction is made within a very narrow scope. For example, if there was a change to the requirements.txt file Docker would detect this change during the build and start fresh from that point forward. It does this because it can view the contents of the requirements.txt file. The execution of the apt-get commands however, are another story. If the Apt repository that provides the Python packages were to contain a newer version of the python-pip package; Docker would not be able to detect the change and would simply use the build cache. This means that an older package may be installed. While this may not be a major issue for the python-pip package it could be a problem if the installation was caching a package with a known vulnerability.

For this reason it is useful to periodically rebuild the image without using Docker's cache. To do this you can simply specify --no-cache=True when executing a Docker build.

### Deploying the rest of the blog
With the Python packages and modules installed this leaves us at the point of copying the required application files and running the hamerkop application. To do this we will simply use more COPY and RUN instructions.

## Dockerfile that generates an instance of http://bencane.com

FROM nginx:latest
MAINTAINER Benjamin Cane <ben@bencane.com>

## Install python and pip
RUN apt-get update
RUN apt-get install -y python-dev python-pip

## Create a directory for required files
RUN mkdir -p /build/

## Add requirements file and run pip
COPY requirements.txt /build/
RUN pip install -r /build/requirements.txt

## Add blog code nd required files
COPY static /build/static
COPY templates /build/templates
COPY hamerkop /build/
COPY config.yml /build/
COPY articles /build/articles

## Run Generator
RUN /build/hamerkop -c /build/config.yml
Now that we have the rest of the build instructions, let's run through another build and verify that the image builds successfully.

# docker build -t blog /root/blog/
Sending build context to Docker daemon 19.52 MB
Sending build context to Docker daemon 
Step 0 : FROM nginx:latest
 ---> 9fab4090484a
Step 1 : MAINTAINER Benjamin Cane <ben@bencane.com>
 ---> Using cache
 ---> 8e0f1899d1eb
Step 2 : RUN apt-get update
 ---> Using cache
 ---> 78b36ef1a1a2
Step 3 : RUN apt-get install -y python-dev python-pip
 ---> Using cache
 ---> ef4f9382658a
Step 4 : RUN mkdir -p /build/
 ---> Using cache
 ---> f4b66e09fa61
Step 5 : COPY requirements.txt /build/
 ---> Using cache
 ---> cef11c3fb97c
Step 6 : RUN pip install -r /build/requirements.txt
 ---> Using cache
 ---> abab55c20962
Step 7 : COPY static /build/static
 ---> 15cb91531038
Removing intermediate container d478b42b7906
Step 8 : COPY templates /build/templates
 ---> ecded5d1a52e
Removing intermediate container ac2390607e9f
Step 9 : COPY hamerkop /build/
 ---> 59efd1ca1771
Removing intermediate container b5fbf7e817b7
Step 10 : COPY config.yml /build/
 ---> bfa3db6c05b7
Removing intermediate container 1aebef300933
Step 11 : COPY articles /build/articles
 ---> 6b61cc9dde27
Removing intermediate container be78d0eb1213
Step 12 : RUN /build/hamerkop -c /build/config.yml
 ---> Running in fbc0b5e574c5
Successfully created file /usr/share/nginx/html//2011/06/25/checking-the-number-of-lwp-threads-in-linux
Successfully created file /usr/share/nginx/html//2011/06/checking-the-number-of-lwp-threads-in-linux
<truncated to reduce noise>
Successfully created file /usr/share/nginx/html//archive.html
Successfully created file /usr/share/nginx/html//sitemap.xml
 ---> 3b25263113e1
Removing intermediate container fbc0b5e574c5
Successfully built 3b25263113e1
### Running a custom container
With a successful build we can now start our custom container by running the docker command with the run option, similar to how we started the nginx container earlier.

# docker run -d -p 80:80 --name=blog blog
5f6c7a2217dcdc0da8af05225c4d1294e3e6bb28a41ea898a1c63fb821989ba1
Once again the -d (detach) flag was used to tell Docker to run the container in the background. However, there are also two new flags. The first new flag is --name, which is used to give the container a user specified name. In the earlier example we did not specify a name and because of that Docker randomly generated one. The second new flag is -p, this flag allows users to map a port from the host machine to a port within the container.

The base nginx image we used exposes port 80 for the HTTP service. By default, ports bound within a Docker container are not bound on the host system as a whole. In order for external systems to access ports exposed within a container the ports must be mapped from a host port to a container port using the -p flag. The command above maps port 80 from the host, to port 80 within the container. If we wished to map port 8080 from the host, to port 80 within the container we could do so by specifying the ports in the following syntax -p 8080:80.

From the above command it appears that our container was started successfully, we can verify this by executing docker ps.

# docker ps
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                         NAMES
d264c7ef92bd        blog:latest         nginx -g 'daemon off   3 seconds ago       Up 3 seconds        443/tcp, 0.0.0.0:80->80/tcp   blog  
## Wrapping up

At this point we now have a running custom Docker container. While we touched on a few Dockerfile instructions within this article we have yet to discuss all the instructions. For a full list of Dockerfile instructions you can checkout Docker's reference page, which explains the instructions very well.

Another good resource is their Dockerfile Best Practices page which contains quite a few best practices for building custom Dockerfiles. Some of these tips are very useful such as strategically ordering the commands within the Dockerfile. In the above examples our Dockerfile has the COPY instruction for the articles directory as the last COPY instruction. The reason for this is that the articles directory will change quite often. It's best to put instructions that will change oftenat the lowest point possible within the Dockerfile to optimize steps that can be cached.

In this article we covered how to start a pre-built container and how to build, then deploy a custom container. While there is quite a bit to learn about Docker this article should give you a good idea on how to get started. Of course, as always if you think there is anything that should be added drop it in the comments below.
