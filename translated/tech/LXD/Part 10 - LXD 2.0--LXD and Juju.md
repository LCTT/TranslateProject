LXD 2.0 系列（十）：LXD和Juju
======================================

这是 [LXD 2.0 系列介绍文章][1]的第十篇。

 ![LXD logo](https://linuxcontainers.org/static/img/containers.png) 

介绍
============================================================

Juju是Canonical的服务建模和部署工具。 它支持非常广泛的云提供商，使您能够轻松地在任何云上部署任何您想要的服务。

此外，Juju 2.0还支持LXD，既适用于本地部署，也适合开发，并且可以在云实例或物理机上共同协作。

本篇文章将关注本地使用，通过一个没有任何Juju经验的LXD用户来体验。

# 要求

本篇文章假设你已经安装了LXD 2.0并且配置完毕（看前面的文章），并且是在Ubuntu 16.04 LTS上运行的。

# 设置 Juju

第一件事是在Ubuntu 16.04上安装Juju 2.0。这个很简单：

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

安装完成后，我们可以使用LXD启动一个新的“控制器”。这意味着Juju不会修改你主机上的任何东西，它会在LXD容器中安装它的管理服务。

现在我们创建一个“test”控制器：

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

这会花费一点时间，这时你可以看到一个正在运行的一个新的LXD容器：

```
stgraber@dakara:~$ lxc list juju-
+-----------------------------------------------------+---------+----------------------+------+------------+-----------+
|                         NAME                        |  STATE  |          IPV4        | IPV6 |    TYPE    | SNAPSHOTS |
+-----------------------------------------------------+---------+----------------------+------+------------+-----------+
| juju-745d1be3-e93d-41a2-80d4-fbe8714230dd-machine-0 | RUNNING | 10.178.150.72 (eth0) |      | PERSISTENT | 0         |
+-----------------------------------------------------+---------+----------------------+------+------------+-----------+
```

在Juju这边，你可以确认它有响应，并且还没有服务运行：

```
stgraber@dakara:~$ juju status
[Services] 
NAME STATUS EXPOSED CHARM 

[Units] 
ID WORKLOAD-STATUS JUJU-STATUS VERSION MACHINE PORTS PUBLIC-ADDRESS MESSAGE 

[Machines] 
ID STATE DNS INS-ID SERIES AZ
```

你也可以在浏览器中访问Juju的GUI界面：

```
stgraber@dakara:~$ juju gui
Opening the Juju GUI in your browser.
If it does not open, open this URL:
https://10.178.150.72:17070/gui/97fa390d-96ad-44df-8b59-e15fdcfc636b/
```

 ![Juju web UI](https://www.stgraber.org/wp-content/uploads/2016/06/juju-gui.png) 

尽管我更倾向使用命令行，因此我会在接下来使用。

# 部署一个minecraft服务

让我们先来一个简单的，部署在一个容器中使用一个Juju单元的服务。

```
stgraber@dakara:~$ juju deploy cs:trusty/minecraft
Added charm "cs:trusty/minecraft-3" to the model.
Deploying charm "cs:trusty/minecraft-3" with the charm series "trusty".
```

返回会很快，然而这不意味着服务已经启动并运行了。你应该使用“juju status”来查看：

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

我们可以看到它正在忙于在刚刚创建的LXD容器中安装java。

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

过一会之后，如我们所见服务就部署完毕了：

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

这时你就可以启动你的Minecraft客户端了，它指向10.178.150.74，端口是25565。现在可以在新的minecraft服务器上玩了！

当你不再需要它，只需运行：

```
stgraber@dakara:~$ juju destroy-service minecraft
```

只要等待几秒就好了。

# 部署一个更复杂的web应用

Juju的主要工作是建模复杂的服务，并以可扩展的方式部署它们。

为了更好地展示，让我们部署一个Juju “组合”。 这个组合是由网站，API，数据库，静态Web服务器和反向代理组成的基本Web服务。

所以这将扩展到4个互联的LXD容器。

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

几秒后，你会看到LXD容器在运行了：

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

几分钟后，所有的服务应该部署完毕并运行了：

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

这时你就可以在80端口访问http://10.178.150.214，并且会看到一个Juju学院页面。

[
 ![Juju Academy web service](https://www.stgraber.org/wp-content/uploads/2016/06/juju-academy.png) 
][2]

# 清理所有东西

如果你不需要Juju创建的容器并且不在乎下次需要再次启动，最简单的方法是：

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

我们用下面的方式确认：

```
stgraber@dakara:~$ lxc list juju-
+------+-------+------+------+------+-----------+
| NAME | STATE | IPV4 | IPV6 | TYPE | SNAPSHOTS |
+------+-------+------+------+------+-----------+
```

# 总结

Juju 2.0内置的LXD支持使得可以用一种非常干净的方式来测试各种服务。

在Juju charm store中有很多预制的“组合”可以用来部署，甚至可以用多个“charm”来组合你想要的架构。

Juju与LXD是一个完美的解决方案，从一个小的Web服务到大规模的基础设施都可以简单开发，这些都在你自己的机器上，并且不会在你的系统上造成混乱！

--------------------------------------------------------------------------
作者简介：我是Stéphane Graber。我是LXC和LXD项目的领导者，目前在加拿大魁北克蒙特利尔的家所在的Canonical有限公司担任LXD的技术主管。

--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/06/06/lxd-2-0-lxd-and-juju-1012/

作者：[ Stéphane Graber][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.stgraber.org/author/stgraber/
[1]:https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[2]:https://www.stgraber.org/wp-content/uploads/2016/06/juju-academy.png
