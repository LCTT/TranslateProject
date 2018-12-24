如何使用 chkconfig 和 systemctl 命令启用或禁用 Linux 服务
======

对于 Linux 管理员来说这是一个重要（美妙）的话题，所以每个人都必须知道，并练习怎样才能更高效的使用它们。

在 Linux 中，无论何时当你安装任何带有服务和守护进程的包，系统默认会把这些服务的初始化及 systemd 脚本添加进去，不过此时它们并没有被启用。

我们需要手动的开启或者关闭那些服务。Linux 中有三个著名的且一直在被使用的初始化系统。

### 什么是初始化系统？

在以 Linux/Unix 为基础的操作系统上，`init` (初始化的简称) 是内核引导系统启动过程中第一个启动的进程。

`init` 的进程 id （pid）是 1，除非系统关机否则它将会一直在后台运行。

`init` 首先根据 `/etc/inittab` 文件决定 Linux 运行的级别，然后根据运行级别在后台启动所有其他进程和应用程序。 

BIOS、MBR、GRUB 和内核程序在启动 `init` 之前就作为 Linux 的引导程序的一部分开始工作了。

下面是 Linux 中可以使用的运行级别（从 0～6 总共七个运行级别）：

  * `0`：关机
  * `1`：单用户模式
  * `2`：多用户模式（没有NFS）
  * `3`：完全的多用户模式
  * `4`：系统未使用
  * `5`：图形界面模式
  * `6`：重启

下面是 Linux 系统中最常用的三个初始化系统：

  * System V（Sys V）
  * Upstart
  * systemd

### 什么是 System V（Sys V）?

System V（Sys V）是类 Unix 系统第一个也是传统的初始化系统。`init` 是内核引导系统启动过程中第一支启动的程序，它是所有程序的父进程。

大部分 Linux 发行版最开始使用的是叫作 System V（Sys V）的传统的初始化系统。在过去的几年中，已经发布了好几个初始化系统以解决标准版本中的设计限制，例如：launchd、Service Management Facility、systemd 和 Upstart。

但是 systemd 已经被几个主要的 Linux 发行版所采用，以取代传统的 SysV 初始化系统。 

### 什么是 Upstart?

Upstart 是一个基于事件的 `/sbin/init` 守护进程的替代品，它在系统启动过程中处理任务和服务的启动，在系统运行期间监视它们，在系统关机的时候关闭它们。

它最初是为 Ubuntu 而设计，但是它也能够完美的部署在其他所有 Linux系统中，用来代替古老的 System-V。

Upstart 被用于 Ubuntu 从 9.10 到 Ubuntu 14.10 和基于 RHEL 6 的系统，之后它被 systemd 取代。

### 什么是 systemd?

systemd 是一个新的初始化系统和系统管理器，它被用于所有主要的 Linux 发行版，以取代传统的 SysV 初始化系统。

systemd 兼容 SysV 和 LSB 初始化脚本。它可以直接替代 SysV 初始化系统。systemd 是被内核启动的第一个程序，它的 PID 是 1。

systemd 是所有程序的父进程，Fedora 15 是第一个用 systemd 取代 upstart 的发行版。`systemctl` 用于命令行，它是管理 systemd 的守护进程/服务的主要工具，例如：（开启、重启、关闭、启用、禁用、重载和状态）

systemd 使用 .service 文件而不是 bash 脚本（SysVinit 使用的）。systemd 将所有守护进程添加到 cgroups 中排序，你可以通过浏览 `/cgroup/systemd` 文件查看系统等级。

### 如何使用 chkconfig 命令启用或禁用引导服务?

`chkconfig` 实用程序是一个命令行工具，允许你在指定运行级别下启动所选服务，以及列出所有可用服务及其当前设置。

此外，它还允许我们从启动中启用或禁用服务。前提是你有超级管理员权限（root 或者 `sudo`）运行这个命令。

所有的服务脚本位于 `/etc/rd.d/init.d`文件中

### 如何列出运行级别中所有的服务

`--list` 参数会展示所有的服务及其当前状态（启用或禁用服务的运行级别）：

```
# chkconfig --list
NetworkManager     0:off    1:off    2:on    3:on    4:on    5:on    6:off
abrt-ccpp          0:off    1:off    2:off    3:on    4:off    5:on    6:off
abrtd              0:off    1:off    2:off    3:on    4:off    5:on    6:off
acpid              0:off    1:off    2:on    3:on    4:on    5:on    6:off
atd                0:off    1:off    2:off    3:on    4:on    5:on    6:off
auditd             0:off    1:off    2:on    3:on    4:on    5:on    6:off
.
.
```

### 如何查看指定服务的状态

如果你想查看运行级别下某个服务的状态，你可以使用下面的格式匹配出需要的服务。

