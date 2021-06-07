[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12127-1.html)
[#]: subject: (Navigating man pages in Linux)
[#]: via: (https://www.networkworld.com/article/3519853/navigating-man-pages-in-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 中遨游手册页的海洋
======

> Linux 系统上的手册页可以做的不仅仅是提供特定命令的信息。它们可以帮助你发现你没有意识到的命令。

![Hello I'm Nik][1]

手册页提供了关于 Linux 命令的基本信息，很多用户经常参考它，但手册页的内容比我们很多人意识到的要多得多。

你总是可以输入一个像 `man who` 这样的命令，然后得到 `who` 命令的工作原理的漂亮描述，但是探索你可能不知道的命令可能会更有启发。例如，你可以使用 `man` 命令来帮助找到一些处理非常具有挑战性的任务的命令，或者显示一些选项，这些选项可以帮助你以新的更好的方式使用你已经知道的命令。

让我们来浏览一些选项，看看最终的结果是什么。

### 用 man 去识别命令

`man` 命令可以帮助你按主题查找命令。例如，如果你要找一个计算文件中的行数的命令，你可以提供一个关键字。在下面的例子中，我们把关键字 “count” 放在了引号中，并添加了空格，这样我们就不会得到与 “accounts” 或 “accounting” 相关的命令，而是得到那些可以为我们做一些计算的命令。

```
$ man -k ' count '
anvil (8postfix)     - Postfix session count and request rate control
cksum (1)            - checksum and count the bytes in a file
sum (1)              - checksum and count the blocks in a file
timer_getoverrun (2) - get overrun count for a POSIX per-process timer
```

为了显示与新用户账户相关的命令，我们可以尝试使用这样的命令。

```
$ man -k "new user"
newusers (8)         - update and create new users in batch
useradd (8)          - create a new user or update default new user information
zshroadmap (1)       - informal introduction to the zsh manual The Zsh Manual, …
```

需要说明的是，上面的第三项只是提到 “new users” 类似的内容，并不是设置、删除或配置用户账号的命令。`man` 命令只是在命令描述中匹配了一些词，作用很像 `apropos` 命令。注意上面列出的每个命令后面的括号中的数字。这些数字与包含这些命令的手册页的分区有关。

### 确定手册页的分区

`man` 命令的分区将其内容划分为不同的类别。要列出这些类别，请键入 `man man`，并查看类似下面的描述。你的系统中很可能没有第 9 分区的命令。

- `1`：可执行程序或 shell 命令
- `2`：系统调用（内核提供的函数）
- `3`：库调用（程序库内的函数）
- `4`：特殊文件（通常在可以 `/dev` 中找到）
- `5`：文件格式和惯例，例如 `/etc/passwd`
- `6`：游戏
- `7`：杂项（包括宏包和约定），例如 `man`(7)、`groff`(7)
- `8`：系统管理命令（通常只由 root 用户使用）
- `9`：内核例程（非标准）

手册页涵盖了比我们通常认为的“命令”更多的内容。从上面的描述中可以看到，它们涵盖了系统调用、库调用、特殊文件等等。

下面的列表显示了 Linux 系统中的手册页的实际存储位置。这些目录上的日期会有所不同，因为随着更新，其中一些分区会有新的内容，而另一些则不会。

```
$ ls -ld /usr/share/man/man?
drwxr-xr-x 2 root root  98304 Feb  5 16:27 /usr/share/man/man1
drwxr-xr-x 2 root root  65536 Oct 23 17:39 /usr/share/man/man2
drwxr-xr-x 2 root root 270336 Nov 15 06:28 /usr/share/man/man3
drwxr-xr-x 2 root root   4096 Feb  4 10:16 /usr/share/man/man4
drwxr-xr-x 2 root root  28672 Feb  5 16:25 /usr/share/man/man5
drwxr-xr-x 2 root root   4096 Oct 23 17:40 /usr/share/man/man6
drwxr-xr-x 2 root root  20480 Feb  5 16:25 /usr/share/man/man7
drwxr-xr-x 2 root root  57344 Feb  5 16:25 /usr/share/man/man8
```

注意，为了节省空间，手册页文件一般都是 gzip 压缩的。每当你使用 `man` 命令时，`man` 命令会根据需要解压。

```
$ ls -l /usr/share/man/man1 | head -10
total 12632
lrwxrwxrwx 1 root root      9 Sep  5 06:38 [.1.gz -> test.1.gz
-rw-r--r-- 1 root root    563 Nov  7 05:07 2to3-2.7.1.gz
-rw-r--r-- 1 root root    592 Apr 23  2016 411toppm.1.gz
-rw-r--r-- 1 root root   2866 Aug 14 10:36 a2query.1.gz
-rw-r--r-- 1 root root   2361 Sep  9 15:13 aa-enabled.1.gz
-rw-r--r-- 1 root root   2675 Sep  9 15:13 aa-exec.1.gz
-rw-r--r-- 1 root root   1142 Apr  3  2018 aaflip.1.gz
-rw-r--r-- 1 root root   3847 Aug 14 10:36 ab.1.gz
-rw-r--r-- 1 root root   2378 Aug 23  2018 ac.1.gz
```

### 按分区列出的手册页

即使只看第 1 分区的前 10 个手册页（如上所示），你也可能会看到一些新的命令 —— 也许是 `a2query` 或 `aaflip`（如上所示）。

探索命令的更好策略是按分区列出命令，不查看文件本身，而是使用 `man` 命令向你显示命令并提供每个命令的简要说明。

在下面的命令中，`-s 1` 指示 `man` 显示第 1 分区中的命令信息。`-k .` 使该命令对所有命令都有效，而不是指定一个特定的关键字；如果没有这个，`man` 命令就会回过头来问：“你想要什么手册页？”所以，使用关键字来选择一组相关的命令，或者使用点来显示一个分区中的所有命令。

```
$ man -s 1 -k .
2to3-2.7 (1)         - Python2 to Python3 converter
411toppm (1)         - convert Sony Mavica .411 image to ppm
as (1)               - the portable GNU assembler.
baobab (1)           - A graphical tool to analyze disk usage
busybox (1)          - The Swiss Army Knife of Embedded Linux
cmatrix (1)          - simulates the display from "The Matrix"
expect_dislocate (1) - disconnect and reconnect processes
red (1)              - line-oriented text editor
enchant (1)          - a spellchecker
…
```

### 有多少手册页？

如果你对每个分区中有多少手册页感到好奇，可以使用以下命令按分区对它们进行计数：

```
$ for num in {1..8}
> do
>   man -s $num -k . | wc -l
> done
2382
493
2935
53
441
11
245
919
```

确切的数量可能有所不同，但是大多数 Linux 系统的命令数量差不多。如果我们使用命令将这些数字加在一起，我们可以看到运行该命令的系统上有将近 7500 个手册页。有很多命令，系统调用等。

```
$ for num in {1..8}
> do
>     num=`man -s $num -k . | wc -l`
>     tot=`expr $num + $tot`
>     echo $tot
> done
2382
2875
5810
5863
6304
6315
6560
7479            <=== total
```

阅读手册页可以学到很多东西，但是以其他方式浏览手册页可以帮助你了解系统上可能不知道的命令。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3519853/navigating-man-pages-in-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/10/field-note_play-book_playbook_map_navigation_journey_by-hello-i-m-nik-via-unsplash-100813507-large.jpg
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/slideshow/153439/linux-best-desktop-distros-for-newbies.html#tk.nww-infsb
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
