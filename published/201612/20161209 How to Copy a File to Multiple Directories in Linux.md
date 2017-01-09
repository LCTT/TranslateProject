如何在 Linux 中复制文件到多个目录中
============================================================

[在学习 Linux 的过程中][1]，对于新手而言总是会使用几个命令来完成一个简单的任务。对正在熟悉使用终端的人这是很容易理解的行为。然而，如果你想要成为一个老手，学习我说的“快捷命令”会显著减少时间浪费。

在本篇中，我们会用一个简单的方法在 Linux 中用一个命令来将目录复制到多个文件夹中。

在 Linux 中，[cp 命令][2]常被用于从一个文件夹中复制文件到另一个中，最简单的语法如下：

```
# cp [options….] source(s) destination
```

另外，你也可以使用[高级复制命令][3]，它可以在复制[大的文件或文件夹][4]时显示进度条。

看下下面的命令，通常你会使用两个不同的命令来将相同的文件复制到不同的文件夹中：

```
# cp -v /home/aaronkilik/bin/sys_info.sh /home/aaronkilik/test
# cp -v /home/aaronkilik/bin/sys_info.sh /home/aaronkilik/tmp
```
[
 ![Copy Files to Multiple Directories](http://www.tecmint.com/wp-content/uploads/2016/12/Copy-Files-to-Multiple-Directories.png) 
][5]

*复制文件到多个文件夹中*

假设你想要复制一个特定文件到 5 个或者更多的文件夹中，这意味着你需要输入 5 次或者更多的cp命令么？

要摆脱这个问题，你可以用 cp 命令与 [echo命令][6]、管道、xargs 命令一起使用：

```
# echo /home/aaronkilik/test/ /home/aaronkilik/tmp | xargs -n 1 cp -v /home/aaronkilik/bin/sys_info.sh
```

上面的命令中，目录的路径（dir1、dir2、dir3...dirN）被管道作为输入到 xargs 命令中，含义是：

1. `-n 1` - 告诉 xargs 命令每个命令行最多使用一个参数，并发送到 cp 命令中。
2.  `cp` – 用于复制文件。
3.  `-v` – 启用详细模式来显示更多复制细节。

[
 ![Copy File to Multiple Locations in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Copy-Files-to-Multiple-Directories-in-Linux.png) 
][7]

*在 Linux 中复制文件到多个位置中*

试试阅读 `cp`、 `echo` 和 `xargs` 的 man 页面来找出所有有用和高级的用法信息：

```
$ man cp
$ man echo
$ man xargs
```

就是这样了，你可以在下面的评论区给我们发送主题相关的问题或者反馈。你也可以阅读有关 [progress 命令][8]来帮助监控运行中的（cp、mv、dd、[tar][9] 等等）的进度。

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili 是一个 Linux 及 F.O.S.S 热衷者，即将成为 Linux 系统管理员、web 开发者，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/copy-file-to-multiple-directories-in-linux/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/free-online-linux-learning-guide-for-beginners/
[2]:http://www.tecmint.com/advanced-copy-command-shows-progress-bar-while-copying-files/
[3]:http://www.tecmint.com/advanced-copy-command-shows-progress-bar-while-copying-files/
[4]:http://www.tecmint.com/find-top-large-directories-and-files-sizes-in-linux/
[5]:http://www.tecmint.com/wp-content/uploads/2016/12/Copy-Files-to-Multiple-Directories.png
[6]:http://www.tecmint.com/echo-command-in-linux/
[7]:http://www.tecmint.com/wp-content/uploads/2016/12/Copy-Files-to-Multiple-Directories-in-Linux.png
[8]:http://www.tecmint.com/progress-monitor-check-progress-of-linux-commands/
[9]:http://www.tecmint.com/18-tar-command-examples-in-linux/
