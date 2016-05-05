translating by ezio

Part 2 - LXD 2.0: 安装与配置 
=================================================

这是 LXD 2.0 [系列介绍文章][2]的第二篇。

![](https://linuxcontainers.org/static/img/containers.png)

### 安装篇

获得 LXD 有很多种办法。我们推荐你是用配合最新版的 LXC 和 Linux 内核使用 LXD，这样就可以享受到它的全部特性，但是注意，我们现在也在慢慢的降低对旧版本 Linux 发布版的支持。

#### Ubuntu 标准版

所有新发布的 LXD 都会在发布几分钟后上传到 Ubuntu 开发版的安装源里。这个安装包然后就会当作种子给全部其他的安装包源，供 Ubuntu 用户使用。

如果使用 Ubuntu 16.04 则可以直接安装：

```
sudo apt install lxd
```

如果运行的是 Ubuntu 14.04，可以这样安装：

```
sudo apt -t trusty-backports install lxd
```

#### Ubuntu Core

使用Ubuntu Core 稳定版的用户可以使用下面的命令安装 LXD：

```
sudo snappy install lxd.stgraber
```

#### ubuntu 官方 PPA

是哟个其他 Ubuntu 发布版 —— 比如 Ubuntu 15.10 —— 的用户可以添加下面的 PPA (Personal Package Archive) 来安装：

```
sudo apt-add-repository ppa:ubuntu-lxc/stable
sudo apt update
sudo apt dist-upgrade
sudo apt install lxd
```

#### Gentoo

Gentoo 已经有了最新的 LXD 安装包，你可以直接安装：

```
sudo emerge --ask lxd
```

#### 源代码

如果你曾经编译过 Go 工程，那么从源代码编译 LXD 并不是十分困难。然而要住你的是你需要 LXC 的开发头文件。为了运行 LXD ， 你的 发布版铜须也需要使用比较新的内核（最起码是 3.13），比较新的 LXC （1.1.4 或更高版本） ，LXCFS 以及支持用户子 uid/gid 分配的 shadow 。

从源代码编译 LXD 的最新指令可以在[上游 README][2]里找到。

### ubuntu 上的网络配置

Ubuntu 的安装包会很方便的给你提供一个 "lxdbr0" 网桥。这个网桥默认是没有配置过的，只提供通过 HTTP 代理的 IPV6 的本地连接。

要配置这个网桥和添加 IPV4 、 IPV6 子网，你可以运行下面的命令：

```
sudo dpkg-reconfigure -p medium lxd
```

或者直接通过 LXD 初始化命令一步一步的配置：

```
sudo lxd init
```

### 存储系统

LXD 提供了集中存储后端。在开始使用 LXD 之前，你最好直到自己想要的后端，因为我们不支持在后端之间迁移已经生成的容器。

各个[后端特性的比较表格][3]可以在这里找到。

#### ZFS

我们的推荐是 ZFS ， 因为他能支持 LXD 的全部特性，同时提供最快和最可靠的容器体验。它包括了以容器为单位的磁盘配额，直接快照和恢复，优化了的迁移（发送/接收），以及快速从镜像创建容器。它同时也被认为要比 btrfs 更成熟。

要和 LXD 一起使用 ZFS ，你需要首先在你的系统上安装 ZFS。

如果你是用的是 Ubuntu 16.04 ， 你只需要简单的使用命令安装：

```
sudo apt install zfsutils-linux
```

在 Ubuntu 15.10 上你可以这样安装：

```
sudo apt install zfsutils-linux zfs-dkms
```

如果是更旧的版本，你需要这样安装：

```
sudo apt-add-repository ppa:zfs-native/stable
sudo apt update
sudo apt install ubuntu-zfs
```

配置 LXD 只需要简单的执行下面的命令：

```
sudo lxd init
```

这条命令接下来会想你提问一下你想要的 ZFS 的配置，然后为你配置好 ZFS 。

#### btrfs

如果 ZFS 不可用，那么 btrfs 可以提供相同级别的集成，除了不会合理的报告容器内的磁盘使用情况（虽然配额还是可以用的）。

btrfs 同时拥有很好的嵌套属性，而这时 ZFS 所不具有的。也就是说如果你计划在 LXD 中再使用 LXD ，那么 btrfs 就很值得你考虑一下。

使用 btrfs 的话，LXD 不需要进行任何的配置，你只需要保证 `/var/lib/lxd` 是保存在 btrfs 文件系统中，然后 LXD 就会自动为你使用 btrfs 了。

#### LVM

如果 ZFS 和 btrfs 都不是你想要的，你仍然可以考虑使用 LVM。 LXD 会以自动精简配置的方式使用 LVM，为每个镜像和容器创建 LV，如果需要的话也会使用 LVM 的快照功能。

要配置 LXD 使用 LVM，需要创建一个 LVM 的 VG ，然后运行：


```
lxc config set storage.lvm_vg_name "THE-NAME-OF-YOUR-VG"
```

默认情况下 LXD 使用 ext4 作为全部 LV 的文件系统。如果你喜欢的话可以改成 XFS：

```
lxc config set storage.lvm_fstype xfs
```

#### 简单目录

如果上面全部方案你都不打算使用， LXD 还可以工作，但是不会使用任何高级特性。它只会为每个容器创建一个目录，然后在创建每个容器时解压缩镜像的压缩包，在容器拷贝和快照时会进行一次完整的文件系统拷贝。

除了磁盘配额以外的特性都是支持的，但是很浪费磁盘空间，并且非常慢。如果你没有其他选择，这还是可以工作的，但是你还是需要认真的考虑一下上面的几个方案。

### 配置篇

LXD 守护进程的完整配置项列表可以在[这里找到][4]。

#### 网络配置

默认情况下 LXD 不会监听网络。和它通信的唯一办法是使用本地 unix socket 通过 `/var/lib/lxd/unix.socket` 进行通信。

要让 LXD 监听网络，下面有两个有用的命令：

```
lxc config set core.https_address [::]
lxc config set core.trust_password some-secret-string
```

第一条命令将 LXD 绑定到 IPV6 地址 “::”，也就是监听机器的所有 IPV6 地址。你可以显式的使用一个特定的 IPV4 或者 IPV6 地址替代默认地址，如果你想绑定 TCP 端口（默认是 8443）的话可以在地址后面添加端口号即可。

第二条命令设置了密码，可以让远程客户端用来把自己添加到 LXD 可信证书中心。如果已经给主机设置了密码，当添加 LXD 主机时会提示输入密码，  LXD 守护进程会保存他们的客户端的证书以确保客户端是可信的，这样就不需要再次输入密码（可以随时设置和取消）

你也可以选择不设置密码，然后通过给每个客户端发送 "client.crt" （来自于 `~/.config/lxc`）文件，然后把它添加到你自己的可信中信来实现人工验证每个新客户端是否可信，可以使用下面的命令：

```
lxc config trust add client.crt
```

#### 代理配置

In most setups, you’ll want the LXD daemon to fetch images from remote servers.

If you are in an environment where you must go through a HTTP(s) proxy to reach the outside world, you’ll want to set a few configuration keys or alternatively make sure that the standard PROXY environment variables are set in the daemon’s environment.

```
lxc config set core.proxy_http http://squid01.internal:3128
lxc config set core.proxy_https http://squid01.internal:3128
lxc config set core.proxy_ignore_hosts image-server.local
```

With those, all transfers initiated by LXD will use the squid01.internal HTTP proxy, except for traffic to the server at image-server.local

#### 镜像管理

LXD does dynamic image caching. When instructed to create a container from a remote image, it will download that image into its image store, mark it as cached and record its origin. After a number of days without seeing any use (10 by default), the image is automatically removed. Every few hours (6 by default), LXD also goes looking for a newer version of the image and updates its local copy.

All of that can be configured through the following configuration options:

```
lxc config set images.remote_cache_expiry 5
lxc config set images.auto_update_interval 24
lxc config set images.auto_update_cached false
```

Here we are instructing LXD to override all of those defaults and instead cache images for up to 5 days since they were last used, look for image updates every 24 hours and only update images which were directly marked as such (–auto-update flag in lxc image copy) but not the images which were automatically cached by LXD.

### 总结

At this point you should have a working version of the latest LXD release, you can now start playing with it on your own or wait for the next blog post where we’ll create our first container and play with the LXD command line tool.

### 额外信息

LXD 的主站在: <https://linuxcontainers.org/lxd>

LXD 的 GitHub 仓库: <https://github.com/lxc/lxd>

LXD 的邮件列表: <https://lists.linuxcontainers.org>

LXD 的 IRC 频道: #lxcontainers on irc.freenode.net

如果你不想或者不能在你的机器上安装 LXD ，你可以[试试在线版的 LXD][1] 。

--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/03/19/lxd-2-0-your-first-lxd-container-312/

作者：[Stéphane Graber][a]
译者：[ezio](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://linuxcontainers.org/lxd/try-it
[2]: https://github.com/lxc/lxd/blob/master/README.md
[3]: https://github.com/lxc/lxd/blob/master/doc/storage-backends.md
[4]: https://github.com/lxc/lxd/blob/master/doc/configuration.md
