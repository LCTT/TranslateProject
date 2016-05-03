translating by ezio

Part 2 - LXD 2.0: 安装与配置 
=================================================

这是 LXD 2.0 [系列介绍文章][2]的第二篇。

![](https://linuxcontainers.org/static/img/containers.png)

### 安装篇

There are many ways to get the latest and greatest LXD. We recommend you use LXD with the latest LXC and Linux kernel to benefit from all its features but we try to degrade gracefully where possible to support older Linux distributions.

#### Ubuntu 标准版

All new releases of LXD get uploaded to the Ubuntu development release within a few minutes of the upstream release. That package is then used to seed all the other source of packages for Ubuntu users.

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

Building LXD from source isn’t very difficult if you are used to building Go projects. Note however that you will need the LXC development headers. In order to run LXD, your distribution also needs a recent Linux kernel (3.13 at least), recent LXC (1.1.5 or higher), LXCFS and a version of shadow that supports user sub-uid/gid allocations.

The latest instructions on building LXD from source can be found in the [upstream README][2].

### ubuntu 上的网络配置

The Ubuntu packages provide you with a “lxdbr0” bridge as a convenience. This bridge comes unconfigured by default, offering only IPv6 link-local connectivity through an HTTP proxy.

To reconfigure the bridge and add some IPv4 or IPv6 subnet to it, you can run:

```
sudo dpkg-reconfigure -p medium lxd
```

Or go through the whole LXD step by step setup (see below) with:

```
sudo lxd init
```

### 存储系统

LXD supports a number of storage backends. It’s best to know what backend you want to use prior to starting to use LXD as we do not support moving existing containers or images between backends.

A feature comparison table of the different backends can be found [here][3].

#### ZFS

Our recommendation is ZFS as it supports all the features LXD needs to offer the fastest and most reliable container experience. This includes per-container disk quotas, immediate snapshot/restore, optimized migration (send/receive) and instant container creation from an image. It is also considered more mature than btrfs.


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

This will ask you a few questions about what kind of zfs configuration you’d like for your LXD and then configure it for you.

#### btrfs

If ZFS isn’t available, then btrfs offers the same level of integration with the exception that it doesn’t properly report disk usage inside the container (quotas do apply though).
btrfs also has the nice property that it can nest properly which ZFS doesn’t yet. That is, if you plan on using LXD inside LXD, btrfs is worth considering.

LXD doesn’t need any configuration to use btrfs, you just need to make sure that /var/lib/lxd is stored on a btrfs filesystem and LXD will automatically make use of it for you.

#### LVM

If ZFS and btrfs aren’t an option for you, you can still get some of their benefits by using LVM instead. LXD uses LVM with thin provisioning, creating an LV for each image and container and using LVM snapshots as needed.

To configure LXD to use LVM, create a LVM VG and run:

```
lxc config set storage.lvm_vg_name "THE-NAME-OF-YOUR-VG"
```

By default LXD uses ext4 as the filesystem for all the LVs. You can change that to XFS if you’d like:

```
lxc config set storage.lvm_fstype xfs
```

#### 简单目录

If none of the above are an option for you, LXD will still work but without any of those advanced features. It will simply create a directory for each container, unpack the image tarballs for each container creation and do a full filesystem copy on container copy or snapshot.

All features are supported except for disk quotas, but this is very wasteful of disk space and also very slow. If you have no other choice, it will work, but you should really consider one of the alternatives above.

 

### 配置篇

The complete list of configuration options for the LXD daemon can be found [here][4].

#### 网络配置

By default LXD doesn’t listen to the network. The only way to talk to it is over a local unix socket at /var/lib/lxd/unix.socket.

To have it listen to the network, there are two useful keys to set:

```
lxc config set core.https_address [::]
lxc config set core.trust_password some-secret-string
```

The first instructs LXD to bind the “::” IPv6 address, namely, all addresses on the machine. You can obviously replace this by a specific IPv4 or IPv6 address and can append the TCP port you’d like it to bind (defaults to 8443).

The second sets a password which is used for remote clients to add themselves to the LXD certificate trust store. When adding the LXD host, they will be prompted for the password, if the password matches, the LXD daemon will store their client certificate and they’ll be trusted, never needing the password again (it can be changed or unset entirely at that point).

You can also choose not to set a password and instead manually trust each new client by having them give you their “client.crt” file (from ~/.config/lxc) and add it to the trust store yourself with:

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.stgraber.org/author/stgraber/
[0]: https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
[1]: https://linuxcontainers.org/lxd/try-it
[2]: https://github.com/lxc/lxd/blob/master/README.md
[3]: https://github.com/lxc/lxd/blob/master/doc/storage-backends.md
[4]: https://github.com/lxc/lxd/blob/master/doc/configuration.md
