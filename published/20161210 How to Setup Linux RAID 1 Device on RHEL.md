如何在 RHEL 上设置 Linux RAID 1
============================================================

### 设置 Linux RAID 1

配置 LINUX RAID 1 非常重要，因为它提供了冗余性。

RAID 分区拥有高级功能，如冗余和更好的性能。所以让我们来说下如何实现 RAID，以及让我们来看看不同类型的 RAID：

- RAID 0（条带）：磁盘组合在一起，形成一个更大的驱动器。这以可用性为代价提供了更好的性能。如果 RAID 中的任何一块磁盘出现故障，则整个磁盘集将无法使用。最少需要两块磁盘。
- RAID 1（镜像）：磁盘从一个复制到另一个，提供了冗余。如果一块磁盘发生故障，则另一块磁盘接管，它有另外一份原始磁盘的数据的完整副本。其缺点是写入时间慢。最少需要两块磁盘。
- RAID 5（带奇偶校验的条带）：磁盘类似于 RAID 0，并且连接在一起以形成一个大型驱动器。这里的区别是，25％ 的磁盘用于奇偶校验位，这允许在单个磁盘发生故障时可以恢复磁盘。最少需要三块盘。

让我们继续进行 Linux RAID 1 配置。

安装 Linux RAID 1 的要求：

1、系统中应该安装了 mdam，请用下面的命令确认。

```
[root@rhel1 ~]# rpm -qa | grep -i mdadm
mdadm-3.2.2-9.el6.x86_64
[root@rhel1 ~]#
```

2、 系统应该连接了 2 块磁盘。

创建两个分区，一个磁盘一个分区（sdc、sdd），每个分区占据整块磁盘。

```
Disk /dev/sdc: 1073 MB, 1073741824 bytes
255 heads, 63 sectors/track, 130 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x67cc8cfb

Device Boot Start End Blocks Id System
/dev/sdc1 1 130 1044193+ 83 Linux

Disk /dev/sdd: 1073 MB, 1073741824 bytes
255 heads, 63 sectors/track, 130 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x0294382b

Device Boot Start End Blocks Id System
/dev/sdd1 1 130 1044193+ 83 Linux
```

--------------------------------------------------------------------------------


作者简介：

大家好！我是 Manmohan Mirkar。我很高兴见到你们！我在 10 多年前开始使用 Linux，我从来没有想过我会到今天这个地步。我的激情是帮助你们获取 Linux 知识。谢谢阅读！

--------------------------------------------------------------------------------

via: http://www.linuxroutes.com/linux-raid-1/

作者：[Manmohan Mirkar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxroutes.com/author/admin/
[1]:http://www.linuxroutes.com/linux-raid-1/#
[2]:http://www.linuxroutes.com/linux-raid-1/#
[3]:http://www.linuxroutes.com/linux-raid-1/#
[4]:http://www.linuxroutes.com/linux-raid-1/#
[5]:http://www.linuxroutes.com/linux-raid-1/#
[6]:http://www.linuxroutes.com/linux-raid-1/#
[7]:http://www.linuxroutes.com/linux-raid-1/#
[8]:http://www.linuxroutes.com/linux-raid-1/#
[9]:http://www.linuxroutes.com/linux-raid-1/#
[10]:http://www.linuxroutes.com/linux-raid-1/#
[11]:http://www.linuxroutes.com/linux-raid-1/#
[12]:http://www.linuxroutes.com/author/admin/
[13]:http://www.linuxroutes.com/linux-raid-1/#respond
