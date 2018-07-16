戴文的Linux内核专题：25 配置内核 (21)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.689/.jpg)

大家好！本篇我们将会配置Linux内核的网络文件系统支持。网络文件系统是一个可以通过网络远程访问计算机的远程文件系统。

首先，"NFS client support"驱动允许linux系统使用NFS网络文件系统。这里还有3个不同版本的NFS - (NFS client support for NFS version 2)、 (NFS client support for NFS version 3)、 (NFS client support for NFS version 4) 和 (NFS client support for NFSv4.1)。如果你有一个使用NFS的网络，找出你正在使用NFS的版本，或者启用所有的NFS驱动。

交换空间并不需要总在本地存储单元上。这个驱动允许Linux使用NFS作为远程交换空间(Provide swap over NFS support)。

NFS系统可以通过缓存系统加速 (Provide NFS client caching support)。这是一个本地缓存。

启用这个驱动允许NFS服务器使用DNS解析器(Use the legacy NFS DNS resolver)。

"NFS server support"给予需要满足这个需求的服务器提供了NFS的特性。其他一些NFS驱动包括(NFS server support for NFS version 3) 和 (NFS server support for NFS version 4)。

"NFS server manual fault injection"驱动是一个调试驱动，它允许开发者让NFS服务器认为在NFS上发生了一个错误。特别地，这用于测试服务器如何处理NFS错误。

"Secure RPC: Kerberos V mechanism"被用于RPC安全调用。由于安全原因，没有这个特性，NFS无法被加入到内核中。

这是一个RPC的特殊驱动(RPC: Enable dprintk debugging)。

Linux内核支持Ceph文件系统(Ceph distributed file system)。

CIFS是一个用于Samba和Windows服务器的虚拟文件系统(CIFS support (advanced network filesystem, SMBFS successor))。CIFS代表的是"Common Internet FileSystem"(通用网络文件系统)

有两个特性被用于调试或监视CIFS驱动(CIFS statistics) 和 (Extended statistics)。

要在服务器上支持LANMAN安全需要一个特定的驱动(Support legacy servers which use weaker LANMAN security)。LANMAN或者LM哈希是一种较弱的特殊的密码哈希函数。

CIFS在被挂载到安全服务器上之前需要Kerberos票据(Kerberos/SPNEGO advanced session setup)。这个驱动提供了CIFS使用能够提供票据的用户空间工具的能力。

像其他文件系统一样，CIFS有一些扩展功能(CIFS extended attributes) 和 (CIFS POSIX Extensions)。

这个驱动从CIFS服务器上获取访问控制列表(ACL)(Provide CIFS ACL support)。

CIFS有两个其他的调试工具(Enable CIFS debugging routines) 和 (Enable additional CIFS debugging routines)。

CIFS有"DFS feature support"，它允许共享在被移除后仍可以访问。DFS代表"Distributed FileSystem"(分布式文件系统)。

SMB2是CIFS的一个提升替代品(SMB2 network file system support)。SMB2代表的是"Server Message Block version 2"(服务器消息块第2版)。

用这个驱动客户端可以存储CIFS缓存(Provide CIFS client caching support)。

Novell NetWare客户端需要这个驱动访问NetWare卷 (NCP file system support (to mount NetWare volumes))。NCP代表"NetWare Core Protocol"(NetWare核心协议)。NCP是一种允许客户端与服务器主机上的NetWare卷通信的协议。

如果启用这个驱动，NetWare服务器可以使用NFS命名空间(Use NFS namespace if available)。

如果启用这个驱动，NetWare服务器可以使用OS/2长命名空间(Use LONG (OS/2) namespace if available)。

如果启用这个驱动，那么由DOS创建或者DOS系统上的存储单元上的文件名将被转换成小写(Lowercase DOS filenames)。

许多文件系统依赖于本地语言支持 (Use Native Language Support)。特别地，本地语言支持(Native Language Support (NLS))在文件名中使用不同的字符集。

这个驱动允许NCP文件系统支持执行标志和符号链接(Enable symbolic links and execute flags)。

Linux内核提供对Coda文件系统的支持(Coda file system support (advanced network fs))。Coda是众多网络文件系统中的一种。

Linux内核可以支持Andrew文件系统(Andrew File System support (AFS))。然而，Linux内核只能以不安全的方式只读这个文件系统。这个驱动目的是让Linux系统访问AFS。如果你的网络只包含了Linux系统，那么选择一个不同的Linux完全支持的网络系统。

Linux内核有一个实验性的驱动，通过9P2000协议访问Plan 9资源(Plan 9 Resource Sharing Support (9P2000))。内核也有缓存支持(Enable 9P client caching support)和控制列表(9P POSIX Access Control Lists)，用于支持先前提到的Plan 9特性。

