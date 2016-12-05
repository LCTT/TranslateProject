如何在Linux VPS中查找一个文件
============================================================

 ![linux-find-command](https://www.rosehosting.com/blog/wp-content/uploads/2016/09/linux-find-command.png) 

尤其对于新手而言，在linux中使用命令行可能会非常不舒服。没有GUI将很难在不同的文件夹之间寻找所要的文件。本篇教程中，我会向你展示在[Linux VPS][1]中查找特定的文件。

第一步要做的是[通过SSH连接到你的Linux VPS][2]。在Linux中查找文件有两种方法。一种是使用`find`命令，另外一种是使用`locate`命令。先让我们试前一种。

### find命令

Linux find命令能让你使用不同的搜索标准如名字、类型、所属人、大小等搜索目录树。这是基本的语法：

```
# find path expression search-term
```

下面是使用find命令根据文件名来查找特定文件的一个例子：

```
# find -name test.file
```

命令会搜索整个目录树来查找名为`test.file`的文件，并且会提供位置。你可以使用你VPS上一个存在的文件名来尝试一下。

find命令有时会花费几分钟来查找整个目录树，尤其是如果系统中有很多文件和目录的话。要明显减少时间，你可以指定搜索的目录。比如，如果你知道`/var`中存在`test.file`, 那就没有必要搜索其他目录。这样，你可以使用下面的命令：

```
# find /var -name test.file
```

find也有根据时间、大小、所属人、权限搜索的选项。要了解更多关于这些选项的信息，你可以使用查看find的手册。

```
# man find
```

### locate命令

要在Linux中使用`locate`命令，你首先需要安装它。

如果你正在使用[Ubuntu VPS][3]，运行下面的命令来安装locate：

```
# apt-get update
# apt-get install mlocate
```

如果你使用的是[CentOS VPS][4]，运行下面的命令来安装locate：

```
# yum install mlocate
```

locae是一种比find更快的方式，因为它在数据库中查找文件。要更新搜索数据库，运行下面的命令：

```
# updatedb
```

要使用locate查找文件，使用下面的语法：

```
# locate test.file
```

就像find命令一样，locate也有很多选项来过滤输出。要了解更多你可以查看locate的手册。

```
# man locate
```

* * *

当然，如果你使用了我们的[Linux VPS托管服务][5]，你不必自己这么做，你可以请求我们专业的Linux管理员来帮助你。我们是24x7服务的，并且会立即处理你的请求。

PS，如果你喜欢这篇文件，请使用左边的按钮分享到社交网络上，或者在下面留言，谢谢。

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/linux-find-file/

作者：[RoseHosting][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com/blog/linux-find-file/
[1]:https://www.rosehosting.com/
[2]:https://www.rosehosting.com/blog/connect-to-your-linux-vps-via-ssh/
[3]:https://www.rosehosting.com/ubuntu-vps.html
[4]:https://www.rosehosting.com/centos-vps.html
[5]:https://www.rosehosting.com/linux-vps-hosting.html