比如说我想查看运行级别中 `auditd` 服务的状态

```
# chkconfig --list| grep auditd
auditd             0:off    1:off    2:on    3:on    4:on    5:on    6:off
```

### 如何在指定运行级别中启用服务

使用 `--level` 参数启用指定运行级别下的某个服务，下面展示如何在运行级别 3 和运行级别 5 下启用 `httpd` 服务。


```
# chkconfig --level 35 httpd on
```

### 如何在指定运行级别下禁用服务

同样使用 `--level` 参数禁用指定运行级别下的服务，下面展示的是在运行级别 3 和运行级别 5 中禁用 `httpd` 服务。

```
# chkconfig --level 35 httpd off
```

### 如何将一个新服务添加到启动列表中

`-–add` 参数允许我们添加任何新的服务到启动列表中，默认情况下，新添加的服务会在运行级别 2、3、4、5 下自动开启。

```
# chkconfig --add nagios
```

### 如何从启动列表中删除服务

可以使用 `--del` 参数从启动列表中删除服务，下面展示的是如何从启动列表中删除 Nagios 服务。

```
# chkconfig --del nagios
```

### 如何使用 systemctl 命令启用或禁用开机自启服务？

`systemctl` 用于命令行，它是一个用来管理 systemd 的守护进程/服务的基础工具，例如：（开启、重启、关闭、启用、禁用、重载和状态）。

所有服务创建的 unit 文件位与 `/etc/systemd/system/`。

### 如何列出全部的服务

使用下面的命令列出全部的服务（包括启用的和禁用的）。

```
# systemctl list-unit-files --type=service
UNIT FILE                                     STATE
arp-ethers.service                            disabled
auditd.service                                enabled
autovt@.service                               enabled
blk-availability.service                      disabled
brandbot.service                              static
chrony-dnssrv@.service                        static
chrony-wait.service                           disabled
chronyd.service                               enabled
cloud-config.service                          enabled
cloud-final.service                           enabled
cloud-init-local.service                      enabled
cloud-init.service                            enabled
console-getty.service                         disabled
console-shell.service                         disabled
container-getty@.service                      static
cpupower.service                              disabled
crond.service                                 enabled
.
.
150 unit files listed.
```

使用下面的格式通过正则表达式匹配出你想要查看的服务的当前状态。下面是使用 `systemctl` 命令查看 `httpd` 服务的状态。

```
# systemctl list-unit-files --type=service | grep httpd
httpd.service disabled
```

### 如何让指定的服务开机自启

使用下面格式的 `systemctl` 命令启用一个指定的服务。启用服务将会创建一个符号链接，如下可见：

```
# systemctl enable httpd
Created symlink from /etc/systemd/system/multi-user.target.wants/httpd.service to /usr/lib/systemd/system/httpd.service.
```

运行下列命令再次确认服务是否被启用。

```
# systemctl is-enabled httpd
enabled
```

### 如何禁用指定的服务

运行下面的命令禁用服务将会移除你启用服务时所创建的符号链接。

```
# systemctl disable httpd
Removed symlink /etc/systemd/system/multi-user.target.wants/httpd.service.
```

运行下面的命令再次确认服务是否被禁用。

```
# systemctl is-enabled httpd
disabled
```

### 如何查看系统当前的运行级别

使用 `systemctl` 命令确认你系统当前的运行级别，`runlevel` 命令仍然可在 systemd 下工作，不过，运行级别对于 systemd 来说是一个历史遗留的概念。所以我建议你全部使用 `systemctl` 命令。

我们当前处于运行级别 3, 它等同于下面显示的 `multi-user.target`。

```
# systemctl list-units --type=target
UNIT                  LOAD   ACTIVE SUB    DESCRIPTION
basic.target          loaded active active Basic System
cloud-config.target   loaded active active Cloud-config availability
cryptsetup.target     loaded active active Local Encrypted Volumes
getty.target          loaded active active Login Prompts
local-fs-pre.target   loaded active active Local File Systems (Pre)
local-fs.target       loaded active active Local File Systems
multi-user.target     loaded active active Multi-User System
network-online.target loaded active active Network is Online
network-pre.target    loaded active active Network (Pre)
network.target        loaded active active Network
paths.target          loaded active active Paths
remote-fs.target      loaded active active Remote File Systems
slices.target         loaded active active Slices
sockets.target        loaded active active Sockets
swap.target           loaded active active Swap
sysinit.target        loaded active active System Initialization
timers.target         loaded active active Timers
```

--------------------------------------------------------------------------------


via: https://www.2daygeek.com/how-to-enable-or-disable-services-on-boot-in-linux-using-chkconfig-and-systemctl-command/


作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[way-ww](https://github.com/way-ww)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出


[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
