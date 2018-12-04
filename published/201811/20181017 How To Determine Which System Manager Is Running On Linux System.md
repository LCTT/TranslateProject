如何弄清 Linux 系统运行何种系统管理程序
======

虽然我们经常听到<ruby>系统管理器<rt>System Manager</rt></ruby>这词，但很少有人深究其确切意义。现在我们将向你展示其区别。

我会尽自己所能来解释清楚一切。我们大多都知道 System V 和 systemd 两种系统管理器。 System V （简写 SysV） 是老式系统所使用的古老且传统的初始化系统及系统管理器。

Systemd 是全新的初始化系统及系统管理器，并且已被大部分主流 Linux 发行版所采用。

Linux 系统中主要有三种有名而仍在使用的初始化系统。大多数 Linux 发行版都使用其中之一。

### 什么是初始化系统管理器？

在基于 Linux/Unix 的操作系统中，`init` (初始化的简称) 是内核启动系统时开启的第一个进程。

它持有的进程 ID（PID）号为 1，其在后台一直运行着，直到关机。

`init` 会查找 `/etc/inittab` 文件中相应配置信息来确定系统的运行级别，然后根据运行级别在后台启动所有的其它进程和应用。

作为 Linux 启动过程的一部分，BIOS、MBR、GRUB 和内核进程在此进程之前就被激活了。

下面列出的是 Linux 的可用运行级别（存在七个运行级别，从 0 到 6）。

  * `0`：停机
  * `1`：单用户模式
  * `2`：多用户，无 NFS（LCTT 译注：NFS 即 Network File System，网络文件系统）
  * `3`：全功能多用户模式
  * `4`：未使用
  * `5`：X11（GUI – 图形用户界面）
  * `6`：重启

下面列出的是 Linux 系统中广泛使用的三种初始化系统。

  * System V (Sys V)：是类 Unix 操作系统传统的也是首款初始化系统。
  * Upstart：基于事件驱动，是 `/sbin/init` 守护进程的替代品。
  * Systemd：是一款全新的初始化系统及系统管理器，它被所有主流的 Linux 发行版实现/采用，以替代传统的 SysV 初始化系统。

### 什么是 System V (Sys V)?

System V（Sys V）是类 Unix 操作系统传统的也是首款初始化系统。`init` 是系统由内核启动期间启动的第一个进程，它是所有进程的父进程。

起初，大多数 Linux 发行版都使用名为 System V（SysV）的传统的初始化系统。多年来，为了解决标准版本中的设计限制，发布了几个替代的初始化系统，例如 launchd、Service Management Facility、systemd 和 Upstart。

但只有 systemd 最终被几个主流 Linux 发行版所采用，以替代传统的 SysV。

### 什么是 Upstart?

Upstart 基于事件驱动，是 `/sbin/init` 守护进程的替代品。用来在启动期间控制任务和服务的启动，在关机期间停止它们，及在系统运行过程中监视它们。

它最初是为 Ubuntu 发行版开发的，但也可以在所有的 Linux 发行版中部署运行，以替代古老的 System V 初始化系统。

它用于 Ubuntu 9.10 到 14.10 版本和基于 RHEL 6 的系统中，之后的被 systemd 取代了。

### 什么是 systemd?

systemd 是一款全新的初始化系统及系统管理器，它被所有主流的 Linux 发行版实现/采用，以替代传统的 SysV 初始化系统。

systemd 与 SysV 和 LSB（LCTT 译注：Linux Standards Base） 初始化脚本兼容。它可以作为 SysV 初始化系统的直接替代品。其是内核启动的第一个进程并占有数字 1 的 PID，它是所有进程的父进程。

Fedora 15 是第一个采用 systemd 而不是 upstart 的发行版。[systemctl][3] 是一款命令行工具，它是管理 systemd 守护进程/服务（如 `start`、`restart`、`stop`、`enable`、`disable`、`reload` 和 `status`）的主要工具。 

systemd 使用 `.service` 文件而不是（SysV 初始化系统使用的） bash 脚本。systemd 把所有守护进程按顺序排列到自己 Cgroups （LCTT 译注：Cgroups 是 control groups 的缩写，是 Linux 内核提供的一种可以限制、记录、隔离进程组所使用的物理资源，如：cpu、memory、IO 等的机制。最初由 Google 的工程师提出，后来被整合进 Linux 内核。Cgroups 也是 LXC 为实现虚拟化所使用的资源管理手段，可以说没有 cgroups 就没有 LXC）中，所以通过查看 `/cgroup/systemd` 文件就可以查看系统层次结构。

### 在 Linux 上如何识别出系统管理器

在系统上运行如下命令来查看运行着什么系统管理器：

（LCTT 译注：原文繁冗啰嗦，翻译时进行了裁剪整理。）

#### 方法 1：使用 ps 命令

`ps` – 显示当前进程快照。`ps` 会显示选定的活动进程的信息。其输出不能确切区分出是 System V(SysV) 还是 upstart，所以我建议使用其它方法。

```
# ps -p1 | grep "init\|upstart\|systemd"
 1 ? 00:00:00 init
```

#### 方法 2：使用 rpm 命令

RPM 即 Red Hat Package Manager （红帽包管理），是一款功能强大的[安装包管理][1]命令行工具，在基于 Red Hat 的发行版中使用，如 RHEL、CentOS、Fedora、openSUSE 和 Mageia。此工具可以在系统/服务上对软件进行安装、更新、删除、查询及验证等操作。通常 RPM 文件都带有 `.rpm` 后缀。

RPM 会使用必要的库和依赖库来构建软件，并且不会与系统上安装的其它包冲突。

```
# rpm -qf /sbin/init
SysVinit-2.86-17.el5
```

#### 方法 3：使用 /sbin/init 文件

`/sbin/init` 程序会将根文件系统从内存加载或切换到磁盘。

这是启动过程的主要部分。这个进程开始时的运行级别为 “N”（无）。`/sbin/init` 程序会按照 `/etc/inittab` 配制文件的描述来初始化系统。

```
# /sbin/init --version
init (upstart 0.6.5)
Copyright (C) 2010 Canonical Ltd.

This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```


--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-determine-which-init-system-manager-is-running-on-linux-system/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/package-management/
[2]: https://www.2daygeek.com/rpm-command-examples/
[3]: https://www.2daygeek.com/how-to-check-all-running-services-in-linux/
