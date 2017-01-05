如何在 Linux 中恢复一个删除了的文件
==============

你曾经是否遇到这样的事？当你发现的时候，你已经通过删除键，或者在命令行中使用 `rm` 命令，错误的删除了一个不该删除的文件。

在第一种情况下，你可以到垃圾箱，[搜索那个文件][6]，然后把它复原到原始位置。但是第二种情况又该怎么办呢？你可能知道，Linux 命令行不会把删除的文件转移到任何位置，而是直接把它们移除了，biu~，它们就不复存在了。

在这篇文章里，将分享一个很有用的技巧来避免此事发生。同时，也会分享一个工具，不小心删除了某些不该删除的文件时，也许用得上。

### 把删除创建为 `rm -i` 的别名

当 `-i` 选项配合 `rm` 命令（也包括其他[文件处理命令比如 `cp` 或者 `mv`][5]）使用时，在删除文件前会出现一个提示。

这同样也可以运用到当[复制，移动或重命名一个文件][4]，当所在位置已经存在一个和目标文件同名的文件时。

这个提示会给你第二次机会来考虑是否真的要删除该文件 - 如果你在这个提示上选择确定，那么文件就被删除了。这种情况下，很抱歉，这个技巧并不能防止你的粗心大意。

为了 `rm -i` 别名替代 `rm` ，这样做：

```
alias rm='rm -i'
```

运行 `alias` 命令可以确定 `rm` 现在已经被别名了：

![增加 rm 别名的命令](http://www.tecmint.com/wp-content/uploads/2016/11/Add-Alias-rm-Command.png) 

*为 rm 增加别名*

然而，这只能在当前用户的当前 shell 上有效。为了永久改变，你必须像下面展示的这样把它保存到　`~/.bashrc`　中（一些版本的　Linux 系统可能是　`~/.profile`）。

![在 Linux 中永久增添别名](http://www.tecmint.com/wp-content/uploads/2016/11/Add-Alias-Permanently-in-Linux.png) 

*在 Linux 中永久增添别名*

为了让 `~/.bashrc`（或 `~/.profile`）中所做的改变立即生效，从当前 shell 中运行文件：

```
. ~/.bashrc
```

![在 Linux 中激活别名](http://www.tecmint.com/wp-content/uploads/2016/11/Active-Alias-in-Linux.png) 

*在 Linux 中激活别名*

### 取证工具　－　Foremost

但愿你对于你的文件足够小心，当你要从外部磁盘或 USB 设备中恢复丢失的文件时，你只需使用这个工具即可。

然而，当你意识到你意外的删除了系统中的一个文件并感到恐慌时－不用担心。让我们来看一看 `foremost`，一个用来处理这种状况的取证工具。

要在 CentOS/RHEL 7　中安装　Foremost，需要首先启用 Repoforge：

```
# rpm -Uvh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
# yum install foremost
```

然而在 Debian 及其衍生系统中，需这样做：

```
# aptitude install foremost
```

安装完成后，我们做一个简单的测试吧。首先删除 `/boot/images` 目录下一个名为 `nosdos.jpg` 的图像文件：

```
# cd images
# rm nosdos.jpg
```

要恢复这个文件，如下所示使用 `foremost`（要先确认所在分区 - 本例中， `/boot` 位于 `/dev/sda1` 分区中）。

```
# foremost -t jpg -i /dev/sda1 -o /home/gacanepa/rescued
```

其中，`/home/gacanepa/rescued` 是另外一个磁盘中的目录 － 请记住，把文件恢复到被删除文件所在的磁盘中不是一个明智的做法。

如果在恢复过程中，占用了被删除文件之前所在的磁盘分区，就可能无法恢复文件。另外，进行文件恢复操作前不要做任何其他操作。

当 `foremost` 执行完成以后，恢复的文件（如果可以恢复）将能够在目录 ·/home/gacanepa/rescue/jpg` 中找到。

##### 总结

在这篇文章中，我们阐述了如何避免意外删除一个不该删除的文件，以及万一这类事情发生，如何恢复文件。还要警告一下， `foremost` 可能运行很长时间，时间长短取决于分区的大小。

如果您有什么问题或想法，和往常一样，不要犹豫，告诉我们。可以给我们留言。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/recover-deleted-file-in-linux/

作者：[Gabriel Cánepa][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/wp-content/uploads/2016/11/Active-Alias-in-Linux.png
[2]:http://www.tecmint.com/wp-content/uploads/2016/11/Add-Alias-Permanently-in-Linux.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/11/Add-Alias-rm-Command.png
[4]:http://www.tecmint.com/rename-multiple-files-in-linux/
[5]:http://www.tecmint.com/progress-monitor-check-progress-of-linux-commands/
[6]:http://www.tecmint.com/linux-find-command-to-search-multiple-filenames-extensions/
