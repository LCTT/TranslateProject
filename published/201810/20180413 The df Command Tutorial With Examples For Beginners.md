df 命令新手教程
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/df-command-1-720x340.png)

在本指南中，我们将学习如何使用 `df` 命令。df 命令是 “Disk Free” 的首字母组合，它报告文件系统磁盘空间的使用情况。它显示一个 Linux 系统中文件系统上可用磁盘空间的数量。`df` 命令很容易与 `du` 命令混淆。它们的用途不同。`df` 命令报告我们拥有多少磁盘空间（空闲磁盘空间），而 `du` 命令报告被文件和目录占用了多少磁盘空间。希望我这样的解释你能更清楚。在继续之前，我们来看一些 `df` 命令的实例，以便于你更好地理解它。

### df 命令使用举例

#### 1、查看整个文件系统磁盘空间使用情况

无需任何参数来运行 `df` 命令，以显示整个文件系统磁盘空间使用情况。

```
$ df
```

示例输出：

```
Filesystem 1K-blocks Used Available Use% Mounted on
dev 4033216 0 4033216 0% /dev
run 4038880 1120 4037760 1% /run
/dev/sda2 478425016 428790352 25308980 95% /
tmpfs 4038880 34396 4004484 1% /dev/shm
tmpfs 4038880 0 4038880 0% /sys/fs/cgroup
tmpfs 4038880 11636 4027244 1% /tmp
/dev/loop0 84096 84096 0 100% /var/lib/snapd/snap/core/4327
/dev/sda1 95054 55724 32162 64% /boot
tmpfs 807776 28 807748 1% /run/user/1000
```

![][2]

正如你所见，输出结果分为六列。我们来看一下每一列的含义。

  * `Filesystem` – Linux 系统中的文件系统
  * `1K-blocks` – 文件系统的大小，用 1K 大小的块来表示。
  * `Used` – 以 1K 大小的块所表示的已使用数量。
  * `Available` – 以 1K 大小的块所表示的可用空间的数量。
  * `Use%` – 文件系统中已使用的百分比。
  * `Mounted on` – 已挂载的文件系统的挂载点。

#### 2、以人类友好格式显示文件系统硬盘空间使用情况

在上面的示例中你可能已经注意到了，它使用 1K 大小的块为单位来表示使用情况，如果你以人类友好格式来显示它们，可以使用 `-h` 标志。

```
$ df -h
Filesystem Size Used Avail Use% Mounted on
dev 3.9G 0 3.9G 0% /dev
run 3.9G 1.1M 3.9G 1% /run
/dev/sda2 457G 409G 25G 95% /
tmpfs 3.9G 27M 3.9G 1% /dev/shm
tmpfs 3.9G 0 3.9G 0% /sys/fs/cgroup
tmpfs 3.9G 12M 3.9G 1% /tmp
/dev/loop0 83M 83M 0 100% /var/lib/snapd/snap/core/4327
/dev/sda1 93M 55M 32M 64% /boot
tmpfs 789M 28K 789M 1% /run/user/1000

```

现在，在 `Size` 列和 `Avail` 列，使用情况是以 GB 和 MB 为单位来显示的。

#### 3、仅以 MB 为单位来显示文件系统磁盘空间使用情况

如果仅以 MB 为单位来显示文件系统磁盘空间使用情况，使用 `-m` 标志。

```
$ df -m
Filesystem 1M-blocks Used Available Use% Mounted on
dev 3939 0 3939 0% /dev
run 3945 2 3944 1% /run
/dev/sda2 467212 418742 24716 95% /
tmpfs 3945 26 3920 1% /dev/shm
tmpfs 3945 0 3945 0% /sys/fs/cgroup
tmpfs 3945 12 3933 1% /tmp
/dev/loop0 83 83 0 100% /var/lib/snapd/snap/core/4327
/dev/sda1 93 55 32 64% /boot
tmpfs 789 1 789 1% /run/user/1000
```

#### 4、列出节点而不是块的使用情况

如下所示，我们可以通过使用 `-i` 标记来列出节点而不是块的使用情况。

```
$ df -i
Filesystem Inodes IUsed IFree IUse% Mounted on
dev 1008304 439 1007865 1% /dev
run 1009720 649 1009071 1% /run
/dev/sda2 30392320 844035 29548285 3% /
tmpfs 1009720 86 1009634 1% /dev/shm
tmpfs 1009720 18 1009702 1% /sys/fs/cgroup
tmpfs 1009720 3008 1006712 1% /tmp
/dev/loop0 12829 12829 0 100% /var/lib/snapd/snap/core/4327
/dev/sda1 25688 390 25298 2% /boot
tmpfs 1009720 29 1009691 1% /run/user/1000
```

#### 5、显示文件系统类型

使用 `-T` 标志显示文件系统类型。

```
$ df -T
Filesystem Type 1K-blocks Used Available Use% Mounted on
dev devtmpfs 4033216 0 4033216 0% /dev
run tmpfs 4038880 1120 4037760 1% /run
/dev/sda2 ext4 478425016 428790896 25308436 95% /
tmpfs tmpfs 4038880 31300 4007580 1% /dev/shm
tmpfs tmpfs 4038880 0 4038880 0% /sys/fs/cgroup
tmpfs tmpfs 4038880 11984 4026896 1% /tmp
/dev/loop0 squashfs 84096 84096 0 100% /var/lib/snapd/snap/core/4327
/dev/sda1 ext4 95054 55724 32162 64% /boot
tmpfs tmpfs 807776 28 807748 1% /run/user/1000
```

正如你所见，现在出现了显示文件系统类型的额外的列（从左数的第二列）。

#### 6、仅显示指定类型的文件系统

我们可以限制仅列出某些文件系统。比如，只列出 ext4 文件系统。我们使用 `-t` 标志。

```
$ df -t ext4
Filesystem 1K-blocks Used Available Use% Mounted on
/dev/sda2 478425016 428790896 25308436 95% /
/dev/sda1 95054 55724 32162 64% /boot
```

看到了吗？这个命令仅显示了 ext4 文件系统的磁盘空间使用情况。

#### 7、不列出指定类型的文件系统

有时，我们可能需要从结果中去排除指定类型的文件系统。我们可以使用 `-x` 标记达到我们的目的。

```
$ df -x ext4
Filesystem 1K-blocks Used Available Use% Mounted on
dev 4033216 0 4033216 0% /dev
run 4038880 1120 4037760 1% /run
tmpfs 4038880 26116 4012764 1% /dev/shm
tmpfs 4038880 0 4038880 0% /sys/fs/cgroup
tmpfs 4038880 11984 4026896 1% /tmp
/dev/loop0 84096 84096 0 100% /var/lib/snapd/snap/core/4327
tmpfs 807776 28 807748 1% /run/user/1000
```

上面的命令列出了除 ext4 类型以外的全部文件系统。

#### 8、显示一个目录的磁盘使用情况

去显示某个目录的硬盘空间使用情况以及它的挂载点，例如 `/home/sk/` 目录，可以使用如下的命令：

```
$ df -hT /home/sk/
Filesystem Type Size Used Avail Use% Mounted on
/dev/sda2 ext4 457G 409G 25G 95% /
```

这个命令显示文件系统类型、以人类友好格式显示已使用和可用磁盘空间、以及它的挂载点。如果你不想去显示文件系统类型，只需要忽略 `-t` 标志即可。

更详细的使用情况，请参阅 man 手册页。

```
$ man df
```


今天就到此这止！我希望对你有用。还有更多更好玩的东西即将奉上。请继续关注！

再见！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-df-command-tutorial-with-examples-for-beginners/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/04/df-command.png

