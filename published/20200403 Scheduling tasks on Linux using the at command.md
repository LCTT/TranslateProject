[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12092-1.html)
[#]: subject: (Scheduling tasks on Linux using the at command)
[#]: via: (https://www.networkworld.com/article/3535808/scheduling-tasks-on-linux-using-the-at-command.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

使用 at 命令在 Linux 上安排任务
======

> at 命令可以很容易地安排 Linux 任务在你选择的任何时间或日期运行，让我们来看看它能为你做什么。

![][0]

当你希望命令或脚本在某个特定时间运行时，你不需要将手指放在键盘上盘旋等待按下回车键，或者是在特定时间坐在办公桌前。相反，你可以通过 `at` 命令来设置任务。在本文中，我们将研究如何使用 `at` 来安排任务，如何精确地选择任务希望运行的时间，以及如何使用 `at` 来查看安排运行的任务。

### at vs cron

对于那些使用 cron 在 Linux 系统上安排任务的人来说，`at` 命令类似于 cron，因为你可以在选定的时间调度任务，但是 cron 用于定期运行的作业 —— 甚至是每年仅一次。大多数 cron 作业的频率都设置为每天、每周或每月运行一次，不过你可以控制运行的频率和时间。

另一方面，`at` 命令用于仅运行一次的任务。想在午夜重启系统？没问题，只要你有适当的权限，`at` 可以为你完成此操作。如果你希望系统在每个星期六凌晨 2 点重启，那么改用 cron。

### 使用 at

`at` 命令很容易使用，只需记住几件事。一个简单使用 `at` 的例子类似于这样：

```
$ at 5:00PM
at> date >> thisfile
at> <EOT>
```

在输入 `at` 和应该运行命令的时间，`at` 会提示你在设定时间会运行该命令（此例中是 `date` 命令）。输入 `^D`（`Ctrl + d`）来完成请求。

假设我们在下午 5 点之前设置这个 `at` 命令，那么这个日期和时间将在当天下午 5 点添加到名为 `thisfile` 文件的末尾。否则，该命令将在第二天下午 5 点运行。

与 `at` 命令进行交互时，可以输入多个命令。如果你要同时运行多个命令，只需输入多个命令行即可：

```
$ at 6:22
warning: commands will be executed using /bin/sh
at> echo first >> thisfile
at> echo second >> thisfile
at> <EOT>
```

在上面的命令中，我们使用了一个普通的用户账户，将一些简单的文本添加到该用户主目录的文件中。如果在上午 6:22 之后运行这些命令，那么命令会在第二天运行，因为 6:22 表示上午 6:22。如果你想在下午 6:22 运行，使用 `6:22 PM` 或者 `18:22`。`6:22 PM` 这样也是可以工作的。

你也可以通过使用 `at` 来安排命令在指定的日期或时间运行，例如 `10:00AM April 15 2021` 或 `noon + 5 days`（从今天起 5 天内的中午运行），以下是一些例子：

```
at 6PM tomorrow
at noon April 15 2021
at noon + 5 days
at 9:15 + 1000 days
```

在指定要运行的命令并按下 `^D` 后，你会注意到 `at` 命令为每个请求分配了一个作业编号，这个数字将显示在 `at` 命令的作业队列中。

```
$ at noon + 1000 days
warning: commands will be executed using /bin/sh
at> date >> thisfile
at> <EOT>
job 36 at Tue Dec 27 12:00:00 2022        <== job # is 36
```

### 检查队列

你可以使用 `atq`（at queue）命令来查看 `at` 作业队列：

```
$ atq
32      Thu Apr  2 03:06:00 2020 a shs
35      Mon Apr  6 12:00:00 2020 a shs
36      Tue Dec 27 12:00:00 2022 a shs
34      Thu Apr  2 18:00:00 2020 a shs
```

如果你需要取消队列中的一个作业，使用 `atrm`（at remove）命令和作业编号：

```
$ atrm 32
$ atq
35      Mon Apr  6 12:00:00 2020 a shs
36      Tue Dec 27 12:00:00 2022 a shs
34      Thu Apr  2 18:00:00 2020 a shs
```

你可以使用 `at -c` 命令来查看安排任务的详细信息，其它详细信息（活动的搜索路径等）也可以看到，但是输出的最后一行将显示计划运行的命令。

```
$ at -c 36 | tail -6
cd /home/shs || {
         echo 'Execution directory inaccessible' >&2
         exit 1
}
date >> thisfile
```

注意，该命令显示首先会测试是否可以通过 `cd` 命令进入用户目录。如果不可以，作业将退出并显示错误。如果可以，则运行在 `at` 中指定的命令。它将命令视为 “进入 `/home/shs` 或退出并显示错误”。

### 以 root 身份运行作业

要以 root 身份运行 `at` 作业，只需将 `sudo` 与你的 `at` 命令一起使用，如下所示：

```
$ sudo at 8PM
[sudo] password for shs:
warning: commands will be executed using /bin/sh
at> reboot now
at> <EOT>
job 37 at Wed Apr  1 16:00:00 2020
```

注意，root 的任务以 `root` 作为执行者显示在队列中。

```
35      Mon Apr  6 12:00:00 2020 a shs
36      Tue Dec 27 12:00:00 2022 a shs
37      Wed Apr  1 20:00:00 2020 a root         <==
```

### 运行脚本

你还可以使用 `at` 命令来运行脚本，这里有一个例子：

```
$ at 4:30PM
warning: commands will be executed using /bin/sh
at> bin/tryme
at> <EOT>
```

### 禁止使用 at 命令

`/etc/at.deny` 文件提供了一种禁止用户使用 `at` 命令的方法。默认情况下，它可能会包含一个不允许的账户列表，例如 `ftp` 和 `nobody`。可以使用 `/etc/at.allow` 文件执行相反的操作，但是通常只配置 `at.deny` 文件。

### 总结

当你要安排一项一次性任务时，无论你是希望在今天下午或几年后运行，`at` 命令都是通用且易于使用的。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3535808/scheduling-tasks-on-linux-using-the-at-command.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[0]: https://images.idgesg.net/images/article/2019/08/gettyimages-140389307-100808283-large.jpg
[1]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
