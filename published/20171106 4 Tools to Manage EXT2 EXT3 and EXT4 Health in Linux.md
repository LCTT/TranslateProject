Linux 中管理 EXT2、 EXT3 和 EXT4 健康状况的 4 个工具
============================================================

文件系统是一个在计算机上帮你去管理数据怎么去存储和检索的数据结构。文件系统也可以被视作是磁盘上的物理（或扩展）分区。如果它没有很好地被维护或定期监视，它可能在长期运行中出现各种各样的错误或损坏。

这里有几个可能导致文件系统出问题的因素：系统崩溃、硬件或软件故障、 有问题的驱动和程序、不正确的优化、大量的数据过载加上一些小故障。

这其中的任何一个问题都可以导致 Linux 不能顺利地挂载（或卸载）一个文件系统，从而导致系统故障。

扩展阅读：[Linux 中判断文件系统类型（Ext2, Ext3 或 Ext4）的 7 种方法][7]

另外，受损的文件系统运行在你的系统上可能导致操作系统中的组件或用户应用程序的运行时错误，它可能会进一步扩大到服务器数据的丢失。为避免文件系统错误或损坏，你需要去持续关注它的健康状况。

在这篇文章中，我们将介绍监视或维护一个 ext2、ext3 和 ext4 文件系统健康状况的工具。在这里描述的所有工具都需要 root 用户权限，因此，需要使用 [sudo 命令][8]去运行它们。

### 怎么去查看 EXT2/EXT3/EXT4 文件系统信息

`dumpe2fs` 是一个命令行工具，用于去转储 ext2/ext3/ext4 文件系统信息，这意味着它可以显示设备上文件系统的超级块和块组信息。

在运行 `dumpe2fs` 之前，先去运行 [df -hT][9] 命令，确保知道文件系统的设备名。

```
$ sudo dumpe2fs /dev/sda10
```

**示例输出：**

```
dumpe2fs 1.42.13 (17-May-2015)
Filesystem volume name:   
Last mounted on:          /
Filesystem UUID:          bb29dda3-bdaa-4b39-86cf-4a6dc9634a1b
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal ext_attr resize_inode dir_index filetype needs_recovery extent flex_bg sparse_super large_file huge_file uninit_bg dir_nlink extra_isize
Filesystem flags:         signed_directory_hash 
Default mount options:    user_xattr acl
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              21544960
Block count:              86154752
Reserved block count:     4307737
Free blocks:              22387732
Free inodes:              21026406
First block:              0
Block size:               4096
Fragment size:            4096
Reserved GDT blocks:      1003
Blocks per group:         32768
Fragments per group:      32768
Inodes per group:         8192
Inode blocks per group:   512
Flex block group size:    16
Filesystem created:       Sun Jul 31 16:19:36 2016
Last mount time:          Mon Nov  6 10:25:28 2017
Last write time:          Mon Nov  6 10:25:19 2017
Mount count:              432
Maximum mount count:      -1
Last checked:             Sun Jul 31 16:19:36 2016
Check interval:           0 ()
Lifetime writes:          2834 GB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:	          256
Required extra isize:     28
Desired extra isize:      28
Journal inode:            8
First orphan inode:       6947324
Default directory hash:   half_md4
Directory Hash Seed:      9da5dafb-bded-494d-ba7f-5c0ff3d9b805
Journal backup:           inode blocks
Journal features:         journal_incompat_revoke
Journal size:             128M
Journal length:           32768
Journal sequence:         0x00580f0c
Journal start:            12055
```

你可以通过 `-b` 选项来显示文件系统中的任何保留块，比如坏块（无输出说明没有坏块）：

```
$ sudo dumpe2fs -b
```

### 检查 EXT2/EXT3/EXT4 文件系统的错误

`e2fsck` 用于去检查 ext2/ext3/ext4 文件系统的错误。`fsck` 可以检查并且可选地 [修复 Linux 文件系统][10]；它实际上是底层 Linux 提供的一系列文件系统检查器 （fsck.fstype，例如 fsck.ext3、fsck.sfx 等等） 的前端程序。

记住，在系统引导时，Linux 会为 `/etc/fstab` 配置文件中被标为“检查”的分区自动运行 `e2fsck`/`fsck`。而在一个文件系统没有被干净地卸载时，一般也会运行它。

注意：不要在已挂载的文件系统上运行 e2fsck 或 fsck，在你运行这些工具之前，首先要去卸载分区，如下所示。

```
$ sudo unmount /dev/sda10
$ sudo fsck /dev/sda10
```

