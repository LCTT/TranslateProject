LXD 2.0 系列（二）：安装与配置
=================================================

这是 LXD 2.0 [系列介绍文章][2]的第二篇。

![](https://linuxcontainers.org/static/img/containers.png)

### 安装篇

有很多种办法可以获得 LXD。我们推荐你配合最新版的 LXC 和 Linux 内核使用 LXD，这样就可以享受到它的全部特性。需要注意的是，我们现在也在慢慢的降低对旧版本 Linux 发布版的支持。

#### Ubuntu 标准版

所有新发布的 LXD 都会在发布几分钟后上传到 Ubuntu 开发版的安装源里。这个安装包然后就会作为 Ubuntu 用户的其他安装包源的种子。

如果使用 Ubuntu 16.04，可以直接安装：

```
sudo apt install lxd
```

如果运行的是 Ubuntu 14.04，则可以这样安装：

```
sudo apt -t trusty-backports install lxd
```

#### Ubuntu Core

使用 Ubuntu Core 稳定版的用户可以使用下面的命令安装 LXD：

```
sudo snappy install lxd.stgraber
```

#### Ubuntu 官方 PPA

使用其他 Ubuntu 发布版 —— 比如 Ubuntu 15.10 —— 的用户可以添加下面的 PPA（Personal Package Archive）来安装：

```
sudo apt-add-repository ppa:ubuntu-lxc/stable
sudo apt update
sudo apt dist-upgrade
sudo apt install lxd
```

#### Gentoo

Gentoo 已经有了最新的 LXD 包，你可以直接安装：

```
sudo emerge --ask lxd
```

#### 使用源代码安装

如果你曾经编译过 Go 语言的项目，那么从源代码编译 LXD 并不是十分困难。然而注意，你需要 LXC 的开发头文件。为了运行 LXD， 你的发布版需也要使用比较新的内核（最起码是 3.13）、比较新的 LXC （1.1.4 或更高版本）、LXCFS 以及支持用户子 uid/gid 分配的 shadow 文件。

从源代码编译 LXD 的最新教程可以在[上游 README][2]里找到。

### Ubuntu 上的网络配置

Ubuntu 的安装包会很方便的给你提供一个“lxdbr0”网桥。这个网桥默认是没有配置过的，只提供通过 HTTP 代理的 IPv6 的本地连接。

要配置这个网桥并添加 IPv4 、 IPv6 子网，你可以运行下面的命令：

```
sudo dpkg-reconfigure -p medium lxd
```

或者直接通过 LXD 初始化命令一步一步的配置：

```
sudo lxd init
```

### 存储后端

LXD 提供了几种存储后端。在开始使用 LXD 之前，你应该决定将要使用的后端，因为我们不支持在后端之间迁移已经生成的容器。

各个[后端特性比较表][3]可以在[这里][3]找到。

#### ZFS

我们的推荐是 ZFS， 因为它能支持 LXD 的全部特性，同时提供最快和最可靠的容器体验。它包括了以容器为单位的磁盘配额、即时快照和恢复、优化后的迁移（发送/接收），以及快速从镜像创建容器的能力。它同时也被认为要比 btrfs 更成熟。

要和 LXD 一起使用 ZFS ，你需要首先在你的系统上安装 ZFS。

如果你是用的是 Ubuntu 16.04 ， 你只需要简单的使用命令安装：

```
sudo apt install zfsutils-linux
```

在 Ubuntu 15.10 上你可以这样安装：

```
sudo apt install zfsutils-linux zfs-dkms
```

如果是更旧的版本，你需要从 zfsonlinux PPA 安装：

```
sudo apt-add-repository ppa:zfs-native/stable
sudo apt update
sudo apt install ubuntu-zfs
```

配置 LXD 只需要执行下面的命令：

```
sudo lxd init
```

这条命令接下来会向你提问一些 ZFS 的配置细节，然后为你配置好 ZFS。

#### btrfs

如果 ZFS 不可用，那么 btrfs 可以提供相同级别的集成，但不能正确地报告容器内的磁盘使用情况（虽然配额仍然可用）。

btrfs 同时拥有很好的嵌套属性，而这是 ZFS 所不具有的。也就是说如果你计划在 LXD 中再使用 LXD，那么 btrfs 就很值得你考虑。

使用 btrfs 的话，LXD 不需要进行任何的配置，你只需要保证 `/var/lib/lxd` 保存在 btrfs 文件系统中，然后 LXD 就会自动为你使用 btrfs 了。

#### LVM

如果 ZFS 和 btrfs 都不是你想要的，你还可以考虑使用 LVM 以获得部分特性。 LXD 会以自动精简配置的方式使用 LVM，为每个镜像和容器创建 LV，如果需要的话也会使用 LVM 的快照功能。

要配置 LXD 使用 LVM，需要创建一个 LVM 卷组，然后运行：

```
lxc config set storage.lvm_vg_name "THE-NAME-OF-YOUR-VG"
```

默认情况下 LXD 使用 ext4 作为全部逻辑卷的文件系统。如果你喜欢的话可以改成 XFS：

```
lxc config set storage.lvm_fstype xfs
```

#### 简单目录

如果上面全部方案你都不打算使用，LXD 依然能在不使用任何高级特性情况下工作。它会为每个容器创建一个目录，然后在创建每个容器时解压缩镜像的压缩包，并在容器拷贝和快照时进行一次完整的文件系统拷贝。

除了磁盘配额以外的特性都是支持的，但是很浪费磁盘空间，并且非常慢。如果你没有其他选择，这还是可以工作的，但是你还是需要认真的考虑一下上面的几个替代方案。

### 配置篇

LXD 守护进程的完整配置项列表可以在[这里找到][4]。

#### 网络配置

默认情况下 LXD 不会监听网络。和它通信的唯一办法是通过 `/var/lib/lxd/unix.socket` 使用本地 unix 套接字进行通信。

要让 LXD 监听网络，下面有两个有用的命令：

```
lxc config set core.https_address [::]
lxc config set core.trust_password some-secret-string
```

第一条命令将 LXD 绑定到 IPv6 地址 “::”，也就是监听机器的所有 IPv6 地址。你可以显式的使用一个特定的 IPv4 或者 IPv6 地址替代默认地址，如果你想绑定某个 TCP 端口（默认是 8443）的话可以在地址后面添加端口号即可。

第二条命令设置了密码，用于让远程客户端把自己添加到 LXD 可信证书中心。如果已经给主机设置了密码，当添加 LXD 主机时会提示输入密码，LXD 守护进程会保存他们的客户端证书以确保客户端是可信的，这样就不需要再次输入密码（可以随时设置和取消）。

你也可以选择不设置密码，而是人工验证每个新客户端是否可信——让每个客户端发送“client.crt”（来自于 `~/.config/lxc`）文件，然后把它添加到你自己的可信证书中心：

```
lxc config trust add client.crt
```

#### 代理配置

大多数情况下，你会想让 LXD 守护进程从远程服务器上获取镜像。

如果你处在一个必须通过 HTTP(s) 代理链接外网的环境下，你需要对 LXD 做一些配置，或保证已在守护进程的环境中设置正确的 PROXY 环境变量。

```
lxc config set core.proxy_http http://squid01.internal:3128
lxc config set core.proxy_https http://squid01.internal:3128
lxc config set core.proxy_ignore_hosts image-server.local
```

以上代码使所有 LXD 发起的数据传输都使用 squid01.internal HTTP 代理，但与在 image-server.local 的服务器的数据传输则是例外。

#### 镜像管理

LXD 使用动态镜像缓存。当从远程镜像创建容器的时候，它会自动把镜像下载到本地镜像商店，同时标志为已缓存并记录来源。几天后（默认 10 天）如果某个镜像没有被使用过，那么它就会自动地被删除。每隔几小时（默认是 6 小时）LXD 还会检查一下这个镜像是否有新版本，然后更新镜像的本地拷贝。

所有这些都可以通过下面的配置选项进行配置：

```
lxc config set images.remote_cache_expiry 5
lxc config set images.auto_update_interval 24
lxc config set images.auto_update_cached false
```

这些命令让 LXD 修改了它的默认属性，缓存期替换为 5 天，更新间隔为 24 小时，而且只更新那些标记为自动更新（–auto-update）的镜像（lxc 镜像拷贝被标记为 `–auto-update`）而不是 LXD 自动缓存的镜像。

### 总结

到这里为止，你就应该有了一个可以工作的、最新版的 LXD，现在你可以开始用 LXD 了，或者等待我们的下一篇博文，我们会在其中介绍如何创建第一个容器以及使用 LXD 命令行工具操作容器。

### 额外信息

- LXD 的主站在: <https://linuxcontainers.org/lxd>
- LXD 的 GitHub 仓库: <https://github.com/lxc/lxd>
- LXD 的邮件列表: <https://lists.linuxcontainers.org>
- LXD 的 IRC 频道: #lxcontainers on irc.freenode.net

如果你不想或者不能在你的机器上安装 LXD ，你可以[试试在线版的 LXD][1]。

--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/03/15/lxd-2-0-installing-and-configuring-lxd-212/

作者：[Stéphane Graber][a]
译者：[ezio](https://github.com/oska874)
校对：[PurlingNayuki](https://github.com/PurlingNayuki)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://linuxcontainers.org/lxd/try-it
[2]: https://github.com/lxc/lxd/blob/master/README.md
[3]: https://github.com/lxc/lxd/blob/master/doc/storage-backends.md
[4]: https://github.com/lxc/lxd/blob/master/doc/configuration.md
