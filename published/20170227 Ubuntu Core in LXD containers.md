使用 LXD 容器运行 Ubuntu Core
============================================================

![LXD logo](https://linuxcontainers.org/static/img/containers.png)

### Ubuntu Core 是什么？

Ubuntu Core 是完全基于 snap 包构建，并且完全事务化的 Ubuntu 版本。

该系统大部分是只读的，所有已安装的应用全部来自 snap 包，完全使用事务化更新。这意味着不管在系统更新还是安装软件的时候遇到问题，整个系统都可以回退到之前的状态并且记录这个错误。

最新版是在 2016 年 11 月发布的 Ubuntu Core 16。

注意，Ubuntu Core 限制只能够安装 snap 包（而非 “传统” 软件包），并且有相当数量的 snap 包在当前环境下不能正常运行，或者需要人工干预（创建用户和用户组等）才能正常运行。随着新版的 snapd  和 “core” snap 包发布，Ubuntu Core 每周都会得到改进。

### 环境需求

就 LXD 而言，Ubuntu Core 仅仅相当于另一个 Linux 发行版。也就是说，snapd 需要挂载无特权的 FUSE 和 AppArmor 命名空间以及软件栈，像下面这样：

*   一个新版的使用 Ubuntu 官方内核的系统
*   一个新版的 LXD

### 创建一个 Ubuntu Core 容器

当前 Ubuntu Core 镜像发布在社区的镜像服务器。你可以像这样启动一个新的容器：

```
stgraber@dakara:~$ lxc launch images:ubuntu-core/16 ubuntu-core
Creating ubuntu-core
Starting ubuntu-core
```

这个容器启动需要一点点时间，它会先执行第一阶段的加载程序，加载程序会确定使用哪一个镜像（镜像是只读的），并且在系统上设置一个可读层，你不要在这一阶段中断容器执行，这个时候什么都没有，所以执行 `lxc exec` 将会出错。

几秒钟之后，执行 `lxc list` 将会展示容器的 IP 地址，这表明已经启动了 Ubuntu Core：

```
stgraber@dakara:~$ lxc list
+-------------+---------+----------------------+----------------------------------------------+------------+-----------+
|     NAME    |  STATE  |          IPV4        |                      IPV6                    |    TYPE    | SNAPSHOTS |
+-------------+---------+----------------------+----------------------------------------------+------------+-----------+
| ubuntu-core | RUNNING | 10.90.151.104 (eth0) | 2001:470:b368:b2b5:216:3eff:fee1:296f (eth0) | PERSISTENT | 0         |
+-------------+---------+----------------------+----------------------------------------------+------------+-----------+
```

之后你就可以像使用其他的交互一样和这个容器进行交互：

```
stgraber@dakara:~$ lxc exec ubuntu-core bash
root@ubuntu-core:~# snap list
Name       Version     Rev  Developer  Notes
core       16.04.1     394  canonical  -
pc         16.04-0.8   9    canonical  -
pc-kernel  4.4.0-45-4  37   canonical  -
root@ubuntu-core:~#
```

### 更新容器

如果你一直关注着 Ubuntu Core 的开发，你应该知道上面的版本已经很老了。这是因为被用作 Ubuntu LXD 镜像的代码每隔几个月才会更新。Ubuntu Core 系统在重启时会检查更新并进行自动更新（更新失败会回退）。

如果你想现在强制更新，你可以这样做：

```
stgraber@dakara:~$ lxc exec ubuntu-core bash
root@ubuntu-core:~# snap refresh
pc-kernel (stable) 4.4.0-53-1 from 'canonical' upgraded
core (stable) 16.04.1 from 'canonical' upgraded
root@ubuntu-core:~# snap version
snap 2.17
snapd 2.17
series 16
root@ubuntu-core:~#
```

然后重启一下 Ubuntu Core 系统，然后看看 snapd 的版本。

```
root@ubuntu-core:~# reboot
root@ubuntu-core:~# 

stgraber@dakara:~$ lxc exec ubuntu-core bash
root@ubuntu-core:~# snap version
snap 2.21
snapd 2.21
series 16
root@ubuntu-core:~#
```

你也可以像下面这样查看所有 snapd 的历史记录：

```
stgraber@dakara:~$ lxc exec ubuntu-core snap changes
ID  Status  Spawn                 Ready                 Summary
1   Done    2017-01-31T05:14:38Z  2017-01-31T05:14:44Z  Initialize system state
2   Done    2017-01-31T05:14:40Z  2017-01-31T05:14:45Z  Initialize device
3   Done    2017-01-31T05:21:30Z  2017-01-31T05:22:45Z  Refresh all snaps in the system
```

### 安装 Snap 软件包

以一个最简单的例子开始，经典的 Hello World：

```
stgraber@dakara:~$ lxc exec ubuntu-core bash
root@ubuntu-core:~# snap install hello-world
hello-world 6.3 from 'canonical' installed
root@ubuntu-core:~# hello-world
Hello World!
```

接下来让我们看一些更有用的：

```
stgraber@dakara:~$ lxc exec ubuntu-core bash
root@ubuntu-core:~# snap install nextcloud
nextcloud 11.0.1snap2 from 'nextcloud' installed
```

之后通过 HTTP 访问你的容器就可以看到刚才部署的 Nextcloud 实例。

如果你想直接通过 git 测试最新版 LXD，你可以这样做：

```
stgraber@dakara:~$ lxc config set ubuntu-core security.nesting true
stgraber@dakara:~$ lxc exec ubuntu-core bash
root@ubuntu-core:~# snap install lxd --edge
lxd (edge) git-c6006fb from 'canonical' installed
root@ubuntu-core:~# lxd init
Name of the storage backend to use (dir or zfs) [default=dir]: 

We detected that you are running inside an unprivileged container.
This means that unless you manually configured your host otherwise,
you will not have enough uid and gid to allocate to your containers.

LXD can re-use your container's own allocation to avoid the problem.
Doing so makes your nested containers slightly less safe as they could
in theory attack their parent container and gain more privileges than
they otherwise would.

Would you like to have your containers share their parent's allocation (yes/no) [default=yes]? 
Would you like LXD to be available over the network (yes/no) [default=no]? 
Would you like stale cached images to be updated automatically (yes/no) [default=yes]? 
Would you like to create a new network bridge (yes/no) [default=yes]? 
What should the new bridge be called [default=lxdbr0]? 
What IPv4 address should be used (CIDR subnet notation, “auto” or “none”) [default=auto]? 
What IPv6 address should be used (CIDR subnet notation, “auto” or “none”) [default=auto]? 
LXD has been successfully configured.
```

已经设置过的容器不能回退版本，但是可以在 Ubuntu Core 16 中运行另一个 Ubuntu Core 16 容器：

```
root@ubuntu-core:~# lxc launch images:ubuntu-core/16 nested-core
Creating nested-core
Starting nested-core 
root@ubuntu-core:~# lxc list
+-------------+---------+---------------------+-----------------------------------------------+------------+-----------+
|    NAME     |  STATE  |         IPV4        |                       IPV6                    |    TYPE    | SNAPSHOTS |
+-------------+---------+---------------------+-----------------------------------------------+------------+-----------+
| nested-core | RUNNING | 10.71.135.21 (eth0) | fd42:2861:5aad:3842:216:3eff:feaf:e6bd (eth0) | PERSISTENT | 0         |
+-------------+---------+---------------------+-----------------------------------------------+------------+-----------+
```

### 写在最后

如果你只是想试用一下 Ubuntu Core，这是一个不错的方法。对于 snap 包开发者来说，这也是一个不错的工具来测试你的 snap 包能否在不同的环境下正常运行。

如果你希望你的系统总是最新的，并且整体可复制，Ubuntu Core 是一个很不错的方案，不过这也会带来一些相应的限制，所以可能不太适合你。

最后是一个警告，对于测试来说，这些镜像是足够的，但是当前并没有被正式的支持。在不久的将来，官方的 Ubuntu server 可以完整的支持 Ubuntu Core LXD 镜像。

### 附录

- LXD 主站：[https://linuxcontainers.org/lxd][2]
- Github：[https://github.com/lxc/lxd][3]
- 邮件列表：[https://lists.linuxcontainers.org][4]
- IRC：#lxcontainers on irc.freenode.net
- 在线试用：[https://linuxcontainers.org/lxd/try-it][5]

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2017/02/27/ubuntu-core-in-lxd-containers/

作者：[Stéphane Graber][a]
译者：[aiwhj](https://github.com/aiwhj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/stgraber/
[1]:https://insights.ubuntu.com/author/stgraber/
[2]:https://linuxcontainers.org/lxd
[3]:https://github.com/lxc/lxd
[4]:https://lists.linuxcontainers.org/
[5]:https://linuxcontainers.org/lxd/try-it
