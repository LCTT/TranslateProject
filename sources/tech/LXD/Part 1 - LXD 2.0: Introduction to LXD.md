translating by ezio

Part 1 - LXD 2.0: LXD 入门
======================================

这是 [LXD 2.0 系列介绍文章][1]的第一篇。

![](https://linuxcontainers.org/static/img/containers.png)


### 关于 LXD 几个常见问题

#### 什么是 LXD ?

简单来说 LXD 就是一个提供了 REST API 的 LXC 容器管理器。

LXD 最主要的目标就是使用 Linux 容器而不是硬件虚拟化向用户提供一种接近虚拟机的使用体验。

#### LXD 和 Docker/Rkt 又有什么关系呢 ?

这是一个最常被问起的问题，现在就让我们直接指出其中的不同吧。

LXD 聚焦于系统容器，通常也被称为架构容器。这就是说 LXD 容器实际上运行了一个完整的 Linux 操作系统，就像在裸机或虚拟机上运行的一样。

这些容器一般都是基于一个干净的发布镜像，会长时间运行。传统的配置管理工具和发布工具可以和 LXD 一起使用，就像你在虚拟机、云或者物理机器上使用一样。

相对的， Docker 关注于短视的、无状态的最小容器，这些容器通常并不会升级或者重新配置，它们一般都是作为一个整体被替换掉。这就使得 Docker 和类似的项目更像是一种软件发布机制，而不是一个机器管理工具。

这两种模型并不是完全互斥的。你完全可以使用 LXD 为你的用户提供一个完整的 Linux 系统，而他们可以在 LXD 上面安装 Docker 来运行他们想要的软件。


#### 为什么要用 LXD?

我们已经在 LXC 上工作了好几个年头了。 LXC 成功的实现了它的目标，它提供了一系列很棒的底层工具和库来创建、管理容器。

然而这些底层工具的使用界面对用户并不是很友好。他们需要用户有很多的基础知识来理解他们要干什么和怎么去干。同时向后兼容旧的容器和部署策略已经阻止 LXC 默认使用一些安全特性，这导致用户需要进行更多人工操作来实现本可以自动完成的工作。

我们把 LXD 作为解决这些缺陷的一个很好的机会。作为一个长时间运行的守护进程可以让我们定位到很多 LXC 的限制，比如动态资源限制，容器迁移和有效的进行在线迁移，它同时也给了我们机会来提供一个新的默认体验：默认开启安全特性，对用户更加友好。


### LXD 的主要组件

LXD 是由几个主要组件构成的，在它的命令行客户端和 API结构体里，这些组件都是 LXD 目录结构下可见的。

#### 容器

LXD 中的容器包括以下及部分：

- 根文件系统
- 设备：包括磁盘、unix 字符/块设备、网络接口
- 一组继承而来的容器配置文件
- 属性（容器架构，暂时的或持久的，容器名）
- 运行时状态（当时为了记录检查点、恢复时用到了 CRIU时）

#### 快照

容器快照和容器是一回事，只不过快照是不可修改的，只能被重命名，销毁或者用来恢复系统，但是无论如何都不能被修改。

值得注意的是，因为我们允许用户保存容器的运行时状态，这就有效的为我们提供了“有状态”的快照的功能。这就是说我们可以使用快照回滚容器的 cpu 和内存。

#### 镜像

LXD 是基于镜像实现的，所有的 LXD 容器都是来自于镜像。容器镜像经常是一些干净的 Linux 发布版的镜像，类似于你们在虚拟机和云实例上使用的镜像。

所以就可以“发布”容器：使用容器制作一个镜像，然后可以在本地或者远程 LXD 主机上使用。

镜像通常使用 sha256 来区分，同时也可以使用它的全部或部分哈希码。因为输入长长的哈希码对用户来说不好，所以镜像可以使用几个自身的属性来区分，这就允许让用户在镜像商店里方便搜索镜像。别名也可以用来把对用户友好的字符串 1 比 1 的映射成镜像的哈希码。

LXD 安装时已经配置好了三个远程镜像服务器（参见下面的远程一节）：

- “ubuntu：” 提供稳定版的 Ubuntu 镜像
- “ubuntu-daily：” 提供每天构建出来的 Ubuntu
- “images：” 社区维护的镜像服务器，提供一系列的 Linux 发布版，使用的是上游 LXC 的模板

LXD 守护进程会从镜像上次被使用开始自动缓存远程镜像一段时间（默认是 10 天），然后这些镜像才会失效。

此外 LXD 还会自动更新远程镜像（除非指明不更新），所以本地的镜像会一直是最新版的。


#### 配置

配置文件是一种在一处定义容器配置和容器设备，然后应用到一系列容器的方法。

一个容器可以被应用多个配置文件。当构建最终容器配置时（即通常的扩展配置），这些配置文件都会按照他们定义顺序被应用到容器上，当有重名的配置，新的会覆盖掉旧的。然后本地容器配置会应用在这些之上，覆盖所有来自配置文件的选项。

LXD 自带两种预配置的配置文件：

- “default” 配置是自动应用在所有容器之上，除非用户提供了一系列替代的配置文件。目前这个配置文件只做一件事，为容器定义 “eth0” 网络设备。
- “docker” 配置是一个允许你在容器里运行 Docker 容器的配置文件。它会要求 LXD 加载一些需要的内核模块，这样就能允许容器嵌套，并且创建一些设备入口。

#### 远程

如我之前提到的， LXD 是一个基于网络的守护进程。附带的命令行客户端可以与多个远程 LXD 服务器、镜像服务器通信。

默认情况下我们的命令行客户端会与下面几个预定义的远程服务器通信：

- local：（默认的远程服务器，使用 UNIX socket 和本地的 LXD 守护进程通信）
- ubuntu：（buntu 镜像服务器，提供稳定版的 Ubuntu 镜像）
- ubuntu-daily：（Ubuntu 镜像服务器，提供每天构建出来的 Ubuntu）
- images：（images.linuxcontainers.org 镜像服务器）

所有这些远程服务器的组合都可以在命令行客户端里使用。

你也可以添加任意数量的远程 LXD 主机来监听网络。匿名服务器如果是开放镜像服务器，或者通过认证可以管理远程容器的镜像服务器，都可以添加进来。

正是这种远程机制使得和远程镜像服务器交互就像在主机间复制、移动容器成为可能。

### 安全性

One aspect that was core to our design of LXD was to make it as safe as possible while allowing modern Linux distributions to run inside it unmodified.

The main security features used by LXD through its use of the LXC library are:

- Kernel namespaces. Especially the user namespace as a way to keep everything the container does separate from the rest of the system. LXD uses the user namespace by default (contrary to LXC) and allows for the user to turn it off on a per-container basis (marking the container “privileged”) when absolutely needed.
- Seccomp. To filter some potentially dangerous system calls.
- AppArmor: To provide additional restrictions on mounts, socket, ptrace and file access. Specifically restricting cross-container communication.
- Capabilities. To prevent the container from loading kernel modules, altering the host system time, …
- CGroups. To restrict resource usage and prevent DoS attacks against the host.
Rather than exposing those features directly to the user as LXC would, we’ve built a new configuration language which abstracts most of those into something that’s more user friendly. For example, one can tell LXD to pass any host device into the container without having to also lookup its major/minor numbers to manually update the cgroup policy.

Communications with LXD itself are secured using TLS 1.2 with a very limited set of allowed ciphers. When dealing with hosts outside of the system certificate authority, LXD will prompt the user to validate the remote fingerprint (SSH style), then cache the certificate for future use.

### REST 接口

Everything that LXD does is done over its REST API. There is no other communication channel between the client and the daemon.

The REST API can be access over a local unix socket, only requiring group membership for authentication or over a HTTPs socket using a client certificate for authentication.

The structure of the REST API matches the different components described above and is meant to be very simple and intuitive to use.

When a more complex communication mechanism is required, LXD will negotiate websockets and use those for the rest of the communication. This is used for interactive console session, container migration and for event notification.

With LXD 2.0, comes the /1.0 stable API. We will not break backward compatibility within the /1.0 API endpoint however we may add extra features to it, which we’ll signal by declaring additional API extensions that the client can look for.

### 容器规模化

While LXD provides a good command line client, that client isn’t meant to manage thousands of containers on multiple hosts. For that kind of use cases, we have nova-lxd which is an OpenStack plugin that makes OpenStack treat LXD containers in the exact same way it would treat VMs.

This allows for very large deployments of LXDs on a large number of hosts, using the OpenStack APIs to manage network, storage and load-balancing.

### 额外信息

The main LXD website is at: <https://linuxcontainers.org/lxd>
Development happens on Github at: <https://github.com/lxc/lxd>
Mailing-list support happens on: <https://lists.linuxcontainers.org>
IRC support happens in: #lxcontainers on irc.freenode.net

And if you can’t wait until the next few posts to try LXD, you can [take our guided tour online][2] and try it for free right from your web browser!

--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/03/11/lxd-2-0-introduction-to-lxd-112/

作者：[Stéphane Graber][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[1]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[2]: https://linuxcontainers.org/lxd/try-it
