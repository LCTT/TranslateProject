如何在Docker容器中运行Kali Linux 2.0
================================================================================
### 介绍 ###

Kali Linux是一个对于安全测试人员和白帽的一个知名的操作系统。它带有大量安全相关的程序，这让它很容易用于渗透测试。最近，[Kali Linux 2.0][1]发布了，并且它被认为是这个操作系统最重要的一次发布。另一方面，Docker技术由于它的可扩展性和易用性让它变得很流行。Dokcer让你非常容易地将你的程序带给你的用户。好消息是你可以通过Docker运行Kali Linux了，让我们看看该怎么做:)

### 在Docker中运行Kali Linux 2.0  ###

**相关提示**

如果你还没有在系统中安装docker，你可以运行下面的命令：

**对于 Ubuntu/Linux Mint/Debian：**

    sudo apt-get install docker 

**对于 Fedora/RHEL/CentOS：**

    sudo yum install docker 

**对于 Fedora 22：**

    dnf install docker 

你可以运行下面的命令来启动docker：

    sudo docker start 

首先运行下面的命令确保服务正在运行：

    sudo docker status 

Kali Linux的开发团队已将Kali Linux的docker镜像上传了，只需要输入下面的命令来下载镜像。

    docker pull kalilinux/kali-linux-docker 

![Pull Kali Linux docker](http://linuxpitstop.com/wp-content/uploads/2015/08/129.png)

下载完成后，运行下面的命令来找出你下载的docker镜像的ID。

    docker images 

![Kali Linux Image ID](http://linuxpitstop.com/wp-content/uploads/2015/08/230.png)

现在运行下面的命令来从镜像文件启动kali linux docker容器（这里用正确的镜像ID替换）。

    docker run -i -t 198cd6df71ab3 /bin/bash 

它会立刻启动容器并且会登录操作系统，你现在可以在Kaili Linux中工作了。

![Kali Linux Login](http://linuxpitstop.com/wp-content/uploads/2015/08/328.png)

你可以通过下面的命令来验证通气已经启动/运行中了：

    docker ps 

![Docker Kali](http://linuxpitstop.com/wp-content/uploads/2015/08/421.png)

### 总结 ###

Docker是一种最聪明的用来部署和分发包的方式。Kali Linux docker镜像非常容易上手，也不会消耗很大的硬盘空间，这样也容易地在任何安装了docker的操作系统上测试这个很棒的发行版了。

--------------------------------------------------------------------------------

via: http://linuxpitstop.com/run-kali-linux-2-0-in-docker-container/

作者：[Aun][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxpitstop.com/author/aun/
[1]:http://linuxpitstop.com/install-kali-linux-2-0/