此外，可以使用 `-V` 开关去启用详细输出，使用 `-t` 去指定文件系统类型，像这样：

```
$ sudo fsck -Vt ext4 /dev/sda10
```

### 调优 EXT2/EXT3/EXT4 文件系统

我们前面提到过，导致文件系统损坏的其中一个因素就是不正确的调优。你可以使用 `tune2fs` 实用程序去改变 ext2/ext3/ext4 文件系统的可调优参数，像下面讲的那样。

去查看文件系统的超级块，包括参数的当前值，使用 `-l` 选项，如下所示。

```
$ sudo tune2fs -l /dev/sda10
```

**示例输出：**

```
tune2fs 1.42.13 (17-May-2015)
Filesystem volume name:   
Last mounted on:          /
Filesystem UUID:          bb29dda3-bdaa-4b39-86cf-4a6dc9634a1b
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal ext_attr resize_inode dir_index filetype needs_recovery extent flex_bg sparse_super large_file huge_file uninit_bg dir_nlink extra_isize
Filesystem flags:         signed_directory_hash 
Default mount options:    user_xattr acl
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              21544960
Block count:              86154752
Reserved block count:     4307737
Free blocks:              22387732
Free inodes:              21026406
First block:              0
Block size:               4096
Fragment size:            4096
Reserved GDT blocks:      1003
Blocks per group:         32768
Fragments per group:      32768
Inodes per group:         8192
Inode blocks per group:   512
Flex block group size:    16
Filesystem created:       Sun Jul 31 16:19:36 2016
Last mount time:          Mon Nov  6 10:25:28 2017
Last write time:          Mon Nov  6 10:25:19 2017
Mount count:              432
Maximum mount count:      -1
Last checked:             Sun Jul 31 16:19:36 2016
Check interval:           0 ()
Lifetime writes:          2834 GB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:	          256
Required extra isize:     28
Desired extra isize:      28
Journal inode:            8
First orphan inode:       6947324
Default directory hash:   half_md4
Directory Hash Seed:      9da5dafb-bded-494d-ba7f-5c0ff3d9b805
Journal backup:           inode blocks
```

接下来，使用 `-c` 标识，你可以设置文件系统在挂载多少次后将进行 `e2fsck` 检查。下面这个命令指示系统每挂载 4 次之后，去对 `/dev/sda10` 运行 `e2fsck`。

```
$ sudo tune2fs -c 4 /dev/sda10
tune2fs 1.42.13 (17-May-2015)
Setting maximal mount count to 4
```

你也可以使用 `-i` 选项定义两次文件系统检查的时间间隔。下列的命令在两次文件系统检查之间设置了一个 2 天的时间间隔。

```
$ sudo tune2fs  -i  2d  /dev/sda10
tune2fs 1.42.13 (17-May-2015)
Setting interval between checks to 172800 seconds
```

现在，如果你运行下面的命令，你可以看到对 `/dev/sda10` 已经设置了文件系统检查的时间间隔。

```
$ sudo tune2fs -l /dev/sda10
```

**示例输出：**

```
Filesystem created:       Sun Jul 31 16:19:36 2016
Last mount time:          Mon Nov  6 10:25:28 2017
Last write time:          Mon Nov  6 13:49:50 2017
Mount count:              432
Maximum mount count:      4
Last checked:             Sun Jul 31 16:19:36 2016
Check interval:           172800 (2 days)
Next check after:         Tue Aug  2 16:19:36 2016
Lifetime writes:          2834 GB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:	          256
Required extra isize:     28
Desired extra isize:      28
Journal inode:            8
First orphan inode:       6947324
Default directory hash:   half_md4
Directory Hash Seed:      9da5dafb-bded-494d-ba7f-5c0ff3d9b805
Journal backup:           inode blocks
```

要改变缺省的日志参数，可以使用 `-J` 选项。这个选项也有子选项： `size=journal-size` （设置日志的大小）、`device=external-journal` （指定日志存储的设备）和 `location=journal-location` （定义日志的位置）。

注意，这里一次仅可以为文件系统设置一个日志大小或设备选项：

```
$ sudo tune2fs -J size=4MB /dev/sda10
```

最后，同样重要的是，可以去使用 `-L` 选项设置文件系统的卷标，如下所示。

```
$ sudo tune2fs -L "ROOT" /dev/sda10
```

### 调试 EXT2/EXT3/EXT4 文件系统

`debugfs` 是一个简单的、交互式的、基于 ext2/ext3/ext4 文件系统的命令行调试器。它允许你去交互式地修改文件系统参数。输入 `?` 查看子命令或请求。

