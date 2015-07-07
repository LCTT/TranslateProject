watch：定期重复Linux / Unix命令
================================================================================
服务器管理员需要维护系统并保持更新和安全。每天需要运行大量的指令。有些系统进程会记录日志。这些日志不断更新。为了检查这些更新，需要重复地执行命令。比如，为了读取一个日志文件需要使用head、tail、cat等命令。这些命令需要重复地执行。而watch命令可以用于定期地执行一个命令。

### Watch 命令 ###

watch是一个简单的命令，只有几个选项。watch命令的基本语法是：

    watch [-dhvt] [-n <seconds>] [--differences[=cumulative]] [--help] [--interval=<seconds>] [--no-title] [--version] <command>

watch命令默认每隔2秒执行后面参数给出的命令。这个时间根据的是命令执行结束到上次执行的间隔来算的。比如，watch命令可以用于监测日志更新，更新是在文件的后面追加新的内容，因此可以用tail命令来检测文件的更新（LCTT 译注：可以直接使用 `tail -f` 主动跟踪某个文件的更新，而不用使用 watch。）。这个命令会持续地运行直到你按下 `CTRL + C`回到提示符。

### 例子 ###

每两秒监测 errors/notices/warning 生成的情况。

    watch tail /var/log/messages

![tail messages](http://blog.linoxide.com/wp-content/uploads/2015/06/1.png)

按指定的时间间隔监测磁盘的使用率。

    watch df -h

![df -h](http://blog.linoxide.com/wp-content/uploads/2015/06/2.png)

对磁盘管理员而言，关注高I/O等待导致的磁盘操作尤其是mysql事务是很重要的。 

    watch mysqladmin processlist

![processlist](http://blog.linoxide.com/wp-content/uploads/2015/06/3.png)

监测服务器负载和运行时间。

    watch uptime

![uptime](http://blog.linoxide.com/wp-content/uploads/2015/06/10.png)

监测exim给用户发送通知的队列大小。

    watch exim -bpc

![exim -bpc](http://blog.linoxide.com/wp-content/uploads/2015/06/9.png)

### 1) 指定延迟 ###

    watch [-n <seconds>] <command>

命令默认运行的时间间隔可用-n改变，下面的命令会在5秒后运行后面的命令：

    watch -n 5 date

![date 5 seconds](http://blog.linoxide.com/wp-content/uploads/2015/06/4b.png)

### 2) 连续输出比较###

如果你使用-d选项，它会累次地高亮第一次和下一次命令之间输出的差别。

    watch [-d or --differences[=cumulative]] <command>

例子 1，用下面的命令连续地输出时间并观察高亮出来的不同部分。

    watch -n 15 -d date

第一次执行date的输出会被记录，15秒后会重复运行命令。

![Difference A](http://blog.linoxide.com/wp-content/uploads/2015/06/6.png)

在下一次执行时，可以看到输出除了被高亮的秒数从14到29之外其他的都一样。

![Difference A](http://blog.linoxide.com/wp-content/uploads/2015/06/6b.png)

例子 2，让我们来体验一下两个连续的“uptime”命令输出的不同。

    watch -n 20 -d uptime

![uptime](http://blog.linoxide.com/wp-content/uploads/2015/06/10.png)

现在列出了时间和3个负载快照之间的不同。

![10b](http://blog.linoxide.com/wp-content/uploads/2015/06/10b.png)

### 3) 不带标题输出 ###

如果你不希望显示更多关于延迟和实际命令的信息可以使用-t选项。

    watch [-t or --no-title] <command>

让我们看下下面例子命令的输出：

    watch -t date

![watch without title](http://blog.linoxide.com/wp-content/uploads/2015/06/7t.png)

### Watch 帮助 ###

可以在ssh中输入下面的命令来得到watch的简要帮助。

    watch -h [or --help]

![watch help](http://blog.linoxide.com/wp-content/uploads/2015/06/8h.png)

### Watch 版本 ###

在ssh终端中运行下面的命令来检查watch的版本。

    watch -v [--version]

![version](http://blog.linoxide.com/wp-content/uploads/2015/06/11.png)

**不足**

不幸的是，在终端大小调整时，屏幕不能在下次运行前重画。所有用--difference高亮的内容也会在更新时丢失。

### 总结 ###

watch对系统管理员而言是一个非常强大的工具，因为它可以用于监控、日志、运维、性能和系统运行时的吞吐量。人们可以非常简单地格式化和推延watch的输出。任何Linux命令/程序或脚本可以按照所需监测和连续输出。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-watch-command/

作者：[Aun Raza][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/