![](http://www.linux.org/attachments/kernel_21-png.687/)

配置完网络文件系统后，内核的下面一部分设置是"Native Language Support"(本地语言支持)。这整个菜单包含了大多数或者全部的字符集和编码驱动。启用这些编码让这些字符集可以被系统和应用使用。UTF-8是最常用的编码，但是这并不是唯一的一个。大多数应用和驱动需要UTF-8，因此这个编码已经被设置到内核中了。

在那个菜单后，可以配置"Distributed Lock Manager (DLM)"。DLM被用于保存共享资源并表现良好。这个驱动管理用户空间和内核空间的应用，它们访问或者操作共享内存(就像网络文件系统)。集群强烈依赖于这个驱动。

现在，我们已经完全配置完了文件系统和相关的特性，我们可以进入使用内核配置工具(当使用"make menuconfig")的第一屏"Kernel hacking"菜单。我正在使用ncurses接口(见截图)，它由"make menuconfig"命令初始化，所以其他的接口可能会有一点不一样。"kernel hacking"菜单中的很多特性和设置包含了关于内核本身的很多设置。这些特性是调试工具，并有一些控制着内核的行为。

第一个设置增加printk时间戳到syslog系统调用输出中(Show timing information on printks)。

下面的3个特性控制着3个不同调试特性(Default message log level (1-7))、 (Enable __deprecated logic) 和 (Enable __must_check logic)。

![](http://www.linux.org/attachments/kernel_21_1-png.688/)

下面的特性是一个调试特性，并在编译时有效((1024) Warn for stack frames larger than (needs gcc 4.4))。如果栈帧大于指定的大小，那么编译器会警告用户。

"Magic SysRq key"会启用Magic SysRq键的支持，这允许用户按下Alt+PrintScreen后发送给内核特殊的命令。这个在大多数情况下都有效而不管内核的状态。然而，有例外的存在。强烈建议启用Magic SysRq Key。

在编译器件，在连接是汇编器的符号链接会被移除以减少get_wchan()的输出(Strip assembler-generated symbols during link)。

下面的一个特性用于调试目的(Generate readable assembler code)。如果启用，一些内核优化将被禁止，那么一些汇编就会变成人可读的。这回损害内核的速度。如果你有特殊原因这么做时才启用它。

这个设定分会启用/禁用普遍不需要或者废除的符号 (Enable unused/obsolete exported symbols)。然而，一些模块可能需要这些符号。启用这个会增加内核的大小。Linux用户很少会需要这些符号。通常上，禁用这个特性，除非你了解一个重要的模块需要这个符号。

如果启用这个设施，内核会在用户内核头上执行健康检查(Run 'make headers_check' when building vmlinux)。

在编译期，这个特性会检查无效的引用(Enable full Section mismatch analysis)。

内核可以被配置来检测软件或硬件加锁(Detect Hard and Soft Lockups)。当系统被冻结超过20s并且其他任务无法执行时，这个称之为软件加锁。如果CPU在循环中超过了20s并且中断无法割到执行时间，那么这个称之为硬件加锁。

下面特性分为让内核在硬件和软件加锁时重启 (Panic (Reboot) On Hard Lockups) 和 (Panic (Reboot) On Soft Lockups)。

当内核遇到严重的问题时，它可以发出一个"kernel panic"(内核崩溃)(Panic on Oops)。强烈建议启用这个设置。这会帮助防止内核造成系统损害和数据丢失。

内核可以被设置来检测被挂起的任务(Detect Hung Tasks)。这指的是进程被锁住或者冻结了。特别是在程序变成不可中断的时候。下面的设置允许用户定义在进程被视为"挂起"前需要等待多长时间(Default timeout for hung task detection (in seconds))。

内核可以被设置成在进程挂起时重启(Panic (Reboot) On Hung Tasks)。通常上，用户并不希望这样。你希望你的系统每次在程序冻结后重启么？

"Kernel memory leak detector"找出并记录内存泄漏。

内核使用帧指针帮助更有效地报告错误并且还包含了更多的信息(Compile the kernel with frame pointers)。不言自明，我会跳过很多调试工具。

如众多Linux用户所知，当系统启动时，boot消息显示得太快了而不来不及阅读。这个特性会设置延迟时间来给用户更多的时间来阅读消息(Delay each boot printk message by N milliseconds)。

这是一个特殊的开发特性用于测试回溯代码(Self test for the backtrace code)。回溯代码是一个自我测试。

可以增加块设备的数量(Force extended block device numbers and spread them)。然而，这可能会引起启动问题，因此小心使用。

下一篇，我们会继续配置内核本身。我希望你们喜欢这边文章。谢谢！

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-21.4988/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出