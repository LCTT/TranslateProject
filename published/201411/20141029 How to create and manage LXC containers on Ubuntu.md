教你在 Ubuntu 上使用 LXC 容器
================================================================================
使用“容器”来保证主机环境的安全性，这个概念早在十年前就已经存在（例如 FreeBSD 的 jail 虚拟化技术），但是直到最近，随着部署云架构需求越来越多，像 LXC 和 [Docker][1] 这种 Linux 下的容器才成为被关注的焦点。当然，由于主流厂商（云服务商如亚马逊主推 AWS，微软主推 Azure；发行版如红帽、Ubuntu等）组成的强大靠山，[Docker][2] 已经被放在媒体的聚光灯下面，其实，Docker 里面所谓的“容器”技术是由 LXC 提供的。

你只是一个普通的 Linux 用户，那 Docker/LXC 能为你带来什么好处呢？容器可以将你的应用在不同的 Linux 发行版之间迁移。想像一下这个场景：你正在用的发行版是 Debian，你喜欢它的稳定性，同时你又想玩一款最新的 Ubuntu 游戏，你不需要在电脑上装双系统然后重启进入 Ubuntu，也不需要在 Debian 上跑一个耗资源的 Ubuntu 虚拟机，你只需要简单地生成一个 Ubuntu 容器就够了。

抛开 Docker 的好处不谈，让我们聊一下 LXC 容器的好处：我可以使用 libvirt 提供的接口来管理 LXC，这些接口和 Docker 没有任何关系。如果你有使用基于 libvirt 库的管理工具（例如 virt-manager 和 virsh），你就可以使用它们来管理 LXC 容器。

在这篇教程中，我只介绍标准 LXC 容器管理工具的命令行操作，来教你**如何在 Ubuntu 下创建和管理 LXC 容器**。

### Ubuntu 下安装 LXC ###

使用下面的命令安装 LXC 在用户态的工具：

    $ sudo apt-get install lxc

然后检查当前内核是否支持 LXC。如果所有结果都是“enable”，说明内核支持：

    $ lxc-checkconfig 

![](https://farm4.staticflickr.com/3955/15655792445_d462957ee9_z.jpg)

安装完 LXC 工具后，就能看到 LXC 自动创建了一块桥接网卡（lxcbr0，可以在 /etc/lxc/default.conf 中设置）。

![](https://farm6.staticflickr.com/5598/15035046834_a53c092230_z.jpg)

当你创建了 LXC 容器后，它的网口会自动链接到这个桥接网卡上，然后这个容器就能和外部世界通信了。

### 创建 LXC 容器 ###

为了在指定环境下（比如 Debian Wheezy 64位）创建 LXC 容器，你需要一个相应的 LXC 模板。幸运的是 LXC 提供的工具集成了一整套现成的 LXC 模板，你可以在 /usr/share/lxc/templates 目录下找到它们。

     $ ls /usr/share/lxc/templates 

![](https://farm4.staticflickr.com/3954/15035046824_d15d1cbf6e_z.jpg)

一个 LXC 模板实质上就是一个脚本，用于创建指定环境下的容器。当你创建 LXC 容器时，你需要用到它们。

比如你要新建 Ubuntu 容器，使用下面的命令即可：

    $ sudo lxc-create -n <container-name> -t ubuntu 

![](https://farm8.staticflickr.com/7559/15035638763_07d63e23ef_z.jpg)

默认情况下，这个命令会创建一个最小的 Ubuntu 环境，版本号与你的宿主机一致，我这边是“活泼的蝾螈”（版本号是13.10），64位。

当然你也可以创建任何你喜欢的版本，只要在命令里面加一个版本参数即可。举个例子，创建 Ubuntu 14.10 的容器：

    $ sudo lxc-create -n <container-name> -t ubuntu -- --release utopic 

这个命令就会下载安装指定环境下的软件包，创建新容器。整个过程需要几分钟时间，与容器的类型有关，所以，你可能需要耐心等待。

![](https://farm4.staticflickr.com/3933/15469152369_6a48943cf3_z.jpg)

下载安装完所有软件包后，LXC 容器镜像就创建完成了，你可以看到默认的登录界面。容器被放到 /var/lib/lxc/<容器名> 这个目录下，容器的根文件系统放在 /var/lib/lxc/<容器名>/rootfs 目录下。

创建过程中下载的软件包保存在 /var/cache/lxc 目录下面，当你想另外建一个一样的容器时，可以省去很多下载时间。

用下面的命令看看主机上所有的 LXC 容器：

    $ sudo lxc-ls --fancy 

----------

    NAME  STATE    IPV4  IPV6  AUTOSTART  
    ------------------------------------
    test-lxc   STOPPED  -     -     NO         

使用下面的命令启动容器。参数“-d”将容器作为后台进程打开。如果没有指定这个参数，你可以在控制台界面上直接把容器的运行程序关闭（LCTT译注：Ctrl+C组合键）。

    $ sudo lxc-start -n <container-name> -d 

打开容器后，看看状态：

    $ sudo lxc-ls --fancy 

----------

    NAME  STATE    IPV4       IPV6  AUTOSTART  
    -----------------------------------------
    lxc   RUNNING  10.0.3.55  -     NO         

容器状态是“运行中”，容器 IP 是10.0.3.55。

你也可以看到容器的网络接口（比如我这里是 vethJ06SFL）自动与 LXC 内部网桥（lxcbr0）连上了：

    $ brctl show lxcbr0 

![](https://farm4.staticflickr.com/3932/15656618342_53c4bc19ca_z.jpg)

### 管理 LXC 容器 ###

我们已经学习了怎么创建和启动 LXC 容器，现在来看看怎么玩一个正在运行着的容器。

第一步：打开容器控制台：

    $ sudo lxc-console -n <container-name> 

![](https://farm8.staticflickr.com/7538/15470225050_d093cb1028_z.jpg)

使用“Crtl+a q”组合键退出控制台。

停止、删除容器：

    $ sudo lxc-stop -n <container-name>
    $ sudo lxc-destroy -n <container-name> 

复制容器，用下面的命令：

    $ sudo lxc-stop -n <container-name>
    $ sudo lxc-clone -o <container-name> -n <new-container-name>

### 常见问题 ###

这个小节主要介绍你们在使用 LXC 过程中碰到过的问题。

1. 创建 LXC 容器时遇到下面的错误：

    $ sudo lxc-create -n test-lxc -t ubuntu 

----------

    lxc-create: symbol lookup error: /usr/lib/x86_64-linux-gnu/liblxc.so.1: undefined symbol: cgmanager_get_pid_cgroup_abs_sync

错误的原因是你运行了最新的 LXC，但是它所依赖的 libcgmanager 版本较老，两者不兼容。升级下 libcmanager 即可解决问题：

    $ sudo apt-get install libcgmanager0 

--------------------------------------------------------------------------------

via: http://xmodulo.com/lxc-containers-ubuntu.html

作者：[Dan Nanni][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/docker-containers-centos-fedora.html
[2]:http://xmodulo.com/manage-linux-containers-docker-ubuntu.html
