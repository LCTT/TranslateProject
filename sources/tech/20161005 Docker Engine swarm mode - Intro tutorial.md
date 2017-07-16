translating by stevenzdg988

Docker Engine swarm mode - Intro tutorial
============================

Sounds like a punk rock band. But it is the brand new orchestration mechanism, or rather, an improvement of the orchestration available in [Docker][1]. To keep it short and sweet, if you are using an older version of Docker, you will manually need to setup Swarm to create Docker clusters. Starting with [version 1.12][2], the Docker engine comes with a native implementation allowing a seamless clustering setup. The reason why we are here.

In this tutorial, I will try to give you a taste of what Docker can do when it comes to orchestration. This article is by no means all inclusive (bed & breakfast) or all-knowing, but it has what it takes to embark you on your clustering journey. After me.

![Teaser](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-teaser.jpg)

### Technology overview

It would be a shame for me to rehash the very detailed and highly useful Docker documentation article, so I will just outline a brief overview of the technology. So we have Docker, right. Now, you want to use more than a single server as a Docker host, but you want them to belong to the same logical entity. Hence, clustering.

Let's start by a cluster of one. When you initiate swarm on a host, it becomes a manager of the cluster. Technically speaking, it becomes a consensus group of one node. The mathematical logic behind is based on the [Raft][3] algorithm. The manager is responsible for scheduling tasks. The tasks will be delegated to worker nodes, once and if they join the swarm. This is governed by the Node API. I hate the word API, but I must use it here.

The Service API is the second component of this implementation. It allows manager nodes to create distributed services on all of the nodes in the swarm. The services can be replicated, meaning they are spread across the cluster using balancing mechanisms, or they can be global, meaning an instance of the service will be running on each node.

There's much more at work here, but this is good enough to get you primed and pumped. Now, let's do some actual hands-on stuff. Our target platform is [CentOS 7.2][4], which is quite interesting, because at the time I wrote this tutorial, it only had Docker 1.10 in the repos, and I had to manually upgrade the framework to use swarm. We will discuss this in a separate tutorial. Then, we will also have a follow-up guide, where we will join new nodes into our cluster, and we will try an asymmetric setup with [Fedora][5]. At this point, please assume the correct setup is in place, and let's get a cluster service up and running.

### Setup image & service

I will try to setup a load-balanced [Apache][6] service, with multiple instances serving content via a single IP address. Pretty standard. It also highlights the typical reasons why you would go with a cluster configuration - availability, redundancy, horizontal scaling, and performance. Of course, you also need to take into consideration the [networking][7] piece, as well as [storage][8], but that's something that goes beyond the immediate scope of this guide.

The actual Dockerfile template is available in the official repository under httpd. You will need a minimal setup to get underway. The details on how to download images, how to create your own and such are available in my intro guide, linked at the beginning of this tutorial.

docker build -t my-apache2 .
Sending build context to Docker daemon 2.048 kB
Step 1 : FROM httpd:2.4
Trying to pull repository docker.io/library/httpd ...
2.4: Pulling from docker.io/library/httpd

8ad8b3f87b37: Pull complete
c95e1f92326d: Pull complete
96e8046a7a4e: Pull complete
00a0d292c371: Pull complete
3f7586acab34: Pull complete
Digest: sha256:3ad4d7c4f1815bd1c16788a57f81b413...a915e50a0d3a4
Status: Downloaded newer image for docker.io/httpd:2.4
 ---> fe3336dd034d
Step 2 : COPY ../public-html/ /usr/local/apache2/htdocs/
...

![Image created](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-image-created.png)

Before you go any further, you should start a single instance and see that your container is created without any errors and that you can connect to the Web server. Once we establish that, we will create a distributed service.

docker run -dit --name my-running-app my-apache2

Check the IP address, punch into a browser, see what gives.

### Swarm initiation and setup

The next step is to get swarm going. Here's the most basic of commands that will get you underway, and it is very similar to the example used in the Docker blog:

docker service create --name frontend --replicas 5 -p 80:80/tcp my-apache2:latest

What do we have here? We are creating a service called frontend, with five container instances. We are also binding our hostPort 80 with the containerPort 80. And we are using my freshly created Apache image for this. However, when you do this, you will get the following error:

docker service create --name frontend --replicas 5 -p 80:80/tcp my-apache2:latest
Error response from daemon: This node is not a swarm manager. Use "docker swarm init" or "docker swarm join" to connect this node to swarm and try again.

This means you have not setup the current host (node) to be a swarm manager. You either need to init the swarm or join an existing one. Since we do not have one yet, we will now initialize it:

docker swarm init
Swarm initialized: current node (dm58mmsczqemiikazbfyfwqpd) is now a manager.

To add a worker to this swarm, run the following command:

docker swarm join \
--token SWMTKN-1-4ofd46a2nfyvrqwu8w5oeetukrbylyznxla
9srf9vxkxysj4p8-eu5d68pu5f1ci66s7w4wjps1u \
10.0.2.15:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

The output is fairly self explanatory. We have created a swarm. New nodes will need to use the correct token to join the swarm. You also have the IP address and port identified, if you require firewall rules. Moreover, you can add managers to the swarm, too. Now, rerun the service create command:

docker service create --name frontend --replicas 5 -p 80:80/tcp my-apache2:latest
6lrx1vhxsar2i50is8arh4ud1

