[#]: subject: "Schedule a task with the Linux at command"
[#]: via: "https://opensource.com/article/21/8/linux-at-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

用 Linux 的命令来安排一个任务
======
at 命令是一种在特定时间和日期安排一次性任务的终端方法。
![Team checklist][1]

计算机擅长[自动化][2]，但不是每个人都知道如何使自动化工作。不过，能够在特定的时间为电脑安排一个任务，然后忘记它，这确实是一种奢侈。也许你有一个文件要在特定的时间上传或下载，或者你需要处理一批还不存在但保证在某个时间存在的文件，或者需要监控的设置，或者你只是需要一个友好的提醒，在下班回家的路上拿起面包和黄油。

That's what the `at`command is for.
这就是 `at` 命令的用处。

### 什么是 Linux at 命令？

`at` 命令是 Linux 终端允许你在特定时间和日期安排一次性工作的方法。它是一种自发的自动化，在终端上很容易实现。

### 安装 at

在 Linux 上，`at` 命令可能已经安装了。你可以使用 `at -V` 命令来验证它是否已经安装。只要返回一个版本，就说明你已经安装了 `at`。


```
$ at -V
at version x.y.z
```

如果你试图使用 `at`，但没有找到该命令，大多数现代的 Linux 发行版会提供缺少的 `at` 包。

### 用 at 交互式地安排一个作业

当你使用 `at` 命令和你希望任务运行的时间时，你会打开一个交互式 `at` 提示。你可以输入你想在你指定的时间运行的命令。

如果有帮助的话，你可以把这个过程看作是一个日历应用，就像你可能在你的手机上使用的那样。首先，你在某一天的某个时间创建一个事件，然后指定你想要发生什么。

例如，尝试通过创建一个未来几分钟的任务来计划给自己的备忘录。让任务变得简单，以减少失败的可能性。要退出 `at` 提示，请按键盘上的 **Ctrl+D**。


```
$ at 11:20 AM
warning: commands will be executed using /bin/sh
at&gt; echo "hello world" &gt; ~/at-test.txt
at&gt; &lt;EOT&gt;
job 3 at Mon Jul 26 11:20:00 2021
```

正如你所看到的，`at` 使用直观和自然的时间定义。你不需要知道 24 小时制的时钟，也不需要把时间翻译成 UTC 或特定的 ISO 格式。一般来说，你可以使用你自然想到的任何符号，如 _noon_、_1:30 PM_、_13:37_ 等等，来描述你希望一个任务发生的时间。

等待几分钟，然后在你创建的文件上运行 `cat` 或者 `tac` 命令，验证你的任务是否已经运行：


```
$ cat ~/at-test.txt
hello world
```

### 用 at 安排一个任务

你不必使用 `at` 交互式提示符来安排任务。你可以使用 `echo` 或 `printf` 向它传送命令。在这个例子中，我使用了 _now_ 符号，以及我希望任务从现在开始延迟多少分钟：


```
`$ echo "echo 'hello again' >> ~/at-test.txt" | at now +1 minute`
```

一分钟后，验证新的命令是否已被执行：


```
$ cat ~/at-test.txt
hello world
hello again
```

### 时间表达式

`at` 命令在解释时间时是非常宽容的。你可以在许多格式中选择，这取决于哪一种对你来说最方便：

  * `YYMMDDhhmm`[.ss]
（缩写的年、月、日、小时、分钟，也可选择秒）
  * `CCYYMMDDhhmm`[.ss]
(完整的年、月、日、时、分，也可选择的秒)
  * `now`
  * `midnight`
  * `noon`
  * `teatime`（4 PM）
  * `AM`
  * `PM`



时间和日期可以是绝对的，也可以加一个加号（_+_），使其与 _now_ 相对。当指定相对时间时，你可以使用你可能已经使用的词语：

  * `minutes`
  * `hours`
  * `days`
  * `weeks`
  * `months`
  * `years`



### 时间和日期语法

`at` 命令对日期的输入相比日期不那么宽容。时间必须放在第一位，接着是日期，尽管日期默认为当前日期，并且只有在为未来某天安排任务时才需要。

这些是一些有效表达式的例子：


```
$ echo "rsync -av /home/tux me@myserver:/home/tux/" | at 3:30 AM tomorrow
$ echo "/opt/batch.sh ~/Pictures" | at 3:30 AM 08/01/2022
$ echo "echo hello" | at now + 3 days
```

### 查看你的 at 队列

当你接受了 `at`，并且正在安排任务，而不是在桌子上的废纸上乱写乱画，你可能想查看一下你是否有任务还在队列中。


要查看你的 `at` 队列，使用 `atq` 命令：


```
$ atq
10 Thu Jul 29 12:19:00 2021 a tux
9 Tue Jul 27 03:30:00 2021 a tux
7 Tue Jul 27 00:00:00 2021 a tux
```

要从队列中删除一个任务，使用 `atrm` 命令和任务号。例如，要删除任务 7：


```
$ atrm 7
$ atq
10 Thu Jul 29 12:19:00 2021 a tux
9 Tue Jul 27 03:30:00 2021 a tux
```

要看一个计划中的任务的实际内容，你需要查看 `at` spool。只有 root 用户可以查看 `at` spool，所以你必须使用 `sudo` 来查看 spool 或 `cat` 任何任务的内容。

### 用 Linux at 安排任务

`at` 系统是一个很好的避免忘记在一天中晚些时候运行一个作业，或者在你离开时让你的计算机为你运行一个作业的方法。与 `cron` 不同的是，它不像 `cron` 那样要求任务必须从现在起一直按计划运行到永远，因此它的语法比 `cron` 简单得多。

等下次你有一个希望你的计算机记住并管理它的小任务，试试 `at` 命令。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-at-command

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_todo_clock_time_team.png?itok=1z528Q0y (Team checklist)
[2]: https://opensource.com/article/20/11/orchestration-vs-automation
