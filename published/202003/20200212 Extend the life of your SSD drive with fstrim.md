[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11959-1.html)
[#]: subject: (Extend the life of your SSD drive with fstrim)
[#]: via: (https://opensource.com/article/20/2/trim-solid-state-storage-linux)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

在 Linux 下使用 fstrim 延长 SSD 驱动器的寿命
======

> 这个新的系统服务可以使你的生活更轻松。

![](https://img.linux.net.cn/data/attachment/album/202003/04/121625sl380ga10g56d33h.jpg)

在过去的十年中，固态驱动器（SSD）带来了一种管理存储的新方法。与上一代的转盘产品相比，SSD 具有无声、更冷却的操作和更快的接口规格等优点。当然，新技术带来了新的维护和管理方法。SSD 具有一种称为 TRIM 的功能。从本质上讲，这是一种用于回收设备上未使用的块的方法，该块可能先前已被写入，但不再包含有效数据，因此可以返回到通用存储池以供重用。Opensource.com 的 Don Watkins 首先在其 2017 年的文章《[Linux 固态驱动器：为 SSD 启用 TRIM][2]》中介绍过 TRIM 的内容。

如果你一直在 Linux 系统上使用此功能，则你可能熟悉下面描述的两种方法。

### 老的方式

#### 丢弃选项

我最初使用 `mount` 命令的 `discard` 选项启用了此功能。每个文件系统的配置都放在 `/etc/fstab` 文件中。

```
# cat /etc/fstab
UUID=3453g54-6628-2346-8123435f  /home  xfs  defaults,discard   0 0
```

丢弃选项可启用自动的在线 TRIM。由于可能会对性能造成负面影响，最近关于这是否是最佳方法一直存在争议。使用此选项会在每次将新数据写入驱动器时启动 TRIM。这可能会引入其他磁盘活动，从而影响存储性能。

#### Cron 作业

我从 `fstab` 文件中删除了丢弃选项。然后，我创建了一个 cron 作业来按计划调用该命令。

```
# crontab -l
@midnight /usr/bin/trim
```

这是我最近在 Ubuntu Linux 系统上使用的方法，直到我了解到另一种方法。

### 一个新的 TRIM 服务

我最近发现有一个用于 TRIM 的 systemd 服务。Fedora 在版本 30 中将其[引入][3]，尽管默认情况下在版本 30 和 31 中未启用它，但计划在版本 32 中使用它。如果你使用的是 Fedora 工作站 31，并且你想要开始使用此功能，可以非常轻松地启用它。我还将在下面向你展示如何对其进行测试。该服务并非 Fedora 独有的服务。它是否存在及其地位将因发行版而异。

#### 测试

我喜欢先进行测试，以更好地了解幕后情况。我通过打开终端并发出配置服务调用的命令来执行此操作。

```
/usr/sbin/fstrim --fstab --verbose --quiet
```

`fstrim` 的 `-help` 参数将描述这些信息和其他参数。

```
$ sudo /usr/sbin/fstrim --help

Usage:
 fstrim [options] <mount point>

Discard unused blocks on a mounted filesystem.

Options:
 -a, --all           trim all supported mounted filesystems
 -A, --fstab         trim all supported mounted filesystems from /etc/fstab
 -o, --offset <num>  the offset in bytes to start discarding from
 -l, --length <num>  the number of bytes to discard
 -m, --minimum <num> the minimum extent length to discard
 -v, --verbose       print number of discarded bytes
     --quiet         suppress error messages
 -n, --dry-run       does everything, but trim

 -h, --help          display this help
 -V, --version       display version
```

因此，现在我可以看到这个 systemd 服务已配置为在我的 `/etc/fstab` 文件中的所有受支持的挂载文件系统上运行该修剪操作（`-fstab`），并打印出所丢弃的字节数（`-verbose`），但是抑制了任何可能会发生的错误消息（`–quiet`）。了解这些选项对测试很有帮助。例如，我可以从最安全的方法开始，即空运行。我还将去掉 `-quiet` 参数，以便确定驱动器设置是否发生任何错误。

```
$ sudo /usr/sbin/fstrim --fstab --verbose --dry-run
```

这就会显示 `fstrim` 命令根据在 `/etc/fstab` 文件中找到的文件系统要执行的操作。

```
$ sudo /usr/sbin/fstrim --fstab --verbose
```

现在，这会将 TRIM 操作发送到驱动器，并报告每个文件系统中丢弃的字节数。以下是我最近在新的 NVME  SSD 上全新安装 Fedora 之后的示例。

```
/home: 291.5 GiB (313011310592 bytes) trimmed on /dev/mapper/wkst-home
/boot/efi: 579.2 MiB (607301632 bytes) trimmed on /dev/nvme0n1p1
/boot: 787.5 MiB (825778176 bytes) trimmed on /dev/nvme0n1p2
/: 60.7 GiB (65154805760 bytes) trimmed on /dev/mapper/wkst-root
```

#### 启用

Fedora Linux 实现了一个计划每周运行它的 systemd 计时器服务。要检查其是否存在及当前状态，请运行 `systemctl status`。

```
$ sudo systemctl status fstrim.timer
```

现在，启用该服务。

```
$ sudo systemctl enable fstrim.timer
```

#### 验证

然后，你可以通过列出所有计时器来验证该计时器是否已启用。

```
$ sudo systemctl list-timers --all
```

会显示出下列行，表明 `fstrim.timer` 存在。注意，该计时器实际上激活了 `fstrim.service` 服务。这是实际调用 `fstrim` 的地方。与时间相关的字段显示为 `n/a`，因为该服务已启用且尚未运行。

```
NEXT   LEFT    LAST   PASSED   UNIT           ACTIVATES
n/a    n/a     n/a    n/a      fstrim.timer   fstrim.service
```

### 结论

该服务似乎是在驱动器上运行 TRIM 的最佳方法。这比必须创建自己的 crontab 条目来调用 `fstrim` 命令要简单得多。不必编辑 `fstab` 文件也更安全。观察固态存储技术的发展很有趣，并且我很高兴看到 Linux 似乎正在朝着标准且安全的方向实现它。

在本文中，学习了固态驱动器与传统硬盘驱动器有何不同以及它的含义...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/trim-solid-state-storage-linux

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: https://linux.cn/article-8177-1.html
[3]: https://fedoraproject.org/wiki/Changes/EnableFSTrimTimer (Fedora Project WIKI: Changes/EnableFSTrimTimer)
