# 如何在 Linux 中恢复一个删除了的文件

你曾经是否遇到这样的事？你意识到你已经通过删除键或者在命令行中使用 ‘rm’ 命令错误的删除了一个不该删除的文件。

在第一种情况下，你可以到垃圾箱，[搜索文件][6]，然后把它重新存储到它原始的位置。但是第二种情况又该怎么办呢？我想你可能也知道，Linux 命令行不会把被删除的文件放到任何位置，而是直接把它们清除了，于是它们不再存在了。

在这篇文章里，我将分享一个可能很有帮助的技巧来阻止这件事发生在你身上。同时，我也会分享一个你可能会考虑使用的工具，当你由于过分粗心而删除了某些不该删除的文件时。

### 为 ’rm -i‘ 创建一个别名

当 ‘-i' 选项和 rm 命令（也包括其他[文件处理命令比如 cp 或者 mv][5]）同时使用时，在删除文件前会出现一个提示。

这同样也可以运用到[复制，移动或重命名一个文件][4]，当所在位置已经存在一个和目标文件同名的文件时。

这个提示给你第二次机会来考虑你是否真的想删除该文件 - 如果你在这个提示上选择确定，那么文件就被删除了。在那种情况下，很抱歉，这个技巧没能保护你远离粗心。

为了让 rm 成为 ‘rm -i’ 别名，这样做：

```
alias rm='rm -i'

```

别名命令将确定 rm 现在已经成为了别名：

[
 ![增加 rm 别名的命令](http://www.tecmint.com/wp-content/uploads/2016/11/Add-Alias-rm-Command.png) 
][3]

增加 rm 别名的命令

然而，这样做只在当前用户对话的当前 shell 上有效。为了永久改变，你必须像下面展示的这样把它保存到　'~/.bashrc'　中（一些版本的　Linux 系统可能是　'~/.profile'）。

[
 ![在 Linux 中永久增添别名](http://www.tecmint.com/wp-content/uploads/2016/11/Add-Alias-Permanently-in-Linux.png) 
][2]

在 Linux 中永久增添别名

为了让 '~/.bashrc'（或 '~/.profile'）中所做的改变立即生效，从当前 shell 中搜索文件：

```
. ~/.bashr

```
[
 ![在 Linux 中激活别名](http://www.tecmint.com/wp-content/uploads/2016/11/Active-Alias-in-Linux.png) 
][1]

在 Linux 中激活别名

### 取证工具　－　Foremost

但愿你对于你的文件足够小心，只有需要恢复一个来自外部磁盘或 USB 设备的丢失文件时才使用这个工具。

然而，当你意识到你意外的删除了系统中的一个文件并将要感到恐慌时－不用担心。让我们来看一看 Foremost，　一个被设计用来处理这种状况的取证工具。

为了在 CentOS/RHEL 7　中安装　Foremost，　你需要首先启用 Repoforge：

```
# rpm -Uvh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
# yum install foremost

```

然而在 Debian 及其派生系统中，只需这样做：

```
# aptitude install foremost

```

安装完成以后，让我们以一个简单的测试开始。我们首先删除 /boot/images 目录下一个名为 'nosdos.jpg' 的图像文件：

```
# cd images
# rm nosdos.jpg

```

为了恢复这个文件，像下面这样使用 Foremost（你需要首先确认潜在分区 - 在这种情况下， '/boot' 位于 '/dev/sda1' 分区中）

```
# foremost -t jpg -i /dev/sda1 -o /home/gacanepa/rescued

```

/home/gacanepa/rescued 是单独磁盘中的一个目录 － 请记住，把文件恢复到被删除文件所在驱动中不是一个明智的做法。

如果在恢复过程中，占用了被删除文件过去所在的磁盘分区，那么可能没法恢复文件。另外，在进行文件恢复操作前停止所有进程也是至关重要的。

当 Foremost 执行文件恢复操作完成以后，恢复文件（如果可以恢复）将能够在目录 /home/gacanepa/rescue/jpg 中找到。

##### 总结

这篇在文章中，我们阐述了如何避免意外删除一个不该删除的文件以及如何恢复文件如果这样一件不期望的事情发生。然而，警告一下， Foremost 需要花费一段时间运行，时间长短取决于分区的大小。

一如既往，如果你有什么问题或想法，不要犹豫，让我们知道。请自由使用下面的形式给我们留下一个注记。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/recover-deleted-file-in-linux/

作者：[ Gabriel Cánepa][a]

译者：[ucasFL](https://github.com/ucasFL)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/wp-content/uploads/2016/11/Active-Alias-in-Linux.png
[2]:http://www.tecmint.com/wp-content/uploads/2016/11/Add-Alias-Permanently-in-Linux.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/11/Add-Alias-rm-Command.png
[4]:http://www.tecmint.com/rename-multiple-files-in-linux/
[5]:http://www.tecmint.com/progress-monitor-check-progress-of-linux-commands/
[6]:http://www.tecmint.com/linux-find-command-to-search-multiple-filenames-extensions/
