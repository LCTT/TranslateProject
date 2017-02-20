如何在 Linux 中查找一个文件
============================================================

 ![linux-find-command](https://www.rosehosting.com/blog/wp-content/uploads/2016/09/linux-find-command.png) 

对于新手而言，在 Linux 中使用命令行可能会非常不方便。没有图形界面，很难在不同文件夹间浏览，找到需要的文件。本篇教程中，我会展示如何在 Linux 中查找特定的文件。

第一步要做的是**[通过 SSH 连接到你的 Linux][2]**。在 Linux 中查找文件有两种方法。一种是使用 `find` 命令，另外一种是使用 `locate` 命令。我们先看第一种。

### find 命令

使用 **Linux find 命令**可以用不同的搜索标准如名字、类型、所属人、大小等来搜索目录树。基本语法如下：

```
# find path expression search-term
```

下面是使用 find 命令根据文件名来查找特定文件的一个例子：

```
# find -name test.file
```

命令会搜索整个目录树来查找名为 `test.file` 的文件，并且会提供其存放位置。你可以使用你 Linux 上一个存在的文件名来尝试一下。

find 命令有时会花费几分钟来查找整个目录树，尤其是如果系统中有很多文件和目录的话。要显著减少时间，你可以指定搜索的目录。比如，如果你知道 `/var` 中存在 `test.file`，那就没有必要搜索其它目录。这样，你可以使用下面的命令：

```
# find /var -name test.file
```

find 还可以根据时间、大小、所属人、权限等选项搜索文件。要了解更多关于这些选项的信息，你可以使用查看** Linux find 命令**的手册。

```
# man find
```

### locate 命令

要在Linux中使用`locate`命令，首先需要安装它。

如果你正在使用 Ubuntu，运行下面的命令来安装 locate：

```
# apt-get update
# apt-get install mlocate
```

如果你使用的是 CentOS ，运行下面的命令来安装 locate：

```
# yum install mlocate
```

locate 是一种比 find 更快的方式，因为它在数据库中查找文件。要更新搜索数据库，运行下面的命令：

```
# updatedb
```

使用 locate 查找文件的语法：

```
# locate test.file
```

就像 find 命令一样，locate 也有很多选项来过滤输出。要了解更多你可以查看**Linux Locate 命令**的手册。

```
# man locate
```

* * *

当然，如果你使用了我们的 [Linux VPS 托管服务][5]，你不必自己这么做，你可以请求我们专业的 Linux 管理员来帮助你。我们是 24x7 服务的，并且会立即处理你的请求。

另外，如果你喜欢这篇文件，请使用左边的按钮分享到社交网络上，或者在下面留言，谢谢。

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/linux-find-file/

作者：[RoseHosting][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com/blog/linux-find-file/
[1]:https://www.rosehosting.com/
[2]:https://www.rosehosting.com/blog/connect-to-your-linux-vps-via-ssh/
[3]:https://www.rosehosting.com/ubuntu-vps.html
[4]:https://www.rosehosting.com/centos-vps.html
[5]:https://www.rosehosting.com/linux-vps-hosting.html
