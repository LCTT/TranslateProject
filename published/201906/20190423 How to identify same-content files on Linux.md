[#]: collector: (lujun9972)
[#]: translator: (tomjlw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10955-1.html)
[#]: subject: (How to identify same-content files on Linux)
[#]: via: (https://www.networkworld.com/article/3390204/how-to-identify-same-content-files-on-linux.html#tk.rss_all)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何在 Linux 上识别同样内容的文件
======
> 有时文件副本相当于对硬盘空间的巨大浪费，并会在你想要更新文件时造成困扰。以下是用来识别这些文件的六个命令。

![Vinoth Chandar \(CC BY 2.0\)][1]

在最近的帖子中，我们看了[如何识别并定位硬链接的文件][2]（即，指向同一硬盘内容并共享 inode）。在本文中，我们将查看能找到具有相同*内容*，却不相链接的文件的命令。

硬链接很有用是因为它们能够使文件存放在文件系统内的多个地方却不会占用额外的硬盘空间。另一方面，有时文件副本相当于对硬盘空间的巨大浪费，在你想要更新文件时也会有造成困扰之虞。在本文中，我们将看一下多种识别这些文件的方式。

### 用 diff 命令比较文件

可能比较两个文件最简单的方法是使用 `diff` 命令。输出会显示你文件的不同之处。`<` 和 `>` 符号代表在当参数传过来的第一个（`<`）或第二个（`>`）文件中是否有额外的文字行。在这个例子中，在 `backup.html` 中有额外的文字行。

```
$ diff index.html backup.html
2438a2439,2441
> <pre>
> That's all there is to report.
> </pre>
```

如果 `diff` 没有输出那代表两个文件相同。

```
$ diff home.html index.html
$
```

`diff` 的唯一缺点是它一次只能比较两个文件并且你必须指定用来比较的文件，这篇帖子中的一些命令可以为你找到多个重复文件。

### 使用校验和

`cksum`（checksum） 命令计算文件的校验和。校验和是一种将文字内容转化成一个长数字（例如2819078353 228029）的数学简化。虽然校验和并不是完全独有的，但是文件内容不同校验和却相同的概率微乎其微。

```
$ cksum *.html
2819078353 228029 backup.html
4073570409 227985 home.html
4073570409 227985 index.html
```

在上述示例中，你可以看到产生同样校验和的第二个和第三个文件是如何可以被默认为相同的。

### 使用 find 命令

虽然 `find` 命令并没有寻找重复文件的选项，它依然可以被用来通过名字或类型寻找文件并运行 `cksum` 命令。例如：

```
$ find . -name "*.html" -exec cksum {} \;
4073570409 227985 ./home.html
2819078353 228029 ./backup.html
4073570409 227985 ./index.html
```

### 使用 fslint 命令

`fslint` 命令可以被特地用来寻找重复文件。注意我们给了它一个起始位置。如果它需要遍历相当多的文件，这就需要花点时间来完成。注意它是如何列出重复文件并寻找其它问题的，比如空目录和坏 ID。

```
$ fslint .
-----------------------------------file name lint
-------------------------------Invalid utf8 names
-----------------------------------file case lint
----------------------------------DUPlicate files   <==
home.html
index.html
-----------------------------------Dangling links
--------------------redundant characters in links
------------------------------------suspect links
--------------------------------Empty Directories
./.gnupg
----------------------------------Temporary Files
----------------------duplicate/conflicting Names
------------------------------------------Bad ids
-------------------------Non Stripped executables
```

你可能需要在你的系统上安装 `fslint`。你可能也需要将它加入你的命令搜索路径：

```
$ export PATH=$PATH:/usr/share/fslint/fslint
```

### 使用 rdfind 命令

`rdfind` 命令也会寻找重复（相同内容的）文件。它的名字意即“重复数据搜寻”，并且它能够基于文件日期判断哪个文件是原件——这在你选择删除副本时很有用因为它会移除较新的文件。

```
$ rdfind ~
Now scanning "/home/shark", found 12 files.
Now have 12 files in total.
Removed 1 files due to nonunique device and inode.
Total size is 699498 bytes or 683 KiB
Removed 9 files due to unique sizes from list.2 files left.
Now eliminating candidates based on first bytes:removed 0 files from list.2 files left.
Now eliminating candidates based on last bytes:removed 0 files from list.2 files left.
Now eliminating candidates based on sha1 checksum:removed 0 files from list.2 files left.
It seems like you have 2 files that are not unique
Totally, 223 KiB can be reduced.
Now making results file results.txt
```

你可以在 `dryrun` 模式中运行这个命令 （换句话说，仅仅汇报可能会另外被做出的改动）。

```
$ rdfind -dryrun true ~
(DRYRUN MODE) Now scanning "/home/shark", found 12 files.
(DRYRUN MODE) Now have 12 files in total.
(DRYRUN MODE) Removed 1 files due to nonunique device and inode.
(DRYRUN MODE) Total size is 699352 bytes or 683 KiB
Removed 9 files due to unique sizes from list.2 files left.
(DRYRUN MODE) Now eliminating candidates based on first bytes:removed 0 files from list.2 files left.
(DRYRUN MODE) Now eliminating candidates based on last bytes:removed 0 files from list.2 files left.
(DRYRUN MODE) Now eliminating candidates based on sha1 checksum:removed 0 files from list.2 files left.
(DRYRUN MODE) It seems like you have 2 files that are not unique
(DRYRUN MODE) Totally, 223 KiB can be reduced.
(DRYRUN MODE) Now making results file results.txt
```

`rdfind` 命令同样提供了类似忽略空文档（`-ignoreempty`）和跟踪符号链接（`-followsymlinks`）的功能。查看 man 页面获取解释。

```
-ignoreempty       ignore empty files
-minsize        ignore files smaller than speficied size
-followsymlinks     follow symbolic links
-removeidentinode   remove files referring to identical inode
-checksum       identify checksum type to be used
-deterministic      determiness how to sort files
-makesymlinks       turn duplicate files into symbolic links
-makehardlinks      replace duplicate files with hard links
-makeresultsfile    create a results file in the current directory
-outputname     provide name for results file
-deleteduplicates   delete/unlink duplicate files
-sleep          set sleep time between reading files (milliseconds)
-n, -dryrun     display what would have been done, but don't do it
```

注意 `rdfind` 命令提供了 `-deleteduplicates true` 的设置选项以删除副本。希望这个命令语法上的小问题不会惹恼你。;-)

```
$ rdfind -deleteduplicates true .
...
Deleted 1 files.    <==
```

你将可能需要在你的系统上安装 `rdfind` 命令。试验它以熟悉如何使用它可能是一个好主意。

### 使用 fdupes 命令

`fdupes` 命令同样使得识别重复文件变得简单。它同时提供了大量有用的选项——例如用来迭代的 `-r`。在这个例子中，它像这样将重复文件分组到一起：

```
$ fdupes ~
/home/shs/UPGRADE
/home/shs/mytwin

/home/shs/lp.txt
/home/shs/lp.man

/home/shs/penguin.png
/home/shs/penguin0.png
/home/shs/hideme.png
```

这是使用迭代的一个例子，注意许多重复文件是重要的（用户的 `.bashrc` 和 `.profile` 文件）并且不应被删除。

```
# fdupes -r /home
/home/shark/home.html
/home/shark/index.html

/home/dory/.bashrc
/home/eel/.bashrc

/home/nemo/.profile
/home/dory/.profile
/home/shark/.profile

/home/nemo/tryme
/home/shs/tryme

/home/shs/arrow.png
/home/shs/PNGs/arrow.png

/home/shs/11/files_11.zip
/home/shs/ERIC/file_11.zip

/home/shs/penguin0.jpg
/home/shs/PNGs/penguin.jpg
/home/shs/PNGs/penguin0.jpg

/home/shs/Sandra_rotated.png
/home/shs/PNGs/Sandra_rotated.png
```

`fdupe` 命令的许多选项列如下。使用 `fdupes -h` 命令或者阅读 man 页面获取详情。

```
-r --recurse     recurse
-R --recurse:    recurse through specified directories
-s --symlinks    follow symlinked directories
-H --hardlinks   treat hard links as duplicates
-n --noempty     ignore empty files
-f --omitfirst   omit the first file in each set of matches
-A --nohidden    ignore hidden files
-1 --sameline    list matches on a single line
-S --size        show size of duplicate files
-m --summarize   summarize duplicate files information
-q --quiet       hide progress indicator
-d --delete      prompt user for files to preserve
-N --noprompt    when used with --delete, preserve the first file in set
-I --immediate   delete duplicates as they are encountered
-p --permissions don't soncider files with different owner/group or
                 permission bits as duplicates
-o --order=WORD  order files according to specification
-i --reverse     reverse order while sorting
-v --version     display fdupes version
-h --help        displays help
```

`fdupes` 命令是另一个你可能需要安装并使用一段时间才能熟悉其众多选项的命令。

### 总结

Linux 系统提供能够定位并（潜在地）能移除重复文件的一系列的好工具，以及能让你指定搜索区域及当对你所发现的重复文件时的处理方式的选项。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3390204/how-to-identify-same-content-files-on-linux.html#tk.rss_all

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/chairs-100794266-large.jpg
[2]: https://www.networkworld.com/article/3387961/how-to-identify-duplicate-files-on-linux.html
[3]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[4]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world

