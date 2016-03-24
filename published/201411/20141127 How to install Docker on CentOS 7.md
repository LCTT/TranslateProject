如何在 CentOS 7 上安装 Docker
================================================================================

Docker 是一个开源工具，它可以让创建和管理 **Linux 容器**变得简单。容器就像是轻量级的虚拟机，并且可以以毫秒级的速度来启动或停止。Docker 帮助系统管理员和程序员在容器中开发应用程序，并且可以扩展到成千上万的节点。

容器和 VM（虚拟机）的主要区别是，容器提供了**基于进程的隔离**，而虚拟机提供了资源的完全隔离。虚拟机可能需要一分钟来启动，而容器只需要一秒钟或更短。容器使用宿主操作系统的内核，而虚拟机使用独立的内核。

Docker 的局限性之一是，它只能用在 **64 位**的操作系统上。

在这篇文章中我们将讨论如何在 CentOS 7.x 中安装 docker。

### CentOS 7 中 Docker 的安装 ###

Docker 软件包已经包括在默认的 CentOS-Extras 软件源里。因此想要安装 docker，只需要运行下面的 yum 命令：

    [root@localhost ~]# yum install docker

### 启动 Docker 服务 ###

安装完成后，使用下面的命令来启动 docker 服务，并将其设置为开机启动：

    [root@localhost ~]# service docker start
    [root@localhost ~]# chkconfig docker on
    
（LCTT 译注：此处采用了旧式的 sysv 语法，如采用CentOS 7中支持的新式 systemd 语法，如下：

    [root@localhost ~]# systemctl  start docker.service
    [root@localhost ~]# systemctl  enable docker.service

）

**下载官方的 CentOS 镜像到本地** （LCTT 译注：由于 Docker 被**墙** :-< ，所以请使用 http://docker.cn  的[镜像][1]，感谢 @马全一 的镜像。 ）

    [root@localhost ~]# docker pull centos
    Pulling repository centos
    192178b11d36: Download complete 
    70441cac1ed5: Download complete 
    ae0c2d0bdc10: Download complete 
    511136ea3c5a: Download complete 
    5b12ef8fd570: Download complete

**确认 CentOS 镜像已经被获取：**

    [root@localhost ~]# docker images centos
    REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
    centos              centos5             192178b11d36        2 weeks ago         466.9 MB
    centos              centos6             70441cac1ed5        2 weeks ago         215.8 MB
    centos              centos7             ae0c2d0bdc10        2 weeks ago         224 MB
    centos              latest              ae0c2d0bdc10        2 weeks ago         224 MB

**运行一个 Docker 容器：**

    [root@localhost ~]# docker run -i -t centos /bin/bash
    [root@dbf66395436d /]#

我们可以看到，CentOS 容器已经被启动，并且我们得到了 bash 提示符。在 docker 命令中我们使用了 “-i 捕获标准输入输出”和 “-t 分配一个终端或控制台”选项。若要断开与容器的连接，输入 exit。

    [root@cd05639b3f5c /]# cat /etc/redhat-release 
    CentOS Linux release 7.0.1406 (Core) 
    [root@cd05639b3f5c /]# exit
    exit
    [root@localhost ~]#

我们还可以搜索基于 Fedora 和 Ubuntu 操作系统的容器。

    [root@localhost ~]# docker search ubuntu
    [root@localhost ~]# docker search fedora

**显示当前正在运行容器的列表**

![](http://www.linuxtechi.com/wp-content/uploads/2014/11/docker-ps.png)

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/install-docker-on-centos-7/

作者：[Pradeep Kumar][a]
译者：[felixonmars](https://github.com/felixonmars)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
[1]:https://docker.cn/h/how-to-use-docker-official-repositories
