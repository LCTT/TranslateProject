如何在 Docker 容器之间设置网络
================================================================================
你也许已经知道了，Docker 容器技术是现有的成熟虚拟化技术的一个替代方案。它被企业应用在越来越多的领域中，比如快速部署环境、简化基础设施的配置流程、多客户环境间的互相隔离等等。当你开始在真实的生产环境使用 Docker 容器去部署应用沙箱时，你可能需要用到多个容器部署一套复杂的多层应用系统，其中每个容器负责一个特定的功能（例如负载均衡、LAMP 栈、数据库、UI 等）。

那么问题来了：有多台宿主机，我们事先不知道会在哪台宿主机上创建容器，如果保证在这些宿主机上创建的容器们可以互相联网？

联网技术哪家强？开源方案找 [weave][1]。这个工具可以为你省下不少烦恼。听我的准没错，谁用谁知道。

于是本教程的主题就变成了“**如何使用 weave 在不同主机上的 Docker 容器之间设置网络**”。

### Weave 是如何工作的 ###

![](https://farm8.staticflickr.com/7288/16662287067_27888684a7_b.jpg)

让我们先来看看 weave 怎么工作：先创建一个由多个 peer 组成的对等网络，每个 peer 是一个虚拟路由器容器，叫做“weave 路由器”，它们分布在不同的宿主机上。这个对等网络的每个 peer 之间会维持一个 TCP 链接，用于互相交换拓扑信息，它们也会建立 UDP 链接用于容器间通信。一个 weave 路由器通过桥接技术连接到本宿主机上的其他容器。当处于不同宿主机上的两个容器想要通信，一台宿主机上的 weave 路由器通过网桥截获数据包，使用 UDP 协议封装后发给另一台宿主机上的 weave 路由器。

每个 weave 路由器会刷新整个对等网络的拓扑信息，可以称作容器的 MAC 地址（如同交换机的 MAC 地址学习一样获取其他容器的 MAC 地址），因此它可以决定数据包的下一跳是往哪个容器的。weave 能让两个处于不同宿主机的容器进行通信，只要这两台宿主机在 weave 拓扑结构内连到同一个 weave 路由器。另外，weave 路由器还能使用公钥加密技术将 TCP 和 UDP 数据包进行加密。

### 准备工作 ###

在使用 weave 之前，你需要在所有宿主机上安装 [Docker][2] 环境，参考[这些][3][教程][4]，在 Ubuntu 或 CentOS/Fedora 发行版中安装 Docker。

Docker 环境部署完成后，使用下面的命令安装 weave：

    $ wget https://github.com/zettio/weave/releases/download/latest_release/weave
    $ chmod a+x weave
    $ sudo cp weave /usr/local/bin 

注意你的 PATH 环境变量要包含 /usr/local/bin 这个路径，请在 /etc/profile 文件中加入一行（LCTT 译注：要使环境变量生效，你需要执行这个命令： source /etc/profile）：

    export PATH="$PATH:/usr/local/bin"

在每台宿主机上重复上面的操作。

Weave 在 TCP 和 UDP 上都使用 6783 端口，如果你的系统开启了防火墙，请确保这两个端口不会被防火墙挡住。

### 在每台宿主机上启动 Weave 路由器 ###

当你想要让处于在不同宿主机上的容器能够互相通信，第一步要做的就是在每台宿主机上启动 weave 路由器。

第一台宿主机，运行下面的命令，就会创建并开启一个 weave 路由器容器（LCTT 译注：前面说过了，weave 路由器也是一个容器）：

    $ sudo weave launch 

第一次运行这个命令的时候，它会下载一个 weave 镜像，这会花一些时间。下载完成后就会自动运行这个镜像。成功启动后，终端会输出这个 weave 路由器的 ID 号。

下面的命令用于查看路由器状态：

    $ sudo weave status 

![](https://farm9.staticflickr.com/8632/16249607573_4514790cf5_c.jpg)

第一个 weave 路由器就绪了，目前为止整个 peer 对等网络中只有一个 peer 成员。

你也可以使用 docker 的命令来查看 weave 路由器的状态：

    $ docker ps 

![](https://farm8.staticflickr.com/7655/16681964438_51d8b18809_c.jpg)

第二台宿主机部署步骤稍微有点不同，我们需要为这台宿主机的 weave 路由器指定第一台宿主机的 IP 地址，命令如下：

    $ sudo weave launch <first-host-IP-address> 

当你查看路由器状态，你会看到两个 peer 成员：当前宿主机和第一个宿主机。

![](https://farm8.staticflickr.com/7608/16868571891_e66d4b8841_c.jpg)

当你开启更多路由器，这个 peer 成员列表会更长。当你新开一个路由器时，要指定前一个宿主机的 IP 地址，请注意不是第一个宿主机的 IP 地址（LCTT 译注：链状结构）。

现在你已经有了一个 weave 网络了，它由位于不同宿主机的 weave 路由器组成。

### 把不同宿主机上的容器互联起来 ###

接下来要做的就是在不同宿主机上开启 Docker 容器，并使用虚拟网络将它们互联起来。

假设我们创建一个私有网络 10.0.0.0/24 来互联 Docker 容器，并为这些容器随机分配 IP 地址。

如果你想新建一个能加入 weave 网络的容器，你就需要使用 weave 命令来创建，而不是 docker 命令。原因是 weave 命令内部会调用 docker 命令来新建容器然后为它设置网络。

下面的命令是在宿主机 hostA 上建立一个 Ubuntu 容器，然后将它放到 10.0.0.0/24 网络中，分配的 IP 地址为 10.0.0.1：

    hostA:~$ sudo weave run 10.0.0.1/24 -t -i ubuntu 

成功运行后，终端会显示出容器的 ID 号。你可以使用这个 ID 来访问这个容器：

    hostA:~$ docker attach <container-id> 

在宿主机 hostB 上，也创建一个 Ubuntu 容器，IP 地址为 10.0.0.2：

    hostB:~$ sudo weave run 10.0.0.2/24 -t -i ubuntu 

访问下这个容器的控制台：

    hostB:~$ docker attach <container-id> 

这两个容器能够互相 ping 通，你可以通过容器的控制台检查一下。

![](https://farm9.staticflickr.com/8566/16868571981_d73c8e401b_c.jpg)

如果你检查一下每个容器的网络配置，你会发现有一块名为“ethwe”的网卡，你分配给容器的 IP 地址出现在它们那里（比如这里分别是 10.0.0.1 和 10.0.0.2）。

![](https://farm8.staticflickr.com/7286/16681964648_013f9594b1_b.jpg)

### Weave 的其他高级用法 ###

weave 提供了一些非常巧妙的特性，我在这里作下简单的介绍。

#### 应用分离 ####

使用 weave，你可以创建多个虚拟网络，并为每个网络设置不同的应用。比如你可以为一群容器创建 10.0.0.0/24 网络，为另一群容器创建 10.10.0.0/24 网络，weave 会自动帮你维护这些网络，并将这两个网络互相隔离。另外，你可以灵活地将一个容器从一个网络移到另一个网络而不需要重启容器。举个例子：

首先开启一个容器，运行在 10.0.0.0/24 网络上：

    $ sudo weave run 10.0.0.2/24 -t -i ubuntu

然后让它脱离这个网络：

    $ sudo weave detach 10.0.0.2/24 <container-id>

最后将它加入到 10.10.0.0/24 网络中：

    $ sudo weave attach 10.10.0.2/24 <container-id> 

![](https://farm8.staticflickr.com/7639/16247212144_c31a49714d_c.jpg)

现在这个容器可以与 10.10.0.0/24 网络上的其它容器进行通信了。这在当你创建一个容器而网络信息还不确定时就很有帮助了。

#### 将 weave 网络与宿主机网络整合起来 ####

有时候你想让虚拟网络中的容器能访问物理主机的网络。或者相反，宿主机需要访问容器。为满足这个功能，weave 允许虚拟网络与宿主机网络整合。

举个例子，在宿主机 hostA 上一个容器运行在 10.0.0.0/24 中，运行使用下面的命令：

    hostA:~$ sudo weave expose 10.0.0.100/24 

这个命令把 IP 地址 10.0.0.100 分配给宿主机 hostA，这样一来宿主机 hostA 也连到了 10.0.0.0/24 网络上了。显然，你在为宿主机选择 IP 地址的时候，需要选一个没有被其他容器使用的地址。

现在 hostA 就可以访问 10.0.0.0/24 上的所有容器了，不管这些容器是否位于 hostA 上。好巧妙的设定啊，32 个赞！

### 总结 ###

如你所见，weave 是一个很有用的 docker 网络配置工具。这个教程只是它[强悍功能][5]的冰山一角。如果你想进一步玩玩，你可以试试它的以下功能：多跳路由功能，这个在 multi-cloud 环境（LCTT 译注：多云，企业使用多个不同的云服务提供商的产品，比如 IaaS 和 SaaS，来承载不同的业务）下还是很有用的；动态重路由功能是一个很巧妙的容错技术；或者它的分布式 DNS 服务，它允许你为你的容器命名。如果你决定使用这个好东西，欢迎分享你的使用心得。

--------------------------------------------------------------------------------

via: http://xmodulo.com/networking-between-docker-containers.html

作者：[Dan Nanni][a]
译者：[bazz2](https://github.com/bazz2)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://github.com/zettio/weave
[2]:http://xmodulo.com/recommend/dockerbook
[3]:http://xmodulo.com/manage-linux-containers-docker-ubuntu.html
[4]:http://xmodulo.com/docker-containers-centos-fedora.html
[5]:http://zettio.github.io/weave/features.html
