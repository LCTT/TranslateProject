如何在后台运行 Linux 命令并且将进程脱离终端
=================

在本指南中，我们将会阐明一个在 [Linux 系统中进程管理][8]的简单但是重要的概念，那就是如何从它的控制终端完全脱离一个进程。

当一个进程与终端关联在一起时，可能会出现两种问题：

1. 你的控制终端充满了很多输出数据或者错误及诊断信息
2. 如果发生终端关闭的情况，进程连同它的子进程都将会终止

为了解决上面两个问题，你需要从一个控制终端完全脱离一个进程。在我们实际上解决这个问题之前，让我们先简要的介绍一下，如何在后台运行一个进程。

### 如何在后台开始一个 Linux 进程或者命令行

如果一个进程已经运行，例如下面的 [tar 命令行的例子][7]，简单的按下 `Ctrl+Z` 就可以停止它（LCTT 译注：这里说的“停止”，不是终止，而是“暂停”的意思），然后输入命令 `bg` 就可以继续以一个任务在后台运行了。

你可以通过输入 `jobs` 查看所有的后台任务。但是，标准输入（STDIN）、标准输出（STDOUT）和标准错误（STDERR）依旧掺杂到控制台中。

```
$ tar -czf home.tar.gz .
$ bg
$ jobs

```

![在后台运行 Linux 命令](http://www.tecmint.com/wp-content/uploads/2016/10/Run-Linux-Command-in-Background.png)

*在后台运行 Linux 命令*

你也可以直接使用符号 `&` 在后台运行一个进程：

```
$ tar -czf home.tar.gz . &
$ jobs

```

![在后台开始一个 Linux 进程](http://www.tecmint.com/wp-content/uploads/2016/10/Start-Linux-Process-in-Background.png)

*在后台开始一个 Linux 进程*

看一下下面的这个例子，虽然 [tar 命令][4]是作为一个后台任务开始的，但是错误信息依旧发送到终端，这表示，进程依旧和控制终端关联在一起。

```
$ tar -czf home.tar.gz . &
$ jobs

```

![运行在后台的 Linux 进程信息](http://www.tecmint.com/wp-content/uploads/2016/10/Linux-Process-Running-in-Background-Message.png)

*运行在后台的 Linux 进程信息*

### 退出控制台之后，保持 Linux 进程的运行

我们将使用 `disown` 命令，它在一个进程已经运行并且被放在后台之后使用，它的作用是从 shell 的活动任务列表中移走一个 shell 任务，因此，对于该任务，你将再也不能使用 `fg` 、 `bg` 命令了。

而且，当你关闭控制控制终端，这个任务将不会挂起（暂停）或者向任何一个子任务发送 SIGHUP 信号。

让我们看一下先下面的这个使用 bash 中内置命令 `disown` 的例子。 

```
$ sudo rsync Templates/* /var/www/html/files/ &
$ jobs
$ disown  -h  %1
$ jobs

```

![关闭终端之后，保持 Linux 进程运行](http://www.tecmint.com/wp-content/uploads/2016/10/Keep-Linux-Processes-Running.png)

*关闭终端之后，保持 Linux 进程运行*

你也可以使用 `nohup` 命令，这个命令也可以在用户退出 shell 之后保证进程在后台继续运行。

```
$ nohup tar -czf iso.tar.gz Templates/* &
$ jobs

```

![关闭 shell 之后把 Linux 进程置于后台](http://www.tecmint.com/wp-content/uploads/2016/10/Put-Linux-Process-in-Background.png)

*关闭 shell 之后把 Linux 进程置于后台*

### 从控制终端脱离一个 Linux 进程

因此，为了彻底从控制终端脱离一个程序，对于图形用户界面 (GUI) 的程序例如 firefox 来说，使用下面的命令行格式会更有效：

```
$ firefox </dev/null &>/dev/null &

```

在 Linux 上，/dev/null 是一个特殊的文件设备，它会忽略所有的写在它上面的数据，上述命令，输入来源和输出发送目标都是 /dev/null。

作为结束陈述，运行一个连接到控制终端的进程，作为用户你将会在你的终端上看到这个进程数据的许多行的输出，也包含错误信息。同样，当你关闭一个控制终端，你的进程和子进程都将会终止。

重要的是，对于这个主题任何的问题或者观点，通过下面的评论联系我们。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/run-linux-command-process-in-background-detach-process/

作者：[Aaron Kili][a]
译者：[yangmingming](https://github.com/yangmingming)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2016/10/Put-Linux-Process-in-Background.png
[2]:http://www.tecmint.com/wp-content/uploads/2016/10/Keep-Linux-Processes-Running.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/Linux-Process-Running-in-Background-Message.png
[4]:https://linux.cn/article-7802-1.html
[5]:http://www.tecmint.com/wp-content/uploads/2016/10/Start-Linux-Process-in-Background.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/10/Run-Linux-Command-in-Background.png
[7]:https://linux.cn/article-7802-1.html
[8]:http://www.tecmint.com/monitor-linux-processes-and-set-process-limits-per-user/
