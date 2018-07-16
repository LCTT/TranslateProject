戴文的Linux内核专题：23 配置内核 (19)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.626/.jpg)

欢迎进入Linux内核系列文章的下一篇！我们正在接近配置过程的终点。在这篇文章中，我们将会讨论固件驱动和文件系统驱动。

这个分类中的第一个驱动是寻找启动盘(BIOS Enhanced Disk Drive calls determine boot disk)。有时，Linux不会知道哪个盘是启动盘。这个驱动允许内核询问BIOS。Linux接着在sysfs上存储信息。Linux需要知道这些来设置bootloader。

即使BIOS EDD服务被编译进了内核，这个选项可以设置这些服务不激活(Sets default behavior for EDD detection to off )。EDD代表的是"Enhanced Disk Drive"(增强磁盘驱动器)。

当使用kexec加载不同的内核时，性能可以通过固件提供的内存映射提升(Add firmware-provided memory map to sysfs)。

"Dell Systems Management Base Driver"通过sysfs接口提供了Linux内核对于Dell硬件的更好的控制。

启用这个驱动可以通过/sys/class/dmi/id/访问硬件的信息(Export DMI identification via sysfs to userspace)。DMI代表的是Desktop Management Interface(桌面管理接口)。DMI管理硬件的组件和访问硬件的数据。BIOS中数据的接口和硬件由SMBIOS(System Management BIOS)规范调节。

从DMI得到的原始数据表可以通过这个驱动访问(DMI table support in sysfs)。

为了从iSCSI驱动器中启动，启用这个驱动(DMI table support in sysfs)。

最后的驱动是一组"Google Firmware Drivers"。这些驱动用于Google特定的硬件。除非你为Google工作并且需要在硬件上使用Linux或者你在为一台从Google偷来的电脑编译内核，否则不要启用它。

下面，我们可以配置内核的文件系统支持。

