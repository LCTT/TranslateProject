如何在 Linux 中查看已挂载的文件系统类型
======

![](https://www.ostechnix.com/wp-content/uploads/2018/07/filesystem-720x340.png)

如你所知，Linux 支持非常多的文件系统，例如 ext4、ext3、ext2、sysfs、securityfs、FAT16、FAT32、NTFS 等等，当前被使用最多的文件系统是 ext4。你曾经疑惑过你的 Linux 系统使用的是什么类型的文件系统吗？没有疑惑过？不用担心！我们将帮助你。本指南将解释如何在类 Unix 的操作系统中查看已挂载的文件系统类型。

### 在 Linux 中查看已挂载的文件系统类型

有很多种方法可以在 Linux 中查看已挂载的文件系统类型，下面我将给出 8 种不同的方法。那现在就让我们开始吧！

#### 方法 1 – 使用 findmnt 命令

这是查出文件系统类型最常使用的方法。`findmnt` 命令将列出所有已挂载的文件系统或者搜索出某个文件系统。`findmnt` 命令能够在 `/etc/fstab`、`/etc/mtab` 或 `/proc/self/mountinfo` 这几个文件中进行搜索。

`findmnt` 预装在大多数的 Linux 发行版中，因为它是 `util-linux` 包的一部分。如果 `findmnt` 命令不可用，你可以安装这个软件包。例如，你可以使用下面的命令在基于 Debian 的系统中安装 `util-linux` 包：

```
$ sudo apt install util-linux
```

下面让我们继续看看如何使用 `findmnt` 来找出已挂载的文件系统。

假如你只敲 `findmnt` 命令而不带任何的参数或选项，它将像下面展示的那样以树状图形式列举出所有已挂载的文件系统。

```
$ findmnt
```

示例输出：

![][2]

正如你看到的那样，`findmnt` 展示出了目标挂载点（`TARGET`）、源设备（`SOURCE`）、文件系统类型（`FSTYPE`）以及相关的挂载选项（`OPTIONS`），例如文件系统是否是可读可写或者只读的。以我的系统为例，我的根（`/`）文件系统的类型是 EXT4 。

假如你不想以树状图的形式来展示输出，可以使用 `-l` 选项来以简单平凡的形式来展示输出：

```
$ findmnt -l
```

![][3]

你还可以使用 `-t` 选项来列举出特定类型的文件系统，例如下面展示的  `ext4` 文件系统类型：

```
$ findmnt -t ext4
TARGET  SOURCE    FSTYPE OPTIONS
/       /dev/sda2 ext4   rw,relatime,commit=360
└─/boot /dev/sda1 ext4   rw,relatime,commit=360,data=ordered
```

`findmnt` 还可以生成 `df` 类型的输出，使用命令

```
$ findmnt --df
```

或

```
$ findmnt -D
```

示例输出：

```
SOURCE     FSTYPE            SIZE    USED   AVAIL   USE% TARGET
dev        devtmpfs          3.9G       0    3.9G     0% /dev
run        tmpfs             3.9G    1.1M    3.9G     0% /run
/dev/sda2  ext4            456.3G  342.5G   90.6G    75% /
tmpfs      tmpfs             3.9G   32.2M    3.8G     1% /dev/shm
tmpfs      tmpfs             3.9G       0    3.9G     0% /sys/fs/cgroup
bpf        bpf                  0       0       0      - /sys/fs/bpf
tmpfs      tmpfs             3.9G    8.4M    3.9G     0% /tmp
/dev/loop0 squashfs         82.1M   82.1M       0   100% /var/lib/snapd/snap/core/4327
/dev/sda1  ext4             92.8M   55.7M   30.1M    60% /boot
tmpfs      tmpfs           788.8M     32K  788.8M     0% /run/user/1000
gvfsd-fuse fuse.gvfsd-fuse      0       0       0      - /run/user/1000/gvfs
```

你还可以展示某个特定设备或者挂载点的文件系统类型。

查看某个特定的设备：

```
$ findmnt /dev/sda1
TARGET SOURCE    FSTYPE OPTIONS
/boot  /dev/sda1 ext4   rw,relatime,commit=360,data=ordered
```

查看某个特定的挂载点：

```
$ findmnt /
TARGET SOURCE    FSTYPE OPTIONS
/      /dev/sda2 ext4   rw,relatime,commit=360
```

你甚至还可以查看某个特定标签的文件系统的类型：

```
$ findmnt LABEL=Storage
```

更多详情，请参考其 man 手册。

```
$ man findmnt
```

`findmnt` 命令已足够完成在 Linux 中查看已挂载文件系统类型的任务，这个命令就是为了这个特定任务而生的。然而，还存在其他方法来查看文件系统的类型，假如你感兴趣的话，请接着往下看。

#### 方法 2 – 使用 blkid 命令

`blkid` 命令被用来查找和打印块设备的属性。它也是 `util-linux` 包的一部分，所以你不必再安装它。

为了使用 `blkid` 命令来查看某个文件系统的类型，可以运行：

```
$ blkid /dev/sda1
```

#### 方法 3 – 使用 df 命令

在类 Unix 的操作系统中，`df` 命令被用来报告文件系统的磁盘空间使用情况。为了查看所有已挂载文件系统的类型，只需要运行：

```
$ df -T
```

示例输出：

![][4]

关于 `df` 命令的更多细节，可以参考下面的指南。

- [针对新手的 df 命令教程](https://www.ostechnix.com/the-df-command-tutorial-with-examples-for-beginners/)

同样也可以参考其 man 手册：

```
$ man df
```

#### 方法 4 – 使用 file 命令

`file` 命令可以判读出某个特定文件的类型，即便该文件没有文件后缀名也同样适用。

运行下面的命令来找出某个特定分区的文件系统类型：

```
$ sudo file -sL /dev/sda1
[sudo] password for sk:
/dev/sda1: Linux rev 1.0 ext4 filesystem data, UUID=83a1dbbf-1e15-4b45-94fe-134d3872af96 (needs journal recovery) (extents) (large files) (huge files)
```

查看其 man 手册可以知晓更多细节：

```
$ man file
```

#### 方法 5 – 使用 fsck 命令

`fsck` 命令被用来检查某个文件系统是否健全或者修复它。你可以像下面那样通过将分区名字作为 `fsck` 的参数来查看该分区的文件系统类型：

```
$ fsck -N /dev/sda1
fsck from util-linux 2.32
[/usr/bin/fsck.ext4 (1) -- /boot] fsck.ext4 /dev/sda1
```

如果想知道更多的内容，请查看其 man 手册：

```
$ man fsck
```

#### 方法 6 – 使用 fstab 命令

`fstab` 是一个包含文件系统静态信息的文件。这个文件通常包含了挂载点、文件系统类型和挂载选项等信息。

要查看某个文件系统的类型，只需要运行：

```
$ cat /etc/fstab
```

![][5]

更多详情，请查看其 man 手册：

```
$ man fstab
```

#### 方法 7 – 使用 lsblk 命令

`lsblk` 命令可以展示设备的信息。

要展示已挂载文件系统的信息，只需运行：

```
$ lsblk -f
NAME   FSTYPE   LABEL  UUID                                 MOUNTPOINT
loop0  squashfs                                             /var/lib/snapd/snap/core/4327
sda
├─sda1 ext4            83a1dbbf-1e15-4b45-94fe-134d3872af96 /boot
├─sda2 ext4            4d25ddb0-5b20-40b4-ae35-ef96376d6594 /
└─sda3 swap            1f8f5e2e-7c17-4f35-97e6-8bce7a4849cb [SWAP]
sr0
```

更多细节，可以参考它的 man 手册：

```
$ man lsblk
```

#### 方法 8 – 使用 mount 命令

`mount` 被用来在类 Unix 系统中挂载本地或远程的文件系统。

要使用 `mount` 命令查看文件系统的类型，可以像下面这样做：

```
$ mount | grep "^/dev"
/dev/sda2 on / type ext4 (rw,relatime,commit=360)
/dev/sda1 on /boot type ext4 (rw,relatime,commit=360,data=ordered)
```

更多详情，请参考其 man 手册的内容：

```
$ man mount
```

好了，上面便是今天的全部内容了。现在你知道了 8 种不同的 Linux 命令来查看已挂载的 Linux 文件系统的类型。假如你知道其他的命令来完成同样的任务，请在下面的评论部分让我们知晓，我将确认并相应地升级本教程。

更过精彩内容即将呈现，请保持关注！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-find-the-mounted-filesystem-type-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/07/findmnt-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/07/findmnt-2.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/07/df.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/07/fstab.png
