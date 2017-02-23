如何知道目录及子目录下文件的数量
============================================================

在本指南中，我们将介绍如何在 Linux 系统上显示当前工作目录或任何目录及其子目录中的文件数量。

我们将使用 [find 命令][6]，它用于搜索目录层次结构中的文件，以及 [wc 命令][7]，它会打印每个文件或来自标准输入的换行符、单词和字节计数。

以下是我们在 [find 命令][8]中使用的选项，如下所示：

1.  `-type` - 指定要搜索的文件类型，在上面的情况下，`f` 表示查找所有常规文件。
2.  `-print` - 打印文件绝对路径。

以下是我们 [wc 命令][8]中使用的选项，如下所示：

1.  `-l` - 此选项打印换行符的总数，也即由 [find 命令][1]输出的绝对文件路径总数。

`find` 命令的一般语法。

```
# find . -type f -print | wc -l
$ sudo find . -type f -print | wc -l
```

重要：使用 [sudo 命令][9]来读取指定目录中的所有文件，包括具有超级用户权限的子目录中的文件，以避免 “Permission denied” 错误，如下截图所示：

[
 ![Find Number of Files in Linux](http://www.tecmint.com/wp-content/uploads/2017/01/Find-Number-of-Files-in-Linux.png) 
][10]

*Linux 中的文件数量*

你可以看到，在上面的第一个命令中，`find` 命令没有读取当前工作目录中的所有文件。

下面是更多的示例，分别显示 `/var/log` 和 `/etc` 目录中的常规文件总数：

```
$ sudo find /var/log/ -type f -print | wc -l
$ sudo find /etc/ -type f -print | wc -l
```

有关 Linux 中 `find` 和 `wc` 命令的更多示例，请查看以下系列文章以了解其他使用选项，提示和相关命令：

1.  [35 个 Linux 中的 “find” 命令示例][2]
2.  [如何在 Linux 中查找最近或今天的修改的文件][3]
3.  [在 Linux 中查找十个占用最大的目录和文件][4]
4.  [6 个有用的 “wc” 命令示例来计算行数、单词和字符][5]

就是这样了！如果你知道其他任何方法来显示目录及其子目录中的文件总数，请在评论中与我们分享。

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux SysAdmin、web 开发人员，目前是 TecMint 的内容创建者，他喜欢用电脑工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/find-number-of-files-in-directory-subdirectories-linux/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/find-top-large-directories-and-files-sizes-in-linux/
[2]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[3]:http://www.tecmint.com/find-recent-modified-files-in-linux/
[4]:http://www.tecmint.com/find-top-large-directories-and-files-sizes-in-linux/
[5]:http://www.tecmint.com/wc-command-examples/
[6]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[7]:http://www.tecmint.com/wc-command-examples/
[8]:http://www.tecmint.com/find-recent-modified-files-in-linux/
[9]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[10]:http://www.tecmint.com/wp-content/uploads/2017/01/Find-Number-of-Files-in-Linux.png