### Test connectivity

Now, let's check that our service actually works. In a way, this is similar to what we did with [Vagrant][9] and [coreOS][10]. After all, the concepts are almost identical. It's just different implementation of the same idea. First, docker ps should show the right output. You should have multiple replicas for the created service.

docker ps
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS              
NAMES
cda532f67d55        my-apache2:latest   "httpd-foreground"  
2 minutes ago       Up 2 minutes        80/tcp              frontend.1.2sobjfchdyucschtu2xw6ms9a
75fe6e0aa77b        my-apache2:latest   "httpd-foreground"  
2 minutes ago       Up 2 minutes        80/tcp              frontend.4.ag77qtdeby9fyvif5v6c4zcpc
3ce824d3151f        my-apache2:latest   "httpd-foreground"  
2 minutes ago       Up 2 minutes        80/tcp              frontend.2.b6fqg6sf4hkeqs86ps4zjyq65
eda01569181d        my-apache2:latest   "httpd-foreground"  
2 minutes ago       Up 2 minutes        80/tcp              frontend.5.0rmei3zeeh8usagg7fn3olsp4
497ef904e381        my-apache2:latest   "httpd-foreground"  
2 minutes ago       Up 2 minutes        80/tcp              frontend.3.7m83qsilli5dk8rncw3u10g5a

I also tested with different, non-default ports, and it works well. You have a lot of leeway in how you can connect to the server and get the response. You can use localhost or the docker interface IP address with the correct port. The example below shows port 1080:

![Replicated Web service works](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-5-replicas-web-works.jpg)

Now, this a very rough, very simple beginning. The real challenge is in creating optimized, scalable services, but they do require a proper technical use case. Moreover, you should also use the docker info and docker service (inspect|ps) commands to learn more about how your cluster is behaving.

### Possible problems

You may encounter some small (or not so small) issues while playing with Docker and swarm. For example, SELinux may complain that you are trying to do something illegal. However, the errors and warnings should not impede you too much.

![SELinux alert](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-selinux-alert.png)

### Docker service is not a docker command

When you try to run the necessary command to start a replicated service, you get an error that says docker: 'service' is not a docker command. This means that you do not have the right version of Docker (check with -v). We will fix this in a follow-up tutorial.

docker service create --name frontend --replicas 5 -p 80:80/tcp my-apache2:latest
docker: 'service' is not a docker command.

### Docker tag not recognized

You may also see the following error:

docker service create -name frontend -replicas 5 -p 80:80/tcp my-apache2:latest
Error response from daemon: rpc error: code = 3 desc = ContainerSpec: "-name" is not a valid repository/tag

There are several [discussions][11] [threads][12] around this. The error may actually be quite innocent. You may have copied the command from a browser, and the hyphens may not be parsed correctly. As simple as that.

### More reading

There's a lot more to be said on this topic, including the Swarm implementation prior to Docker 1.12, as well as the current version of the Docker engine. To wit, please do not be lazy and spend some time reading:

Docker Swarm [overview][13] (for standalone Swarm installations)

[Build][14] a Swarm cluster for production (standalone setups)

[Install and create][15] a Docker Swarm (standalone setups)

Docker engine swarm [overview][16] (for version 1.12)

Getting started with [swarm][17] mode (for version 1.12)

### Conclusion

There you go. Nothing too grand at this point, but I believe you will find the article useful. It covers several key concepts, there's an overview of how the swarm mode works and what it does, and we successfully managed to download and create our own Web server image and then run several clustered instances of it. We did this on a single node for now, but we will expand in the future. Also, we tackled some common problems.

I hope you find this guide interesting. Combined with my previous work on Docker, this should give you a decent understand of how to work with images, the networking stack, storage, and now clusters. Warming up. Indeed, enjoy and see you soon with fresh new tutorials on Docker. I just can't contain [sic] myself.

Cheers.

--------------------------------------------------------------------------------

via: http://www.dedoimedo.com/computers/docker-swarm-intro.html

作者：[Dedoimedo ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.dedoimedo.com/computers/docker-swarm-intro.html
[1]:http://www.dedoimedo.com/computers/docker-guide.html
[2]:https://blog.docker.com/2016/06/docker-1-12-built-in-orchestration/
[3]:https://en.wikipedia.org/wiki/Raft_%28computer_science%29
[4]:http://www.dedoimedo.com/computers/lenovo-g50-centos-xfce.html
[5]:http://www.dedoimedo.com/computers/fedora-24-gnome.html
[6]:https://hub.docker.com/_/httpd/
[7]:http://www.dedoimedo.com/computers/docker-networking.html
[8]:http://www.dedoimedo.com/computers/docker-data-volumes.html
[9]:http://www.dedoimedo.com/computers/vagrant-intro.html
[10]:http://www.dedoimedo.com/computers/vagrant-coreos.html
[11]:https://github.com/docker/docker/issues/24192
[12]:http://stackoverflow.com/questions/38618609/docker-swarm-1-12-name-option-not-recognized
[13]:https://docs.docker.com/swarm/
[14]:https://docs.docker.com/swarm/install-manual/
[15]:https://docs.docker.com/swarm/install-w-machine/
[16]:https://docs.docker.com/engine/swarm/
[17]:https://docs.docker.com/engine/swarm/swarm-tutorial/
