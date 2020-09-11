[#]: collector: (lujun9972)
[#]: translator: (liujing97)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10727-1.html)
[#]: subject: (7 Methods To Identify Disk Partition/FileSystem UUID On Linux)
[#]: via: (https://www.2daygeek.com/check-partitions-uuid-filesystem-uuid-universally-unique-identifier-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Linux 中获取硬盘分区或文件系统的 UUID 的七种方法
======

作为一个 Linux 系统管理员，你应该知道如何去查看分区的 UUID 或文件系统的 UUID。因为现在大多数的 Linux 系统都使用 UUID 挂载分区。你可以在 `/etc/fstab` 文件中可以验证。

有许多可用的实用程序可以查看 UUID。本文我们将会向你展示多种查看 UUID 的方法，并且你可以选择一种适合于你的方法。

### 何为 UUID？

UUID 意即<ruby>通用唯一识别码<rt>Universally Unique Identifier</rt></ruby>，它可以帮助 Linux 系统识别一个磁盘分区而不是块设备文件。

自内核 2.15.1 起，libuuid 就是 util-linux-ng 包中的一部分，它被默认安装在 Linux 系统中。UUID 由该库生成，可以合理地认为在一个系统中 UUID 是唯一的，并且在所有系统中也是唯一的。

这是在计算机系统中用来标识信息的一个 128 位（比特）的数字。UUID 最初被用在<ruby>阿波罗网络计算机系统<rt>Apollo Network Computing System</rt></ruby>（NCS）中，之后 UUID 被<ruby>开放软件基金会<rt>Open Software Foundation</rt></ruby>（OSF）标准化，成为<ruby>分布式计算环境<rt>Distributed Computing Environment</rt></ruby>（DCE）的一部分。

UUID 以 32 个十六进制的数字表示，被连字符分割为 5 组显示，总共的 36 个字符的格式为 8-4-4-4-12（32 个字母或数字和 4 个连字符）。

例如： `d92fa769-e00f-4fd7-b6ed-ecf7224af7fa`

我的 `/etc/fstab` 文件示例：

```
# cat /etc/fstab

# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a device; this may
# be used with UUID= as a more robust way to name devices that works even if
# disks are added and removed. See fstab(5).
#
#
UUID=69d9dd18-36be-4631-9ebb-78f05fe3217f / ext4 defaults,noatime 0 1
UUID=a2092b92-af29-4760-8e68-7a201922573b swap swap defaults,noatime 0 2
```

我们可以使用下面的 7 个命令来查看。

  * `blkid` 命令：定位或打印块设备的属性。
  * `lsblk` 命令：列出所有可用的或指定的块设备的信息。
  * `hwinfo` 命令：硬件信息工具，是另外一个很好的实用工具，用于查询系统中已存在硬件。
  * `udevadm` 命令：udev 管理工具
  * `tune2fs` 命令：调整 ext2/ext3/ext4 文件系统上的可调文件系统参数。
  * `dumpe2fs` 命令：查询 ext2/ext3/ext4 文件系统的信息。　
  * 使用 `by-uuid` 路径：该目录下包含有 UUID 和实际的块设备文件，UUID 与实际的块设备文件链接在一起。

### Linux 中如何使用 blkid 命令查看磁盘分区或文件系统的 UUID？

`blkid` 是定位或打印块设备属性的命令行实用工具。它利用 libblkid 库在 Linux 系统中获得到磁盘分区的 UUID。

```
# blkid
/dev/sda1: UUID="d92fa769-e00f-4fd7-b6ed-ecf7224af7fa" TYPE="ext4" PARTUUID="eab59449-01"
/dev/sdc1: UUID="d17e3c31-e2c9-4f11-809c-94a549bc43b7" TYPE="ext2" PARTUUID="8cc8f9e5-01"
/dev/sdc3: UUID="ca307aa4-0866-49b1-8184-004025789e63" TYPE="ext4" PARTUUID="8cc8f9e5-03"
/dev/sdc5: PARTUUID="8cc8f9e5-05"
```

### Linux 中如何使用 lsblk 命令查看磁盘分区或文件系统的 UUID？

`lsblk` 列出所有有关可用或指定块设备的信息。`lsblk` 命令读取 sysfs 文件系统和 udev 数据库以收集信息。

如果 udev 数据库不可用或者编译的 lsblk 不支持 udev，它会试图从块设备中读取卷标、UUID 和文件系统类型。这种情况下，必须以 root 身份运行。该命令默认会以类似于树的格式打印出所有的块设备（RAM 盘除外）。

```
# lsblk -o name,mountpoint,size,uuid
NAME   MOUNTPOINT  SIZE UUID
sda                 30G 
└─sda1 /            20G d92fa769-e00f-4fd7-b6ed-ecf7224af7fa
sdb                 10G 
sdc                 10G 
├─sdc1               1G d17e3c31-e2c9-4f11-809c-94a549bc43b7
├─sdc3               1G ca307aa4-0866-49b1-8184-004025789e63
├─sdc4               1K 
└─sdc5               1G 
sdd                 10G 
sde                 10G 
sr0               1024M 
```

### Linux 中如何使用 by-uuid 路径查看磁盘分区或文件系统的 UUID？

该目录包含了 UUID 和实际的块设备文件，UUID 与实际的块设备文件链接在一起。

```
# ls -lh /dev/disk/by-uuid/
total 0
lrwxrwxrwx 1 root root 10 Jan 29 08:34 ca307aa4-0866-49b1-8184-004025789e63 -> ../../sdc3
lrwxrwxrwx 1 root root 10 Jan 29 08:34 d17e3c31-e2c9-4f11-809c-94a549bc43b7 -> ../../sdc1
lrwxrwxrwx 1 root root 10 Jan 29 08:34 d92fa769-e00f-4fd7-b6ed-ecf7224af7fa -> ../../sda1
```

### Linux 中如何使用 hwinfo 命令查看磁盘分区或文件系统的 UUID？

[hwinfo][1] 意即硬件信息工具，是另外一种很好的实用工具。它被用来检测系统中已存在的硬件，并且以可读的格式显示各种硬件组件的细节信息。

```
# hwinfo --block | grep by-uuid | awk '{print $3,$7}'
/dev/sdc1, /dev/disk/by-uuid/d17e3c31-e2c9-4f11-809c-94a549bc43b7
/dev/sdc3, /dev/disk/by-uuid/ca307aa4-0866-49b1-8184-004025789e63
/dev/sda1, /dev/disk/by-uuid/d92fa769-e00f-4fd7-b6ed-ecf7224af7fa
```

### Linux 中如何使用 udevadm 命令查看磁盘分区或文件系统的 UUID？

`udevadm` 需要命令和命令特定的操作。它控制 systemd-udevd 的运行时行为，请求内核事件、管理事件队列并且提供简单的调试机制。

```
# udevadm info -q all -n /dev/sdc1 | grep -i by-uuid | head -1
S: disk/by-uuid/d17e3c31-e2c9-4f11-809c-94a549bc43b7
```

### Linux 中如何使用 tune2fs 命令查看磁盘分区或文件系统的 UUID？

`tune2fs` 允许系统管理员在 Linux 的 ext2、ext3、ext4 文件系统中调整各种可调的文件系统参数。这些选项的当前值可以使用选项 `-l` 显示。

```
# tune2fs -l /dev/sdc1 | grep UUID
Filesystem UUID: d17e3c31-e2c9-4f11-809c-94a549bc43b7
```

### Linux 中如何使用 dumpe2fs 命令查看磁盘分区或文件系统的 UUID？

`dumpe2fs` 打印出现在设备文件系统中的超级块和块组的信息。

```
# dumpe2fs /dev/sdc1 | grep UUID
dumpe2fs 1.43.5 (04-Aug-2017)
Filesystem UUID: d17e3c31-e2c9-4f11-809c-94a549bc43b7
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-partitions-uuid-filesystem-uuid-universally-unique-identifier-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[liujing97](https://github.com/liujing97)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/hwinfo-check-display-detect-system-hardware-information-linux/
