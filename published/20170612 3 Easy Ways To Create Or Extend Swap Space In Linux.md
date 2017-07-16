三种在 Linux 上创建或扩展交换分区的简单方法
============================================================

用户可以在任何 Linux 操作系统的安装过程中或者是其它必要的时候创建交换空间。如果你在安装 Linux 的时候忘记了创建或是你想要再增加交换分区的空间，你随时都可以再创建或增加。

有时候在你安装后摇升级 RAM 的时候需要增加一点交换分区的空间，比如你要将你的系统的 RAM 从 1GB 升级到 2GB 你，那么你就不得不将你的交换分区空间也升级一下（从 2GB 到 4GB），这是因为它使用的容量是物理 RAM 的双倍容量。（LCTT 译注：其实这里是个误区，交换分区不一定非得是双倍的物理内存容量，只是惯例如此。事实上，如果你的物理内存足够的话，你完全可以不用交换分区——在这里的情形下，或许你增加了物理内存，就没必要增加交换分区大小了。）

交换空间是当物理内存（RAM 随机存取存储器）的用量已满时，被保留用作虚拟内存的磁盘上的空间。 如果系统在 RAM 满载时需要更多的内存资源，内存中的非活动页面将被移动到交换空间，这样可以帮助系统运行应用程序更多的时间，但不应该把它当做 RAM 的扩展。

建议你创建一个专用的交换分区，但是如果你没有可用的分区，那么可以使用交换文件，或交换分区和交换文件的组合。 交换空间通常建议用户至少 4 GB，用户也可以根据自己的要求和环境创建交换空间。

我发现大部分 VM 和 云服务器都没有交换分区，所以在这种情况下，我们可以使用以下三种方法创建，扩展或增加交换空间。

### 如何检测当前交换分区大小

通过 [free][1] & `swapon` 命令来检测当前的交换分区空间的大小。 

```
$ free -h
              total        used        free      shared  buff/cache   available
Mem:           2.0G        1.3G        139M         45M        483M        426M
Swap:          2.0G        655M        1.4G

$ swapon --show
NAME      TYPE      SIZE   USED PRIO
/dev/sda5 partition   2G 655.2M   -1
```

上面的输出显示了当前的交换分区空间是 `2GB` 。

### 方法 1 : 通过 fallocate 命令创建交换文件

`fallocate` 程序是立即创建预分配大小的文件的最佳方法。

下面这个命令会创建一个 1GB 大小的 `/swapfile`。

```
$ sudo fallocate -l 1G /swapfile
```

检查一下创建的文件的大小是否正确。

```
$ ls -lh /swapfile
-rw-r--r-- 1 root root 1.0G Jun  7 09:49 /swapfile
```

将该文件的权限设置为 `600` 这样只有 root 用户可以访问这个文件。

```
$ sudo chmod 600 /swapfile
```

通过运行以下的命令来将此文件转换为交换文件。

```
$ sudo mkswap /swapfile
Setting up swapspace version 1, size = 1024 MiB (1073737728 bytes)
no label, UUID=cda50e0e-41f3-49c7-af61-b8cb4a33a464
```

通过运行以下的命令来使交换文件生效。

```
$ sudo swapon /swapfile
```

将新创建的交换文件添加到 `fstab` 文件中，这样交换分区空间的修改即使在重启后也可以生效。

```
$ vi /etc/fstab

/swapfile  swap  swap  defaults  0 0
```

检查一下新创建的交换文件。

```
$ swapon --show
NAME      TYPE       SIZE   USED PRIO
/dev/sda5 partition    2G 657.8M   -1
/swapfile file      1024M     0B   -2
```

现在我可以看到一个新的  1GB 的 `/swapfile1` 文件了。重启系统以使新的交换文件生效。

### 方法 2 : 通过 dd 命令来创建交换文件

`dd` 命令是另一个实用程序，可以帮助我们立即创建预分配大小的文件。

以下 dd 命令将创建 1GB 的 `/swapfile1`。

```
$ sudo dd if=/dev/zero of=/swapfile1 bs=1G count=1
1+0 records in
1+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 16.6154 s, 64.6 MB/s
```

**详解：**

*   `if=/dev/zero` 是输入文件，`/dev/zero` 是类 Unix 操作系统中的一个特殊文件，它提供从它读取的尽可能多的空字符（ASCII NUL，0x00）。
*   `of=/swapfile1` 设置输出文件。
*   `bs=1G` 一次性读写的大小为 1GB
*   `count=1` 仅复制一个输入块

检查一下创建的文件的大小是否正确。

```
$ ls -lh /swapfile1
-rw-r--r-- 1 root root 1.0G Jun  7 09:58 /swapfile1
```

将该文件的权限设置为 `600` 这样只有 root 用户可以访问这个文件。

```
$ sudo chmod 600 /swapfile1
```

通过运行以下的命令来将此文件转换为交换文件。

```
$ sudo mkswap /swapfile1
Setting up swapspace version 1, size = 1024 MiB (1073737728 bytes)
no label, UUID=96def6d7-b2da-4954-aa72-aa32316ec993
```

通过运行以下的命令来使交换文件生效。

```
$ sudo swapon /swapfile1
```

将新创建的交换文件添加到 `fstab` 文件中，这样交换分区空间的修改即使在重启后也可以生效。

```
$ vi /etc/fstab

/swapfile1  swap  swap  defaults  0 0
```

检查新创建的交换文件。

```
$ swapon --show
NAME       TYPE       SIZE USED PRIO
/dev/sda5  partition    2G 1.3G   -1
/swapfile  file      1024M   0B   -2
/swapfile1 file      1024M   0B   -3
```

现在我可以看到一个新的  1GB 的 `/swapfile1` 了。重启系统以使新的交换文件生效。

### 方法 3 : 通过硬盘分区来创建交换文件

我们也推荐使用通过硬盘分区的方式来创建交换分区。

如果你已经在你的另一个硬盘上通过 `fdisk` 命令创建了一个新的分区，假设我们已经创建了一个叫做 `/dev/sda4` 的分区。

使用 `mkswap` 命令来将这个分区转换成交换分区。

```
$ sudo mkswap /dev/sda4
```

通过运行以下命令来使交换文件生效。

```
$ sudo swapon /dev/sda4
```

把新增的交换文件添加到 `fstab` 文件中，这样即使是重启了系统交换分区的修改也能生效。

```
$ vi /etc/fstab

/dev/sda4  swap  swap  defaults  0 0
```

检查新创建的交换文件。

```
$ swapon --show
NAME       TYPE       SIZE USED PRIO
/dev/sda5  partition    2G 1.3G   -1
/swapfile  file      1024M   0B   -2
/swapfile1 file      1024M   0B   -3
/dev/sda4  partition    1G   0B   -4
```

我可以看到新的交换分区 1GB 的 `/dev/sda4`。重启系统就可以使用新的交换分区了。


--------------------------------------------------------------------------------

via: http://www.2daygeek.com/add-extend-increase-swap-space-memory-file-partition-linux/

作者：[2DAYGEEK][a]
译者：[chenxinlong](https://github.com/chenxinlong)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/2daygeek/
[1]:http://www.2daygeek.com/free-command-to-check-memory-usage-statistics-in-linux/
[2]:http://www.2daygeek.com/author/2daygeek/
