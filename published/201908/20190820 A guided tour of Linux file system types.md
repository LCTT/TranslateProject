[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11274-1.html)
[#]: subject: (A guided tour of Linux file system types)
[#]: via: (https://www.networkworld.com/article/3432990/a-guided-tour-of-linux-file-system-types.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Linux 文件系统类型导览
======

> Linux 文件系统多年来在不断发展，让我们来看一下文件系统类型。

![](https://img.linux.net.cn/data/attachment/album/201908/27/175516vzrp4j4zevcqr66c.jpg)

虽然对于普通用户来说可能并不明显，但在过去十年左右的时间里，Linux 文件系统已经发生了显著的变化，这使它们能够更好对抗损坏和性能问题。

如今大多数 Linux 系统使用名为 ext4 的文件系统。 “ext” 代表“<ruby>扩展<rt>extended</rt></ruby>”，“4” 表示这是此文件系统的第 4 代。随着时间的推移添加的功能包括：能够提供越来越大的文件系统（目前大到 1,000,000 TiB）和更大的文件（高达 16 TiB），更抗系统崩溃，更少碎片（将单个文件分散为存在多个位置的块）以提高性能。

ext4 文件系统还带来了对性能、可伸缩性和容量的其他改进。实现了元数据和日志校验和以增强可靠性。时间戳现在可以跟踪纳秒级变化，以便更好地对文件打戳（例如，文件创建和最后更新时间）。并且，在时间戳字段中增加了两个位，2038 年的问题（存储日期/时间的字段将从最大值翻转到零）已被推迟到了 400 多年之后（到 2446）。

### 文件系统类型

要确定 Linux 系统上文件系统的类型，请使用 `df` 命令。下面显示的命令中的 `-T` 选项显示文件系统类型。 `-h` 显示“易读的”磁盘大小。换句话说，调整报告的单位（如 M 和 G），使人们更好地理解。

```
$ df -hT | head -10
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  2.9G     0  2.9G   0% /dev
tmpfs          tmpfs     596M  1.5M  595M   1% /run
/dev/sda1      ext4      110G   50G   55G  48% /
/dev/sdb2      ext4      457G  642M  434G   1% /apps
tmpfs          tmpfs     3.0G     0  3.0G   0% /dev/shm
tmpfs          tmpfs     5.0M  4.0K  5.0M   1% /run/lock
tmpfs          tmpfs     3.0G     0  3.0G   0% /sys/fs/cgroup
/dev/loop0     squashfs   89M   89M     0 100% /snap/core/7270
/dev/loop2     squashfs  142M  142M     0 100% /snap/hexchat/42
```

请注意，`/`（根）和 `/apps`  的文件系统都是 ext4，而 `/dev` 是 devtmpfs 文件系统（一个由内核填充的自动化设备节点）。其他的文件系统显示为 tmpfs（驻留在内存和/或交换分区中的临时文件系统）和 squashfs（只读压缩文件系统的文件系统，用于快照包）。

还有 proc 文件系统，用于存储正在运行的进程的信息。

```
$ df -T /proc
Filesystem     Type 1K-blocks  Used Available Use% Mounted on
proc           proc         0     0         0    - /proc
```

当你在整个文件系统中游览时，可能会遇到许多其他文件系统类型。例如，当你移动到目录中并想了解它的文件系统时，可以运行以下命令：

```
$ cd /dev/mqueue; df -T .
Filesystem     Type   1K-blocks  Used Available Use% Mounted on
mqueue         mqueue         0     0         0    - /dev/mqueue
$ cd /sys; df -T .
Filesystem     Type  1K-blocks  Used Available Use% Mounted on
sysfs          sysfs         0     0         0    - /sys
$ cd /sys/kernel/security; df -T .
Filesystem     Type       1K-blocks  Used Available Use% Mounted on
securityfs     securityfs         0     0         0    - /sys/kernel/security
```

与其他 Linux 命令一样，这里的 `.` 代表整个文件系统的当前位置。

这些和其他独特的文件系统提供了一些特殊功能。例如，securityfs 提供支持安全模块的文件系统。

Linux 文件系统需要能够抵抗损坏，能够承受系统崩溃并提供快速、可靠的性能。由几代 ext 文件系统和新一代专用文件系统提供的改进使 Linux 系统更易于管理和更可靠。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3432990/a-guided-tour-of-linux-file-system-types.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/08/guided-tour-on-the-flaker_people-in-horse-drawn-carriage_germany-by-andreas-lehner-flickr-100808681-large.jpg
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
