[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12560-1.html)
[#]: subject: (11 ways to list and sort files on Linux)
[#]: via: (https://www.networkworld.com/article/3572590/11-ways-to-list-and-sort-files-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

把 Linux 上的文件列表和排序玩出花来
======

![](https://img.linux.net.cn/data/attachment/album/202008/28/213742y8cxnbnjpopzd5j0.jpg)

> Linux 命令可以提供文件的详细信息，也可以自定义显示的文件列表，甚至可以深入到文件系统的目录中，只要你愿意看。

在 Linux 系统上，有许多方法可以列出文件并显示它们的信息。这篇文章回顾了一些提供文件细节的命令，并提供了自定义文件列表的选项，以满足你的需求。

大多数命令都会列出单个目录中的文件，而其他命令则可以深入到文件系统的目录中，只要你愿意看。

当然，最主要的文件列表命令是 `ls`。然而，这个命令有大量的选项，可以只查找和列出你想看的文件。另外，还有 `find` 可以帮助你进行非常具体的文件搜索。

### 按名称列出文件

最简单的方法是使用 `ls` 命令按名称列出文件。毕竟，按名称（字母数字顺序）列出文件是默认的。你可以选择 `ls`（无细节）或 `ls -l`（大量细节）来决定你看到什么。

```
$ ls | head -6
8pgs.pdf
Aesthetics_Thank_You.pdf
alien.pdf
Annual_Meeting_Agenda-20190602.pdf
bigfile.bz2
bin
$ ls -l | head -6
-rw-rw-r--  1 shs     shs      10886 Mar 22  2019 8pgs.pdf
-rw-rw-r--  1 shs     shs     284003 May 11  2019 Aesthetics_Thank_You.pdf
-rw-rw-r--  1 shs     shs      38282 Jan 24  2019 alien.pdf
-rw-rw-r--  1 shs     shs      97358 May 19  2019 Annual_Meeting_20190602.pdf
-rw-rw-r--  1 shs     shs   18115234 Apr 16 17:36 bigfile.bz2
drwxrwxr-x  4 shs     shs    8052736 Jul 10 13:17 bin
```

如果你想一次查看一屏的列表，可以将 `ls` 的输出用管道送到 `more` 命令中。

### 按相反的名字顺序排列文件

要按名称反转文件列表，请添加 `-r`（<ruby>反转<rt>Reverse</rt></ruby>）选项。这就像把正常的列表倒过来一样。

```
$ ls -r
$ ls -lr
```

### 按文件扩展名列出文件

`ls` 命令不会按内容分析文件类型，它只会处理文件名。不过，有一个命令选项可以按扩展名列出文件。如果你添加了 `-X` （<ruby>扩展名<rt>eXtension</rt></ruby>）选项，`ls` 将在每个扩展名类别中按名称对文件进行排序。例如，它将首先列出没有扩展名的文件（按字母数字顺序），然后是扩展名为 `.1`、`.bz2`、`.c` 等的文件。

### 只列出目录

默认情况下，`ls` 命令将同时显示文件和目录。如果你想只列出目录，你可以使用 `-d`（<ruby>目录<rt>Directory</rt></ruby>）选项。你会得到一个像这样的列表：

```
$ ls -d */
1/     backups/     modules/       projects/     templates/
2/     html/        patches/       public/       videos/
bin/   new/         private/       save/
```

### 按大小排列文件

如果你想按大小顺序列出文件，请添加 `-S`（<ruby>大小<rt>Size</rt></ruby>）选项。但请注意，这实际上不会显示文件的大小（以及其他文件的细节），除非你还添加 `-l`（<ruby>长列表<rt>Long listing</rt></ruby>）选项。当按大小列出文件时，一般来说，看到命令在按你的要求做事情是很有帮助的。注意，默认情况下是先显示最大的文件。添加 `-r` 选项可以反过来（即 `ls -lSr`）。

```
$ ls -lS
total 959492
-rw-rw-r--  1 shs   shs  357679381 Sep 19  2019 sav-linux-free-9.tgz
-rw-rw-r--  1 shs   shs  103270400 Apr 16 17:38 bigfile
-rw-rw-r--  1 shs   shs   79117862 Oct  5  2019 Nessus-8.7.1-ubuntu1110_amd64.deb
```

### 按属主列出文件

如果你想按属主列出文件（例如，在一个共享目录中），你可以把 `ls` 命令的输出传给 `sort`，并通过添加 `-k3` 来按第三个字段排序，从而挑出属主一栏。

```
$ ls -l | sort -k3 | more
total 56
-rw-rw-r-- 1 dory  shs      0 Aug 23 12:27 tasklist
drwx------ 2 gdm   gdm   4096 Aug 21 17:12 tracker-extract-files.121
srwxr-xr-x 1 root  root     0 Aug 21 17:12 ntf_listenerc0c6b8b4567
drwxr-xr-x 2 root  root  4096 Aug 21 17:12 hsperfdata_root
              ^
              |
```

事实上，你可以用这种方式对任何字段进行排序（例如，年份）。只是要注意，如果你要对一个数字字段进行排序，则要加上一个 `n`，如 `-k5n`，否则你将按字母数字顺序进行排序。这种排序技术对于文件内容的排序也很有用，而不仅仅是用于列出文件。

### 按年份排列文件

使用 `-t`（<ruby>修改时间<rt>Time modified</rt></ruby>）选项按年份顺序列出文件 —— 它们的新旧程度。添加 `-r` 选项，让最近更新的文件在列表中最后显示。我使用这个别名来显示我最近更新的文件列表。

```
$ alias recent='ls -ltr | tail -8'
```

请注意，文件的更改时间和修改时间是不同的。`-c`（<ruby>更改时间<rt>time Changed</rt></ruby>）和 `-t`（修改时间）选项的结果并不总是相同。如果你改变了一个文件的权限，而没有改变其他内容，`-c` 会把这个文件放在 `ls` 输出的顶部，而 `-t` 则不会。如果你想知道其中的区别，可以看看 `stat` 命令的输出。

```
$ stat ckacct
  File: ckacct
  Size: 200             Blocks: 8          IO Block: 4096   regular file
Device: 801h/2049d      Inode: 829041      Links: 1
Access: (0750/-rwxr-x---)  Uid: ( 1000/     shs)   Gid: ( 1000/     shs)
Access: 2020-08-20 16:10:11.063015008 -0400
Modify: 2020-08-17 07:26:34.579922297 -0400 <== content changes
Change: 2020-08-24 09:36:51.699775940 -0400 <== content or permissions changes
 Birth: -
```

### 按组别列出文件

要按关联的组别对文件进行排序，你可以将一个长列表的输出传给 `sort` 命令，并告诉它在第 4 列进行排序。

```
$ ls -l | sort -k4
```

### 按访问日期列出文件

要按访问日期（最近访问的日期在前）列出文件，使用 `-ltu` 选项。`u` 强制“按访问日期”排列顺序。

```
$ ls -ltu
total 959500
-rwxr-x---  1 shs     shs        200 Aug 24 09:42 ckacct  <== most recently used
-rw-rw-r--  1 shs     shs       1335 Aug 23 17:45 lte
```

### 单行列出多个文件

有时，精简的文件列表更适合手头的任务。`ls` 命令甚至有这方面的选项。为了在尽可能少的行上列出文件，你可以使用 `--format=comma` 来用逗号分隔文件名，就像这个命令一样：

```
$ ls --format=comma
1, 10, 11, 12, 124, 13, 14, 15, 16pgs-landscape.pdf, 16pgs.pdf, 17, 18, 19,
192.168.0.4, 2, 20, 2018-12-23_OoS_2.pdf, 2018-12-23_OoS.pdf, 20190512_OoS.pdf,
'2019_HOHO_application working.pdf' …
```

喜欢用空格？使用 `--format=across` 代替。

```
$ ls --format=across z*
z              zip            zipfiles      zipfiles1.bat   zipfiles2.bat
zipfiles3.bat  zipfiles4.bat  zipfiles.bat  zoom_amd64.deb  zoomap.pdf
zoom-mtg
```

### 增加搜索的深度

虽然 `ls` 一般只列出单个目录中的文件，但你可以选择使用 `-R` 选项（<ruby>递归<rt>Recursively</rt></ruby>）地列出文件，深入到整个目录的深处。

```
$ ls -R zzzzz | grep -v "^$"
zzzzz:
zzzz
zzzzz/zzzz:
zzz
zzzzz/zzzz/zzz:
zz
zzzzz/zzzz/zzz/zz:
z
zzzzz/zzzz/zzz/zz/z:
sleeping
```

另外，你也可以使用 `find` 命令，对深度进行限制或不限制。在这个命令中，我们指示 `find` 命令只在三个层次的目录中查找：

```
$ find zzzzz -maxdepth 3
zzzzz
zzzzz/zzzz
zzzzz/zzzz/zzz
zzzzz/zzzz/zzz/zz
```

### 选择 ls 还是 find

当你需要列出符合具体要求的文件时，`find` 命令可能是比 `ls` 更好的工具。

与 `ls` 不同的是，`find` 命令会尽可能地深入查找，除非你限制它。它还有许多其他选项和一个 `-exec` 子命令，允许在找到你要找的文件后采取一些特定的行动。

### 总结

`ls` 命令有很多用于列出文件的选项。了解一下它们。你可能会发现一些你会喜欢的选项。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3572590/11-ways-to-list-and-sort-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
