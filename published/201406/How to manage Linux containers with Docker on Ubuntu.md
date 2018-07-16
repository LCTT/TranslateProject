在 Ubuntu 中用 Docker 管理 Linux Container 容器
================================================================================
当前，完全硬件虚拟化技术（KVM、Xen、Hyper-V 等）能在一个物理主机上很好地运行多个互相独立的操作系统，但这也带来一些问题：性能不佳，资源浪费，系统反应迟缓等。有时候对用户来说，完全的硬件虚拟化并不是最好的选择。

一种替代方案是使用轻量级虚拟化技术 —— 所谓的 [LinuX Container 容器][1] (LXC)，它提供的是系统级虚拟化。与跑虚拟机相比，LXC 可以在一个轻量级沙箱容器里面跑多个 Linux 操作系统。当你需要设置一些易于克隆的开发环境、测试环境，或想在安全沙盒里安装应用时，LXC 就非常有用了。

[Docker][2] 是一个开源工具，可以让用户方便地布署 Linux Container 容器。Docker 很快变成了 container 技术的非官方标准，从而被 [Ubuntu][3] 和 [Red Hat][4]等众多发行版吸收进去。

本教程中我会向你们演示如何在 Ubuntu 14.04 中使用 Docker 来管理 LXC。需要注意的是，本教程的一些内容可能会与其他 Ubuntu 版本下的操作会稍微有些出入。

当前Ubuntu 系统下的 Docker 的安装包只提供64位。如果你想运行32位的 Docker，你需要[使用源码编译32位 Docker 工具][5]。

### 安装 Docker ###

通过 apt-get 安装 Docker 简直是小菜一碟。

    $ sudo apt-get install docker.io

如果你不是 root 组的用户，你可以把自己加入到 docker 用户组。下面的命令可以让没有 root 权限的用户使用 Docker：

    $ sudo usermod -a -G docker $USER

重新登录，以便让你的用户组权限生效。

下一步是编辑 Docker 配置文件，确定 Docker 可执行文件的路径：

    $ sudo vi /etc/default/docker.io
	
	DOCKER="/usr/bin/docker.io"

重启 Docker 服务：

    $ sudo service docker.io restart

### 管理 Docker Container 容器 ###

如果你想在新的 Docker 容器下创建一个新的 Ubuntu 操作系统，你首先需要 pull 一个 [Ubuntu][6] 的 Docker 镜像。下面的命令可以通过网络下载 Docker 镜像：

    $ docker pull ubuntu

你可以使用下面的命令启动 Docker 里面的 Ubuntu 系统。最后的参数“/bin/bash”表示一旦容器启动，首先会执行简单的 bash。

    $ docker run -i -t ubuntu /bin/bash

上面的命令会立即启动 Ubuntu container 容器（这是一个完美的容器！），然后它会提供一个 shell 提示符运行环境给你。现在开始你可以通过这个沙箱环境访问一个完整的 Ubuntu 系统了。

![](https://farm6.staticflickr.com/5515/13892198519_dfb9481af6_z.jpg)

输入“exit”命令退出 Docker 容器。

你也可以用下面的命令进入不同的系统。比如 Fedora：

    $ docker.io run -i -t fedora /bin/bash

如果系统中还不存在 Fedora Docker 镜像，这个命令会自动下载它，然后启动这个 Fedora 的 Docker 容器。

![](https://farm8.staticflickr.com/7427/14079294164_0ccabde57a.jpg)

如果你想要开启指定版本的系统，比如 Ubuntu 13.04，你可以使用下面的命令：

    $ docker.io run -i -t ubuntu:13.04 /bin/bash

### Container 容器网络设置 ###

Docker 使用 Linux 桥接技术与其他容器通信，以及连通外网。安装完 Docker 后你应该可以看到 docker0 这个网桥，这是 Docker 默认创建的。你创建的每个容器都会通过这个网桥连接到网络。

![](https://farm6.staticflickr.com/5462/14078810715_513764848b_z.jpg)

#### 自定义 Linux 网桥 ####

如果你想自定义网桥，你可以执行以下步骤。你可以在这个网桥后面分配一个子网，并为这个子网分配地址。下面的命令会为 Docker 子网分配 10.0.0.0/24 地址段：

    $ sudo apt-get install bridge-utils
    $ sudo brctl addbr br0
    $ sudo ifconfig br0 10.0.0.1 netmask 255.255.255.0

然后在 /etc/default/docker.io 文件的 DOCKER_OPTS 变量里添加“-b=br0”选项，并重启 Docker 服务：

    $ sudo service docker.io restart

到目前为止，任何创建的容器都会连上 br0 网桥，它们的 IP 地址会从 10.0.0.0/24 中自动分配（译注：在10.0.0.2到10.0.0.254之间随机分配）。

#### 其他自定义设置 ####

你可以通过 /etc/default/docker.io 文件的 DOCKER_OPTS 变量设置其他一些属性：

- "-dns 8.8.8.8 -dns 8.8.4.4": 为容器指定 DNS 服务器。
- "-icc=false": 将容器与其他容器隔离出来

### 疑难解答 ###

1、当你运行 docker.io 命令时，你可能会遇到以下问题：

> dial unix /var/run/docker.sock: no such file or directory

这个错误可能是由于 Docker 后台进程没有启动。检查下 Docker 后台进程的状态，确认它已经处于启动状态：

    $ sudo service docker.io status
    $ sudo service docker.io start 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/05/manage-linux-containers-docker-ubuntu.html

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://linuxcontainers.org/
[2]:https://www.docker.io/
[3]:http://blog.docker.io/2014/04/docker-in-ubuntu-ubuntu-in-docker/
[4]:http://www.redhat.com/about/news/press-archive/2014/4/red-hat-docker-expand-collaboration
[5]:http://mwhiteley.com/linux-containers/2013/08/31/docker-on-i386.html
[6]:http://xmodulo.com/go/ubuntubook
