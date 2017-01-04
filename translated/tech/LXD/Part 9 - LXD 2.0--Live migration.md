LXD 2.0 系列（九）：实时迁移
======================================

这是 [LXD 2.0 系列介绍文章][0]的第九篇。

![](https://linuxcontainers.org/static/img/containers.png)

### 介绍

LXD 2.0中的有一个尽管是实验性质的但非常令人兴奋的功能，那就是支持容器检查点和恢复。

简单地说，检查点/恢复意味着正在运行的容器状态可以被序列化到磁盘，然后在与容器状态快照相同的主机上或者在等同于实时迁移的另一主机上恢复。

### 要求

要访问容器实时迁移和有状态快照，你需要以下条件：

- 一个最近的Linux内核，4.4或更高版本。
- CRIU 2.0，可能有一些cherry-pick的提交，具体取决于你确切的内核配置。
- 直接在主机上运行LXD。 不能在容器嵌套下使用这些功能。
- 对于迁移，目标机器必须至少实现源的指令集，目标内核必须至少提供与源相同的系统调用，并且在源上挂载的任何内核文件系统也必须可挂载到目标主机上。

Ubuntu 16.04 LTS已经提供了所有需要的依赖，在这种情况下，您只需要安装CRIU本身：

```
apt install criu
```

### 使用CRIU

#### 有状态快照

一个普通的快照看上去像这样：

```
stgraber@dakara:~$ lxc snapshot c1 first
stgraber@dakara:~$ lxc info c1 | grep first
 first (taken at 2016/04/25 19:35 UTC) (stateless)
 ```
 
一个有状态快照看上去像这样：

```
stgraber@dakara:~$ lxc snapshot c1 second --stateful
stgraber@dakara:~$ lxc info c1 | grep second
 second (taken at 2016/04/25 19:36 UTC) (stateful)
 ```
 
这意味着所有容器运行时状态都被序列化到磁盘并且作为了快照的一部分。就像你还原无状态快照那样还原一个有状态快照：

```
stgraber@dakara:~$ lxc restore c1 second
stgraber@dakara:~$
```

#### 有状态快照的停止/启动

比方说你想要升级内核或者其他类似的维护。与其等待所有的容器启动，你可以：

```
stgraber@dakara:~$ lxc stop c1 --stateful
```

容器状态将会写入到磁盘，会在下次启动时读取。

你甚至可以看到像下面那样的状态：

```
root@dakara:~# tree /var/lib/lxd/containers/c1/rootfs/state/
/var/lib/lxd/containers/c1/rootfs/state/
├── cgroup.img
├── core-101.img
├── core-102.img
├── core-107.img
├── core-108.img
├── core-109.img
├── core-113.img
├── core-114.img
├── core-122.img
├── core-125.img
├── core-126.img
├── core-127.img
├── core-183.img
├── core-1.img
├── core-245.img
├── core-246.img
├── core-50.img
├── core-52.img
├── core-95.img
├── core-96.img
├── core-97.img
├── core-98.img
├── dump.log
├── eventfd.img
├── eventpoll.img
├── fdinfo-10.img
├── fdinfo-11.img
├── fdinfo-12.img
├── fdinfo-13.img
├── fdinfo-14.img
├── fdinfo-2.img
├── fdinfo-3.img
├── fdinfo-4.img
├── fdinfo-5.img
├── fdinfo-6.img
├── fdinfo-7.img
├── fdinfo-8.img
├── fdinfo-9.img
├── fifo-data.img
├── fifo.img
├── filelocks.img
├── fs-101.img
├── fs-113.img
├── fs-122.img
├── fs-183.img
├── fs-1.img
├── fs-245.img
├── fs-246.img
├── fs-50.img
├── fs-52.img
├── fs-95.img
├── fs-96.img
├── fs-97.img
├── fs-98.img
├── ids-101.img
├── ids-113.img
├── ids-122.img
├── ids-183.img
├── ids-1.img
├── ids-245.img
├── ids-246.img
├── ids-50.img
├── ids-52.img
├── ids-95.img
├── ids-96.img
├── ids-97.img
├── ids-98.img
├── ifaddr-9.img
├── inetsk.img
├── inotify.img
├── inventory.img
├── ip6tables-9.img
├── ipcns-var-10.img
├── iptables-9.img
├── mm-101.img
├── mm-113.img
├── mm-122.img
├── mm-183.img
├── mm-1.img
├── mm-245.img
├── mm-246.img
├── mm-50.img
├── mm-52.img
├── mm-95.img
├── mm-96.img
├── mm-97.img
├── mm-98.img
├── mountpoints-12.img
├── netdev-9.img
├── netlinksk.img
├── netns-9.img
├── netns-ct-9.img
├── netns-exp-9.img
├── packetsk.img
├── pagemap-101.img
├── pagemap-113.img
├── pagemap-122.img
├── pagemap-183.img
├── pagemap-1.img
├── pagemap-245.img
├── pagemap-246.img
├── pagemap-50.img
├── pagemap-52.img
├── pagemap-95.img
├── pagemap-96.img
├── pagemap-97.img
├── pagemap-98.img
├── pages-10.img
├── pages-11.img
├── pages-12.img
├── pages-13.img
├── pages-1.img
├── pages-2.img
├── pages-3.img
├── pages-4.img
├── pages-5.img
├── pages-6.img
├── pages-7.img
├── pages-8.img
├── pages-9.img
├── pipes-data.img
├── pipes.img
├── pstree.img
├── reg-files.img
├── remap-fpath.img
├── route6-9.img
├── route-9.img
├── rule-9.img
├── seccomp.img
├── sigacts-101.img
├── sigacts-113.img
├── sigacts-122.img
├── sigacts-183.img
├── sigacts-1.img
├── sigacts-245.img
├── sigacts-246.img
├── sigacts-50.img
├── sigacts-52.img
├── sigacts-95.img
├── sigacts-96.img
├── sigacts-97.img
├── sigacts-98.img
├── signalfd.img
├── stats-dump
├── timerfd.img
├── tmpfs-dev-104.tar.gz.img
├── tmpfs-dev-109.tar.gz.img
├── tmpfs-dev-110.tar.gz.img
├── tmpfs-dev-112.tar.gz.img
├── tmpfs-dev-114.tar.gz.img
├── tty.info
├── unixsk.img
├── userns-13.img
└── utsns-11.img

0 directories, 154 files
```

还原容器也很简单：

```
stgraber@dakara:~$ lxc start c1
```

### 实时迁移

实时迁移基本上与上面的有状态快照的停止/启动相同，除了容器目录和配置被移动到另一台机器上。

```
stgraber@dakara:~$ lxc list c1
+------+---------+-----------------------+----------------------------------------------+------------+-----------+
| NAME |  STATE  |          IPV4         |                     IPV6                     |    TYPE    | SNAPSHOTS |
+------+---------+-----------------------+----------------------------------------------+------------+-----------+
| c1   | RUNNING | 10.178.150.197 (eth0) | 2001:470:b368:4242:216:3eff:fe19:27b0 (eth0) | PERSISTENT | 2         |
+------+---------+-----------------------+----------------------------------------------+------------+-----------+

stgraber@dakara:~$ lxc list s-tollana:
+------+-------+------+------+------+-----------+
| NAME | STATE | IPV4 | IPV6 | TYPE | SNAPSHOTS |
+------+-------+------+------+------+-----------+

stgraber@dakara:~$ lxc move c1 s-tollana:

stgraber@dakara:~$ lxc list c1
+------+-------+------+------+------+-----------+
| NAME | STATE | IPV4 | IPV6 | TYPE | SNAPSHOTS |
+------+-------+------+------+------+-----------+

stgraber@dakara:~$ lxc list s-tollana:
+------+---------+-----------------------+----------------------------------------------+------------+-----------+
| NAME |  STATE  |          IPV4         |                     IPV6                     |    TYPE    | SNAPSHOTS |
+------+---------+-----------------------+----------------------------------------------+------------+-----------+
| c1   | RUNNING | 10.178.150.197 (eth0) | 2001:470:b368:4242:216:3eff:fe19:27b0 (eth0) | PERSISTENT | 2         |
+------+---------+-----------------------+----------------------------------------------+------------+-----------+
```

### 限制

正如我之前说的，容器的检查点/恢复还是非常新的功能，我们还在努力地开发这个功能、修复问题已知问题。我们确实需要更多的人来尝试这个功能，并给我们反馈，但我不建议在生产中使用这个功能。

我们跟踪的问题列表在[Launchpad上][1]。

我们期望在Ubuntu 16.04上有一个基本的带有几个服务的Ubuntu容器能够与CRIU一起工作。然而在更复杂的容器、使用设备传递、复杂的网络服务或特殊的存储配置可能会失败。

只要有可能，CRIU会在转储时失败，而不是在恢复时。在这种情况下，源容器将继续运行，快照或迁移将会失败，并生成一个日志文件用于调试。

在极少数情况下，CRIU无法恢复容器，在这种情况下，源容器仍然存在但将被停止，并且必须手动重新启动。

### 发送bug报告

我们正在跟踪Launchpad上关于CRIU Ubuntu软件包的检查点/恢复相关的错误。大多数修复bug工作是在上游的CRIU或Linux内核上，但是这种方式我们更容易跟踪。

要提交新的bug报告，请看这里。

请务必包括：

你运行的命令和显示给你的错误消息

- “lxc info”的输出（*）
- “lxc info <container name>”的输出
- “lxc config show -expanded <container name>”的输出
- “dmesg”（*）的输出
- “/proc/self/mountinfo”的输出（*）
- “lxc exec <container name> - cat /proc/self/mountinfo”的输出
- “uname -a”（*）的输出
- /var/log/lxd.log（*）的内容
- /etc/default/lxd-bridge（*）的内容
- /var/log/lxd/<container name>/ 的tarball（*）

如果报告迁移错误，而不是状态快照或有状态停止错误，请将上面所有含有（*）标记的源与目标主机的信息发来。

### 额外信息

CRIU 的网站在: <https://criu.org>

LXD 的主站在: <https://linuxcontainers.org/lxd>

LXD 的 GitHub 仓库: <https://github.com/lxc/lxd>

LXD 的邮件列表: <https://lists.linuxcontainers.org>

LXD 的 IRC 频道: #lxcontainers on irc.freenode.net


--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/03/19/lxd-2-0-your-first-lxd-container-312/

作者：[Stéphane Graber][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://bugs.launchpad.net/ubuntu/+source/criu/+bugs
[3]: https://launchpad.net/ubuntu/+source/criu/+filebug?no-redirect
