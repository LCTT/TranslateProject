[#]: subject: (Systemd Timers for Scheduling Tasks)
[#]: via: (https://fedoramagazine.org/systemd-timers-for-scheduling-tasks/)
[#]: author: (Richard England https://fedoramagazine.org/author/rlengland/)
[#]: collector: (lujun9972)
[#]: translator: (dcoliversun)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13522-1.html)

用于调度任务的 systemd 定时器
======

![](https://img.linux.net.cn/data/attachment/album/202106/25/175650j4wrdw0z884iod80.jpg )

systemd 提供定时器有一段时间了，定时器替代了 cron 功能，这一特性值得看看。本文将向你介绍在系统启动后如何使用 systemd 中的定时器来运行任务，并在此后重复运行。这不是对 systemd 的全面讨论，只是对此特性的一个介绍。

### 快速回顾：cron、anacron 与 systemd

cron 可以以几分钟到几个月或更长时间的粒度调度运行一个任务。设置起来相对简单，它只需要一个配置文件。虽然配置过程有些深奥，但一般用户也可以使用。

然而，如果你的系统在需要执行的时间没有运行，那么 cron 会失败。

anacron 克服了“系统没有运行”的问题。它确保任务将在你的系统再次启动时执行。虽然它旨在给管理员使用，但有些系统允许普通用户访问 anacron。

但是，anacron 的执行频率不能低于每天一次。

cron 和 anacron 都存在执行上下文一致性的问题。必须注意任务运行时有效的环境与测试时使用的环境完全相同。必须提供相同的 shell、环境变量和路径。这意味着测试和调试有时会很困难。

systemd 定时器提供了 cron 和 anacron 二者的优点，允许调度到分钟粒度。确保在系统再次运行时执行任务，即使在预期的执行时间内系统处于关闭状态。它对所有用户都可用。你可以在它将要运行的环境中测试和调试执行。

但是，它的配置更加复杂，至少需要两个配置文件。

如果你的 cron 和 anacron 配置可以很好地为你服务，那么可能没有理由改变。但是 systemd 至少值得研究，因为它可以简化任何当前的 cron/anacron 工作方式。

### 配置

systemd 定时器执行功能至少需要两个文件。这两个是“<ruby>定时器单元<rt>timer unit</rt></ruby>”和“<ruby>服务单元<rt>service unit</rt></ruby>”。（其执行的）“动作”不仅仅是简单的命令，你还需要一个“作业”文件或脚本来执行必要的功能。

定时器单元文件定义调度表，而服务单元文件定义执行的任务。有关的更多详细信息请参考 `man systemd.timer` 中提供的 .timer 单元。服务单元的详细信息可在 `man systemd.service` 中找到。

单元文件存放在几个位置（在手册页中有列出）。然而，对于普通用户来说，最容易找到的位置可能是 `~/.config/systemd/user`。请注意，这里的 `user` 是字符串 `user`。

### 示例

此示例是一个创建用户调度作业而不是（以 root 用户身份运行的）系统调度作业的简单示例。它将消息、日期和时间打印到文件中。

1、首先创建一个执行任务的 shell 脚本。在你的本地 `bin` 目录中创建它，例如在 `~/bin/schedule-test.sh` 中。

创建文件：

```
touch ~/bin/schedule-test.sh
```

然后将以下内容添加到你刚刚创建的文件中：

```
#!/bin/sh
echo "This is only a test: $(date)" >> "$HOME/schedule-test-output.txt"
```

记住赋予你的 shell 脚本执行权限。

2、创建 .service 单元调用上面的脚本。在以下位置创建目录与文件：`~/.config/systemd/user/schedule-test.service`：

```
[Unit]
Description=A job to test the systemd scheduler

[Service]
Type=simple
ExecStart=/home/<user>/bin/schedule-test.sh

[Install]
WantedBy=default.target
```

请注意 `<user>` 应该是你的家目录地址，但是单元文件路径名中的 `user` 实际上是字符串 `user`。

`ExecStart` 应该提供一个没有变量的绝对地址。例外情况是，对于用户单元文件，你可以用 `%h` 替换 `$HOME`。换句话说，你可以使用:

```
ExecStart=%h/bin/schedule-test.sh
```

这仅用于用户单元文件，而不适用于系统服务，因为在系统环境中运行时 `%h` 总是返回 `/root`。其他特殊符号可在 `man systemd.unit` 的 `SPECIFIERS` 中找到。因为它超出了本文的范围，所以这就是我们目前需要了解的关于特殊符号的全部内容。

3、创建一个 .timer 单元文件，该文件实际上调度你创建的 .service 单元文件。在 .service 单元文件相同位置创建它：`~/.config/systemd/user/schedule-test.timer`。请注意，文件名仅在扩展名上有所不同，例如一个是 `.service`，一个是 `.timer`。

```
[Unit]
Description=Schedule a message every 1 minute
RefuseManualStart=no  # Allow manual starts
RefuseManualStop=no   # Allow manual stops

[Timer]
#Execute job if it missed a run due to machine being off
Persistent=true
#Run 120 seconds after boot for the first time
OnBootSec=120
#Run every 1 minute thereafter
OnUnitActiveSec=60
#File describing job to execute
Unit=schedule-test.service

[Install]
WantedBy=timers.target
```

请注意，这个 .timer 单元文件使用了 `OnUnitActiveSec` 来指定调度表。`OnCalendar` 选项更加灵活。例如:

```
# run on the minute of every minute every hour of every day
 OnCalendar=*-*-* *:*:00
# run on the hour of every hour of every day
 OnCalendar=*-*-* *:00:00
# run every day
 OnCalendar=*-*-* 00:00:00
# run 11:12:13 of the first or fifth day of any month of the year
# 2012, but only if that day is a Thursday or Friday
 OnCalendar=Thu,Fri 2012-*-1,5 11:12:13
```

有关 `OnCalendar` 的更多信息参见 [这里][2]。

4、所有的部件都已就位，但你应该进行测试，以确保一切正常。首先，启用该用户服务:

```
$ systemctl --user enable schedule-test.service
```

这将导致类似如下的输出:

```
Created symlink /home/<user>/.config/systemd/user/default.target.wants/schedule-test.service → /home/<user>/.config/systemd/user/schedule-test.service.
```

现在执行测试工作：

```
$ systemctl --user start schedule-test.service
```

检查你的输出文件（`$HOME/schedule-test-output.txt`），确保你的脚本运行正常。应该只有一个条目，因为我们还没有启动定时器。必要时进行调试。如果你需要更改 .service 单元文件，而不是更改它调用的 shell 脚本，请不要忘记再次启用该服务。

5、一旦作业正常运行，通过为服务启用、启动用户定时器来实时调度作业：

```
$ systemctl --user enable schedule-test.timer
$ systemctl --user start schedule-test.timer
```

请注意，你已经在上面的步骤 4 中启动、启用了服务，因此只需要为它启用、启动定时器。

`enable` 命令会产生如下输出：

```
Created symlink /home/<user>/.config/systemd/user/timers.target.wants/schedule-test.timer → /home/<user>/.config/systemd/user/schedule-test.timer.
```

`start` 命令将只是返回命令行界面提示符。

### 其他操作

你可以检查和监控服务。如果你从系统服务收到错误，下面的第一个命令特别有用：

```
$ systemctl --user status schedule-test
$ systemctl --user list-unit-files
```

手动停止服务：

```
$ systemctl --user stop schedule-test.service
```

永久停止并禁用定时器和服务，重新加载守护程序配置并重置任何失败通知：

```
$ systemctl --user stop schedule-test.timer
$ systemctl --user disable schedule-test.timer
$ systemctl --user stop schedule-test.service
$ systemctl --user disable schedule-test.service
$ systemctl --user daemon-reload
$ systemctl --user reset-failed
```

### 总结

本文以 systemd 定时器为出发点，但是 systemd 的内容远不止于此。这篇文章应该为你提供一个基础。你可以从 [Fedora Magazine systemd 系列][3] 开始探索更多。

### 参考

更多阅读：

  * `man systemd.timer`
  * `man systemd.service`
  * [Use systemd timers instead of cronjobs][4]
  * [Understanding and administering systemd][5]
  * <https://opensource.com/> 内有 systemd 速查表

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/systemd-timers-for-scheduling-tasks/

作者：[Richard England][a]
选题：[lujun9972][b]
译者：[dcoliversun](https://github.com/dcoliversun)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rlengland/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/06/schedule_withsystemdtimer-816x345.jpg
[2]: https://www.freedesktop.org/software/systemd/man/systemd.time.html#Calendar%20Events
[3]: https://fedoramagazine.org/what-is-an-init-system/
[4]: https://opensource.com/article/20/7/systemd-timers
[5]: https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/
