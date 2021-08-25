[#]: subject: "4 alternatives to cron in Linux"
[#]: via: "https://opensource.com/article/21/7/alternatives-cron-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13716-1.html"

Linux 中 cron 系统的 4 种替代方案
======

> 在 Linux 系统中有一些其他开源项目可以结合或者替代 cron 系统使用。

![](https://img.linux.net.cn/data/attachment/album/202108/25/104033ro6lasn54lq25r2l.jpg)

[Linux cron 系统][2] 是一项经过时间检验的成熟技术，然而在任何情况下它都是最合适的系统自动化工具吗？答案是否定的。有一些开源项目就可以用来与 cron 结合或者直接代替 cron 使用。

### at 命令

cron 适用于长期重复任务。如果你设置了一个工作任务，它会从现在开始定期运行，直到计算机报废为止。但有些情况下你可能只想设置一个一次性命令，以备不在计算机旁时该命令可以自动运行。这时你可以选择使用 `at` 命令。

`at` 的语法比 cron 语法简单和灵活得多，并且兼具交互式和非交互式调度方法。（只要你想，你甚至可以使用 `at` 作业创建一个 `at` 作业。）

```
$ echo "rsync -av /home/tux/ me@myserver:/home/tux/" | at 1:30 AM
```

该命令语法自然且易用，并且不需要用户清理旧作业，因为它们一旦运行后就完全被计算机遗忘了。

阅读有关 [at 命令][3] 的更多信息并开始使用吧。

### systemd

除了管理计算机上的进程外，`systemd` 还可以帮你调度这些进程。与传统的 cron 作业一样，systemd 计时器可以在指定的时间间隔触发事件，例如 shell 脚本和命令。时间间隔可以是每月特定日期的一天一次（例如在星期一的时候触发），或者在 09:00 到 17:00 的工作时间内每 15 分钟一次。

此外 systemd 里的计时器还可以做一些 cron 作业不能做的事情。

例如，计时器可以在一个事件 _之后_ 触发脚本或程序来运行特定时长，这个事件可以是开机，可以是前置任务的完成，甚至可以是计时器本身调用的服务单元的完成！

如果你的系统运行着 systemd 服务，那么你的机器就已经在技术层面上使用 systemd 计时器了。默认计时器会执行一些琐碎的任务，例如滚动日志文件、更新 mlocate 数据库、管理 DNF 数据库等。创建自己的计时器很容易，具体可以参阅 David Both 的文章 [使用 systemd 计时器来代替 cron][4]。

### anacron 命令

cron 专门用于在特定时间运行命令，这适用于从不休眠或断电的服务器。然而对笔记本电脑和台式工作站而言，时常有意或无意地关机是很常见的。当计算机处于关机状态时，cron 不会运行，因此设定在这段时间内的一些重要工作（例如备份数据）也就会跳过执行。

anacron 系统旨在确保作业定期运行，而不是按计划时间点运行。这就意味着你可以将计算机关机几天，再次启动时仍然靠 anacron 来运行基本任务。anacron 与 cron 协同工作，因此严格来说前者不是后者的替代品，而是一种调度任务的有效可选方案。许多系统管理员配置了一个 cron 作业来在深夜备份远程工作者计算机上的数据，结果却发现该作业在过去六个月中只运行过一次。anacron 确保重要的工作在 _可执行的时候_ 发生，而不是必须在安排好的 _特定时间点_ 发生。

点击参阅关于 [使用 anacron 获得更好的 crontab 效果][5] 的更多内容。

### 自动化

计算机和技术旨在让人们的生活更美好，工作更轻松。Linux 为用户提供了许多有用的功能，以确保完成重要的操作系统任务。查看这些可用的功能，然后试着将这些功能用于你自己的工作任务吧。（LCTT 译注：作者本段有些语焉不详，读者可参阅譬如 [Ansible 自动化工具安装、配置和快速入门指南](https://linux.cn/article-13142-1.html) 等关于 Linux 自动化的文章）

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/alternatives-cron-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/clocks_time.png?itok=_ID09GDk (Alarm clocks with different time)
[2]: https://opensource.com/article/21/7/cron-linux
[3]: https://opensource.com/article/21/7/intro-command
[4]: https://opensource.com/article/20/7/systemd-timers
[5]: https://opensource.com/article/21/2/linux-automation
