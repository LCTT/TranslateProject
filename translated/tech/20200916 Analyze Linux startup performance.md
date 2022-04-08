[#]: collector: (lujun9972)
[#]: translator: (jiamn)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Analyze Linux startup performance)
[#]: via: (https://opensource.com/article/20/9/systemd-startup-configuration)
[#]: author: (David Both https://opensource.com/users/dboth)

分析 Linux 启动性能
======
用 systemd-analyze 查看 Linux 启动性能或者解决一些问题

![Magnifying glass on code][1]


系统管理员的一部分工作就是分析系统性能，去发现并解决引起性能不佳、长时间启动系统的问题。系统维护者也需要去检查系统配置和使用等。

systemd 初始化系统提供了 systemd-analyze 工具，帮助查看性能和其他重要的 systemd 信息。在以前的文章 分析 [_systemd 日历和时间间隔_][2] 里，我用了 systemd-analyze 去分析 systemd 里的时间戳和时间间隔，但是这个工具有很多其他用法，这个文章里我再揭示一些。

（译者注： systemd 是目前主流Linux release 采用的系统管理； boot 翻译为启动，startup 翻译为起动）

### 总览

LINUX 起动顺序是值得学习关注的地方，因为 systemd-analyze 工具很多功能聚焦在起动 startup 过程。但是首先，要理解启动 boot 和起动 startup 。启动从 BIOS 加电自检（POST）开始，装载和控制主机系统结束，然后是起动 startup ，systemd 日志开始。
这个系列的第二篇文章， [_理解LINUX起动 systemd_][3]，我讨论了起动 startup 的一点顺序上的细节，文章里，我试图解释起动 startup 顺序时间总进程和大部分时间花费在哪里。
我的主工作站比虚拟机的结果更有意义。工作站组成是ASUS TUF X299 Mark 2 主板，Intel i9-7960X cpu （16核 32线程），64G内存。一些命令非超级用户可以使用，但是我在这篇文章里使用了超级用户避免在用户之间切换。
检查起动过程有几个选项，最简单的是从 systemd-analyze 命令显示起动的几个主要分段耗费的时间汇总，内核起动，装载运行 initrd （初始ramdisk，一个临时系统镜像用来初始化一些硬件，挂载 / 根文件系统），还有用户空间 （所有的程序和后台进程需要主机起动到一个可用的状态）。如果没有子命令传递给命令， systemd-analyze time 是这样的：

```
[root@david ~]$ systemd-analyze
Startup finished in 53.921s (firmware) + 2.643s (loader) + 2.236s (kernel) + 4.348s (initrd) + 10.082s (userspace) = 1min 13.233s
graphical.target reached after 10.071s in userspace
[root@david ~]#
```
特别要注意的 BIOS 花费了接近54秒，这是一个非同寻常的时间段，基本上所有的物理硬件系统都要使用 BIOS。

我的System76 Oryx Pro笔记本在BIOS只花了8.506秒，我家里所有的系统都在10秒以内。在线搜索一阵之后，我发现这个主板（译者注：作者的主工作站主板）因为不同寻常的 BIOS 启动时间著名，我的主板从不“启动”，总是挂掉，我需要关机再开机，BIOS报错，按 F1 进入 BIO S设置，选择要启动的驱动器完成启动，多出的时间就是这样用掉的。

不是所有主机显示固件数据（译者注：固件启动中无法使用 systemd）。用Intel 9代或者更高的处理器就感觉不科学。尽管那不是正确的。（译者注：更高代的 cpu 启动时间更短，因为优化的 BIOS ）

总结关于启动起动是非常有趣的，同时提供了很好的（虽然有限）的信息，仍然有很多关于起动的信息，就像下面我将描述的一样。

### 指定火炬

你可以用 systemd-analyze blame 去发现初始化每个 systemd 单元用掉的时间，结果按照初始化时间长短排序，从多到少：


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
注：删去了好多时间不长的条目

因为很多服务是并行开始的，在 BIOS 之后所有单元加在一起的总数超过了 systemd-analyze time 汇总数。很多都是小数，不能显著的节省时间。

这个命令提供的数据显明了提升启动时间的办法。无用的服务禁止（disable）掉。在起动序列中花掉很多时间的单一服务呈现明显。每次启动起动你可以看到不同结果。（译者注：并行起动服务的原因）

### 严格链

项目管理中有个严格链，（译者注：systemd可以定义服务间严格依赖，构成严格链）在起动中可以通过查看一个严格链与时间相关的事件。
有一些systemd单元起动中很慢，可能因为依赖严格链影响的，工具没有从开始显示所有单元，仅仅是有严格限制关系的事件。（译者注：相当于最短路径。并不显示依赖但不在严格链上的服务单元）


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

@后面的秒数数字是从起动开始到单元激活的时间，+后面是单元开始花费的时间。

### 系统状态

有时候你需要决定系统的当前状态， systemd-analyze dump 命令挖显出当前系统状态的一堆数据。有主要的启动时间戳，一个每个 systemd 单元的列表，和一个每个完整的详细描述：


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

注：删掉了很多输出行

在我的主工作站，这个命令生成了49680行大概1.66MB，命令很快，你不需要等待。

我喜欢多种连接设备的规格细节，例如存储。每个 systemd 单元有一节例如模块的多种运行时、缓存、日志目录、单元开始命令、PID、开始时间戳、内存和文件限制。

systemd-analyze 的 man 帮助手册里展示了 systemd-analyze --user dump 选项，显示用户管理器的内部状态。但是我失败了，互联网搜索之后表明机器有一些问题。在 systemd 里， --user 实例用来管理和控制处理器给每个用户的资源。处理能力按分给每个用户的控制组 control group（译者注：系统管理一个特性）分配，我回头再写。

### 分析图表

很多尖头老板( pointy-haired-bosses )和好的经理人发现好的图表特别容易阅读理解，比我经常看的文本类系统性能数据好。看，我喜欢好图表，systemd-analyze 提供了显示启动/起动数据用 [SVG][4] 向量图表。 

下面的命令生成一个向量图文件来显示在启动起动之间发生的事件。生成这个文件只需要几秒：

```
`[root@david ~]# systemd-analyze plot > /tmp/bootup.svg`
```

这个命令创建了 SVG，SVG是一个定义图向量应用的文本文件，包括Image Viewer、Ristretto、 Okular、 Eye of Mate、 LibreOffice Draw、和其他，(译者注：这些是文档应用）用来生成图。这些应用可以处理 SVG 来创建一个图像。

我用 LibreOffice Draw（译者注：一个办公文档软件）去渲染一幅图。图很大，你需要放大来看细节。这里放的比较小：

![The bootup.svg file displayed in LibreOffice Draw.][5]

(David Both, [CC BY-SA 4.0][6])

启动起始是图上左面的时间线0，起动序列在0的右面。这个小图显示了内核、initrd、和initrd处理开启。 

这个图显示了谁什么时候开始，持续了多久，和主要的依赖。严格路径是红色高亮的。

另外一个生成图片输出的命令是 systemd-analyze plot，它生成了[DOT][7] 格式纹理依赖图。结果数据流通过 dot 工具管道，这是一族用来生成向量图文件多种类型数据的程序。这些 SVG 文件也能被上面列出的工具处理。

首先，生成文件，在我的主工作站花了9分钟：


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

我不想重新生成输出了，因为比意大利面还好。但是你应该试试看看我想让你看到的结果。

### 条件

我不想重新生成输出了，因为比意大利面还好。但是你应该试试看看我想让你看到的结果。

很多有意思的，也有些普遍的，当我读 systemd-analyze man 帮助时发现 condition 子命令 （是的，我读了man帮助手册，我就是这样学习的）。这个 condition 子命令能用来测试条件和断言 systemd 单元文件。

把它放到程序里评估一个或者多个条件成立是否返回 0 值，或者条件没有成立返回 1。 在其他情况，它根据调查结果吐出文本。

下面的例子，来自man帮助手册，稍微有点复杂。它测试了内核版本是不是在 4.0 和 5.1，主机使 用AC power，系统结构不是 arm，并且它的目录 /etc/os-release 是否存在。我加了 echo $? 来打印返回值。


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

条件和断言在 systemd.unit(5) man帮助手册的大概 600 行。

### 罗列配置文件

systemd-analyze 工具可以发送多种配置文件内容去标准输出，像这儿展示的，基础根目录是 /etc/:


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

这和标准的 cat 命令做的差不多。我发现另外一条小有帮助的命令，它能在标准的 systemd 所在的位置搜索模式匹配的内容：


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

这些命令为每个文件提供了包含文件的全路径和文件名的注释行。

### 单元文件检查

当创建了一个新的单元文件，利用 verify 子命令帮助检查语法是否正确。它能指出来不正确的拼写和呼叫错误服务单元的指导。


```
`[root@david ~]# systemd-analyze verify /etc/systemd/system/backup.service`
```

Unix/Linux 的反馈宗旨是“沉默是金”，没有输出意味着扫描文件没有错。

### 安全

security 子命令检查指定服务的安全级别。只能针对服务单元，其他类型的单元文件不可用：


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

是的，哭脸（emoji）是输出。但是当然，很多服务的工作比美观更重要。我列举了一些服务，包括我自己的备份服务，结果可能不同，但是最下面一行看起来是一样的。
这个工具对于在严格的安全环境检查和修复用户空间服务单元是很有用的。我不认为我们的大多数都能用到它。

### 最后总结

强有力的工具（sysmted-analyze）提供了一些有意思和迷人的有益的选项。这篇文章阐述了用 systemd-analyze 来分析 systemd Linux内部起动性能。它同样能分析 systemd 的其他方面。
工具的某部分是限制使用的，有些被遗漏。但是大多数对于起动和其他 systemd 功能的问题解决提供了很好的结果。

### 资源

互联网上关于 systemd 有很多信息，但是很多过于简洁，迟钝，甚至误导。这篇文章中提到的额外的资源，是列在下面的关于 systemd 起动的更细节更可信的web页面。我罗列了自从我开始这个系列的文章影响我研究的内容。

  * The [systemd.unit(5) 手册页面][9] 包含了非常棒的每个都是丰富细节描述的一些单元文件节段和它们的配置文件选项。
  * The Fedora 项目有一个好的练习 [systemd 指导][10]. 它指导了你用 Fedora systemd 要知道的设置，管理，维护。
  * The Fedora 项目还有一个好的 [备忘录][11] 兼容交叉了老的 SystemV 命令和 systemd 以及比较。
  * Red Hat 文档包含了一个详细的描述 [单元文件结构][12] 和其他一样重要的信息。
  * 关于systemd技术细节和创建的原因，可以去 Freedesktop.org's [ systemd 详述][13].
  * [Linux.com][14]的 "更多 systemd 乐趣" 提供了很多高级的 systemd  [信息和提示][15].


下面是 systemd 设计者和主要开发者 Lennart Poettering 关于 Linux 系统管理员的深度技术文档，这些文章尽管写于2010年4月到2011年9月，现在看也是非常适应时宜的。其他很棒的 systemd 相关的体系都基于这些设计。

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