```
$ sudo debugfs /dev/sda10
```

缺省情况下，文件系统将以只读模式打开，使用 `-w` 标识去以读写模式打开它。使用 `-c` 选项以灾难（catastrophic）模式打开它。

**示例输出：**

```
debugfs 1.42.13 (17-May-2015)
debugfs:  ?
Available debugfs requests:
show_debugfs_params, params
Show debugfs parameters
open_filesys, open       Open a filesystem
close_filesys, close     Close the filesystem
freefrag, e2freefrag     Report free space fragmentation
feature, features        Set/print superblock features
dirty_filesys, dirty     Mark the filesystem as dirty
init_filesys             Initialize a filesystem (DESTROYS DATA)
show_super_stats, stats  Show superblock statistics
ncheck                   Do inode->name translation
icheck                   Do block->inode translation
change_root_directory, chroot
....
```

要展示未使用空间的碎片，使用 `freefrag` 请求，像这样：

```
debugfs: freefrag
```

**示例输出：**

```
Device: /dev/sda10
Blocksize: 4096 bytes
Total blocks: 86154752
Free blocks: 22387732 (26.0%)
Min. free extent: 4 KB 
Max. free extent: 2064256 KB
Avg. free extent: 2664 KB
Num. free extent: 33625
HISTOGRAM OF FREE EXTENT SIZES:
Extent Size Range :  Free extents   Free Blocks  Percent
4K...    8K-  :          4883          4883    0.02%
8K...   16K-  :          4029          9357    0.04%
16K...   32K-  :          3172         15824    0.07%
32K...   64K-  :          2523         27916    0.12%
64K...  128K-  :          2041         45142    0.20%
128K...  256K-  :          2088         95442    0.43%
256K...  512K-  :          2462        218526    0.98%
512K... 1024K-  :          3175        571055    2.55%
1M...    2M-  :          4551       1609188    7.19%
2M...    4M-  :          2870       1942177    8.68%
4M...    8M-  :          1065       1448374    6.47%
8M...   16M-  :           364        891633    3.98%
16M...   32M-  :           194        984448    4.40%
32M...   64M-  :            86        873181    3.90%
64M...  128M-  :            77       1733629    7.74%
128M...  256M-  :            11        490445    2.19%
256M...  512M-  :            10        889448    3.97%
512M... 1024M-  :             2        343904    1.54%
1G...    2G-  :            22      10217801   45.64%
debugfs:  
```

通过去简单浏览它所提供的简要描述，你可以试试更多的请求，比如，创建或删除文件或目录，改变当前工作目录等等。要退出 `debugfs`，使用 `q`。

现在就这些！我们收集了不同分类下的相关文章，你可以在里面找到对你有用的内容。

**文件系统使用信息：**

1.  [12 Useful “df” Commands to Check Disk Space in Linux][1]
2.  [Pydf an Alternative “df” Command to Check Disk Usage in Different Colours][2]
3.  [10 Useful du (Disk Usage) Commands to Find Disk Usage of Files and Directories][3]

**检查磁盘或分区健康状况：**

1.  [3 Useful GUI and Terminal Based Linux Disk Scanning Tools][4]
2.  [How to Check Bad Sectors or Bad Blocks on Hard Disk in Linux][5]
3.  [How to Repair and Defragment Linux System Partitions and Directories][6]

维护一个健康的文件系统可以提升你的 Linux 系统的整体性能。如果你有任何问题或更多的想法，可以使用下面的评论去分享。

--------------------------------------------------------------------------------

via: https://www.tecmint.com/manage-ext2-ext3-and-ext4-health-in-linux/

作者：[Aaron Kili][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/how-to-check-disk-space-in-linux/
[2]:https://www.tecmint.com/pyd-command-to-check-disk-usage/
[3]:https://www.tecmint.com/check-linux-disk-usage-of-files-and-directories/
[4]:https://www.tecmint.com/linux-disk-scanning-tools/
[5]:https://www.tecmint.com/check-linux-hard-disk-bad-sectors-bad-blocks/
[6]:https://www.tecmint.com/defragment-linux-system-partitions-and-directories/
[7]:https://linux.cn/article-8289-1.html
[8]:https://linux.cn/article-8278-1.html
[9]:https://www.tecmint.com/how-to-check-disk-space-in-linux/
[10]:https://www.tecmint.com/defragment-linux-system-partitions-and-directories/
[11]:https://www.tecmint.com/author/aaronkili/
[12]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[13]:https://www.tecmint.com/free-linux-shell-scripting-books/