"Second extended fs support"驱动用于EXT2文件系统。[http://www.linux.org/threads/ext-file-system.4365/][1]

![](http://www.linux.org/attachments/kernel_19-png.627/)

"Ext2 extended attributes"提供了原生文件系统不支持的额外的元数据的使用。

"Ext2 POSIX Access Control Lists"增加了额外的非原生的权限模型。

"Ext2 Security Labels"增强了由SELinux提供的安全性。

启用"Ext2 execute in place support"允许可执行文件在当前的位置执行而不必在页缓存中执行。

这个驱动提供EXT3文件系统(Ext3 journaling file system support)。 [http://www.linux.org/threads/ext-file-system.4365/][2]

"Default to 'data=ordered' in ext3"驱动设置数据的排序模式为"Ordered"。这种处理方式为日志和写入工作。数据排序在这篇文章中解释 - [http://www.linux.org/threads/journal-file-system.4136/][3]

"Ext3 extended attributes"提供了原生文件系统不支持的额外的元数据使用。再说一次，接下来的EXT3的驱动/特性与EXT2相同 - "Ext3 POSIX Access Control Lists" 和 "Ext3 Security Labels"。同样，对接下来的EXT4也是相同的 - "Ext4 POSIX Access Control Lists"、"Ext4 Security Labels" 和 "EXT4 debugging support"。

EXT3和EXT4支持日志块设备调试(JBD debugging support)，(JBD2 debugging support)。

下面的驱动提供Reiser文件系统支持(Reiserfs support)。 [http://www.linux.org/threads/reiser-file-system-reiser3-and-reiser4.4403/][4]

Reiser文件系统也有调试(Enable reiserfs debug mode)。

内核可以存储ReiserFS统计在/proc/fs/reiserfs (Stats in /proc/fs/reiserfs)。

下面的Reiser驱动/特性与EXT2/3/4相同 - ReiserFS extended attributes", "ReiserFS POSIX Access Control Lists" 和 "ReiserFS Security Labels".

Linux内核同样支持JFS，同时也包含了不同的特性 "JFS filesystem support"、 "JFS POSIX Access Control Lists"、"JFS Security Labels"、"JFS debugging" 和 "JFS statistics". [http://www.linux.org/threads/journaled-file-system-jfs.4404/][5]

再说一次,XFS可以通过启用这些驱动/特性支持 - "XFS filesystem support"、"XFS Quota support"、"XFS POSIX ACL support"、"XFS Realtime subvolume support" 和 "XFS Debugging support"。 [http://www.linux.org/threads/xfs-file-system.4364/][6]

"Global FileSystem 2"可以被内核支持(GFS2 file system support)。这个文件系统用于在集群中共享存储。

"GFS2 DLM locking"驱动提供了GFS2的分布式锁管理(DLM)

"Oracle Cluster FileSystem 2"被内核支持(OCFS2 file system support)。这个文件系统用于在集群中共享存储。

"O2CB Kernelspace Clustering"提供了OCFS2文件系统的不同服务。

"OCFS2 Userspace Clustering"允许集群栈在用户空间执行。

"OCFS2 statistics"驱动允许用户得到关于文件系统的统计信息。

像大多树Linux内核一样，OCFS2提供日志(OCFS2 logging support)。这可能被用来监视错误或者调试目的。

"OCFS2 expensive checks"驱动以性能为代价提供了存储一致性检测。一些Linux用户建议只有在调试目的在才启用它。

Linux内核同样包含了新的B树文件系统；这个驱动提供了磁盘格式化程序(Btrfs filesystem Unstable disk format)。BTRFS仍在开发中并被计划某天变的比EXT4更流行。[http://www.linux.org/threads/b-tree-file-system-btrfs.4430/][7]

"Btrfs POSIX Access Control Lists"提供了额外的原生BTRFS没有提供的权限模型。

下面，是一个BTRFS检测工具(Btrfs with integrity check tool compiled in (DANGEROUS))。由于BTRFS是一个最新在开发中的文件系统，大多数相关软件还并不稳定。

Linux系统也支持NIL-FileSystem(NILFS2 file system support)。[http://www.linux.org/threads/new-implementation-of-a-log-structured-file-system-nilfs.4547/][8]。

为了支持一些文件系统使用到的flock()系统调用，启用这个驱动(Enable POSIX file locking API)。禁用这个去的那个会减少11KB的内核大小。这个驱动提供了文件锁定。文件锁定是一个允许进程在某刻读取文件的过程。这通常用于网络文件系统，就像NFS。

"Dnotify support"驱动是一个古老的文件系统通知系统，它提醒文件系统上的事件的用户空间。它和它的继承者被用于监控应用的文件系统。某个应用告诉守护进程需要监视哪些事件。不然，每个用户空间应用需要它们自己完成这个任务。

记住，Dnotify是一个古老的系统，那么什么是新的通知系统？它就是由这个驱动提供的Inotify (Inotify support for userspace)。

一个可选的通知系统是fanotify (Filesystem wide access notification)。Fanotify与Inotify一样，但是fanotify比Inotify传递更多的信息到用户空间中。

用这个驱动Fanotify可以检测权限(fanotify permissions checking)。

对于用户想要划分存储空间的系统需要 "Quota support"。 [http://www.linux.org/threads/atomic-disk-quotas.4277/][9]

接下来的驱动允许通过netlink报告磁盘配额警告和信息(Report quota messages through netlink interface)。netlink是一个用于与内核通信的用户空间的套接字接口。

配额信息同样可以发送到控制台(Print quota warnings to console (OBSOLETE))。

这个驱动允许配额系统执行额外的完整性检查(Additional quota sanity checks)。在计算机技术中，完整性检查是检测由于不良编程导致的错误。文件和输出都被检查来确保数据正确而不是以奇怪的方式构造。

一些旧的系统使用老的配额系统但希望在升级新内核时保留旧的配额系统。可以通过启用这个来容易解决(Old quota format support)。许多读者可能想要知道为什么一些人想要保留旧的配额系统而不是更新新的。好的，想想一下你是一家很大公司的IT部门的经理，公司有许多服务器运行着非常重要的任务。当你可以继续使用现在工作的很好的系统，你想要创建并配置一个新的(也可能很大)的文件系统么？ 通常上，对于计算机，坚持下面的原则 - 如果它没有坏或者不会导致安全问题，不要去修复它。

用这个驱动，新的配额系统支持32位UID和GID(Quota format vfsv0 and vfsv1 support)。

为了自动挂载远程存储单元，启用这个驱动(Kernel automounter version 4 support)。

这个驱动支持FUSE文件系统(FUSE (Filesystem in Userspace) support)。用户空间文件系统(FUSE)支持任何用户创建他们自己的文件系统并在用户空间内使用。

一个特殊的FUSE扩展可以用于在用户空间使用字符设备Character device in Userspace support)。

下一篇文章中，我们会继续讨论缓存，光盘文件系统，Linux上的FAT32和其他有趣的文件系统话题。谢谢！

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-19.4929/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linux.org/threads/ext-file-system.4365/
[2]:http://www.linux.org/threads/ext-file-system.4365/
[3]:http://www.linux.org/threads/journal-file-system.4136/
[4]:http://www.linux.org/threads/reiser-file-system-reiser3-and-reiser4.4403/
[5]:http://www.linux.org/threads/journaled-file-system-jfs.4404/
[6]:http://www.linux.org/threads/xfs-file-system.4364/
[7]:http://www.linux.org/threads/b-tree-file-system-btrfs.4430/
[8]:http://www.linux.org/threads/new-implementation-of-a-log-structured-file-system-nilfs.4547/
[9]:http://www.linux.org/threads/atomic-disk-quotas.4277/