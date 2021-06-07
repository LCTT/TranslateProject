[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10777-1.html)
[#]: subject: (How to identify duplicate files on Linux)
[#]: via: (https://www.networkworld.com/article/3387961/how-to-identify-duplicate-files-on-linux.html#tk.rss_all)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何识别 Linux 上的文件分身
======

> Linux 系统上的一些文件可能出现在多个位置。按照本文指示查找并识别这些“同卵双胞胎”，还可以了解为什么硬链接会如此有利。
 
![Archana Jarajapu \(CC BY 2.0\)][1]

识别使用同一个磁盘空间的文件依赖于利用文件使用相同的 inode 这一事实。这种数据结构存储除了文件名和内容之外的所有信息。如果两个或多个文件具有不同的名称和文件系统位置，但共享一个 inode，则它们还共享内容、所有权、权限等。

这些文件通常被称为“硬链接”，不像符号链接（即软链接）那样仅仅通过包含它们的名称指向其他文件，符号链接很容易在文件列表中通过第一个位置的 `l` 和引用文件的 `->` 符号识别出来。

```
$ ls -l my*
-rw-r--r-- 4 shs shs   228 Apr 12 19:37 myfile
lrwxrwxrwx 1 shs shs     6 Apr 15 11:18 myref -> myfile
-rw-r--r-- 4 shs shs   228 Apr 12 19:37 mytwin
```

在单个目录中的硬链接并不是很明显，但它仍然非常容易找到。如果使用 `ls -i` 命令列出文件并按 inode 编号排序，则可以非常容易地挑选出硬链接。在这种类型的 `ls` 输出中，第一列显示 inode 编号。

```
$ ls -i | sort -n | more
 ...
 788000 myfile  <==
 788000 mytwin  <==
 801865 Name_Labels.pdf
 786692 never leave home angry
 920242 NFCU_Docs
 800247 nmap-notes
```

扫描输出，查找相同的 inode 编号，任何匹配都会告诉你想知道的内容。 

另一方面，如果你只是想知道某个特定文件是否是另一个文件的硬链接，那么有一种方法比浏览数百个文件的列表更简单，即 `find` 命令的 `-samefile` 选项将帮助你完成工作。

```
$ find . -samefile myfile
./myfile
./save/mycopy
./mytwin
```

注意，提供给 `find` 命令的起始位置决定文件系统会扫描多少来进行匹配。在上面的示例中，我们正在查看当前目录和子目录。

使用 `find` 的 `-ls` 选项添加输出的详细信息可能更有说服力：

```
$ find . -samefile myfile -ls
 788000    4 -rw-r--r--   4 shs    shs      228 Apr 12 19:37 ./myfile
 788000    4 -rw-r--r--   4 shs    shs      228 Apr 12 19:37 ./save/mycopy
 788000    4 -rw-r--r--   4 shs    shs      228 Apr 12 19:37 ./mytwin
```

第一列显示 inode 编号，然后我们会看到文件权限、链接、所有者、文件大小、日期信息以及引用相同磁盘内容的文件的名称。注意，在这种情况下，链接字段是 “4” 而不是我们可能期望的 “3”。这告诉我们还有另一个指向同一个 inode 的链接（但不在我们的搜索范围内）。

如果你想在一个目录中查找所有硬链接的实例，可以尝试以下的脚本来创建列表并为你查找副本：

```
#!/bin/bash

# seaches for files sharing inodes

prev=""

# list files by inode
ls -i | sort -n > /tmp/$0

# search through file for duplicate inode #s
while read line
do
    inode=`echo $line | awk '{print $1}'`
    if [ "$inode" == "$prev" ]; then
        grep $inode /tmp/$0
    fi
    prev=$inode
done < /tmp/$0

# clean up
rm /tmp/$0
```

```
$ ./findHardLinks
 788000 myfile
 788000 mytwin
```

你还可以使用 `find` 命令按 inode 编号查找文件，如命令中所示。但是，此搜索可能涉及多个文件系统，因此可能会得到错误的结果。因为相同的 inode 编号可能会在另一个文件系统中使用，代表另一个文件。如果是这种情况，文件的其他详细信息将不相同。

```
$ find / -inum 788000 -ls 2> /dev/null
 788000   4 -rw-r--r--   4 shs   shs    228 Apr 12 19:37 /tmp/mycopy
 788000   4 -rw-r--r--   4 shs   shs    228 Apr 12 19:37 /home/shs/myfile
 788000   4 -rw-r--r--   4 shs   shs    228 Apr 12 19:37 /home/shs/save/mycopy
 788000   4 -rw-r--r--   4 shs   shs    228 Apr 12 19:37 /home/shs/mytwin
```

注意，错误输出被重定向到 `/dev/null`，这样我们就不必查看所有 “Permission denied” 错误，否则这些错误将显示在我们不允许查看的其他目录中。

此外，扫描包含相同内容但不共享 inode 的文件（即，简单的文本拷贝）将花费更多的时间和精力。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3387961/how-to-identify-duplicate-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/reflections-candles-100793651-large.jpg
[2]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
