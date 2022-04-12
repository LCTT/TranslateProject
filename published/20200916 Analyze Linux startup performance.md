[#]: collector: (lujun9972)
[#]: translator: (jiamn)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14462-1.html)
[#]: subject: (Analyze Linux startup performance)
[#]: via: (https://opensource.com/article/20/9/systemd-startup-configuration)
[#]: author: (David Both https://opensource.com/users/dboth)

Linux 启动性能分析
======

> 用 systemd-analyze 洞悉并解决 Linux 启动性能问题。

![](https://img.linux.net.cn/data/attachment/album/202204/12/120909ygssda7j3t3a3a3a.jpg)

系统管理员的一部分工作就是分析系统性能，发现并解决引起性能不佳、启动时间长的问题。系统管理员也需要去检查 systemd 的配置和使用的其它方面。

systemd 初始化系统提供了 `systemd-analyze` 工具，可以帮助发现性能问题和其他重要的 systemd 信息。在以前的文章《[分析 systemd 日历和时间跨度][2]》里，我用了 `systemd-analyze` 去分析 systemd 里的时间戳和时间跨度，但是这个工具还有很多其他用法，这个文章里我将再揭示一些。

（LCTT 译注：systemd 是目前主流 Linux 发行版采用的系统管理系统）

（LCTT 译注：为了区分英文的 “boot” 和 “startup” 的不同涵义，此处将 “boot” 翻译为“引导”，“startup” 翻译为“启动”。）

### 概述启动

Linux 启动过程是值得学习关注的地方，因为 `systemd-analyze` 工具很多功能聚焦在<ruby>启动<rt>startup</rt></ruby>过程。但是首先，要理解<ruby>引导<rt>boot</rt></ruby>和<ruby>启动<rt>startup</rt></ruby>。引导阶段从 BIOS 加电自检（POST）开始，结束于内核完成加载并控制主机系统，然后是开始了启动过程，也是 systemd 日志的开始点。

这个系列的第二篇文章《[理解 Linux 启动时的 systemd][3]》中，我详细讨论了启动阶段的内容和过程。在这篇文章里，我想研究一下启动过程，看看需要多少时间和大部分时间花费在哪里。

下面我将展示的结果来自我的主要工作站，这比虚拟机的结果要有趣得多。这个工作站包括一块 华硕 TUF X299 Mark 2 主板、一个英特尔 i9-7960X CPU（16 核 32 线程），64 G 内存。下面的一些命令非 root 用户也可以使用，但是我在这篇文章里使用了 root 用户，以避免在用户之间切换。

检查启动过程有几种方法，最简单的 `systemd-analyze` 命令显示了启动的几个主要部分耗费的时间，包括内核启动、装载运行 initrd（即初始 ramdisk，这是一个用来初始化一些硬件、挂载 `/` 根文件系统的临时系统镜像），还有用户空间（加载所有使主机达到可用状态的程序和守护程序）。如果没有像该命令传递子命令，默认是 `systemd-analyze time`：

```
[root@david ~]$ systemd-analyze
Startup finished in 53.921s (firmware) + 2.643s (loader) + 2.236s (kernel) + 4.348s (initrd) + 10.082s (userspace) = 1min 13.233s
graphical.target reached after 10.071s in userspace
[root@david ~]#
```

这个输出中最值得注意的数据是在固件（BIOS）中花费的时间：几乎 54 秒。这是一个不太正常的时间，我的其他物理系统都没有花费这么长的时间来通过 BIOS。

我的 System76 Oryx Pro 笔记本在 BIOS 阶段只花了 8.506 秒，我家里所有的系统都在 10 秒以内。在线搜索一阵之后，我发现这块主板以其超长的 BIOS 引导时间而闻名。我的主板从不“马上启动”，总是挂起，我需要关机再开机，BIOS 报错，按 `F1` 进入 BIOS 设置，选择要引导的驱动器完成引导，多花费的时间就是这样用掉的。

不是所有主机都会显示固件数据（LCTT 译注：固件引导中不涉及 systemd）。我的不科学的实验使我相信，这个数据只显示给英特尔 9 代或以上的处理器。但这可能是不正确的。

这个关于引导、启动的概述提供了很好的（虽然有限）的信息，但是还有很多关于启动的信息，我将在下面描述。

### 分配责任

你可以用 `systemd-analyze blame` 来发现哪个 systemd 单元的初始化时间最长。其结果按照初始化时间长短排序，从多到少：

```
[root@david ~]$ systemd-analyze blame  
       5.417s NetworkManager-wait-online.service
       3.423s dracut-initqueue.service
       2.715s systemd-udev-settle.service
       2.519s fstrim.service
       1.275s udisks2.service
       1.271s smartd.service
        996ms upower.service
        637ms lvm2-monitor.service
        533ms lvm2-pvscan@8:17.service
        520ms dmraid-activation.service
        460ms vboxdrv.service
        396ms initrd-switch-root.service
<截断：删去了好多时间不长的条目>
```

因为很多服务是并行开始的，在 BIOS 之后所有单元加在一起的总数大大超过了 `systemd-analyze time` 汇总数。很多都是小数，不能显著的节省时间。

这个命令提供的数据指明了改善启动时间的办法。无用的服务可以禁用（`disable`）。在这个启动过程中，似乎没有任何一个服务需要花费过长的时间。你可能会在每次启动时看到不同的结果。（LCTT 译注：并行启动服务的原因）

### 关键链

就像项目管理中的关键路径一样，关键链显示了在启动过程中发生的时间关键的事件链（LCTT 译注：systemd 可以定义服务间的依赖，构成关键链）。如果启动缓慢，这些是你想查看的 systemd 单元，因为它们是导致延迟的单元。这个工具不会显示所有启动的单元，只显示这个关键事件链中的单元。（LCTT 译注：相当于最短路径。并不显示依赖不在关键链上的服务单元）

```
[root@david ~]# systemd-analyze critical-chain
The time when unit became active or started is printed after the "@" character.
The time the unit took to start is printed after the "+" character.

graphical.target @10.071s
└─lxdm.service @10.071s
  └─plymouth-quit.service @10.047s +22ms
    └─systemd-user-sessions.service @10.031s +7ms
      └─remote-fs.target @10.026s
        └─remote-fs-pre.target @10.025s
          └─nfs-client.target @4.636s
            └─gssproxy.service @4.607s +28ms
              └─network.target @4.604s
                └─NetworkManager.service @4.383s +219ms
                  └─dbus-broker.service @4.434s +136ms
                    └─dbus.socket @4.369s
                      └─sysinit.target @4.354s
                        └─systemd-update-utmp.service @4.345s +9ms
                          └─auditd.service @4.301s +42ms
                            └─systemd-tmpfiles-setup.service @4.254s +42ms
                              └─import-state.service @4.233s +19ms
                                └─local-fs.target @4.229s
                                  └─Virtual.mount @4.019s +209ms
                                    └─systemd-fsck@dev-mapper-vg_david2\x2dVirtual.service @3.742s +274ms
                                      └─local-fs-pre.target @3.726s
                                        └─lvm2-monitor.service @356ms +637ms
                                          └─dm-event.socket @319ms
                                            └─-.mount
                                              └─system.slice
                                                └─-.slice
[root@david ~]#
```

前面有 `@` 的数字表示单元激活开始启动所使用的绝对秒数。前面有 `+` 的数字显示单元启动所需的时间。

### 系统状态

有时候你需要确定系统的当前状态，`systemd-analyze dump` 命令转储了当前系统状态的大量数据。有主要的启动时间戳，一个每个 systemd 单元的列表，并对每个单元状态进行了完整描述：

```
[root@david ~]# systemd-analyze dump
Timestamp firmware: 1min 7.983523s
Timestamp loader: 3.872325s
Timestamp kernel: Wed 2020-08-26 12:33:35 EDT
Timestamp initrd: Wed 2020-08-26 12:33:38 EDT
Timestamp userspace: Wed 2020-08-26 12:33:42 EDT
Timestamp finish: Wed 2020-08-26 16:33:56 EDT
Timestamp security-start: Wed 2020-08-26 12:33:42 EDT
Timestamp security-finish: Wed 2020-08-26 12:33:42 EDT
Timestamp generators-start: Wed 2020-08-26 16:33:42 EDT
Timestamp generators-finish: Wed 2020-08-26 16:33:43 EDT
Timestamp units-load-start: Wed 2020-08-26 16:33:43 EDT
Timestamp units-load-finish: Wed 2020-08-26 16:33:43 EDT
Timestamp initrd-security-start: Wed 2020-08-26 12:33:38 EDT
Timestamp initrd-security-finish: Wed 2020-08-26 12:33:38 EDT
Timestamp initrd-generators-start: Wed 2020-08-26 12:33:38 EDT
Timestamp initrd-generators-finish: Wed 2020-08-26 12:33:38 EDT
Timestamp initrd-units-load-start: Wed 2020-08-26 12:33:38 EDT
Timestamp initrd-units-load-finish: Wed 2020-08-26 12:33:38 EDT
-> Unit system.slice:
        Description: System Slice
        Instance: n/a
        Unit Load State: loaded
        Unit Active State: active
        State Change Timestamp: Wed 2020-08-26 12:33:38 EDT
        Inactive Exit Timestamp: Wed 2020-08-26 12:33:38 EDT
        Active Enter Timestamp: Wed 2020-08-26 12:33:38 EDT
        Active Exit Timestamp: n/a
        Inactive Enter Timestamp: n/a
        May GC: no
<截断：删除了大量的输出行>
```

在我的主工作站上，这个命令生成了 49680 行输出，大概 1.66MB，这个命令非常快，不需要等待。

我很喜欢为各种连接设备（如存储设备）提供的大量细节。每个 systemd 单元有一个部分，包括各种运行时、缓存、日志目录的模式、启动单元的命令行、PID、开始时间戳，以及内存和文件限制等细节。

`systemd-analyze` 的手册页里展示了 `systemd-analyze --user dump` 选项，目的是显示用户管理器的内部状态。但这个选项对我来说是失败的，互联网搜索之后表明它可能有一些问题。在 systemd 里，`--user` 实例用来管理和控制处理器给每个用户的进程资源。处理能力按分给每个用户的进程都属于一个控制组，我将在以后的文章中介绍。

### 分析图表

大多数啥都不懂的猥琐老板（PHB）和许多优秀的管理者都发现漂亮的图表比我通常喜欢的基于文本的系统性能数据更容易阅读和理解。但有时，即使是我也喜欢一个好的图表，`systemd-analyze` 提供了显示引导/启动数据的 [SVG][4] 矢量图表。 

下面的命令生成一个矢量图文件，来显示在引导和启动过程发生的事件。生成这个文件只需要几秒：

```
[root@david ~]# systemd-analyze plot > /tmp/bootup.svg
```

这个命令创建了一个 SVG 文件，SVG 是一个定义了一系列图形矢量的文本文件，包括 Image Viewer、Ristretto、Okular、Eye of Mate、LibreOffice Draw 在内的这些可以生成图形的应用，可以用 SVG 来创建图像。

我用 LibreOffice Draw（LCTT 译注：一个办公文档软件）来渲染一幅图形。这张图形很大，你需要放到很大才能看清细节。这里是它的一小部分：

![The bootup.svg file displayed in LibreOffice Draw.][5]

图中时间轴上零点（0）的左边是引导阶段，零点的右边是启动阶段。这一小部分显示了内核、initrd 和 initrd 启动的进程。

这张图一目了然地显示了什么时候启动，启动需要多少时间，以及主要的依赖项。关键路径用红色高亮显示。

另外一个生成图形输出的命令是 `systemd-analyze plot`，它生成了 [DOT][7] 格式的文本依赖图。产生的数据流通过 `dot` 工具进行处理，这是一组用来从多种类型数据中生成矢量图文件的程序。这些 SVG 文件也能被上面列出的工具处理。

首先，生成文件，在我的主工作站花了 9 分钟：

```
[root@david ~]# time systemd-analyze dot | dot -Tsvg > /tmp/test.svg
   Color legend: black     = Requires
                 dark blue = Requisite
                 dark grey = Wants
                 red       = Conflicts
                 green     = After

real    8m37.544s
user    8m35.375s
sys     0m0.070s
[root@david ~]#
```

我不会在这里重现输出，因为产生的图形就像一大堆意大利面条。但是你应该试试，看看我想让你看到的结果。

### 条件

在阅读 systemd-analyze(1) 的手册页时，我发现了一个更有趣的功能，但又有点通用，就是条件子命令。（是的，我确实在读手册页，而且我神奇地通过这种方式学到了很多东西！）。这个 `condition` 子命令能用来测试 systemd 单元文件中的条件和断言。

它也可以在脚本中用来评估一个或多个条件 —— 如果所有条件都满足，则返回 0；如果有条件不满足，则返回 1。在其它情况下，它都会输出其结果文本。

下面的例子来自手册页，稍微有点复杂。它测试了内核版本是否在 4.0 和 5.1 之间，主机是否使用交流电供电，系统结构是否是 ARM，以及 `/etc/os-release` 目录是否存在。我添加了 `echo $?` 来打印返回值。

```
[root@david ~]# systemd-analyze condition 'ConditionKernelVersion = ! <4.0' \
                    'ConditionKernelVersion = >=5.1' \
                    'ConditionACPower=|false' \
                    'ConditionArchitecture=|!arm' \
                    'AssertPathExists=/etc/os-release' ; \
echo $?
test.service: AssertPathExists=/etc/os-release succeeded.
Asserts succeeded.
test.service: ConditionArchitecture=|!arm succeeded.
test.service: ConditionACPower=|false failed.
test.service: ConditionKernelVersion=>=5.1 succeeded.
test.service: ConditionKernelVersion=!<4.0 succeeded.
Conditions succeeded.
0
[root@david ~]#
```

条件和断言的列表大约从 systemd.unit(5) 手册页的第 600 行左右开始。

### 列出配置文件

`systemd-analyze` 工具提供了一种将各种配置文件的内容发送到 STDOUT 的方法，如图所示。其基本目录是 `/etc/`。

```
[root@david ~]# systemd-analyze cat-config systemd/system/display-manager.service
# /etc/systemd/system/display-manager.service
[Unit]
Description=LXDM (Lightweight X11 Display Manager)
#Documentation=man:lxdm(8)
Conflicts=getty@tty1.service
After=systemd-user-sessions.service getty@tty1.service plymouth-quit.service livesys-late.service
#Conflicts=plymouth-quit.service

[Service]
ExecStart=/usr/sbin/lxdm
Restart=always
IgnoreSIGPIPE=no
#BusName=org.freedesktop.lxdm

[Install]
Alias=display-manager.service
[root@david ~]#
```

打了这么多字却和标准的 `cat` 命令做的差不多。我发现下一条命令小有帮助，它能在标准的 systemd 所在的位置搜索具有指定模式的内容：

```
[root@david ~]# systemctl cat backup*
# /etc/systemd/system/backup.timer
# This timer unit runs the local backup program
# (C) David Both
# Licensed under GPL V2
#

[Unit]
Description=Perform system backups
Requires=backup.service

[Timer]
Unit=backup.service
OnCalendar=*-*-* 00:15:30

[Install]
WantedBy=timers.target


# /etc/systemd/system/backup.service
# This service unit runs the rsbu backup program
# By David Both
# Licensed under GPL V2
#

[Unit]
Description=Backup services using rsbu
Wants=backup.timer

[Service]
Type=oneshot
Environment="HOME=/root"
ExecStart=/usr/local/bin/rsbu -bvd1
ExecStart=/usr/local/bin/rsbu -buvd2

[Install]
WantedBy=multi-user.target

[root@david ~]#
```

这两个命令在每个文件的内容前面都有一个注释行，包含文件的完整路径和名称。

### 单元文件检查

当创建了一个新的单元文件，可以利用 `verify` 子命令帮助检查语法是否正确。它能指出来不正确的拼写，并列出缺失的服务单元。

```
[root@david ~]# systemd-analyze verify /etc/systemd/system/backup.service
```

秉承 Unix/Linux 的“沉默是金”的宗旨，没有输出意味着扫描的文件中没有错误。

### 安全性

`security` 子命令检查指定服务的安全级别。它只能针对服务单元，其他类型的单元文件不起作用：

```
[root@david ~]# systemd-analyze security display-manager
  NAME                                                        DESCRIPTION                                                     >
✗ PrivateNetwork=                                             Service has access to the host's network                        >
✗ User=/DynamicUser=                                          Service runs as root user                                       >
✗ CapabilityBoundingSet=~CAP_SET(UID|GID|PCAP)                Service may change UID/GID identities/capabilities              >
✗ CapabilityBoundingSet=~CAP_SYS_ADMIN                        Service has administrator privileges                            >
✗ CapabilityBoundingSet=~CAP_SYS_PTRACE                       Service has ptrace() debugging abilities                        >
✗ RestrictAddressFamilies=~AF_(INET|INET6)                    Service may allocate Internet sockets                           >
✗ RestrictNamespaces=~CLONE_NEWUSER                           Service may create user namespaces                              >
✗ RestrictAddressFamilies=~…                                  Service may allocate exotic sockets                             >
✗ CapabilityBoundingSet=~CAP_(CHOWN|FSETID|SETFCAP)           Service may change file ownership/access mode/capabilities unres>
✗ CapabilityBoundingSet=~CAP_(DAC_*|FOWNER|IPC_OWNER)         Service may override UNIX file/IPC permission checks            >
✗ CapabilityBoundingSet=~CAP_NET_ADMIN                        Service has network configuration privileges                    >
✗ CapabilityBoundingSet=~CAP_SYS_MODULE                       Service may load kernel modules
<截断>
✗ CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG                   Service may issue vhangup()                                     >
✗ CapabilityBoundingSet=~CAP_WAKE_ALARM                       Service may program timers that wake up the system              >
✗ RestrictAddressFamilies=~AF_UNIX                            Service may allocate local sockets                              >

→ Overall exposure level for backup.service: 9.6 UNSAFE ?
lines 34-81/81 (END)
```

是的，表情符是输出的一部分。但是，当然，许多服务需要几乎完全访问所有的东西，以便完成它们的工作。我针对几个服务运行了这个程序，包括我自己的备份服务；结果可能有所不同，但最底下一行似乎大多是一样的。

这个工具对于在严格的安全环境检查和修复用户空间的服务单元是很有用的。我不认为我们的大多数都能用到它。

### 最后总结

这个强力的工具提供了一些有趣而惊人的有用选项。本文探讨的大部分内容是关于使用 systemd-analyze 来深入了解 Linux 使用 systemd 的启动性能。它还可以分析 systemd 的其他方面。

其中有些工具的作用有限，有几个应该完全忘记。但在解决启动和其他 systemd 功能的问题时，大多数都能起到很好的作用。

### 资源

互联网上关于 systemd 有很多信息，但是很多过于简略、晦涩，甚至是误导。除了这篇文章中提到的资源外，以下网页提供了关于systemd启动的更详细和可靠的信息。这个列表在我开始写这一系列文章后有所增长，以反映我所做的研究。

  * [systemd.unit(5) 手册页][9] 包含了一份单元文件部分及其配置选项的清单，并对每个部分进行了简明的描述。
  * Fedora 项目有一个很好的实用 [systemd 指南][10]。它包含了配置、管理和维护使用 systemd 的 Fedora 计算机所需的几乎所有知识。
  * Fedora 项目还有一份很好的 [备忘录][11]，将旧的 SystemV 命令与 systemd 命令进行了对照。
  * Red Hat 文档包含了对 [单元文件结构][12] 的详细描述和其他重要的信息。
  * 关于 systemd 技术的细节和创建它的原因，可以去看 Freedesktop.org  [systemd 详述][13]。
  * [Linux.com][14] 的“更多 systemd 乐趣”提供了很多高级的 systemd [信息和技巧][15]。

此外，systemd 设计者和主要开发者 Lennart Poettering 也为 Linux 系统管理员撰写了一系列深度技术文档，尽管这些文章写于 2010 年 4 月到 2011 年 9 月，现在看也是非常适应时宜。关于 systemd 及其生态系统的其他好文章，大部分都是基于这些文章的。

  * [Rethinking PID 1][16]
  * [systemd for Administrators, Part I][17]
  * [systemd for Administrators, Part II][18]
  * [systemd for Administrators, Part III][19]
  * [systemd for Administrators, Part IV][20]
  * [systemd for Administrators, Part V][21]
  * [systemd for Administrators, Part VI][22]
  * [systemd for Administrators, Part VII][23]
  * [systemd for Administrators, Part VIII][24]
  * [systemd for Administrators, Part IX][25]
  * [systemd for Administrators, Part X][26]
  * [systemd for Administrators, Part XI][27]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/systemd-startup-configuration

作者：[David Both][a]
选题：[lujun9972][b]
译者：[jiamn](https://github.com/jiamn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://opensource.com/article/20/7/systemd-calendar-timespans
[3]: https://opensource.com/article/20/5/systemd-startup?utm_campaign=intrel
[4]: https://en.wikipedia.org/wiki/Scalable_Vector_Graphics
[5]: https://opensource.com/sites/default/files/uploads/bootup.svg-graph.png (The bootup.svg file displayed in LibreOffice Draw.)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://en.wikipedia.org/wiki/DOT_(graph_description_language)
[8]: mailto:getty@tty1.service
[9]: https://man7.org/linux/man-pages/man5/systemd.unit.5.html
[10]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[11]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[12]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/managing-services-with-systemd_configuring-basic-system-settings#Managing_Services_with_systemd-Unit_File_Structure
[13]: https://www.freedesktop.org/wiki/Software/systemd/
[14]: http://Linux.com
[15]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[16]: http://0pointer.de/blog/projects/systemd.html
[17]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[18]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[19]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[20]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[21]: http://0pointer.de/blog/projects/three-levels-of-off.html
[22]: http://0pointer.de/blog/projects/changing-roots
[23]: http://0pointer.de/blog/projects/blame-game.html
[24]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[25]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[26]: http://0pointer.de/blog/projects/instances.html
[27]: http://0pointer.de/blog/projects/inetd.html
