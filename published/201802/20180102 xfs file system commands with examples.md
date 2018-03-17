通过案例学习 xfs 文件系统相关命令
======

![Learn xfs commands with examples][1]

在我们另一篇文章中，我带您领略了一下[什么是 xfs，xfs 的相关特性等内容][2]。本文我们来看一些常用的 xfs 管理命令。我们将会通过几个例子来讲解如何创建 xfs 文件系统，如何对 xfs 文件系统进行扩容，如何检测并修复 xfs 文件系统。

### 创建 XFS 文件系统

`mkfs.xfs` 命令用来创建 xfs 文件系统。无需任何特别的参数，其输出如下：

```
root@kerneltalks # mkfs.xfs /dev/xvdf
meta-data=/dev/xvdf              isize=512    agcount=4, agsize=1310720 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0, sparse=0
data     =                       bsize=4096   blocks=5242880, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
```

> 注意：一旦 XFS 文件系统创建完毕就不能在缩容而只能进行扩容了。

### 调整 XFS 文件系统容量

你只能对 XFS 进行扩容而不能缩容。我们使用 `xfs_growfs` 来进行扩容。你需要使用 `-D` 参数指定挂载点的新容量。`-D` 接受一个数字的参数，指定文件系统块的数量。若你没有提供 `-D` 参数，则 `xfs_growfs` 会将文件系统扩到最大。

```
root@kerneltalks # xfs_growfs /dev/xvdf -D 256
meta-data=/dev/xvdf              isize=512    agcount=4, agsize=720896 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0 spinodes=0
data     =                       bsize=4096   blocks=2883584, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal               bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
data size 256 too small, old size is 2883584
```

观察上面的输出中的最后一行。由于我分配的容量要小于现在的容量。它告诉你不能缩减 XFS 文件系统。你只能对它进行扩展。

```
root@kerneltalks #  xfs_growfs /dev/xvdf -D 2883840
meta-data=/dev/xvdf              isize=512    agcount=4, agsize=720896 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0 spinodes=0
data     =                       bsize=4096   blocks=2883584, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal               bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
data blocks changed from 2883584 to 2883840
```

现在我多分配了 1GB 的空间，而且也成功地扩增了容量。

**1GB 块的计算方式：**

当前文件系统 bsize 为 4096，意思是块的大小为 4MB。我们需要 1GB，也就是 256 个块。因此在当前块数，2883584 上加上 256 得到 2883840。因此我为 `-D` 传递参数 2883840。

### 修复 XFS 文件系统

可以使用 `xfs_repair` 命令进行文件系统一致性检查和修复。使用 `-n` 参数则并不对文件系统做出什么实质性的修改。它只会搜索并报告要做哪些修改。若不带 `-n` 参数，则会修改文件系统以保证文件系统的纯净。

请注意，在检查之前，你需要先卸载 XFS 文件系统。否则会报错。

```
root@kerneltalks # xfs_repair -n /dev/xvdf
xfs_repair: /dev/xvdf contains a mounted filesystem
xfs_repair: /dev/xvdf contains a mounted and writable filesystem
 
fatal error -- couldn't initialize XFS library
```

卸载后运行检查命令。

```
root@kerneltalks # xfs_repair -n /dev/xvdf
Phase 1 - find and verify superblock...
Phase 2 - using internal log
        - zero log...
        - scan filesystem freespace and inode maps...
        - found root inode chunk
Phase 3 - for each AG...
        - scan (but don't clear) agi unlinked lists...
        - process known inodes and perform inode discovery...
        - agno = 0
        - agno = 1
        - agno = 2
        - agno = 3
        - agno = 4
        - process newly discovered inodes...
Phase 4 - check for duplicate blocks...
        - setting up duplicate extent list...
        - check for inodes claiming duplicate blocks...
        - agno = 0
        - agno = 1
        - agno = 2
        - agno = 3
        - agno = 4
No modify flag set, skipping phase 5
Phase 6 - check inode connectivity...
        - traversing filesystem ...
        - traversal finished ...
        - moving disconnected inodes to lost+found ...
Phase 7 - verify link counts...
No modify flag set, skipping filesystem flush and exiting.
```

你可以看到，命令在每个阶段都显示出了为了文件系统变得健康可能做出的修改。若你希望命令在扫描时实际应用这些修改，则不带任何参数运行命令即可。

```
root @ kerneltalks # xfs_repair /dev/xvdf

Phase 1 - find and verify superblock . . .
Phase 2 - using internal log
        - zero log . . .
        - scan filesystem freespace and inode maps . . .
        - found root inode chunk
Phase 3 - for each AG . . . 
        - scan and clear agi unlinked lists . . .
        - process known inodes and perform inode discovery . . .
        - agno = 0 
        - agno = 1
        - agno = 2
        - agno = 3
        - agno = 4
        - process newly discovered inodes . . . 
Phase 4 - check for duplicate blocks . . .
        - setting up duplicate extent list . . .
        - check for inodes claiming duplicate blocks . . .
        - agno = 0
        - agno = 1
        - agno = 2
        - agno = 3
        - agno = 4 
Phase 5 - rebuild AG headers and trees . . .
        - reset superblock . . .
Phase 6 - check inode connectivity . . .
        - resetting contents of realtime bitmap and summary inodes
        - traversing filesystem . . .
        - traversal finished . . .
        - moving disconnected inodes to lost + found . . .
Phase 7 - verify and correct link counts . . . 
done
```

你会发现 `xfs_repair` 命令对文件系统做出了修改让其变得健康。

### 查看 XFS 版本以及它的详细信息

查看 xfs 文件系统版本很简单。使用 `-V` 参数运行 `xfs_info` 再加上挂载点就行了。

```
root@kerneltalks # xfs_info -V /shrikant
xfs_info version 4.5.0
```

若要查看 XFS 文件系统的详细信息，比如想计算扩容 XFS 文件系统时要新增多少个块，需要了解块大小，块的个数等信息，则不带任何选项运行 `xfs_info` 加上挂载点。

```
root@kerneltalks # xfs_info /shrikant
meta-data=/dev/xvdf              isize=512    agcount=5, agsize=720896 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=0 spinodes=0
data     =                       bsize=4096   blocks=2883840, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal               bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
```

则会显示 XFS 文件系统的所有详细信息，就跟创建 XFS 文件系统时显示的信息一样。

此外还有一些 XFS 文件系统管理命令可以修改并管理 XFS 的元数据。我们将在另一篇文章中来讲解。

--------------------------------------------------------------------------------

via: https://kerneltalks.com/commands/xfs-file-system-commands-with-examples/

作者：[kerneltalks][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://a3.kerneltalks.com/wp-content/uploads/2018/01/xfs-commands.png
[2]:https://kerneltalks.com/disk-management/xfs-filesystem-in-linux/
