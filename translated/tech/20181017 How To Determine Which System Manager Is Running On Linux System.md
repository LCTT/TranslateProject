弄清 Linux 系统运行何种系统管理程序
======
虽然我们经常听到系统管理器这词，但很少有人深究其确切意义。现在我们将向你展示其区别。

我会尽自己所能来解释清楚一切。我们大多都知道 System V 和 systemd 两种系统管理器。 System V （简写 Sysv） 是老系统所使用的古老且传统的 init 进程和系统管理器。

Systemd 是全新的 init 进程和系统管理器，并且适配大部分主发布版本 Linux 系统。

Linux 系统中主要有三种 init 进程系统，很出名且仍在使用。大多数 Linux 发布版本都使用其中之一。

### 什么是初始化系统管理器 (init System Manager)？

在基于 Linux/Unix 的操作系统中，init (初始化的简称) 是内核启动系统时开启的第一个进程。

它持有的进程 ID（PID）号为 1，其在后台一直运行着，直到关机。

Init 会查找 `/etc/inittab` 文件中相应配置信息来确定系统的运行级别，然后根据运行级别启动所有的后台进程和后台应用。

作为 Linux 启动过程的一部分，BIOS，MBR，GRUB 和内核进程此进程之前就被激活了。

下面列出的是 Linux 的可用运行级别（存在七个运行级别，从零到六）。

  * **`0:`** 停机
  * **`1:`** 单用户模式
  * **`2:`** 多用户, 无 NFS (译者注：Network File System 即网络文件系统)
  * **`3:`** 全功能多用户模式
  * **`4:`** 未使用
  * **`5:`** X11 (GUI – 图形用户界面)
  * **`6:`** 重启



下面列出的是 Linux 系统中广泛使用的三种 init 进程系统。

  * **`System V (Sys V):`** System V（Sys V）是类 Unix 操作系统的首款传统的 `init` 进程系统。
  * **`Upstart:`** Upstart 基于事件驱动，是 `/sbin/init` 守护进程的替代品。
  * **`systemd:`** Systemd 是一款全新的 `init` 进程系统和系统管理器，它通过传统的 `SysV init` 进程系统来实现/适配全部的 Linux 主版本。



### 什么是 System V (Sys V)?

System V（Sys V）是类 Unix 操作系统的首款传统的 `init` 进程系统。init 是内核启动系统期间启动的第一个进程，它是所有进程的父进程。

起初，大多数 Linux 发行版都使用名为 System V（Sys V）的传统 `init` 进程系统。 多年来，为了解决标准版本中的设计限制，发布了几个替代的 init 进程系统，例如launchd、Service Management Facility、systemd 和 Upstart。

但只有 systemd 最终被几个主要 Linux 发行版本所采用，而放弃传统的 SysV。

### 在 Linux 上如何识别出 `System V(Sys V)` 系统管理器

在系统上运行如下命令来查看是否在运行着 System V (Sys V) 系统管理器：

### 方法 1: 使用 `ps` 命令

**ps** – 显示当前进程快照。`ps` 会显示当前活动进程的信息。其输出区分不出是 System V(SysV) 还是 upstart，所以我建议使用其它方法。

```
# ps -p1 | grep "init\|upstart\|systemd"
 1 ? 00:00:00 init
```

### 方法 2: 使用 `rpm` 命令

RPM 即 `Red Hat Package Manager （红帽包管理）`，是一款功能强大的[安装包管理][1]命令行具，在基于 Red Hat 的发布系统中使用，如 RHEL、CentOS、Fedora、openSUSE 和 Mageia。此工具可以在系统/服务上对软件进行安装、更新、删除、查询及验证等操作。通常 RPM 文件都带有 `.rpm` 后缀。
RPM 会使用必须的库和依赖库来构建软件，并具不会与系统上安装的其它包冲突。

```
# rpm -qf /sbin/init
SysVinit-2.86-17.el5
```

### 什么是 Upstart?

Upstart 基于事件驱动，是 `/sbin/init` 守护进程的替代品。用来启动、停止及监视系统的所有任务和服务。

最初，它是为 Ubuntu 系统而开发的，但也可以在所有的 Linux 发布版本中部署运行，以替代古老的 System-V init 进程系统。

它在 Ubuntu 9.10 到 14.10 版本和基于 RHEL 6 的系统中使用，之后的 Linux 版本被 systemd 取代了。

### 在 Linux 上如何识别出 `Upstart` 系统管理器

