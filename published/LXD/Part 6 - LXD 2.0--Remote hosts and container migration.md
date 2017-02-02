LXD 2.0 系列（六）：远程主机及容器迁移
======================================

这是 [LXD 2.0 系列介绍文章][0]的第六篇。

![](https://linuxcontainers.org/static/img/containers.png)

### 远程协议

LXD 2.0 支持两种协议:

* LXD 1.0 API：这是在客户端和 LXD 守护进程之间使用的 REST API，以及在 LXD 守护进程间复制/移动镜像和容器时使用的 REST API。
* Simplestreams：Simplestreams 协议是 LXD 客户端和守护进程使用的只读、仅针对镜像的协议，用于客户端和 LXD 守护进程获取镜像信息以及从一些公共镜像服务器（如 Ubuntu 镜像）导入镜像。

以下所有内容都将使用这两个协议中的第一个。

### 安全

LXD API 的验证是通过客户端证书在 TLS 1.2 上使用最近的密钥验证的。 当两个 LXD 守护进程必须直接交换信息时，源守护程序生成一个临时令牌，并通过客户端传输到目标守护程序。 此令牌仅可用于访问特定流，并且会被立即撤销，因此不能重新使用。

为了避免中间人攻击，客户端工具还将源服务器的证书发送到目标服务器。这意味着对于特定的下载操作，目标服务器会被提供源服务器的 URL、所需资源的一次性访问令牌以及服务器应该使用的证书。 这可以防止中间人攻击，并且只允许临时访问所传输的对象。

### 网络需求

LXD 2.0 使用这样一种模型，某个操作的目标（接收端）直接连接到源以获取数据。

这意味着你必须确保目标服务器可以直接连接到源、可以更新任何所需的防火墙。

我们有个[允许反向连接的计划][1]，允许通过客户端代理本身以应对那些严格的防火墙阻止两台主机之间通信的罕见情况。

### 与远程主机交互

LXD 使用的是“远程”的概念，而不是让我们的用户总是提供主机名或 IP 地址，然后在他们想要与远程主机交互时验证证书信息。

默认情况下，唯一真正的 LXD 远程配置是 `local:`，这也是默认的远程（所以你不必输入它的名称）。这个本地（`local:`）远程使用 LXD REST API 通过 unix 套接字与本地守护进程通信。

#### 添加一台远程主机

假设你已经有两台装有 LXD 的机器：你的本机以及远程那台我们称为“foo”的主机。

首先你需要确保“foo”正在监听网络，并设置了一个密码，以便得到一个远程 shell，运行：

```
lxc config set core.https_address [::]:8443
lxc config set core.trust_password something-secure
```

在你本地 LXD 上，你需要使它对网络可见，这样我们可以从它传输容器和镜像：

```
lxc config set core.https_address [::]:8443
```

现在已经在两端完成了守护进程的配置，你可以添加“foo”到你的本地客户端：

```
lxc remote add foo 1.2.3.4
```

（将 1.2.3.4 替换成你的 IP 或者 FQDN）

看上去像这样：

```
stgraber@dakara:~$ lxc remote add foo 2607:f2c0:f00f:2770:216:3eff:fee1:bd67
Certificate fingerprint: fdb06d909b77a5311d7437cabb6c203374462b907f3923cefc91dd5fce8d7b60
ok (y/n)? y
Admin password for foo: 
Client certificate stored at server: foo
```

你接着可以列出远端服务器，你可以在列表中看到“foo”：

```
stgraber@dakara:~$ lxc remote list
+-----------------+-------------------------------------------------------+---------------+--------+--------+
|      NAME       |                         URL                           |   PROTOCOL    | PUBLIC | STATIC |
+-----------------+-------------------------------------------------------+---------------+--------+--------+
| foo             | https://[2607:f2c0:f00f:2770:216:3eff:fee1:bd67]:8443 | lxd           | NO     | NO     |
+-----------------+-------------------------------------------------------+---------------+--------+--------+
| images          | https://images.linuxcontainers.org:8443               | lxd           | YES    | NO     |
+-----------------+-------------------------------------------------------+---------------+--------+--------+
| local (default) | unix://                                               | lxd           | NO     | YES    |
+-----------------+-------------------------------------------------------+---------------+--------+--------+
| ubuntu          | https://cloud-images.ubuntu.com/releases              | simplestreams | YES    | YES    |
+-----------------+-------------------------------------------------------+---------------+--------+--------+
| ubuntu-daily    | https://cloud-images.ubuntu.com/daily                 | simplestreams | YES    | YES    |
+-----------------+-------------------------------------------------------+---------------+--------+--------+
```

#### 与它交互

好了，所以我们已经有了一台定义好的远程服务器，我们现在可以做些什么？

现在，就如你看到的，唯一的不同是你必须告诉 LXD 要哪台主机运行。

比如：

```
lxc launch ubuntu:14.04 c1
```

它会在默认主机（`lxc remote get-default`），也就是你的本机上运行。

```
lxc launch ubuntu:14.04 foo:c1
```

这个会在 foo 上运行。

列出远程主机正在运行的容器可以这么做：

```
stgraber@dakara:~$ lxc list foo:
+------+---------+---------------------+-----------------------------------------------+------------+-----------+
| NAME |  STATE  |         IPV4        |                     IPV6                      |    TYPE    | SNAPSHOTS |
+------+---------+---------------------+-----------------------------------------------+------------+-----------+
| c1   | RUNNING | 10.245.81.95 (eth0) | 2607:f2c0:f00f:2770:216:3eff:fe43:7994 (eth0) | PERSISTENT | 0         |
+------+---------+---------------------+-----------------------------------------------+------------+-----------+
```

你要记住的一件事是你需要在远程主机上同时指定镜像和容器。因此如果你在“foo”上有一个“my-image”的镜像，并且希望从它创建一个“c2”的容器，你需要运行：

```
lxc launch foo:my-image foo:c2
```

最后，就如你希望的那样得到一个远程容器的 shell：

```
lxc exec foo:c1 bash
```

#### 复制容器

在两台主机间复制容器就如它听上去那样简单：

```
lxc copy foo:c1 c2
```

你会有一个新的从远程“c1”复制过来的本地“c2”容器。这需要停止“c1”容器，但是你可以在运行的时候只复制一个快照：

```
lxc snapshot foo:c1 current
lxc copy foo:c1/current c3
```

#### 移动容器

除非你在做实时迁移（将会在之后的文章中讲到），不然你需要在移动前先停止容器，接着就会如你预料的那样。

```
lxc stop foo:c1
lxc move foo:c1 local:
```

这个例子等同于：

```
lxc stop foo:c1
lxc move foo:c1 c1
```

### 这些如何工作

正如你期望的那样, 与远程容器的交互时 LXD 使用的 REST API 并不是通过本地 Unix 套接字，而是通过 HTTPS 传输。

当两个守护程序之间交互时会变得有些棘手，如复制和移动的情况。

在这种情况下会发生：

1. 用户运行`lxc move foo：c1 c1`。
2. 客户端联系 `local:` 远程以检查是否现有“c1”容器。
3. 客户端从“foo”获取容器信息。
4. 客户端从源“foo”守护程序请求迁移令牌。
5. 客户端将迁移令牌以及源 URL 和“foo”的证书发送到本地 LXD 守护程序以及容器配置和周围设备。
6. 然后本地 LXD 守护程序使用提供的令牌直接连接到“foo”
	a) 它连接到第一个控制 websocket
  	b) 它协商文件系统传输协议（zfs 发送/接收，btrfs 发送/接收或者纯 rsync）
  	c) 如果在本地可用，它会解压用于创建源容器的镜像。这是为了避免不必要的数据传输。
  	d) 然后它会将容器及其任何快照作为增量传输。
7. 如果成功，客户端会命令“foo”删除源容器。

### 在线尝试

没有两台机器来尝试远端交互和复制/移动容器？

没有问题，你可以使用我们的 [demo 服务][2]。这里甚至还包括了一步步的指导！

### 额外信息

LXD 的主站在: <https://linuxcontainers.org/lxd>

LXD 的 GitHub 仓库: <https://github.com/lxc/lxd>

LXD 的邮件列表: <https://lists.linuxcontainers.org>

LXD 的 IRC 频道: #lxcontainers on irc.freenode.net


--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/04/12/lxd-2-0-remote-hosts-and-container-migration-612/

作者：[Stéphane Graber][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://github.com/lxc/lxd/issues/553
[2]: https://linuxcontainers.org/lxd/try-it/
