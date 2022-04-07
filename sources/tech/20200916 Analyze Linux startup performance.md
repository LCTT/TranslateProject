[#]: collector: (lujun9972)
[#]: translator: (jiamn)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Analyze Linux startup performance)
[#]: via: (https://opensource.com/article/20/9/systemd-startup-configuration)
[#]: author: (David Both https://opensource.com/users/dboth)

分析Linux启动性能
======
用 systemd-analyze 看一看Linux启动性能或者解决一些问题

![Magnifying glass on code][1]

系统管理员的一部分工作就是分析系统性能，去发现并解决引起性能不佳长时间启动系统的问题。系统维护者也需要去检查系统配置和使用各方面。

systemd 初始化系统提供了 systemd-analyze 工具，帮助查看性能和其他重要的 systemd 信息。在以前的文章 [_分析 systemd 日历和时间间隔_][2] 里，我用了 systemd-analyze 去分析 systemd 里的时间戳和时间间隔，但是这个工具有很多其他用法，这个文章里我再揭示一些。

### Startup overview
### 总览

The Linux startup sequence is a good place to begin exploring because many `systemd-analyze` tool functions are targeted at startup. But first, it is important to understand the difference between boot and startup. The boot sequence starts with the BIOS power-on self test (POST) and ends when the kernel is finished loading and takes control of the host system, which is the beginning of startup and the point when the systemd journal begins.

LINUX起动顺序是学习关注的地方，因为 systemd-analyze 工具很多功能聚焦在起动startup过程。但是首先，要理解启动boot和起动startup。启动从BIOS加电自检（POST）开始，装载和控制主机系统后结束，然后是起动startup，systemd 日志开始。

In the second article in this series, [_Understanding systemd at startup on Linux_][3], I discuss startup in a bit more detail with respect to what happens and in what sequence. In this article, I want to examine the startup sequence to look at the amount of time it takes to go through startup and which tasks take the most time.

这个系列的第二篇文章， [_理解LINUX起动 systemd_]【3】，我讨论起动startup的一点顺序上的细节，文章里，我试图解释起动startup顺序时间总进程和大部分时间花费在哪里。

The results I'll show below are from my primary workstation, which is much more interesting than a virtual machine's results. This workstation consists of an ASUS TUF X299 Mark 2 motherboard, an Intel i9-7960X CPU with 16 cores and 32 CPUs (threads), and 64GB of RAM. Some of the commands below can be run by a non-root user, but I will use root in this article to prevent having to switch between users.
我将展示我的主工作站，非常感兴趣在虚拟机的结果，工作站组成是ASUS TUF X299 Mark 2 主板，Intel i9-7960X cpu （16核 32线程），64G内存。一些命令可以用非超级用户使用，但是我在这篇文章里使用了超级用户避免在用户之间切换。

There are several options for examining the startup sequence. The simplest form of the `systemd-analyze` command displays an overview of the amount of time spent in each of the main sections of startup, the kernel startup, loading and running `initrd` (i.e., initial ramdisk, a temporary system image that is used to initialize some hardware and mount the `/` [root] filesystem), and userspace (where all the programs and daemons required to bring the host up to a usable state are loaded). If no subcommand is passed to the command, `systemd-analyze time` is implied:
检查起动过程有几个选项，最简单的是从 systemd-analyze 命令显示起动的几个主要分段耗费的时间汇总，核心起动，装载运行 initrd （初始ramdisk，一个临时的系统镜像用来初始化一些硬件，挂载/ 文件系统），还有用户空间 （所有的程序和后台需要主机起动到一个可用的状态）。如果没有子命令传递给命令， systemd-analyze time 是这样的。

```
[root@david ~]$ systemd-analyze
Startup finished in 53.921s (firmware) + 2.643s (loader) + 2.236s (kernel) + 4.348s (initrd) + 10.082s (userspace) = 1min 13.233s
graphical.target reached after 10.071s in userspace
[root@david ~]#
```

The most notable data in this output is the amount of time spent in firmware (BIOS): almost 54 seconds. This is an extraordinary amount of time, and none of my other physical systems take anywhere near as long to get through BIOS.
主要的在BIOS花费了接近54秒，这是一个非同寻常的时间段，基本上所有的物理硬件系统都要穿过BIOS。

My System76 Oryx Pro laptop spends only 8.506 seconds in BIOS, and all of my home-built systems take a bit less than 10 seconds. After some online searches, I found that this motherboard is known for its inordinately long BIOS boot time. My motherboard never "just boots." It always hangs, and I need to do a power off/on cycle, and then BIOS starts with an error, and I need to press F1 to enter BIOS configuration, from where I can select the boot drive and finish the boot. This is where the extra time comes from.
我的System76 Oryx Pro笔记本在BIOS只花了8.506秒，我家里所有的系统都在10秒以内。一些在线搜索之后，我发现这个主板因为不同寻常的IBIOS启动时间著名，我的主板从不“正启动”，总是挂掉，我需要关机/再开机，BIOS报错开始，需要按F1进入BIOS设置，选择要启动的驱动器完成启动，这些时间就是这样用掉的。

Not all hosts show firmware data. My unscientific experiments lead me to believe that this data is shown only for Intel generation 9 processors or above. But that could be incorrect.
不是所有主机显示固件数据，用Intel 9代或者更高的处理器就感觉不科学，那不是正确的。

This overview of the boot startup process is interesting and provides good (though limited) information, but there is much more information available about startup, as I'll describe below.
总结关于启动起动是非常有趣的同时提供了很好的（虽然有限）的信息，但是仍然有很多关于起动的信息可用，就像下面我将描述的一样。

### Assigning blame
### 设定火炬

You can use `systemd-analyze blame` to discover which systemd units take the most time to initialize. The results are displayed in order by the amount of time they take to initialize, from most to least:
你可以用 systemd-analyze blame 去发现初始化systemd 单元花费的时间，结果按照初始化花费时间的排序，从多到少。


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
&lt;SNIP – removed lots of entries with increasingly small times&gt;
```
注：删去了好多小时间

Because many of these services start in parallel, the numbers may add up to significantly more than the total given by `systemd-analyze time` for everything after the BIOS. All of these are small numbers, so I cannot find any significant savings here.
因为很多服务是并行开始的，在BIOS之后所有加在一起的超过了汇总数 systemd-analyze time。很多都是小数，所以我不能发现这签解决了哪些。

The data from this command can provide indications about which services you might consider to improve boot times. Services that are not used can be disabled. There does not appear to be any single service that is taking an excessively long time during this startup sequence. You may see different results for each boot and startup.
这个命令提供的数据表明了提升启动时间的办法。无用的服务禁止（disable）掉。在起动序列中花掉很多时间的单一服务可以消失？你可以看到每次不同结果每次启动起动。

### Critical chains
### 严格链

Like the critical path in project management, a _critical chain_ shows the time-critical chain of events that take place during startup. These are the systemd units you want to look at if startup is slow, as they are the ones that would cause delays. This tool does not display all the units that start, only those in this critical chain of events:
工程管理中有个严格链，在起动中能查一个严格的链表现了时间相关的事件。有一些systemd单元起动中很慢，可能就是因为限制链影响的，工具没有显示所有单元开始，仅仅是有严格限制关系的事件。


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

The numbers preceded with `@` show the absolute number of seconds since startup began when the unit becomes active. The numbers preceded by `+` show the amount of time it takes for the unit to start.
@后面的秒数数字是从起动开始到单元激活的时间，+后面是单元开始花费的时间。

### System state
### 系统状态

Sometimes you need to determine the system's current state. The `systemd-analyze dump` command dumps a _massive_ amount of data about the current system state. It starts with a list of the primary boot timestamps, a list of each systemd unit, and a complete description of the state of each:
有时候你需要决定系统的当前状态， systemd-analyze dump 命令挖显出当前系统状态的一堆数据。有启动的时间戳，一个每个systemd单元的列表，和一个完整的每个状态的详细描述

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
-&gt; Unit system.slice:
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
&lt;SNIP – Deleted a bazillion lines of output&gt;
```
注：删掉了一些输出行

On my main workstation, this command generated a stream of 49,680 lines and about 1.66MB. This command is very fast, so you don't need to wait for the results.
在我的主工作站，这个命令生成了49680行大概1.66MB，命令很快，你不需要等待。

I do like the wealth of detail provided for the various connected devices, such as storage. Each systemd unit has a section with details such as modes for various runtimes, cache, and log directories, the command line used to start the unit, the process ID (PID), the start timestamp, as well as memory and file limits.
我喜欢多种连接设备的细节规格，例如存储。每个systemd单元有一节例如模块给多种运行时，缓存，和日志目录，命令用来开始单元，PID，开始时间戳，和内存和文件限制。

The man page for `systemd-analyze` shows the `systemd-analyze --user dump` option, which is intended to display information about the internal state of the user manager. This fails for me, and internet searches indicate that there may be a problem with it. In systemd, `--user` instances are used to manage and control the resources for the hierarchy of processes belonging to each user. The processes for each user are part of a control group, which I'll cover in a future article.
systemd-analyze 的man帮助里展示了 systemd-analyze --user dump 选项，显示内部用户管理器的状态，但是我失败了，搜索之后表明有一些问题。在systemd里， --user 实例用来管理和控制处理器给每个用户的资源。处理器分给每个用户一部分控制组（译者注：系统管理的一个特性），我回头会再写一篇。

### Analytic graphs
### 分析图表

Most pointy-haired-bosses (PHBs) and many good managers find pretty graphs easier to read and understand than the text-based system performance data I usually prefer. Sometimes, though, even I like a good graph, and `systemd-analyze` provides the capability to display boot/startup data in an [SVG][4] vector graphics chart.
很多PHB老板和好的经理人发现好的图表特别容易阅读肯理解文本类胡系统性能数据，有时，我喜欢好图表，systemd-analyze 提供了显示启动起动数据用[SVG][4] 向量图表。
The following command generates a vector graphics file that displays the events that take place during boot and startup. It only takes a few seconds to generate this file:
下面胡命令生成一个向量图文件来显示在启动起动之间发生胡事件，生成这个文件只需要几秒：

```
`[root@david ~]# systemd-analyze plot > /tmp/bootup.svg`
```

This command creates an SVG, which is a text file that defines a series of graphic vectors that applications, including Image Viewer, Ristretto, Okular, Eye of Mate, LibreOffice Draw, and others, use to generate a graph. These applications process SVG files to create an image.
这个命令创建SVG，是一个文本文件来定义图表向量的应用，包括Image Viewer, Ristretto, Okular, Eye of Mate, LibreOffice Draw,(译者注：这些都是一些文档程序），和其他，用来生成图，这些应用可以处理SVG来创建一个图像。
I used LibreOffice Draw to render a graph. The graph is huge, and you need to zoom in considerably to make out any detail. Here is a small portion of it:
我用 LibreOffice Draw（译者注：一个办公文档软件）去渲染一幅图。图很大，你需要放大来看细节。这里是一个比较小部分。

![The bootup.svg file displayed in LibreOffice Draw.][5]

(David Both, [CC BY-SA 4.0][6])

The bootup sequence is to the left of the zero (0) on the timeline in the graph, and the startup sequence is to the right of zero. This small portion shows the kernel, `initrd`, and the processes `initrd` started.
启动顺序是图上左面的时间线0，起动序列是右面的0.这个小图显示了内核、initrd、和处理器initrd开始。
This graph shows at a glance what started when, how long it took to start up, and the major dependencies. The critical path is highlighted in red.
这个图显示了谁什么时候开始，持续了多久，和主要的依赖。严格路径是红色高亮的。
Another command that generates graphical output is `systemd-analyze plot`. It generates textual dependency graph descriptions in [DOT][7] format. The resulting data stream is then piped through the `dot` utility, which is part of a family of programs that can be used to generate vector graphic files from various types of data. These SVG files can also be processed by the tools listed above.
另外一个生成图片输出的命令是 systemd-analyze plot，它生成了纹理依赖图描述在 [DOT][7]格式。结果数据流通过dot工具的管道，这是一族用来生成向量图片文件多种类型数据的程序。这些SVG文件也能被上面列出的工具处理。
First, generate the file. This took almost nine minutes on my primary workstation:
首先，生成文件，在我的主工作站花了9分钟


```
[root@david ~]# time systemd-analyze dot | dot -Tsvg &gt; /tmp/test.svg
   Color legend: black     = Requires
                 dark blue = Requisite
                 dark grey = Wants
                 red       = Conflicts
                 green     = After

real    8m37.544s
user    8m35.375s
sys     0m0.070s
[root@david ~]#
```

I won't reproduce the output here because the resulting graph is pretty much spaghetti. But you should try it and view the result to see what I mean.
我不想重新生成输出了，因为比spaghetti还好。你应该试试看看我想让你看到的结果。
### Conditionals
### 条件

One of the more interesting, yet somewhat generic, capabilities I discovered while reading the `systemd-analyze(1)` man page is the `condition` subcommand. (Yes—I do read the man pages, and it is amazing what I have learned this way!) This `condition` subcommand can be used to test the conditions and asserts that can be used in systemd unit files.
很多有意思的，也有些普遍的，当我读 systemd-analyze man帮助时发现 condition 子命令 （是的，我读了man帮助手册，我就是这样学习的）。这个 condition 子命令能用来测试条件和断言systemd单元文件。
It can also be used in scripts to evaluate one or more conditions—it returns a zero (0) if all are met or a one (1) if any condition is not met. In either case, it also spews text about its findings.
它能用来编码评估一个或者多个条件成立是否返回0值，或者条件没有成立返回1. 在其他时候，它根据它的调查结果吐出文本。
The example below, from the man page, is a bit complex. It tests for a kernel version between 4.0 and 5.1, that the host is running on AC power, that the system architecture is anything but ARM, and that the directory `/etc/os-release` exists. I added the `echo $?` statement to print the return code.
下面的例子，来自man帮助手册，稍微有点复杂。它测试了内核版本是不是在4.0和5.1，主机正在运行ACpower，系统结构不是arm，并且它的目录 /etc/os-release 是否存在，我加了 echo $? 来打印返回值。

```
[root@david ~]# systemd-analyze condition 'ConditionKernelVersion = ! &lt;4.0' \
                    'ConditionKernelVersion = &gt;=5.1' \
                    'ConditionACPower=|false' \
                    'ConditionArchitecture=|!arm' \
                    'AssertPathExists=/etc/os-release' ; \
echo $?
test.service: AssertPathExists=/etc/os-release succeeded.
Asserts succeeded.
test.service: ConditionArchitecture=|!arm succeeded.
test.service: ConditionACPower=|false failed.
test.service: ConditionKernelVersion=&gt;=5.1 succeeded.
test.service: ConditionKernelVersion=!&lt;4.0 succeeded.
Conditions succeeded.
0
[root@david ~]#
```

The list of conditions and asserts starts around line 600 on the `systemd.unit(5)` man page.
条件和断言在 systemd.unit(5) man帮助手册的大概600行。
### Listing configuration files
### 配置文件列表
The `systemd-analyze` tool provides a way to send the contents of various configuration files to `STDOUT`, as shown here. The base directory is `/etc/`:
systemd-analyze 工具提供了一个方法去发送多种配置文件内容去标准输出，像这儿展示的，依据目根录是 /etc/

```
[root@david ~]# systemd-analyze cat-config systemd/system/display-manager.service
# /etc/systemd/system/display-manager.service
[Unit]
Description=LXDM (Lightweight X11 Display Manager)
#Documentation=man:lxdm(8)
Conflicts=[getty@tty1.service][8]
After=systemd-user-sessions.service [getty@tty1.service][8] plymouth-quit.service livesys-late.service
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

This is a lot of typing to do nothing more than a standard `cat` command does. I find the next command a tiny bit helpful. It can search out files with the specified pattern within the standard systemd locations:
这和标准的cat命令做的差不多。我发现另外一条小有帮助的命令，它能在标准的systemd所在的位置搜索指定的模式：

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

Both of these commands preface the contents of each file with a comment line containing the file's full path and name.
这些命令为每个文件提供了注释行包含了文件的全路径名。
### Unit file verification
### 单元文件校验
After creating a new unit file, it can be helpful to verify that its syntax is correct. This is what the `verify` subcommand does. It can list directives that are spelled incorrectly and call out missing service units:
当创建了一个新的单元文件，它能帮助校验语法是否正确，利用 verify 子命令。它能列出来不正确拼写和呼叫错误服务单元的指导。

```
`[root@david ~]# systemd-analyze verify /etc/systemd/system/backup.service`
```

Adhering to the Unix/Linux philosophy that "silence is golden," a lack of output messages means that there are no errors in the scanned file.
Unix/Linux的宗旨是“沉默是金”，没有输出意味着扫描文件没有错。
### Security
### 安全
The `security` subcommand checks the security level of specified services. It only works on service units and not on other types of unit files:
security 子命令检查指定服务的安全级别，只能对服务单元工作，其他类型的单元文件不可用。

```
[root@david ~]# systemd-analyze security display-manager
  NAME                                                        DESCRIPTION                                                     &gt;
✗ PrivateNetwork=                                             Service has access to the host's network                        &gt;
✗ User=/DynamicUser=                                          Service runs as root user                                       &gt;
✗ CapabilityBoundingSet=~CAP_SET(UID|GID|PCAP)                Service may change UID/GID identities/capabilities              &gt;
✗ CapabilityBoundingSet=~CAP_SYS_ADMIN                        Service has administrator privileges                            &gt;
✗ CapabilityBoundingSet=~CAP_SYS_PTRACE                       Service has ptrace() debugging abilities                        &gt;
✗ RestrictAddressFamilies=~AF_(INET|INET6)                    Service may allocate Internet sockets                           &gt;
✗ RestrictNamespaces=~CLONE_NEWUSER                           Service may create user namespaces                              &gt;
✗ RestrictAddressFamilies=~…                                  Service may allocate exotic sockets                             &gt;
✗ CapabilityBoundingSet=~CAP_(CHOWN|FSETID|SETFCAP)           Service may change file ownership/access mode/capabilities unres&gt;
✗ CapabilityBoundingSet=~CAP_(DAC_*|FOWNER|IPC_OWNER)         Service may override UNIX file/IPC permission checks            &gt;
✗ CapabilityBoundingSet=~CAP_NET_ADMIN                        Service has network configuration privileges                    &gt;
✗ CapabilityBoundingSet=~CAP_SYS_MODULE                       Service may load kernel modules
&lt;SNIP&gt;
✗ CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG                   Service may issue vhangup()                                     &gt;
✗ CapabilityBoundingSet=~CAP_WAKE_ALARM                       Service may program timers that wake up the system              &gt;
✗ RestrictAddressFamilies=~AF_UNIX                            Service may allocate local sockets                              &gt;

→ Overall exposure level for backup.service: 9.6 UNSAFE 😨
lines 34-81/81 (END)
```

Yes, the emoji is part of the output. But, of course, many services need pretty much complete access to everything in order to do their work. I ran this program against several services, including my own backup service; the results may differ, but the bottom line seems to be mostly the same.
是的，emoji是输出。但是当然，很多服务为了工作比需要更美更重要。我列举了一些服务，包括我自己的备份服务，结果不同，但是底行看起来是很重要的的一样。
This tool would be very useful for checking and fixing userspace service units in security-critical environments. I don't think it has much to offer for most of us.
这个工具对于在严格的安全空间环境检查和修复用户空间服务单元是很有用的。我不认为我们的大多数都能用到它。
### Final thoughts
### 最后总结
This powerful tool offers some interesting and amazingly useful options. Much of what this article explores is about using `systemd-analyze` to provide insights into Linux's startup performance using systemd. It can also analyze other aspects of systemd.
强有力的工具提供了一些有意思和迷人的有益的选项。这篇文章阐述了Linux起动性能用systemd-analyze来分析systemd的内部查看工具。它同样能分析其他systemd。
Some of these tools are of limited use, and a couple should be forgotten completely. But most can be used to good effect when resolving problems with startup and other systemd functions.
这些工具的一部分是限制使用的，有些被完整遗忘。但是大多数对于起动和其他systemd功能的问题解决提供了很好的结果。
### Resources
### 资源
There is a great deal of information about systemd available on the internet, but much is terse, obtuse, or even misleading. In addition to the resources mentioned in this article, the following webpages offer more detailed and reliable information about systemd startup. This list has grown since I started this series of articles to reflect the research I have done.

  * The [systemd.unit(5) manual page][9] contains a nice list of unit file sections and their configuration options along with concise descriptions of each.
  * The Fedora Project has a good, practical [guide to systemd][10]. It has pretty much everything you need to know in order to configure, manage, and maintain a Fedora computer using systemd.
  * The Fedora Project also has a good [cheat sheet][11] that cross-references the old SystemV commands to comparable systemd ones.
  * Red Hat documentation contains a good description of the [Unit file structure][12] as well as other important information.  
  * For detailed technical information about systemd and the reasons for creating it, check out Freedesktop.org's [description of systemd][13].
  * [Linux.com][14]'s "More systemd fun" offers more advanced systemd [information and tips][15].



There is also a series of deeply technical articles for Linux sysadmins by Lennart Poettering, the designer and primary developer of systemd. These articles were written between April 2010 and September 2011, but they are just as relevant now as they were then. Much of everything else good that has been written about systemd and its ecosystem is based on these papers.

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