在系统上运行如下命令来查看是否在运行着 Upstart 系统管理器：

### 方法 1: 使用 `ps` 命令

**ps** – 显示当前进程快照。`ps` 会显示当前活动进程的信息。其输出区分不出是 System V(SysV) 还是 upstart，所以我建议使用其它方法。

```
# ps -p1 | grep "init\|upstart\|systemd"
 1 ? 00:00:00 init
```

### 方法 2: 使用 `rpm` 命令

RPM 即 `Red Hat Package Manager （红帽包管理）`，是一款功能强大的安装包管理命令行具，在基于 Red Hat 的发布系统中使用，如 RHEL、CentOS、Fedora、openSUSE 和 Mageia。此[ RPM 命令][2]可以让你在系统/服务上对软件进行安装、更新、删除、查询及验证等操作。通常 RPM 文件都带有 `.rpm` 后缀。
RPM 会使用必须的库和依赖库来构建软件，并具不会与系统上安装的其它包冲突。

```
# rpm -qf /sbin/init
upstart-0.6.5-16.el6.x86_64
```

### 方法 3: 使用 `/sbin/init` 文件

`/sbin/init` 程序会将根文件系统从内存加载或切换到磁盘。
这是启动过程的主要部分。这个进程开始时的运行级别为 “N”（无）。`/sbin/init` 此程序会按照 `/etc/inittab` 配制文件的描述来初始化系统。

```
# /sbin/init --version
init (upstart 0.6.5)
Copyright (C) 2010 Canonical Ltd.

This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

### 什么是 systemd?

Systemd 是一款全新的 `init` 进程系统和系统管理器，它通过传统的 `SysV init` 进程系统来实现/适配全部的 Linux 主版本。

systemd 与 SysV 和 LSB (全称：Linux Standards Base) init 脚本兼容。它可以作为 sysv init 系统的直接替代品。其是内核启动的第一个进程并占有 1 的 PID。

它是所有进程的父进程，Fedora 15 是第一个采用 systemd 而不是 upstart 的发行版本。[systemctl][3] 是一款命令行工具，它是管理 systemd 守护进程/服务（如 start、restart、stop、enable、disable、reload 和 status ）的主要工具。 

systemd 使用 `.service` 文件而不是 bash 脚本（SysV init 使用）。systemd 把所有守护进程按顺序排列到自己 Cgroups （译者注：Cgroups 是 control groups 的缩写，是 Linux 内核提供的一种可以限制、记录、隔离进程组（process groups）所使用的物理资源（如：cpu,memory,IO等等）的机制。最初由 google 的工程师提出，后来被整合进Linux内核。Cgroups 也是 LXC 为实现虚拟化所使用的资源管理手段，可以说没有 cgroups 就没有 LXC。）中，所以通过探索 `/ cgroup/systemd` 文件就可以查看系统层次结构。

### 在 Linux 上如何识别出 `systemd` 系统管理器

在系统上运行如下命令来查看是否在运行着 systemd 系统管理器：

### 方法 1: 使用 `ps` 命令

**ps** – 显示当前进程快照。`ps` 会显示当前活动进程的信息。

```
# ps -p1 | grep "init\|upstart\|systemd"
 1 ? 00:18:09 systemd
```

### 方法 2: 使用 `rpm` 命令

RPM 即 `Red Hat Package Manager （红帽包管理）`，是一款功能强大的安装包管理命令行具，在基于 Red Hat 的发布系统中使用，如 RHEL、CentOS、Fedora、openSUSE 和 Mageia。此工具可以在系统/服务上对软件进行安装、更新、删除、查询及验证等操作。通常 RPM 文件都带有 `.rpm` 后缀。

RPM 会使用必须的库和依赖库来构建软件，并具不会与系统上安装的其它包冲突。

```
# rpm -qf /sbin/init
systemd-219-30.el7_3.9.x86_64
```

### 方法 3: 使用 `/sbin/init` 文件

`/sbin/init` 程序会将根文件系统从内存加载或切换到磁盘。
这是启动过程的主要部分。这个进程开始时的运行级别为 “N”（无）。`/sbin/init` 此程序会按照 `/etc/inittab` 配制文件的描述来初始化系统。

```
# file /sbin/init
/sbin/init: symbolic link to `../lib/systemd/systemd'
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-determine-which-init-system-manager-is-running-on-linux-system/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/package-management/
[2]: https://www.2daygeek.com/rpm-command-examples/
[3]: https://www.2daygeek.com/how-to-check-all-running-services-in-linux/
