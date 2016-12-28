# LXD 2.0: LXD and Juju [10/12]

This is the tenth blog post in [this series about LXD 2.0][1].

 ![LXD logo](https://linuxcontainers.org/static/img/containers.png) 

Introduction
============================================================

Juju is Canonical’s service modeling and deployment tool. It supports a very wide range of cloud providers to make it easy for you to deploy any service you want on any cloud you want.

On top of that, Juju 2.0 also includes support for LXD, both for local deployments, ideal for development and as a way to co-locate services on a cloud instance or physical machine.

This post will focus on the local use case, going through the experience of a LXD user without any pre-existing Juju experience.

# Requirements

This post assumes that you already have LXD 2.0 installed and configured (see previous posts) and that you’re running it on Ubuntu 16.04 LTS.

# Setting up Juju

The first thing to do is to install Juju 2.0\. On Ubuntu 16.04, it’s as simple as:

```
stgraber@dakara:~$ sudo apt install juju
Reading package lists... Done
Building dependency tree 
Reading state information... Done
The following additional packages will be installed:
 juju-2.0
Suggested packages:
 juju-core
The following NEW packages will be installed:
 juju juju-2.0
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 39.7 MB of archives.
After this operation, 269 MB of additional disk space will be used.
Do you want to continue? [Y/n] 
Get:1 http://us.archive.ubuntu.com/ubuntu xenial-updates/main amd64 juju-2.0 amd64 2.0~beta7-0ubuntu1.16.04.1 [39.6 MB]
Get:2 http://us.archive.ubuntu.com/ubuntu xenial-updates/main amd64 juju all 2.0~beta7-0ubuntu1.16.04.1 [9,556 B]
Fetched 39.7 MB in 0s (53.4 MB/s)
Selecting previously unselected package juju-2.0.
(Reading database ... 255132 files and directories currently installed.)
Preparing to unpack .../juju-2.0_2.0~beta7-0ubuntu1.16.04.1_amd64.deb ...
Unpacking juju-2.0 (2.0~beta7-0ubuntu1.16.04.1) ...
Selecting previously unselected package juju.
Preparing to unpack .../juju_2.0~beta7-0ubuntu1.16.04.1_all.deb ...
Unpacking juju (2.0~beta7-0ubuntu1.16.04.1) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up juju-2.0 (2.0~beta7-0ubuntu1.16.04.1) ...
Setting up juju (2.0~beta7-0ubuntu1.16.04.1) ...
```

Once that’s done, we can bootstrap a new “controller” using LXD. This means that Juju will not modify anything on your host, it will instead install its management service inside a LXD container.

Here, we’ll be creating a controller called “test” with:

```
stgraber@dakara:~$ juju bootstrap localhost test
Creating Juju controller "local.test" on localhost/localhost
Bootstrapping model "admin"
Starting new instance for initial controller
Launching instance
 - juju-745d1be3-e93d-41a2-80d4-fbe8714230dd-machine-0
Installing Juju agent on bootstrap instance
Preparing for Juju GUI 2.1.2 release installation
Waiting for address
Attempting to connect to 10.178.150.72:22
Logging to /var/log/cloud-init-output.log on remote host
Running apt-get update
Running apt-get upgrade
Installing package: curl
Installing package: cpu-checker
Installing package: bridge-utils
Installing package: cloud-utils
Installing package: cloud-image-utils
Installing package: tmux
Fetching tools: curl -sSfw 'tools from %{url_effective} downloaded: HTTP %{http_code}; time %{time_total}s; size %{size_download} bytes; speed %{speed_download} bytes/s ' --retry 10 -o $bin/tools.tar.gz <[https://streams.canonical.com/juju/tools/agent/2.0-beta7/juju-2.0-beta7-xenial-amd64.tgz]>
Bootstrapping Juju machine agent
Starting Juju machine agent (jujud-machine-0)
Bootstrap agent installed
Waiting for API to become available: upgrade in progress (upgrade in progress)
Waiting for API to become available: upgrade in progress (upgrade in progress)
Waiting for API to become available: upgrade in progress (upgrade in progress)
Bootstrap complete, local.test now available.
```

This should take about a minute, at which point you’ll see a new LXD container running:

```
stgraber@dakara:~$ lxc list juju-
+-----------------------------------------------------+---------+----------------------+------+------------+-----------+
|                         NAME                        |  STATE  |          IPV4        | IPV6 |    TYPE    | SNAPSHOTS |
+-----------------------------------------------------+---------+----------------------+------+------------+-----------+
| juju-745d1be3-e93d-41a2-80d4-fbe8714230dd-machine-0 | RUNNING | 10.178.150.72 (eth0) |      | PERSISTENT | 0         |
+-----------------------------------------------------+---------+----------------------+------+------------+-----------+
```

On the Juju side of things, you can confirm that it’s responding and that nothing is running yet:

```
stgraber@dakara:~$ juju status
[Services] 
NAME STATUS EXPOSED CHARM 

[Units] 
ID WORKLOAD-STATUS JUJU-STATUS VERSION MACHINE PORTS PUBLIC-ADDRESS MESSAGE 

[Machines] 
ID STATE DNS INS-ID SERIES AZ
```

You can also access the Juju GUI in your web browser with:

```
stgraber@dakara:~$ juju gui
Opening the Juju GUI in your browser.
If it does not open, open this URL:
https://10.178.150.72:17070/gui/97fa390d-96ad-44df-8b59-e15fdcfc636b/
```

 ![Juju web UI](https://www.stgraber.org/wp-content/uploads/2016/06/juju-gui.png) 

Though I prefer the command line so that’s what I’ll be using next.

# Deploying a minecraft server

So lets start with something very trivial, just deploy a service that uses a single Juju unit in a single container.

```
stgraber@dakara:~$ juju deploy cs:trusty/minecraft
Added charm "cs:trusty/minecraft-3" to the model.
Deploying charm "cs:trusty/minecraft-3" with the charm series "trusty".
```

This should return pretty much immediately. It however doesn’t mean the service is already up and running. Instead you’ll want to look at “juju status”:

```
stgraber@dakara:~$ juju status
[Services] 
NAME STATUS EXPOSED CHARM 
minecraft maintenance false cs:trusty/minecraft-3 

[Units] 
ID WORKLOAD-STATUS JUJU-STATUS VERSION MACHINE PORTS PUBLIC-ADDRESS MESSAGE 
minecraft/1 maintenance executing 2.0-beta7 1 10.178.150.74 (install) Installing java 

[Machines] 
ID STATE DNS INS-ID SERIES AZ 
1 started 10.178.150.74 juju-97fa390d-96ad-44df-8b59-e15fdcfc636b-machine-1 trusty 

```

Here we can see it’s currently busy installing java in the LXD container it just created.

```
stgraber@dakara:~$ lxc list juju-
+-----------------------------------------------------+---------+----------------------+------+------------+-----------+
|                         NAME                        |  STATE  |          IPV4        | IPV6 |    TYPE    | SNAPSHOTS |
+-----------------------------------------------------+---------+----------------------+------+------------+-----------+
| juju-745d1be3-e93d-41a2-80d4-fbe8714230dd-machine-0 | RUNNING | 10.178.150.72 (eth0) |      | PERSISTENT | 0         |
+-----------------------------------------------------+---------+----------------------+------+------------+-----------+
| juju-97fa390d-96ad-44df-8b59-e15fdcfc636b-machine-1 | RUNNING | 10.178.150.74 (eth0) |      | PERSISTENT | 0         |
+-----------------------------------------------------+---------+----------------------+------+------------+-----------+
```

After a little while, the service will be done deploying as can be seen here:

```
stgraber@dakara:~$ juju status
[Services] 
NAME STATUS EXPOSED CHARM 
minecraft active false cs:trusty/minecraft-3 

[Units] 
ID WORKLOAD-STATUS JUJU-STATUS VERSION MACHINE PORTS PUBLIC-ADDRESS MESSAGE 
minecraft/1 active idle 2.0-beta7 1 25565/tcp 10.178.150.74 Ready 

[Machines] 
ID STATE DNS INS-ID SERIES AZ 
1 started 10.178.150.74 juju-97fa390d-96ad-44df-8b59-e15fdcfc636b-machine-1 trusty
```

At which point you can fire up your minecraft client, point it at 10.178.150.74 on port 25565 and play with your all new minecraft server!

When you want to get rid of it, just run:

```
stgraber@dakara:~$ juju destroy-service minecraft
```

Wait a few seconds and everything will be gone.

# Deploying a more complex web application

Juju’s main focus is on modeling complex services and deploying them in a scallable way.

To better show that, lets deploy a Juju “bundle”. This bundle is a basic web service, made of a website, an API endpoint, a database, a static web server and a reverse proxy.

So that’s going to expand to 4, inter-connected LXD containers.

```
stgraber@dakara:~$ juju deploy cs:~charmers/bundle/web-infrastructure-in-a-box
added charm cs:~hp-discover/trusty/node-app-1
service api deployed (charm cs:~hp-discover/trusty/node-app-1 with the series "trusty" defined by the bundle)
annotations set for service api
added charm cs:trusty/mongodb-3
service mongodb deployed (charm cs:trusty/mongodb-3 with the series "trusty" defined by the bundle)
annotations set for service mongodb
added charm cs:~hp-discover/trusty/nginx-4
service nginx deployed (charm cs:~hp-discover/trusty/nginx-4 with the series "trusty" defined by the bundle)
annotations set for service nginx
added charm cs:~hp-discover/trusty/nginx-proxy-3
service nginx-proxy deployed (charm cs:~hp-discover/trusty/nginx-proxy-3 with the series "trusty" defined by the bundle)
annotations set for service nginx-proxy
added charm cs:~hp-discover/trusty/website-3
service website deployed (charm cs:~hp-discover/trusty/website-3 with the series "trusty" defined by the bundle)
annotations set for service website
related mongodb:database and api:mongodb
related website:nginx-engine and nginx:web-engine
related api:website and nginx-proxy:website
related nginx-proxy:website and website:website
added api/0 unit to new machine
added mongodb/0 unit to new machine
added nginx/0 unit to new machine
added nginx-proxy/0 unit to new machine
deployment of bundle "cs:~charmers/bundle/web-infrastructure-in-a-box-10" completed
```

A few seconds later, you’ll see all the LXD containers running:

```
stgraber@dakara:~$ lxc list juju-
+-----------------------------------------------------+---------+-----------------------+------+------------+-----------+
|                         NAME                        |  STATE  |           IPV4        | IPV6 |    TYPE    | SNAPSHOTS |
+-----------------------------------------------------+---------+-----------------------+------+------------+-----------+
| juju-745d1be3-e93d-41a2-80d4-fbe8714230dd-machine-0 | RUNNING | 10.178.150.72 (eth0)  |      | PERSISTENT | 0         |
+-----------------------------------------------------+---------+-----------------------+------+------------+-----------+
| juju-97fa390d-96ad-44df-8b59-e15fdcfc636b-machine-2 | RUNNING | 10.178.150.98 (eth0)  |      | PERSISTENT | 0         |
+-----------------------------------------------------+---------+-----------------------+------+------------+-----------+
| juju-97fa390d-96ad-44df-8b59-e15fdcfc636b-machine-3 | RUNNING | 10.178.150.29 (eth0)  |      | PERSISTENT | 0         |
+-----------------------------------------------------+---------+-----------------------+------+------------+-----------+
| juju-97fa390d-96ad-44df-8b59-e15fdcfc636b-machine-4 | RUNNING | 10.178.150.202 (eth0) |      | PERSISTENT | 0         |
+-----------------------------------------------------+---------+-----------------------+------+------------+-----------+
| juju-97fa390d-96ad-44df-8b59-e15fdcfc636b-machine-5 | RUNNING | 10.178.150.214 (eth0) |      | PERSISTENT | 0         |
+-----------------------------------------------------+---------+-----------------------+------+------------+-----------+
```

After a couple of minutes, all the services should be deployed and running:

```
stgraber@dakara:~$ juju status
[Services] 
NAME STATUS EXPOSED CHARM 
api unknown false cs:~hp-discover/trusty/node-app-1 
mongodb unknown false cs:trusty/mongodb-3 
nginx unknown false cs:~hp-discover/trusty/nginx-4 
nginx-proxy unknown false cs:~hp-discover/trusty/nginx-proxy-3 
website false cs:~hp-discover/trusty/website-3 

[Relations] 
SERVICE1 SERVICE2 RELATION TYPE 
api mongodb database regular 
api nginx-proxy website regular 
mongodb mongodb replica-set peer 
nginx website nginx-engine subordinate 
nginx-proxy website website regular 

[Units] 
ID WORKLOAD-STATUS JUJU-STATUS VERSION MACHINE PORTS PUBLIC-ADDRESS MESSAGE 
api/0 unknown idle 2.0-beta7 2 8000/tcp 10.178.150.98 
mongodb/0 unknown idle 2.0-beta7 3 27017/tcp,27019/tcp,27021/tcp,28017/tcp 10.178.150.29 
nginx-proxy/0 unknown idle 2.0-beta7 5 80/tcp 10.178.150.214 
nginx/0 unknown idle 2.0-beta7 4 10.178.150.202 
 website/0 unknown idle 2.0-beta7 10.178.150.202 

[Machines] 
ID STATE DNS INS-ID SERIES AZ 
2 started 10.178.150.98 juju-97fa390d-96ad-44df-8b59-e15fdcfc636b-machine-2 trusty 
3 started 10.178.150.29 juju-97fa390d-96ad-44df-8b59-e15fdcfc636b-machine-3 trusty 
4 started 10.178.150.202 juju-97fa390d-96ad-44df-8b59-e15fdcfc636b-machine-4 trusty 
5 started 10.178.150.214 juju-97fa390d-96ad-44df-8b59-e15fdcfc636b-machine-5 trusty
```

At which point, you can hit the reverse proxy on port 80 with http://10.178.150.214 and you’ll hit the Juju academy web service.

[
 ![Juju Academy web service](https://www.stgraber.org/wp-content/uploads/2016/06/juju-academy.png) 
][2]

# Cleaning everything up

If you want to get rid of all the containers Juju created and don’t mind having to bootstrap again next time, the easiest way to destroy everything is with:

```
stgraber@dakara:~$ juju destroy-controller test --destroy-all-models
WARNING! This command will destroy the "local.test" controller.
This includes all machines, services, data and other resources.

Continue [y/N]? y
Destroying controller
Waiting for hosted model resources to be reclaimed
Waiting on 1 model, 4 machines, 5 services
Waiting on 1 model, 4 machines, 5 services
Waiting on 1 model, 4 machines, 5 services
Waiting on 1 model, 4 machines, 5 services
Waiting on 1 model, 4 machines, 5 services
Waiting on 1 model, 4 machines, 5 services
Waiting on 1 model, 4 machines
Waiting on 1 model, 4 machines
Waiting on 1 model, 4 machines
Waiting on 1 model, 4 machines
Waiting on 1 model, 4 machines
Waiting on 1 model, 4 machines
Waiting on 1 model, 2 machines
Waiting on 1 model
Waiting on 1 model
All hosted models reclaimed, cleaning up controller machines
```

And we can confirm that it’s all gone:

```
stgraber@dakara:~$ lxc list juju-
+------+-------+------+------+------+-----------+
| NAME | STATE | IPV4 | IPV6 | TYPE | SNAPSHOTS |
+------+-------+------+------+------+-----------+
```

# Conclusion

Juju 2.0’s built-in LXD support makes for a very clean way to test a whole variety of services.

There are quite a few pre-made “bundles” for you to deploy in the Juju charm store and even more “charms” that you can use to piece together the architecture you want.

Juju with LXD is the perfect solution for easily developing anything from a small web service to a big scale out infrastructure, all on your own machine, without creating a mess on your system!

--------------------------------------------------------------------------
作者简介：I’m Stéphane Graber. I’m probably mostly known as the LXC and LXD project leader, currently working as a technical lead for LXD at Canonical Ltd. from my home in Montreal, Quebec, Canada.

--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/06/06/lxd-2-0-lxd-and-juju-1012/

作者：[ Stéphane Graber][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.stgraber.org/author/stgraber/
[1]:https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[2]:https://www.stgraber.org/wp-content/uploads/2016/06/juju-academy.png
