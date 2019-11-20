[#]: collector: (lujun9972)
[#]: translator: (guevaraya )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting Started With ZFS Filesystem on Ubuntu 19.10)
[#]: via: (https://itsfoss.com/zfs-ubuntu/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

在 Ubuntu 19.10 上入门 ZFS 文件系统
======

 [Ubuntu 19.01][1] 的一个主要新特性就是 [ZFS][2]。现在你可以很容易的不要太多操作就可以在 Ubuntu 系统上安装 ZFS了。

一般情况下，安装 Linux 都会选择 Ext4 文件系统。但是如果是安装 Ubuntu 19.10，在启动阶段可以看到 ZFS 选项。但你绝对不能在双系统上用它，因为它会擦除这个磁盘。

![你可以在安装 Ubuntu 19.10 的时候选择 ZFS][3]

让我们看看 ZFS 有多重要以及如何在已经安装 ZFS 的 Ubuntu 上使用它。

### ZFS 与其他文件系统有哪些区别？

ZFS 的设计初衷是：处理海量存储和避免数据损坏。ZFS 可以处理 256 千万亿的泽它字节(ZB)数据。（这就是ZFS的Z）且它可以处理最大16艾字节（EB）的文件。

如果你仅有一个单磁盘的笔记本电脑，你可以体验 ZFS 的数据保护特性。即写及时拷贝特性确保正在使用的数据不会被覆盖，相反，新的数据会被写到一个新的块中，同时文件系统的元数据会被更新到新块中。ZFS 可容易的创建文件系统的快照。这个快照可追踪文件系统的更改，并共享数据块确保节省数据空间。

ZFS 为磁盘上的每个文件分配一个校验和。它会不断的校验文件的状态和校验和。如果发现文件被损坏了，它就会尝试修复文件。

我写过一个文章详细介绍 [什么是 ZFS以及它有哪些特性][2].如果你感兴趣可以去阅读下。

注：

请谨记 ZFS 的数据保护特性会导致性能下降。

### Ubuntu下使用 ZFS [适用于中高级用户] 

![][4]

一旦你在你的主磁盘上干净安装了 Ubuntu 的 ZFS，你就可以开始体验它的特性。

请注意安装 ZFS 这个过程需要命令行。我还没用过它的 GUI 工具。

#### 创建一个 ZFS 池

_**这段仅针对拥有多个磁盘的系统。如果你只有一个磁盘，Ubuntu会在安装的时候自动的创建池。**_

在创建池之前，你需要为池找到磁盘的id。你可以用命令 _**lsblk**_ 查询出这个信息。

为三个磁盘创建一个基础池，用以下命令：

```
sudo zpool create pool-test /dev/sdb /dev/sdc /dev/sdd.
```

请记得替换 _**pool-test**_ 为你自己的命名

这个命令将会设置“无冗余RAID-0池”。这意味着如果一个磁盘被破坏或有故障，你将会丢失数据。如果你执行以上命令，还是建议做一个常规备份。


你也可以增加一个磁盘到池，用下面命令：

```
sudo zpool add pool-name /dev/sdx
```

#### 查看 ZFS 池的状态

你可以用这个命令查询新建池的状态：

```
sudo zpool status pool-test
```

![Zpool 状态][6]

#### 镜像一个 ZFS 池

确保数据的安全性，你可以创建镜像。镜像意味着每个磁盘包含同样的数据。在创建镜像的磁盘上三个磁盘坏掉两个仍然可以不丢数据。

创建镜像你可以用下面命令：

```
sudo zpool create pool-test mirror /dev/sdb /dev/sdc /dev/sdd
```

#### 创建 ZFS 用于备份恢复的快照

快照可以是一个需要备份的时间点以防某个文件被删除或被覆盖。比如，我们创建一个快照，当在用户主目录下删除一些目录后，然后把他恢复。

首先，你需要找到你想要的快照数据集。你可以这样做：

```
zfs list
```

![Zfs List][7]

你可以看到我的目录位于 **rpool/USERDATA/johnblood_uwcjk7**。

我们用下面命令创建一个名叫 **1910** 的快照：

```
sudo zfs snapshot rpool/USERDATA/[email protected]
```

快照很快创建完成。现在你可以删除 _Downloads_ 和 _Documents_ 目录。

现在你用以下命令恢复快照：

```
sudo zfs rollback rpool/USERDATA/[email protected]
```

回滚的数据大小取决于有多少信息改变。现在你可以查看用户目录和被删目录（和它的内容）将会被恢复过来。

### 要不要试试 ZFS ？

这篇文章仅简单介绍的 Ubuntu下 ZFS 的用法。更多的信息请参考 [ Ubuntu 的ZFS Wiki页面][5] 我也推荐阅读 [ArsTechnica的精彩文章][8]。

这个是试验性的功能。如果你还不了解 ZFS，你想用一个简单稳定的系统，请安装标准文件系统 EXT4。如果你想用闲置的机器体验，可以参照上面了解 ZFS。如果你是一个‘专家’，你知道你在做什么，那就可以随便咋搞。

你之前用过 ZFS 吗？请在下面留言。如果你觉得这个文章还可以，请分享到社交媒体，黑客新闻或 [Reddit][9]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/zfs-ubuntu/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[guevaraya](https://github.com/guevaraya)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-19-04-release-features/
[2]: https://itsfoss.com/what-is-zfs/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/zfs-ubuntu-19-10.jpg?ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/Using_ZFS_Ubuntu.jpg?resize=800%2C450&ssl=1
[5]: https://wiki.ubuntu.com/Kernel/Reference/ZFS
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/zpool-status.png?ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/zfs-list.png?ssl=1
[8]: https://arstechnica.com/information-technology/2019/10/a-detailed-look-at-ubuntus-new-experimental-zfs-installer/
[9]: https://reddit.com/r/linuxusersgroup
 know in the comments below. If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][9].

--------------------------------------------------------------------------------

via: https://itsfoss.com/zfs-ubuntu/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-19-04-release-features/
[2]: https://itsfoss.com/what-is-zfs/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/zfs-ubuntu-19-10.jpg?ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/Using_ZFS_Ubuntu.jpg?resize=800%2C450&ssl=1
[5]: https://wiki.ubuntu.com/Kernel/Reference/ZFS
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/zpool-status.png?ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/zfs-list.png?ssl=1
[8]: https://arstechnica.com/information-technology/2019/10/a-detailed-look-at-ubuntus-new-experimental-zfs-installer/
[9]: https://reddit.com/r/linuxusersgroup
