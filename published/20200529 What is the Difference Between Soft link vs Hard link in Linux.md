[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12270-1.html)
[#]: subject: (What is the Difference Between Soft link vs Hard link in Linux?)
[#]: via: (https://www.2daygeek.com/difference-between-soft-link-vs-hard-link-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)


Linux 中软链接和硬链接的区别
======

![](https://img.linux.net.cn/data/attachment/album/202006/01/082717bilg8nmx808oxzgn.jpg)

<ruby>链接<rt>Link</rt></ruby>是一种快捷访问机制，它通过一个文件指向原始文件或目录的方式实现快捷访问，同时还记录了原始文件或目录的一些信息。

链接允许多个不同文件对同一个文件进行引用。

### 什么是软链接

<ruby>符号链接<rt>Symbolic Link</rt></ruby>（symlink），又称<ruby>软链接<rt>Soft Link</rt></ruby>，是一种特殊的文件，它指向 Linux 系统上的另一个文件或目录。

这和 Windows 系统中的快捷方式有点类似，链接文件中记录的只是原始文件的路径，并不记录原始文件的内容。

符号链接通常用于对库文件进行链接，也常用于链接日志文件和<ruby>网络文件系统<rt>Network File System</rt></ruby>（NFS）上共享的目录。

### 什么是硬链接

硬链接是原始文件的一个镜像副本。创建硬链接后，如果把原始文件删除，链接文件也不会受到影响，因为此时原始文件和链接文件互为镜像副本。

为什么要创建链接文件而不直接复制文件呢？

当你需要将同一个文件保存在多个不同位置，而且还要保持持续更新的时候，硬链接的重要性就体现出来了。

如果你只是单纯把文件复制到另一个位置，那么另一个位置的文件只会保存着复制那一刻的文件内容，后续也不会跟随着原始文件持续更新。

而使用硬链接时，各个镜像副本的文件内容都会同时更新。

### 软链接和硬链接的区别

下表列出了软链接和硬链接之间的区别。

\# | 软链接 | 硬链接 
---|---|---
1 | 软链接类似于 Windows 系统中的快捷方式 | 硬链接是原始文件的一个镜像副本 
2 | 软链接又称符号链接 | 硬链接没有别名 
3 | 链接中任何一个文件发生改变，都会同步到连接中的其它文件 | 和软链接一样 
4 | 软链接可以跨文件系统进行创建 | 硬链接不可以跨文件系统进行创建 
5 | 软链接可以指向文件或目录 | 硬链接只能指向文件 
6 | 链接文件和原始文件之间的 inode 和文件权限不完全一致 | 链接文件和原始文件的 inode 和文件权限完全一致 
7 | 链接文件只记录原始文件的路径，不记录原始文件的内容 | 链接文件记录了原始文件的内容 
8 | 如果原始文件被移除，软链接就会因为指向不存在的文件而失效。这被称为“<ruby>挂起链接<rt>hanging link</rt></ruby>” | 即使原始文件被移除，链接文件也不受影响。 
9 | 通过 `ln -s <原始文件> <链接文件>` 命令创建软链接 | 通过 `ln <原始文件> <链接文件>` 命令创建硬链接 
10 | 软链接文件的文件权限中有一个特殊标记 `l` | 硬链接文件没有特殊标记 
11 | 通过 `find / -type l` 命令可以查找软链接文件 | 通过 `find / -samefile <原始文件>` 命令可以查找硬链接文件 
12 | 通过 `symlinks <目录>`  命令可以查找失效的软链接 | 硬链接不存在失效链接 


--------------------------------------------------------------------------------

via: https://www.2daygeek.com/difference-between-soft-link-vs-hard-link-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
