[#]: collector: (lujun9972)
[#]: translator: (liujing97)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10716-1.html)
[#]: subject: (How To Understand And Identify File types in Linux)
[#]: via: (https://www.2daygeek.com/how-to-understand-and-identify-file-types-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

怎样理解和识别 Linux 中的文件类型
======

众所周知，在 Linux 中一切皆为文件，包括硬盘和显卡等。在 Linux 中导航时，大部分的文件都是普通文件和目录文件。但是也有其他的类型，对应于 5 类不同的作用。因此，理解 Linux 中的文件类型在许多方面都是非常重要的。

如果你不相信，那只需要浏览全文，就会发现它有多重要。如果你不能理解文件类型，就不能够毫无畏惧的做任意的修改。

如果你做了一些错误的修改，会毁坏你的文件系统，那么当你操作的时候请小心一点。在 Linux 系统中文件是非常重要的，因为所有的设备和守护进程都被存储为文件。

### 在 Linux 中有多少种可用类型？

据我所知，在 Linux 中总共有 7 种类型的文件，分为 3 大类。具体如下。

  * 普通文件
  * 目录文件
  * 特殊文件（该类有 5 个文件类型）
      * 链接文件
      * 字符设备文件
      * Socket 文件
      * 命名管道文件
      * 块文件

参考下面的表可以更好地理解 Linux 中的文件类型。  

|　符号　　|　意义　　　　　　　　　　　　　　　　　　|  
| ------- | --------------------------------- |
|　`–`　　　|　普通文件。长列表中以下划线 `_` 开头。　　　　　　　|  
|　`d`　　　|　目录文件。长列表中以英文字母 `d` 开头。　　　　　|  
|　`l`　　　|　链接文件。长列表中以英文字母 `l` 开头。　　　　　　|  
|　`c`　　　|　字符设备文件。长列表中以英文字母 `c` 开头。　　　　|  
|　`s`　　　|　Socket 文件。长列表中以英文字母 `s` 开头。　　　　　|  
|　`p`　　　|　命名管道文件。长列表中以英文字母 `p` 开头。　　　　|  
|　`b`　　　|　块文件。长列表中以英文字母 `b` 开头。　　　　　　　|  


### 方法１：手动识别 Linux 中的文件类型

如果你很了解 Linux，那么你可以借助上表很容易地识别文件类型。

#### 在 Linux 中如何查看普通文件？

在 Linux 中使用下面的命令去查看普通文件。在 Linux 文件系统中普通文件可以出现在任何地方。
普通文件的颜色是“白色”。

```
# ls -la | grep ^-
-rw-------.  1 mageshm mageshm      1394 Jan 18 15:59 .bash_history
-rw-r--r--.  1 mageshm mageshm        18 May 11  2012 .bash_logout
-rw-r--r--.  1 mageshm mageshm       176 May 11  2012 .bash_profile
-rw-r--r--.  1 mageshm mageshm       124 May 11  2012 .bashrc
-rw-r--r--.  1 root    root           26 Dec 27 17:55 liks
-rw-r--r--.  1 root    root    104857600 Jan 31  2006 test100.dat
-rw-r--r--.  1 root    root    104874307 Dec 30  2012 test100.zip
-rw-r--r--.  1 root    root     11536384 Dec 30  2012 test10.zip
-rw-r--r--.  1 root    root           61 Dec 27 19:05 test2-bzip2.txt
-rw-r--r--.  1 root    root           61 Dec 31 14:24 test3-bzip2.txt
-rw-r--r--.  1 root    root           60 Dec 27 19:01 test-bzip2.txt
```

#### 在 Linux 中如何查看目录文件？

在 Linux 中使用下面的命令去查看目录文件。在 Linux 文件系统中目录文件可以出现在任何地方。目录文件的颜色是“蓝色”。

```
# ls -la | grep ^d
drwxr-xr-x.  3 mageshm mageshm      4096 Dec 31 14:24 links/
drwxrwxr-x.  2 mageshm mageshm      4096 Nov 16 15:44 perl5/
drwxr-xr-x.  2 mageshm mageshm      4096 Nov 16 15:37 public_ftp/
drwxr-xr-x.  3 mageshm mageshm      4096 Nov 16 15:37 public_html/
```

#### 在 Linux 中如何查看链接文件？

在 Linux 中使用下面的命令去查看链接文件。在 Linux 文件系统中链接文件可以出现在任何地方。
链接文件有两种可用类型，软连接和硬链接。链接文件的颜色是“浅绿宝石色”。

```
# ls -la | grep ^l
lrwxrwxrwx.  1 root    root           31 Dec  7 15:11 s-link-file -> /links/soft-link/test-soft-link
lrwxrwxrwx.  1 root    root           38 Dec  7 15:12 s-link-folder -> /links/soft-link/test-soft-link-folder
```

#### 在 Linux 中如何查看字符设备文件？

在 Linux 中使用下面的命令查看字符设备文件。字符设备文件仅出现在特定位置。它出现在目录 `/dev` 下。字符设备文件的颜色是“黄色”。

```
# ls -la | grep ^c
# ls -la | grep ^c
crw-------.  1 root root      5,   1 Jan 28 14:05 console
crw-rw----.  1 root root     10,  61 Jan 28 14:05 cpu_dma_latency
crw-rw----.  1 root root     10,  62 Jan 28 14:05 crash
crw-rw----.  1 root root     29,   0 Jan 28 14:05 fb0
crw-rw-rw-.  1 root root      1,   7 Jan 28 14:05 full
crw-rw-rw-.  1 root root     10, 229 Jan 28 14:05 fuse
```

#### 在 Linux 中如何查看块文件？

在 Linux 中使用下面的命令查看块文件。块文件仅出现在特定位置。它出现在目录 `/dev` 下。块文件的颜色是“黄色”。

```
# ls -la | grep ^b
brw-rw----.  1 root disk      7,   0 Jan 28 14:05 loop0
brw-rw----.  1 root disk      7,   1 Jan 28 14:05 loop1
brw-rw----.  1 root disk      7,   2 Jan 28 14:05 loop2
brw-rw----.  1 root disk      7,   3 Jan 28 14:05 loop3
brw-rw----.  1 root disk      7,   4 Jan 28 14:05 loop4
```

#### 在 Linux 中如何查看 Socket 文件？

在 Linux 中使用下面的命令查看 Socket 文件。Socket 文件可以出现在任何地方。Scoket 文件的颜色是“粉色”。（LCTT 译注：此处及下面关于 Socket 文件、命名管道文件可出现的位置原文描述有误，已修改。）

```
# ls -la | grep ^s
srw-rw-rw- 1 root root 0 Jan  5 16:36 system_bus_socket
```

#### 在 Linux 中如何查看命名管道文件？

在 Linux 中使用下面的命令查看命名管道文件。命名管道文件可以出现在任何地方。命名管道文件的颜色是“黄色”。

```
# ls -la | grep ^p
prw-------.  1 root    root        0 Jan 28 14:06 replication-notify-fifo|
prw-------.  1 root    root        0 Jan 28 14:06 stats-mail|
```

### 方法２：在 Linux 中如何使用 file 命令识别文件类型

在 Linux 中 `file` 命令允许我们去确定不同的文件类型。这里有三个测试集，按此顺序进行三组测试：文件系统测试、魔术字节测试和用于识别文件类型的语言测试。

#### 在 Linux 中如何使用 file 命令查看普通文件

在你的终端简单地输入 `file` 命令跟着普通文件。`file` 命令将会读取提供的文件内容并且准确地显示文件的类型。

这就是我们看到对于每个普通文件有不同结果的原因。参考下面普通文件的不同结果。

```
# file 2daygeek_access.log 
2daygeek_access.log: ASCII text, with very long lines

# file powertop.html 
powertop.html: HTML document, ASCII text, with very long lines

# file 2g-test
2g-test: JSON data

# file powertop.txt
powertop.txt: HTML document, UTF-8 Unicode text, with very long lines

# file 2g-test-05-01-2019.tar.gz
2g-test-05-01-2019.tar.gz: gzip compressed data, last modified: Sat Jan  5 18:22:20 2019, from Unix, original size 450560
```

#### 在 Linux 中如何使用 file 命令查看目录文件？

在你的终端简单地输入 `file` 命令跟着目录。参阅下面的结果。

```
# file Pictures/
Pictures/: directory
```

#### 在 Linux 中如何使用 file 命令查看链接文件？

在你的终端简单地输入 `file` 命令跟着链接文件。参阅下面的结果。

```
# file log
log: symbolic link to /run/systemd/journal/dev-log
```

#### 在 Linux 中如何使用 file 命令查看字符设备文件？

在你的终端简单地输入 `file` 命令跟着字符设备文件。参阅下面的结果。

```
# file vcsu
vcsu: character special (7/64)
```

#### 在 Linux 中如何使用 file 命令查看块文件？

在你的终端简单地输入 `file` 命令跟着块文件。参阅下面的结果。

```
# file sda1
sda1: block special (8/1)
```

#### 在 Linux 中如何使用 file 命令查看 Socket 文件？

在你的终端简单地输入 `file` 命令跟着 Socket 文件。参阅下面的结果。

```
# file system_bus_socket
system_bus_socket: socket
```

#### 在 Linux 中如何使用 file 命令查看命名管道文件？

在你的终端简单地输入 `file` 命令跟着命名管道文件。参阅下面的结果。

```
# file pipe-test
pipe-test: fifo (named pipe)
```

### 方法 3：在 Linux 中如何使用 stat 命令识别文件类型？

`stat` 命令允许我们去查看文件类型或文件系统状态。该实用程序比 `file` 命令提供更多的信息。它显示文件的大量信息，例如大小、块大小、IO 块大小、Inode 值、链接、文件权限、UID、GID、文件的访问/更新和修改的时间等详细信息。

#### 在 Linux 中如何使用 stat 命令查看普通文件？

在你的终端简单地输入 `stat` 命令跟着普通文件。参阅下面的结果。

```
# stat 2daygeek_access.log
  File: 2daygeek_access.log
  Size: 14406929  	Blocks: 28144      IO Block: 4096   regular file
Device: 10301h/66305d	Inode: 1727555     Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/ daygeek)   Gid: ( 1000/ daygeek)
Access: 2019-01-03 14:05:26.430328867 +0530
Modify: 2019-01-03 14:05:26.460328868 +0530
Change: 2019-01-03 14:05:26.460328868 +0530
 Birth: -
```

#### 在 Linux 中如何使用 stat 命令查看目录文件？

在你的终端简单地输入 `stat` 命令跟着目录文件。参阅下面的结果。

```
# stat Pictures/
  File: Pictures/
  Size: 4096      	Blocks: 8          IO Block: 4096   directory
Device: 10301h/66305d	Inode: 1703982     Links: 3
Access: (0755/drwxr-xr-x)  Uid: ( 1000/ daygeek)   Gid: ( 1000/ daygeek)
Access: 2018-11-24 03:22:11.090000828 +0530
Modify: 2019-01-05 18:27:01.546958817 +0530
Change: 2019-01-05 18:27:01.546958817 +0530
 Birth: -
```

#### 在 Linux 中如何使用 stat 命令查看链接文件？

在你的终端简单地输入 `stat` 命令跟着链接文件。参阅下面的结果。

```
# stat /dev/log
  File: /dev/log -> /run/systemd/journal/dev-log
  Size: 28        	Blocks: 0          IO Block: 4096   symbolic link
Device: 6h/6d	Inode: 278         Links: 1
Access: (0777/lrwxrwxrwx)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2019-01-05 16:36:31.033333447 +0530
Modify: 2019-01-05 16:36:30.766666768 +0530
Change: 2019-01-05 16:36:30.766666768 +0530
 Birth: -
```

#### 在 Linux 中如何使用 stat 命令查看字符设备文件？

在你的终端简单地输入 `stat` 命令跟着字符设备文件。参阅下面的结果。

```
# stat /dev/vcsu
  File: /dev/vcsu
  Size: 0         	Blocks: 0          IO Block: 4096   character special file
Device: 6h/6d	Inode: 16          Links: 1     Device type: 7,40
Access: (0660/crw-rw----)  Uid: (    0/    root)   Gid: (    5/     tty)
Access: 2019-01-05 16:36:31.056666781 +0530
Modify: 2019-01-05 16:36:31.056666781 +0530
Change: 2019-01-05 16:36:31.056666781 +0530
 Birth: -
```

#### 在 Linux 中如何使用 stat 命令查看块文件？

在你的终端简单地输入 `stat` 命令跟着块文件。参阅下面的结果。

```
# stat /dev/sda1
  File: /dev/sda1
  Size: 0         	Blocks: 0          IO Block: 4096   block special file
Device: 6h/6d	Inode: 250         Links: 1     Device type: 8,1
Access: (0660/brw-rw----)  Uid: (    0/    root)   Gid: (  994/    disk)
Access: 2019-01-05 16:36:31.596666806 +0530
Modify: 2019-01-05 16:36:31.596666806 +0530
Change: 2019-01-05 16:36:31.596666806 +0530
 Birth: -
```

#### 在 Linux 中如何使用 stat 命令查看 Socket 文件？

在你的终端简单地输入 `stat` 命令跟着 Socket 文件。参阅下面的结果。

```
# stat /var/run/dbus/system_bus_socket 
  File: /var/run/dbus/system_bus_socket
  Size: 0         	Blocks: 0          IO Block: 4096   socket
Device: 15h/21d	Inode: 576         Links: 1
Access: (0666/srw-rw-rw-)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2019-01-05 16:36:31.823333482 +0530
Modify: 2019-01-05 16:36:31.810000149 +0530
Change: 2019-01-05 16:36:31.810000149 +0530
 Birth: -
```

#### 在 Linux 中如何使用 stat 命令查看命名管道文件？

在你的终端简单地输入 `stat` 命令跟着命名管道文件。参阅下面的结果。

```
# stat pipe-test 
  File: pipe-test
  Size: 0         	Blocks: 0          IO Block: 4096   fifo
Device: 10301h/66305d	Inode: 1705583     Links: 1
Access: (0644/prw-r--r--)  Uid: ( 1000/ daygeek)   Gid: ( 1000/ daygeek)
Access: 2019-01-06 02:00:03.040394731 +0530
Modify: 2019-01-06 02:00:03.040394731 +0530
Change: 2019-01-06 02:00:03.040394731 +0530
 Birth: -
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-understand-and-identify-file-types-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[liujing97](https://github.com/liujing97)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
