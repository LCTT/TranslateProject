在 Linux 中查看你的时区
============================================================

在这篇短文中，我们将向你简单介绍几种 Linux 下查看系统时区的简单方法。在 Linux 机器中，尤其是生产服务器上的时间管理技能，是在系统管理中一个极其重要的方面。

Linux 包含多种可用的时间管理工具，比如 `date` 或 `timedatectlcommands`，你可以用它们来获取当前系统时区，也可以[将系统时间与 NTP 服务器同步][1]，来自动地、更精确地进行时间管理。

好，我们一起来看几种查看我们的 Linux 系统时区的不同方法。

### 1、我们从使用传统的 `date` 命令开始

使用下面的命令，来看一看我们的当前时区：

```
$ date
```

或者，你也可以使用下面的命令。其中 `%Z` 格式可以输出字符形式的时区，而 `%z` 输出数字形式的时区：

```
$ date +”%Z %z”
```
![Find Linux Timezone](http://www.tecmint.com/wp-content/uploads/2016/10/Find-Linux-Timezone.png)

*查看 Linux 时区*

注意：`date` 的手册页中包含很多输出格式，你可以利用它们，来替换你的 `date` 命令的输出内容：

```
$ man date
```

### 2、接下来，你同样可以用 `timedatectl` 命令

当你不带任何参数运行它时，这条命令可以像下图一样，输出系统时间概览，其中包含当前时区：

```
$ timedatectl
```

然后，你可以在命令中提供一条管道，然后用 [grep 命令][3] 来像下面一样，只过滤出时区信息：

```
$ timedatectl | grep “Time zone”
```

![Find Current Linux Timezone](http://www.tecmint.com/wp-content/uploads/2016/10/Find-Current-Linux-Timezone.png)

*查看当前 Linux 时区*

同样，我们可以学习如何使用 timedatectl 来[设置 Linux 时区][5]。

###3、进一步，显示文件 /etc/timezone 的内容

使用 [cat 工具][6]显示文件 `/etc/timezone` 的内容，来查看你的时区：

```
$ cat /etc/timezone
```
![Check Timezone of Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Check-Timezone-of-Linux.png)

*在 Linux 中查看时区*

对于 RHEL/CentOS/Fedora 用户，这里还有一条可以起到同样效果的命令：

```
$ grep ZONE /etc/sysconfig/clock
```

就这些了！别忘了在下面的反馈栏中分享你对于这篇文章中的看法。重要的是：你应该通过这篇 Linux 时区管理指南来学习更多系统时间管理的知识，因为它含有很多易于操作的实例。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/check-linux-timezone

作者：[Aaron Kili][a]
译者：[StdioA](https://github.com/StdioA)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/install-ntp-server-in-centos/
[2]:http://www.tecmint.com/wp-content/uploads/2016/10/Find-Linux-Timezone.png
[3]:http://www.tecmint.com/12-practical-examples-of-linux-grep-command/
[4]:http://www.tecmint.com/wp-content/uploads/2016/10/Find-Current-Linux-Timezone.png
[5]:http://www.tecmint.com/set-time-timezone-and-synchronize-time-using-timedatectl-command/
[6]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/Check-Timezone-of-Linux.png
