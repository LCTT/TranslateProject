[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11643-1.html)
[#]: subject: (Using multitail on Linux)
[#]: via: (https://www.networkworld.com/article/3445228/using-multitail-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 上使用 Multitail
======

![](https://img.linux.net.cn/data/attachment/album/201912/05/053423mpnrn95hqqknzheq.jpg)

当你想同时查看多个文件（尤其是日志文件）的活动时，`multitail` 命令会非常有用。它的工作方式类似于多窗口形式的 `tail -f` 命令。也就是说，它显示这些文件的底部和添加的新行。虽然通常使用简单，但是 `multitail` 提供了一些命令行和交互式选项，在开始使用它之前，你应该了解它们。

### 基本 multitail 使用

`multitail` 的最简单用法是在命令行中列出你要查看的文件名称。此命令水平分割屏幕（即顶部和底部），并显示每个文件的底部以及更新。

```
$ multitail /var/log/syslog /var/log/dmesg
```

显示内容将像这样拆分：

```
+-----------------------+
|                       |
|                       |
+-----------------------|
|                       |
|                       |
+-----------------------+
```

每个文件都有一行显示该文件的文件编号（从 00 开始）、文件名、文件大小、最新内容的添加日期和时间。每个文件将被分配一半空间，而不论它的大小和活动情况。比如：

```
content lines from my1.log
more content
more lines

00] my1.log                                    59KB - 2019/10/14 12:12:09
content lines from my2.log
more content
more lines

01] my2.log                                   120KB - 2019/10/14 14:22:29
```

请注意，如果你要求 `multitail` 显示非文本文件或者你无权查看的文件，它不会报错。你只是看不到内容。

你还可以使用通配符指定要查看的文件：

```
$ multitail my*.log
```

要记住的一件事是，`multitail` 将平均分割屏幕。如果指定的文件太多，那么除非你采取额外的步骤查看之后的文件（参考下面的滚动选项），否则你将只会看到前面 7 个文件的前面几行。确切的结果取决于终端窗口中有多少行可用。

按 `q` 退出 `multitail` 并返回到正常的屏幕视图。

### 分割屏幕

如果你愿意，`multitail` 也可以垂直分割你的终端窗口（即，左和右）。为此，请使用 `-s` 选项。如果指定了三个文件，那么屏幕右侧的窗口将会水平分隔。四个文件的话，你将拥有四个大小相等的窗口。

```
+-----------+-----------+     +-----------+-----------+     +-----------+-----------+
|           |           |     |           |           |     |           |           |
|           |           |     |           |           |     |           |           |
|           |           |     |           +-----------+     +-----------+-----------+
|           |           |     |           |           |     |           |           |
|           |           |     |           |           |     |           |           |
+-----------+-----------+     +-----------+-----------+     +-----------+-----------+
         2 个文件                       3 个文件                       4 个文件
```

如果要将屏幕分为三列，请使用 `multitail -s 3 file1 file2 file3`。

```
+-------+-------+-------+
|       |       |       |
|       |       |       |
|       |       |       |
|       |       |       |
|       |       |       |
+-------+-------+-------+
  3 个文件带上 -s 3 选项
```

### 滚动

你可以上下滚动文件，但是需要按下 `b` 弹出选择菜单，然后使用向上和向下箭头按钮选择要滚动浏览的文件。然后按下回车键。然后，你可以再次使用向上和向下箭头在放大的区域中滚动浏览各行。完成后按下 `q` 返回正常视图。

### 获得帮助

在 `multitail` 中按下 `h` 将打开一个帮助菜单，其中描述了一些基本操作，但是手册页提供了更多信息，如果莫想了解更多有关使用此工具的信息，请仔细阅读。

默认情况下，你的系统上不会安装 `multitail`，但是使用 `apt-get` 或 `yum` 可以使你轻松安装。该工具提供了许多功能，不过它是基于字符显示的，窗口边框只是 `q` 和 `x` 的字符串组成的。当你需要关注文件更新时，它非常方便。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3445228/using-multitail-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/glenbowman/7992498919/in/photolist-dbgDtv-gHfRRz-5uRM4v-gHgFnz-6sPqTZ-5uaP7H-USFPqD-pbtRUe-fiKiYn-nmgWL2-pQNepR-q68p8d-dDsUxw-dbgFKG-nmgE6m-DHyqM-nCKA4L-2d7uFqH-Kbqzk-8EwKg-8Vy72g-2X3NSN-78Bv84-buKWXF-aeM4ok-yhweWf-4vwpyX-9hu8nq-9zCoti-v5nzP5-23fL48r-24y6pGS-JhWDof-6zF75k-24y6nHS-9hr19c-Gueh6G-Guei7u-GuegFy-24y6oX5-26qu5iX-wKrnMW-Gueikf-24y6oYh-27y4wwA-x4z19F-x57yP4-24BY6gc-24y6nPo-QGwbkf
[2]: https://creativecommons.org/licenses/by-sa/2.0/legalcode
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
