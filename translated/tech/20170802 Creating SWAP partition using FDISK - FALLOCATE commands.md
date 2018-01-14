使用 fdisk 和 fallocate 命令创建交换分区
======

交换分区在物理内存（RAM）被填满时用来保持内存中的内容。当 RAM 被耗尽，Linux 会将内存中不活动的页移动到交换空间中，从而空出内存给系统使用。虽然如此，但交换空间不应被认为是物理内存的替代品。

大多数情况下，建议交换内存的大小为物理内存的 1 到 2 倍。也就是说如果你有 8GB 内存, 那么交换空间大小应该介于8-16 GB。

若系统中没有配置交换分区，当内存耗尽后，系统可能会杀掉正在运行中的进程/应用，从而导致系统崩溃。在本文中，我们将学会如何为 Linux 系统添加交换分区，我们有两个办法：

-  使用 fdisk 命令
-  使用 fallocate 命令

###  第一个方法（使用 fdisk 命令）

通常，系统的第一块硬盘会被命名为 `/dev/sda`，而其中的分区会命名为 `/dev/sda1` 、 `/dev/sda2`。 本文我们使用的是一块有两个主分区的硬盘，两个分区分别为 `/dev/sda1`、 `/dev/sda2`，而我们使用 `/dev/sda3` 来做交换分区。

首先创建一个新分区，

```
$ fdisk /dev/sda
```

按 `n` 来创建新分区。系统会询问你从哪个柱面开始，直接按回车键使用默认值即可。然后系统询问你到哪个柱面结束, 这里我们输入交换分区的大小（比如 1000MB）。这里我们输入 `+1000M`。

![swap][2]

现在我们创建了一个大小为 1000MB 的磁盘了。但是我们并没有设置该分区的类型，我们按下 `t` 然后回车，来设置分区类型。

现在我们要输入分区编号，这里我们输入 `3`，然后输入磁盘分类号，交换分区的分区类型为 `82` （要显示所有可用的分区类型，按下 `l` ) ，然后再按下 `w` 保存磁盘分区表。

![swap][4]

再下一步使用 `mkswap` 命令来格式化交换分区：

```
$ mkswap /dev/sda3
```

然后激活新建的交换分区：

```
$ swapon /dev/sda3
```

然而我们的交换分区在重启后并不会自动挂载。要做到永久挂载，我们需要添加内容到 `/etc/fstab` 文件中。打开 `/etc/fstab` 文件并输入下面行：

```
$ vi /etc/fstab

/dev/sda3 swap  swap  default  0  0
```

保存并关闭文件。现在每次重启后都能使用我们的交换分区了。

### 第二种方法（使用 fallocate 命令）

我推荐用这种方法因为这个是最简单、最快速的创建交换空间的方法了。`fallocate` 是最被低估和使用最少的命令之一了。 `fallocate` 命令用于为文件预分配块/大小。

使用 `fallocate` 创建交换空间，我们首先在 `/` 目录下创建一个名为 `swap_space` 的文件。然后分配 2GB 到 `swap_space` 文件：

```
$ fallocate -l 2G /swap_space
```

我们运行下面命令来验证文件大小：

```
$ ls -lh /swap_space
```

然后更改文件权限，让 `/swap_space` 更安全：

```
$ chmod 600 /swap_space
```

这样只有 root 可以读写该文件了。我们再来格式化交换分区（LCTT 译注：虽然这个 `swap_space` 是个文件，但是我们把它当成是分区来挂载）：

```
$ mkswap /swap_space
```

然后启用交换空间：

```
$ swapon -s
```

每次重启后都要重新挂载磁盘分区。因此为了使之持久化，就像上面一样，我们编辑 `/etc/fstab` 并输入下面行：

```
/swap_space swap  swap  sw  0  0 
```

保存并退出文件。现在我们的交换分区会一直被挂载了。我们重启后可以在终端运行 `free -m` 来检查交换分区是否生效。

我们的教程至此就结束了，希望本文足够容易理解和学习，如果有任何疑问欢迎提出。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/create-swap-using-fdisk-fallocate/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=668%2C211
[2]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/fidsk.jpg?resize=668%2C211
[3]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=620%2C157
[4]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/fidsk-swap-select.jpg?resize=620%2C157
