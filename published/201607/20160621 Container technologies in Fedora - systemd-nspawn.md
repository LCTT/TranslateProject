Fedora 中的容器技术：systemd-nspawn
===

欢迎来到“Fedora 中的容器技术”系列！本文是该系列文章中的第一篇，它将说明你可以怎样使用 Fedora 中各种可用的容器技术。本文将学习 `systemd-nspawn` 的相关知识。

### 容器是什么？

一个容器就是一个用户空间实例，它能够在与托管容器的系统（叫做宿主系统）相隔离的环境中运行一个程序或者一个操作系统。这和 `chroot` 或 [虚拟机][1] 的思想非常类似。运行在容器中的进程是由与宿主操作系统相同的内核来管理的，但它们是与宿主文件系统以及其它进程隔离开的。

### 什么是 systemd-nspawn？

systemd 项目认为应当将容器技术变成桌面的基础部分，并且应当和用户的其余系统集成在一起。为此，systemd 提供了 `systemd-nspawn`，这款工具能够使用多种 Linux 技术创建容器。它也提供了一些容器管理工具。

`systemd-nspawn` 和 `chroot` 在许多方面都是类似的，但是前者更加强大。它虚拟化了文件系统、进程树以及客户系统中的进程间通信。它的吸引力在于它提供了很多用于管理容器的工具，例如用来管理容器的 `machinectl`。由 `systemd-nspawn` 运行的容器将会与 systemd 组件一同运行在宿主系统上。举例来说，一个容器的日志可以输出到宿主系统的日志中。

在 Fedora 24 上，`systemd-nspawn` 已经从 systemd 软件包分离出来了，所以你需要安装 `systemd-container` 软件包。一如往常，你可以使用 `dnf install systemd-container` 进行安装。

### 创建容器

使用 `systemd-nspawn` 创建一个容器是很容易的。假设你有一个专门为 Debian 创造的应用，并且无法在其它发行版中正常运行。那并不是一个问题，我们可以创造一个容器！为了设置容器使用最新版本的 Debian（现在是 Jessie），你需要挑选一个目录来放置你的系统。我暂时将使用目录 `~/DebianJessie`。

一旦你创建完目录，你需要运行 `debootstrap`，你可以从 Fedora 仓库中安装它。对于 Debian Jessie，你运行下面的命令来初始化一个 Debian 文件系统。

```
$ debootstrap --arch=amd64 stable ~/DebianJessie
```

以上默认你的架构是 x86_64。如果不是的话，你必须将架构的名称改为 `amd64`。你可以使用 `uname -m` 得知你的机器架构。

一旦设置好你的根目录，你就可以使用下面的命令来启动你的容器。

```
$ systemd-nspawn -bD ~/DebianJessie
```

容器将会在数秒后准备好并运行，当你试图登录时就会注意到：你无法使用你的系统上任何账户。这是因为 `systemd-nspawn` 虚拟化了用户。修复的方法很简单：将之前的命令中的 `-b` 移除即可。你将直接进入容器的 root 用户的 shell。此时，你只能使用 `passwd` 命令为 root 设置密码，或者使用 `adduser` 命令添加一个新用户。一旦设置好密码或添加好用户，你就可以把 `-b` 标志添加回去然后继续了。你会进入到熟悉的登录控制台，然后你使用设置好的认证信息登录进去。

以上对于任意你想在容器中运行的发行版都适用，但前提是你需要使用正确的包管理器创建系统。对于 Fedora，你应使用 DNF 而非 `debootstrap`。想要设置一个最小化的 Fedora 系统，你可以运行下面的命令，要将“/absolute/path/”替换成任何你希望容器存放的位置。

```
$ sudo dnf --releasever=24 --installroot=/absolute/path/ install systemd passwd dnf fedora-release
```

![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/Screenshot-from-2016-06-17-15-04-14.png)

### 设置网络

如果你尝试启动一个服务，但它绑定了你宿主机正在使用的端口，你将会注意到这个问题：你的容器正在使用和宿主机相同的网络接口。幸运的是，`systemd-nspawn` 提供了几种可以将网络从宿主机分开的方法。

#### 本地网络

第一种方法是使用 `--private-network` 标志，它默认仅创建一个回环设备。这对于你不需要使用网络的环境是非常理想的，例如构建系统和其它持续集成系统。

#### 多个网络接口

如果你有多个网络接口设备，你可以使用 `--network-interface` 标志给容器分配一个接口。想要给我的容器分配 `eno1`，我会添加选项 `--network-interface=eno1`。当某个接口分配给一个容器后，宿主机就不能同时使用那个接口了。只有当容器彻底关闭后，宿主机才可以使用那个接口。

#### 共享网络接口

对于我们中那些并没有额外的网络设备的人来说，还有其它方法可以访问容器。一种就是使用 `--port` 选项。这会将容器中的一个端口定向到宿主机。使用格式是 `协议:宿主机端口:容器端口`，这里的协议可以是 `tcp` 或者 `udp`，`宿主机端口` 是宿主机的一个合法端口，`容器端口` 则是容器中的一个合法端口。你可以省略协议，只指定 `宿主机端口:容器端口`。我通常的用法类似 `--port=2222:22`。

你可以使用 `--network-veth` 启用完全的、仅宿主机模式的网络，这会在宿主机和容器之间创建一个虚拟的网络接口。你也可以使用 `--network-bridge` 桥接二者的连接。

### 使用 systemd 组件

如果你容器中的系统含有 D-Bus，你可以使用 systemd 提供的实用工具来控制并监视你的容器。基础安装的 Debian 并不包含 `dbus`。如果你想在 Debian Jessie 中使用 `dbus`，你需要运行命令 `apt install dbus`。

#### machinectl

为了能够轻松地管理容器，systemd 提供了 `machinectl` 实用工具。使用 `machinectl`，你可以使用 `machinectl login name` 登录到一个容器中、使用 `machinectl status name`检查状态、使用 `machinectl reboot name` 启动容器或者使用 `machinectl poweroff name`  关闭容器。

### 其它 systemd 命令

多数 systemd 命令，例如 `journalctl`, `systemd-analyze` 和 `systemctl`，都支持使用 `--machine` 选项来指定容器。例如，如果你想查看一个名为 “foobar” 的容器的日志，你可以使用 `journalctl --machine=foobar`。你也可以使用 `systemctl --machine=foobar status service` 来查看运行在这个容器中的服务状态。

![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/Screenshot-from-2016-06-17-15-09-25.png)

### 和 SELinux 一起工作

如果你要使用 SELinux 强制模式（Fedora 默认模式），你需要为你的容器设置 SELinux 环境。想要那样的话，你需要在宿主系统上运行下面两行命令。

```
$ semanage fcontext -a -t svirt_sandbox_file_t "/path/to/container(/.*)?"
$ restorecon -R /path/to/container/
```

确保使用你的容器路径替换 “/path/to/container”。对于我的容器 "DebianJessie"，我会运行下面的命令：

```
$ semanage fcontext -a -t svirt_sandbox_file_t "/home/johnmh/DebianJessie(/.*)?"
$ restorecon -R /home/johnmh/DebianJessie/
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/container-technologies-fedora-systemd-nspawn/

作者：[John M. Harris, Jr.][a]
译者：[ChrisLeeGit](https://github.com/chrisleegit)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/container-technologies-fedora-systemd-nspawn/
[1]: https://en.wikipedia.org/wiki/Virtual_machine
