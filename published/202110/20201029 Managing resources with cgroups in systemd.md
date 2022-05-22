[#]: collector: (lujun9972)
[#]: translator: (YungeG)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13881-1.html)
[#]: subject: (Managing resources with cgroups in systemd)
[#]: via: (https://opensource.com/article/20/10/cgroups)
[#]: author: (David Both https://opensource.com/users/dboth)

在 systemd 中使用控制组管理资源
======

> 控制组可以按照应用管理资源，而不是按照组成应用的单个进程。

![](https://img.linux.net.cn/data/attachment/album/202110/14/114622by5jdu87u4vng272.jpg)

作为一个系统管理员，没有事情比意外地耗尽计算资源让我更觉得沮丧。我曾不止一次填满了一个分区的所有可用磁盘空间、耗尽内存、以及没有足够的 CPU 时间在合理的时间内处理我的任务。资源管理是系统管理员最重要的工作之一。

资源管理的关键是保证所有的进程能够相对公平的访问需要的系统资源。资源管理还包括确保在需要时添加内存、硬盘驱动器空间、还有 CPU 处理能力；或者在无法添加时限制资源的使用。此外，应该阻止独占系统资源的用户，无论其是否有意。

系统管理员可以通过一些工具监控和管理不同的系统资源。例如，[top][2] 和类似的工具允许你监控内存、I/O、存储（磁盘、SSD 等）、网络、交换空间、CPU 的用量等。这些工具，尤其是那些以 CPU 为中心的工具，大部分基于以运行的进程为基本单位进行控制的模型。它们最多只是提供了一种方式来调整 `nice` 数字，从而修改优先级，或者杀死一个运行的进程。（要了解 `nice` 数字的信息，查看 [使用 Glances 监控 Linux 和 Windows 主机][3]）。

SystemV 环境中基于传统的资源管理的其他工具，由 `/etc/security/limits.conf` 文件和 `/etc/security/limits.d` 中的本地配置文件控制。资源可以按照用户或组以一种相对粗糙但实用的方式限制。可以管理的资源包括内存的各个方面、每日的总 CPU 时间、数据总量、优先级、`nice` 数字、并发登录的数量、进程数、文件大小的最大值等。

### 使用控制组管理进程

[systemd 和 SystemV][4] 之间的一个主要差异是管理进程的方式。SystemV 将每个进程视作一个独立的实体。systemd 将相关的进程集中到一个控制组，简写做 [cgroup][5]，并将控制组作为一个整体管理系统资源。这意味着资源能够基于应用管理，而不是由组成应用的各个进程来管理。

控制组的控制单元称作<ruby>切片单元<rt>slice unit</rt></ruby>。切片是允许 systemd 以树状格式控制程序次序，从而简化管理的概念化。

### 查看控制组

我将从一些允许你查看不同类型控制组信息的命令开始。 `systemctl status <service>` 命令显示一个特定服务的切片信息，包括服务的切片。这个例子展示了 `at` 守护进程：

```
[root@testvm1 ~]# systemctl status atd.service
● atd.service - Deferred execution scheduler
     Loaded: loaded (/usr/lib/systemd/system/atd.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2020-09-23 12:18:24 EDT; 1 day 3h ago
       Docs: man:atd(8)
   Main PID: 1010 (atd)
      Tasks: 1 (limit: 14760)
     Memory: 440.0K
        CPU: 5ms
     CGroup: /system.slice/atd.service
             └─1010 /usr/sbin/atd -f

Sep 23 12:18:24 testvm1.both.org systemd[1]: Started Deferred execution scheduler.
[root@testvm1 ~]#
```

这是一个我感到 systemd 比 SystemV 和旧的初始化程序更好用的原因的绝佳示例。这里的信息远比 SystemV 能够提供的丰富。`CGroup` 项包括的层级结构中，`system.slice` 是 systemd（PID 1），`atd.service` 在下一层，是 `system.slice` 的一部分。`CGroup` 项的第二行还显示了进程 ID（PID）和启动守护进程使用的命令。

`systemctl` 命令可以列出多个控制组项，`--all` 参数列出所有的切片，包括当前没有激活的切片：

```
[root@testvm1 ~]# systemctl -t slice --all
  UNIT                             LOAD   ACTIVE   SUB    DESCRIPTION                    
  -.slice                          loaded active   active Root Slice                      
  system-getty.slice               loaded active   active system-getty.slice              
  system-lvm2\x2dpvscan.slice      loaded active   active system-lvm2\x2dpvscan.slice    
  system-modprobe.slice            loaded active   active system-modprobe.slice          
  system-sshd\x2dkeygen.slice      loaded active   active system-sshd\x2dkeygen.slice    
  system-systemd\x2dcoredump.slice loaded inactive dead   system-systemd\x2dcoredump.slice
  system-systemd\x2dfsck.slice     loaded active   active system-systemd\x2dfsck.slice    
  system.slice                     loaded active   active System Slice                    
  user-0.slice                     loaded active   active User Slice of UID 0            
  user-1000.slice                  loaded active   active User Slice of UID 1000          
  user.slice                       loaded active   active User and Session Slice          

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.

11 loaded units listed.
To show all installed unit files use 'systemctl list-unit-files'.
[root@testvm1 ~]#
```

关于这个数据，第一个需要注意的是数据显示了 UID 0（root）和 UID 1000 的用户切片，UID 1000 是我登录的用户。这里列出了组成每个切片的切片部分，而不是服务。还说明了每个用户登录时都会为其创建一个切片，这为将一个用户的所有任务作为单个控制组项进行管理提供了一种方式。

### 探索控制组的层次结构

目前为止一切顺利，但是控制组是分层的，所有的服务单元作为其中一个控制组的成员运行。要查看这个层次结构很简单，使用一个旧命令和 systemd 的一个新命令即可。

`ps` 命令可以用于映射进程的和其所处的控制组层次。注意使用 `ps` 命令时需要指明想要的数据列。我大幅削减了下面命令的输出数量，但是试图保留足够的数据，以便你能够对自己系统上的输出有所感受：

```
[root@testvm1 ~]# ps xawf -eo pid,user,cgroup,args
    PID USER     CGROUP                      COMMAND
      2 root     -                           [kthreadd]
      3 root     -                            \_ [rcu_gp]
      4 root     -                            \_ [rcu_par_gp]
      6 root     -                            \_ [kworker/0:0H-kblockd]
      9 root     -                            \_ [mm_percpu_wq]
     10 root     -                            \_ [ksoftirqd/0]
     11 root     -                            \_ [rcu_sched]
     12 root     -                            \_ [migration/0]
     13 root     -                            \_ [cpuhp/0]
     14 root     -                            \_ [cpuhp/1]
<删节>
 625406 root     -                            \_ [kworker/3:0-ata_sff]
 625409 root     -                            \_ [kworker/u8:0-events_unbound]
      1 root     0::/init.scope              /usr/lib/systemd/systemd --switched-root --system --deserialize 30
    588 root     0::/system.slice/systemd-jo /usr/lib/systemd/systemd-journald
    599 root     0::/system.slice/systemd-ud /usr/lib/systemd/systemd-udevd
    741 root     0::/system.slice/auditd.ser /sbin/auditd
    743 root     0::/system.slice/auditd.ser  \_ /usr/sbin/sedispatch
    764 root     0::/system.slice/ModemManag /usr/sbin/ModemManager
    765 root     0::/system.slice/NetworkMan /usr/sbin/NetworkManager --no-daemon
    767 root     0::/system.slice/irqbalance /usr/sbin/irqbalance --foreground
    779 root     0::/system.slice/mcelog.ser /usr/sbin/mcelog --ignorenodev --daemon --foreground
    781 root     0::/system.slice/rngd.servi /sbin/rngd -f
    782 root     0::/system.slice/rsyslog.se /usr/sbin/rsyslogd -n
<删节>
    893 root     0::/system.slice/sshd.servi sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
   1130 root     0::/user.slice/user-0.slice  \_ sshd: root [priv]
   1147 root     0::/user.slice/user-0.slice  |   \_ sshd: root@pts/0
   1148 root     0::/user.slice/user-0.slice  |       \_ -bash
   1321 root     0::/user.slice/user-0.slice  |           \_ screen
   1322 root     0::/user.slice/user-0.slice  |               \_ SCREEN
   1323 root     0::/user.slice/user-0.slice  |                   \_ /bin/bash
 498801 root     0::/user.slice/user-0.slice  |                   |   \_ man systemd.resource-control
 498813 root     0::/user.slice/user-0.slice  |                   |       \_ less
   1351 root     0::/user.slice/user-0.slice  |                   \_ /bin/bash
 123293 root     0::/user.slice/user-0.slice  |                   |   \_ man systemd.slice
 123305 root     0::/user.slice/user-0.slice  |                   |       \_ less
   1380 root     0::/user.slice/user-0.slice  |                   \_ /bin/bash
 625412 root     0::/user.slice/user-0.slice  |                   |   \_ ps xawf -eo pid,user,cgroup,args
 625413 root     0::/user.slice/user-0.slice  |                   |   \_ less
 246795 root     0::/user.slice/user-0.slice  |                   \_ /bin/bash
 625338 root     0::/user.slice/user-0.slice  |                       \_ /usr/bin/mc -P /var/tmp/mc-root/mc.pwd.246795
 625340 root     0::/user.slice/user-0.slice  |                           \_ bash -rcfile .bashrc
   1218 root     0::/user.slice/user-1000.sl  \_ sshd: dboth [priv]
   1233 dboth    0::/user.slice/user-1000.sl      \_ sshd: dboth@pts/1
   1235 dboth    0::/user.slice/user-1000.sl          \_ -bash
<删节>
   1010 root     0::/system.slice/atd.servic /usr/sbin/atd -f
   1011 root     0::/system.slice/crond.serv /usr/sbin/crond -n
   1098 root     0::/system.slice/lxdm.servi /usr/sbin/lxdm-binary
   1106 root     0::/system.slice/lxdm.servi  \_ /usr/libexec/Xorg -background none :0 vt01 -nolisten tcp -novtswitch -auth /var/run/lxdm/lxdm-:0.auth
 370621 root     0::/user.slice/user-1000.sl  \_ /usr/libexec/lxdm-session
 370631 dboth    0::/user.slice/user-1000.sl      \_ xfce4-session
 370841 dboth    0::/user.slice/user-1000.sl          \_ /usr/bin/ssh-agent /bin/sh -c exec -l bash -c "/usr/bin/startxfce4"
 370911 dboth    0::/user.slice/user-1000.sl          \_ xfwm4 --display :0.0 --sm-client-id 2dead44ab-0b4d-4101-bca4-e6771f4a8ac2
 370930 dboth    0::/user.slice/user-1000.sl          \_ xfce4-panel --display :0.0 --sm-client-id 2ce38b8ef-86fd-4189-ace5-deec1d0e0952
 370942 dboth    0::/user.slice/user-1000.sl          |   \_ /usr/lib64/xfce4/panel/wrapper-2.0 /usr/lib64/xfce4/panel/plugins/libsystray.so 6 23068680 systr
ay Notification Area Area where notification icons appear
 370943 dboth    0::/user.slice/user-1000.sl          |   \_ /usr/lib64/xfce4/panel/wrapper-2.0 /usr/lib64/xfce4/panel/plugins/libpulseaudio-plugin.so 8 2306
8681 pulseaudio PulseAudio Plugin Adjust the audio volume of the PulseAudio sound system
 370944 dboth    0::/user.slice/user-1000.sl          |   \_ /usr/lib64/xfce4/panel/wrapper-2.0 /usr/lib64/xfce4/panel/plugins/libxfce4powermanager.so 9 2306
8682 power-manager-plugin Power Manager Plugin Display the battery levels of your devices and control the brightness of your display
 370945 dboth    0::/user.slice/user-1000.sl          |   \_ /usr/lib64/xfce4/panel/wrapper-2.0 /usr/lib64/xfce4/panel/plugins/libnotification-plugin.so 10 2
3068683 notification-plugin Notification Plugin Notification plugin for the Xfce panel
 370948 dboth    0::/user.slice/user-1000.sl          |   \_ /usr/lib64/xfce4/panel/wrapper-2.0 /usr/lib64/xfce4/panel/plugins/libactions.so 14 23068684 acti
ons Action Buttons Log out, lock or other system actions
 370934 dboth    0::/user.slice/user-1000.sl          \_ Thunar --sm-client-id 2cfc809d8-4e1d-497a-a5c5-6e4fa509c3fb --daemon
 370939 dboth    0::/user.slice/user-1000.sl          \_ xfdesktop --display :0.0 --sm-client-id 299be0608-4dca-4055-b4d6-55ec6e73a324
 370962 dboth    0::/user.slice/user-1000.sl          \_ nm-applet
<删节>
```

你可以使用 `systemd-cgls` 命令查看整个层次结构，这个命令不需要任何的复杂参数，更加简单。

我也大幅缩短了这个树状结构，但是保留了足够多的输出，以便你能够了解在自己的系统上执行这个命令时应该看到的数据总量和条目类型。我在我的一个虚拟机上执行了这个命令，输出大概有 200 行；我的主要工作站的输出大概有 250 行。

```
[root@testvm1 ~]# systemd-cgls
Control group /:
-.slice
├─user.slice
│ ├─user-0.slice
│ │ ├─session-1.scope
│ │ │ ├─  1130 sshd: root [priv]
│ │ │ ├─  1147 sshd: root@pts/0
│ │ │ ├─  1148 -bash
│ │ │ ├─  1321 screen
│ │ │ ├─  1322 SCREEN
│ │ │ ├─  1323 /bin/bash
│ │ │ ├─  1351 /bin/bash
│ │ │ ├─  1380 /bin/bash
│ │ │ ├─123293 man systemd.slice
│ │ │ ├─123305 less
│ │ │ ├─246795 /bin/bash
│ │ │ ├─371371 man systemd-cgls
│ │ │ ├─371383 less
│ │ │ ├─371469 systemd-cgls
│ │ │ └─371470 less
│ │ └─user@0.service …
│ │   ├─dbus-broker.service
│ │   │ ├─1170 /usr/bin/dbus-broker-launch --scope user
│ │   │ └─1171 dbus-broker --log 4 --controller 12 --machine-id 3bccd1140fca488187f8a1439c832f07 --max-bytes 100000000000000 --max-fds 25000000000000 --max->
│ │   ├─gvfs-daemon.service
│ │   │ └─1173 /usr/libexec/gvfsd
│ │   └─init.scope
│ │     ├─1137 /usr/lib/systemd/systemd --user
│ │     └─1138 (sd-pam)
│ └─user-1000.slice
│   ├─user@1000.service …
│   │ ├─dbus\x2d:1.2\x2dorg.xfce.Xfconf.slice
│   │ │ └─dbus-:1.2-org.xfce.Xfconf@0.service
│   │ │   └─370748 /usr/lib64/xfce4/xfconf/xfconfd
│   │ ├─dbus\x2d:1.2\x2dca.desrt.dconf.slice
│   │ │ └─dbus-:1.2-ca.desrt.dconf@0.service
│   │ │   └─371262 /usr/libexec/dconf-service
│   │ ├─dbus-broker.service
│   │ │ ├─1260 /usr/bin/dbus-broker-launch --scope user
│   │ │ └─1261 dbus-broker --log 4 --controller 11 --machine-id
<删节>
│   │ └─gvfs-mtp-volume-monitor.service
│   │   └─370987 /usr/libexec/gvfs-mtp-volume-monitor
│   ├─session-3.scope
│   │ ├─1218 sshd: dboth [priv]
│   │ ├─1233 sshd: dboth@pts/1
│   │ └─1235 -bash
│   └─session-7.scope
│     ├─370621 /usr/libexec/lxdm-session
│     ├─370631 xfce4-session
│     ├─370805 /usr/bin/VBoxClient --clipboard
│     ├─370806 /usr/bin/VBoxClient --clipboard
│     ├─370817 /usr/bin/VBoxClient --seamless
│     ├─370818 /usr/bin/VBoxClient --seamless
│     ├─370824 /usr/bin/VBoxClient --draganddrop
│     ├─370825 /usr/bin/VBoxClient --draganddrop
│     ├─370841 /usr/bin/ssh-agent /bin/sh -c exec -l bash -c "/usr/bin/startxfce4"
│     ├─370910 /bin/gpg-agent --sh --daemon --write-env-file /home/dboth/.cache/gpg-agent-info
│     ├─370911 xfwm4 --display :0.0 --sm-client-id 2dead44ab-0b4d-4101-bca4-e6771f4a8ac2
│     ├─370923 xfsettingsd --display :0.0 --sm-client-id 261b4a437-3029-461c-9551-68c2c42f4fef
│     ├─370930 xfce4-panel --display :0.0 --sm-client-id 2ce38b8ef-86fd-4189-ace5-deec1d0e0952
│     ├─370934 Thunar --sm-client-id 2cfc809d8-4e1d-497a-a5c5-6e4fa509c3fb --daemon
│     ├─370939 xfdesktop --display :0.0 --sm-client-id 299be0608-4dca-4055-b4d6-55ec6e73a324
<删节>
└─system.slice
  ├─rngd.service
  │ └─1650 /sbin/rngd -f
  ├─irqbalance.service
  │ └─1631 /usr/sbin/irqbalance --foreground
  ├─fprintd.service
  │ └─303383 /usr/libexec/fprintd
  ├─systemd-udevd.service
  │ └─956 /usr/lib/systemd/systemd-udevd
<删节>
  ├─systemd-journald.service
  │ └─588 /usr/lib/systemd/systemd-journald
  ├─atd.service
  │ └─1010 /usr/sbin/atd -f
  ├─system-dbus\x2d:1.10\x2dorg.freedesktop.problems.slice
  │ └─dbus-:1.10-org.freedesktop.problems@0.service
  │   └─371197 /usr/sbin/abrt-dbus -t133
  ├─sshd.service
  │ └─893 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
  ├─vboxservice.service
  │ └─802 /usr/sbin/VBoxService -f
  ├─crond.service
  │ └─1011 /usr/sbin/crond -n
  ├─NetworkManager.service
  │ └─765 /usr/sbin/NetworkManager --no-daemon
  ├─switcheroo-control.service
  │ └─787 /usr/libexec/switcheroo-control
 <删节>
```

这个树状视图显示了所有的用户和系统切片，以及每个控制组内正在运行的服务和程序。注意叫作 `scope`（范围）的单元，它将相关的程序组成一个管理单元，在上面列出的结果中就是 `user-1000.slice`。`user-1000.slice/session-7.scope` 控制组包含了 GUI 桌面程序层次结构，以 LXDM 显示管理器会话和其所有的子任务开始，包括像 Bash 命令行解释器和 Thunar GUI 文件管理器之类的程序。

配置文件中不定义范围单元，而是作为启动相关程序组的结果程序化生成的。范围单元不创建或启动作为控制组的组成部分运行的进程。范围内的所有进程都是平等的，没有内部的层次结构。一个范围的生命周期在第一个进程创建时开始，在最后一个进程销毁时结束。

在你的桌面打开多个窗口，比如终端模拟器、LibreOffice、或者任何你想打开的，然后切换到一个可用的虚拟控制台，启动类似 `top` 或 [Midnight Commander][11] 的程序。在主机运行 `systemd-cgls` 命令，留意整体的层次结构和范围单元。

`systemd-cgls` 命令提供的控制组层次结构表示（以及组成控制组单元的细节），比我见过的其他任何指令都要完整。和 `ps` 命令提供的输出相比，我喜欢 `systemd-cgls` 命令更简洁的树形表示。

### 来自朋友们的一点帮助

介绍完这些基础知识后，我曾计划过深入研究控制组的更多细节，以及如何使用，但是我在 Opensource.com 的姐妹网站 [Enable Sysadmin][13] 上发现了一系列四篇优秀文章，由 Red Hat 公司的 [Steve Ovens][12] 所作。与其从头重写 Steve 的文章，我觉得倒不如通过链接到这些文章，利用他的控制组专业知识：

  1. [一个 Linux 系统管理员对控制组的介绍][14]
  2. [如何用 CPUShares 管理控制组][15]
  3. [用更难的方式，手动管理控制组][16]
  4. [用 systemd 管理控制组][17]

像我一样享受这些文章并从中汲取知识吧。

### 其他资源

互联网上充斥着大量关于 systemd 的信息，但大部分都简短生硬、愚钝、甚至令人误解。除了本文提到的资源，下面的网页提供了关于 systemd 启动更详细可靠的信息。自从我开始这一系列的文章来反映我所做的研究以来，这个的列表已经变长了。

  * Fedora 项目有一个优质实用的 [systemd 指南][18]，几乎有你使用 systemd 配置、管理、维护一个 Fedora 计算机需要知道的一切。
  * Fedora 项目还有一个好用的 [速查表][19]，交叉引用了古老的 SystemV 命令和对应的 systemd 命令。
  * [systemd.unit(5) 手册页][20] 包含了一个不错的单元文件中各个节的列表，以及这些节的配置选项和简洁的描述。
  * Red Hat 文档包含了一个 [单元文件结构][21] 的有用描述，还有一些其他的重要信息。
  * 要获取 systemd 的详细技术信息和创立的原因，查看 Freedesktop.org 的 [systemd 描
述][22]。这个使我发现过的最棒页面之一，因为其中包含了许多指向其他重要准确文档的链接。
  * Linux.com 上 “systemd 的更多乐趣” 提供了更高级的 systemd [信息和提示][23]。
  * 查看 [systemd.resource-control(5)][24] 的手册页
  * 查看 [_Linux 内核用户和管理员指南_][25] 中的 [控制组 v2 条目][26]。

还有一系列针对系统管理员的深度技术文章，由 systemd 的设计者和主要开发者 Lennart
Poettering 所作。这些文章写于 2010 年 4 月到 2011 年 9 月之间，但在当下仍然像当时一样有
价值。关于 systemd 及其生态的许多其他优秀的作品都是基于这些文章的。

  * [Rethinking PID 1][27]
  * [systemd for Administrators, Part I][28]
  * [systemd for Administrators, Part II][29]
  * [systemd for Administrators, Part III][30]
  * [systemd for Administrators, Part IV][31]
  * [systemd for Administrators, Part V][32]
  * [systemd for Administrators, Part VI][33]
  * [systemd for Administrators, Part VII][34]
  * [systemd for Administrators, Part VIII][35]
  * [systemd for Administrators, Part IX][36]
  * [systemd for Administrators, Part X][37]
  * [systemd for Administrators, Part XI][38]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/cgroups

作者：[David Both][a]
选题：[lujun9972][b]
译者：[YungeG](https://github.com/YungeG)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://en.wikipedia.org/wiki/Top_(software)
[3]: https://opensource.com/article/19/11/monitoring-linux-glances
[4]: https://opensource.com/article/20/4/systemd
[5]: https://en.wikipedia.org/wiki/Cgroups
[6]: mailto:user@0.service
[7]: mailto:user@1000.service
[8]: mailto:1.2-org.xfce.Xfconf@0.service
[9]: mailto:1.2-ca.desrt.dconf@0.service
[10]: mailto:1.10-org.freedesktop.problems@0.service
[11]: https://midnight-commander.org/
[12]: https://www.redhat.com/sysadmin/users/steve-ovens
[13]: https://www.redhat.com/sysadmin/
[14]: https://www.redhat.com/sysadmin/cgroups-part-one
[15]: https://www.redhat.com/sysadmin/cgroups-part-two
[16]: https://www.redhat.com/sysadmin/cgroups-part-three
[17]: https://www.redhat.com/sysadmin/cgroups-part-four
[18]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html
[19]: https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
[20]: https://man7.org/linux/man-pages/man5/systemd.unit.5.html
[21]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/managing-services-with-systemd_configuring-basic-system-settings#Managing_Services_with_systemd-Unit_File_Structure
[22]: https://www.freedesktop.org/wiki/Software/systemd/
[23]: https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/
[24]: https://man7.org/linux/man-pages/man5/systemd.resource-control.5.html
[25]: https://www.kernel.org/doc/html/latest/admin-guide/index.html
[26]: https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html
[27]: http://0pointer.de/blog/projects/systemd.html
[28]: http://0pointer.de/blog/projects/systemd-for-admins-1.html
[29]: http://0pointer.de/blog/projects/systemd-for-admins-2.html
[30]: http://0pointer.de/blog/projects/systemd-for-admins-3.html
[31]: http://0pointer.de/blog/projects/systemd-for-admins-4.html
[32]: http://0pointer.de/blog/projects/three-levels-of-off.html
[33]: http://0pointer.de/blog/projects/changing-roots
[34]: http://0pointer.de/blog/projects/blame-game.html
[35]: http://0pointer.de/blog/projects/the-new-configuration-files.html
[36]: http://0pointer.de/blog/projects/on-etc-sysinit.html
[37]: http://0pointer.de/blog/projects/instances.html
[38]: http://0pointer.de/blog/projects/inetd.html
