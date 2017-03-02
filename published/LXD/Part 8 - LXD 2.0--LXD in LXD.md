LXD 2.0 系列（八）：LXD 中的 LXD
======================================

这是 [LXD 2.0 系列介绍文章][0]的第八篇。

![](https://linuxcontainers.org/static/img/containers.png)

### 介绍

在上一篇文章中，我介绍了如何[在 LXD 中运行 Docker][1]，这是一个访问由 Docker 提供的应用程序组合的很好方式，同时 Docker 还运行在 LXD 提供的安全环境中。

我提到的一个情况是为你的用户提供一个 LXD 容器，然后让他们使用他们的容器来运行 Docker。那么，如果他们自己想要在其容器中使用 LXD 运行其他 Linux 发行版，或者甚至允许另一组人来访问运行在他们的容器中的 Linux 系统呢？

原来 LXD 使得用户运行嵌套容器变得非常简单。

### 嵌套 LXD

最简单的情况可以使用 Ubuntu 16.04 镜像来展示。 Ubuntu 16.04 云镜像预装了 LXD。守护进程本身没有运行，因为它是由套接字激活的，所以它不使用任何资源，直到你真正使用它。

让我们启动一个启用了嵌套的 Ubuntu 16.04 容器：

```
lxc launch ubuntu-daily:16.04 c1 -c security.nesting=true
```

你也可以在一个已有的容器上设置 `security.nesting`：

```
lxc config set <container name> security.nesting true
```

或者对所有的容器使用一个指定的配置文件：

```
lxc profile set <profile name> security.nesting true
```

容器启动后，你可以从容器内部得到一个 shell，配置 LXD 并生成一个容器：

```
stgraber@dakara:~$ lxc launch ubuntu-daily:16.04 c1 -c security.nesting=true
Creating c1
Starting c1

stgraber@dakara:~$ lxc exec c1 bash
root@c1:~# lxd init
Name of the storage backend to use (dir or zfs): dir

We detected that you are running inside an unprivileged container.
This means that unless you manually configured your host otherwise,
you will not have enough uid and gid to allocate to your containers.

LXD can re-use your container's own allocation to avoid the problem.
Doing so makes your nested containers slightly less safe as they could
in theory attack their parent container and gain more privileges than
they otherwise would.

Would you like to have your containers share their parent's allocation (yes/no)? yes
Would you like LXD to be available over the network (yes/no)? no
Do you want to configure the LXD bridge (yes/no)? yes
Warning: Stopping lxd.service, but it can still be activated by:
 lxd.socket
LXD has been successfully configured.

root@c1:~# lxc launch ubuntu:14.04 trusty
Generating a client certificate. This may take a minute...
If this is your first time using LXD, you should also run: sudo lxd init

Creating trusty
Retrieving image: 100%
Starting trusty

root@c1:~# lxc list
+--------+---------+-----------------------+----------------------------------------------+------------+-----------+
|  NAME  |  STATE  |         IPV4          |                     IPV6                     |    TYPE    | SNAPSHOTS |
+--------+---------+-----------------------+----------------------------------------------+------------+-----------+
| trusty | RUNNING | 10.153.141.124 (eth0) | fd7:f15d:d1d6:da14:216:3eff:fef1:4002 (eth0) | PERSISTENT | 0         |
+--------+---------+-----------------------+----------------------------------------------+------------+-----------+
root@c1:~#
```

就是这样简单。

### 在线演示服务器

因为这篇文章很短，我想我会花一点时间谈论我们运行中的[演示服务器][2]。我们今天早些时候刚刚达到了 10000 个会话！

这个服务器基本上只是一个运行在一个相当强大的虚拟机上的正常的 LXD，一个小型的守护进程实现了我们的网站所使用的 REST API。

当你接受服务条款时，将为你创建一个新的 LXD 容器，并启用 `security.nesting`，如上所述。接着你就像使用 `lxc exec` 时一样连接到了那个容器，除了我们使用 websockets 和 javascript 来做这些。

你在此环境中创建的容器都是嵌套的 LXD 容器。如果你想，你可以进一步地嵌套。

我们全范围地使用了 [LXD 资源限制][3]，以防止一个用户的行为影响其他用户，并仔细监控服务器的任何滥用迹象。

如果你想运行自己的类似的服务器，你可以获取我们的网站和守护进程的代码：

```
git clone https://github.com/lxc/linuxcontainers.org
git clone https://github.com/lxc/lxd-demo-server
```

### 额外信息

LXD 的主站在: <https://linuxcontainers.org/lxd>

LXD 的 GitHub 仓库: <https://github.com/lxc/lxd>

LXD 的邮件列表: <https://lists.linuxcontainers.org>

LXD 的 IRC 频道: #lxcontainers on irc.freenode.net


--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/04/14/lxd-2-0-lxd-in-lxd-812/

作者：[Stéphane Graber][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://linux.cn/article-8235-1.html
[2]: https://linuxcontainers.org/lxd/try-it/
[3]: https://www.stgraber.org/2016/03/26/lxd-2-0-resource-control-412/
