LXD 2.0 系列（七）：LXD 中的 Docker
======================================

这是 [LXD 2.0 系列介绍文章][0]的第七篇。

![](https://linuxcontainers.org/static/img/containers.png)

### 为什么在 LXD 中运行 Docker

正如我在[系列的第一篇][1]中简要介绍的，LXD 的重点是系统容器，也就是我们在容器中运行一个完全未经修改的 Linux 发行版。LXD 的所有意图和目的并不在乎容器中的负载是什么。它只是设置容器命名空间和安全策略，然后运行 `/sbin/init` 来生成容器，接着等待容器停止。

应用程序容器，例如由 Docker 或 Rkt 所实现的应用程序容器是非常不同的，因为它们用于分发应用程序，通常在它们内部运行单个主进程，并且比 LXD 容器生命期更短暂。

这两种容器类型不是相互排斥的，我们的确看到使用 Docker 容器来分发应用程序的价值。这就是为什么我们在过去一年中努力工作以便让 LXD 中运行 Docker 成为可能。

这意味着，使用 Ubuntu 16.04 和 LXD 2.0，您可以为用户创建容器，然后可以像正常的 Ubuntu 系统一样连接到这些容器，然后运行 Docker 来安装他们想要的服务和应用程序。

### 要求

要让它正常工作要做很多事情，Ubuntu 16.04 上已经包含了这些：

- 支持 CGroup 命名空间的内核（4.4 Ubuntu 或 4.6 主线内核）
- 使用 LXC 2.0 和 LXCFS 2.0 的 LXD 2.0
- 一个自定义版本的 Docker（或一个用我们提交的所有补丁构建的）
- Docker 镜像，其受限于用户命名空间限制，或者使父 LXD 容器成为特权容器（`security.privileged = true`）

### 运行一个基础的 Docker 载荷

说完这些，让我们开始运行 Docker 容器！

首先你可以用下面的命令得到一个 Ubuntu 16.04 的容器：

```
lxc launch ubuntu-daily:16.04 docker -p default -p docker
```

`-p default -p docker` 表示 LXD 将 `default` 和 `docker` 配置文件应用于容器。`default` 配置文件包含基本网络配置，而 `docker` 配置文件告诉 LXD 加载几个必需的内核模块并为容器设置一些挂载。 `docker` 配置文件还支持容器嵌套。

现在让我们确保容器是最新的并安装 docker：

```
lxc exec docker -- apt update
lxc exec docker -- apt dist-upgrade -y
lxc exec docker -- apt install docker.io -y
```

就是这样！你已经安装并运行了一个 Docker 容器。

现在让我们用两个 Docker 容器开启一个基础的 web 服务：

```
stgraber@dakara:~$ lxc exec docker -- docker run --detach --name app carinamarina/hello-world-app
Unable to find image 'carinamarina/hello-world-app:latest' locally
latest: Pulling from carinamarina/hello-world-app
efd26ecc9548: Pull complete 
a3ed95caeb02: Pull complete 
d1784d73276e: Pull complete 
72e581645fc3: Pull complete 
9709ddcc4d24: Pull complete 
2d600f0ec235: Pull complete 
c4cf94f61cbd: Pull complete 
c40f2ab60404: Pull complete 
e87185df6de7: Pull complete 
62a11c66eb65: Pull complete 
4c5eea9f676d: Pull complete 
498df6a0d074: Pull complete 
Digest: sha256:6a159db50cb9c0fbe127fb038ed5a33bb5a443fcdd925ec74bf578142718f516
Status: Downloaded newer image for carinamarina/hello-world-app:latest
c8318f0401fb1e119e6c5bb23d1e706e8ca080f8e44b42613856ccd0bf8bfb0d

stgraber@dakara:~$ lxc exec docker -- docker run --detach --name web --link app:helloapp -p 80:5000 carinamarina/hello-world-web
Unable to find image 'carinamarina/hello-world-web:latest' locally
latest: Pulling from carinamarina/hello-world-web
efd26ecc9548: Already exists 
a3ed95caeb02: Already exists 
d1784d73276e: Already exists 
72e581645fc3: Already exists 
9709ddcc4d24: Already exists 
2d600f0ec235: Already exists 
c4cf94f61cbd: Already exists 
c40f2ab60404: Already exists 
e87185df6de7: Already exists 
f2d249ff479b: Pull complete 
97cb83fe7a9a: Pull complete 
d7ce7c58a919: Pull complete 
Digest: sha256:c31cf04b1ab6a0dac40d0c5e3e64864f4f2e0527a8ba602971dab5a977a74f20
Status: Downloaded newer image for carinamarina/hello-world-web:latest
d7b8963401482337329faf487d5274465536eebe76f5b33c89622b92477a670f
```

现在这两个 Docker 容器已经运行了，我们可以得到 LXD 容器的 IP 地址，并且访问它的服务了！

```
stgraber@dakara:~$ lxc list
+--------+---------+----------------------+----------------------------------------------+------------+-----------+
|  NAME  |  STATE  |         IPV4         |                      IPV6                    |    TYPE    | SNAPSHOTS |
+--------+---------+----------------------+----------------------------------------------+------------+-----------+
| docker | RUNNING | 172.17.0.1 (docker0) | 2001:470:b368:4242:216:3eff:fe55:45f4 (eth0) | PERSISTENT | 0         |
|        |         | 10.178.150.73 (eth0) |                                              |            |           |
+--------+---------+----------------------+----------------------------------------------+------------+-----------+

stgraber@dakara:~$ curl http://10.178.150.73
The linked container said... "Hello World!"
```

### 总结

就是这样了！在 LXD 容器中运行 Docker 容器真的很简单。

现在正如我前面提到的，并不是所有的 Docker 镜像都会像我的示例一样，这通常是因为 LXD 带来了额外的限制，特别是用户命名空间。

在这种模式下只有 Docker 的 overlayfs 存储驱动可以工作。该存储驱动有一组自己的限制，这进一步限制了在该环境中可以有多少镜像工作。

如果您的负载无法正常工作，并且您信任该 LXD 容器中的用户，你可以试下：

```
lxc config set docker security.privileged true
lxc restart docker
```

这将取消激活用户命名空间，并以特权模式运行容器。

但是请注意，在这种模式下，容器内的 root 与主机上的 root 是相同的 uid。现在有许多已知的方法让用户脱离容器，并获得主机上的 root 权限，所以你应该只有在信任你的 LXD 容器中的用户可以具有主机上的 root 权限才这样做。

### 额外信息

LXD 的主站在: <https://linuxcontainers.org/lxd>

LXD 的 GitHub 仓库: <https://github.com/lxc/lxd>

LXD 的邮件列表: <https://lists.linuxcontainers.org>

LXD 的 IRC 频道: #lxcontainers on irc.freenode.net


--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/04/13/lxd-2-0-docker-in-lxd-712/

作者：[Stéphane Graber][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://linux.cn/article-7618-1.html
[2]: https://linuxcontainers.org/lxd/try-it/
