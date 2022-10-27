[#]: subject: (How to use cron on Linux)
[#]: via: (https://opensource.com/article/21/7/cron-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (perfiffer)
[#]: reviewer: (turbokernel)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13644-1.html)

如何在 Linux 上使用 cron 定时器
======

> cron 定时器是一个可以按照计划自动运行命令的工具。

![](https://img.linux.net.cn/data/attachment/album/202108/03/132733qhmt6mavtbh66m5j.jpg)

cron 定时器是一个可以按照计划自动运行命令的工具。定时器作业称为 cronjob，创建于 `crontab` 文件中。这是用户自动操作电脑的最简单也是最古老的方法。

### 创建一个 cronjob

要创建一个 cronjob，你可以使用 `crontab` 命令，并添加 `-e` 选项：

```
$ crontab -e
```

这将使用默认的文本编辑器打开 `crontab`。如需指定文本编辑器，请使用 `EDITOR` [环境变量][1]：

```
$ EDITOR=nano crontab -e
```

### Cron 语法

如需调度一个 cronjob，你需要提供给计算机你想要执行的命令，然后提供一个 cron 表达式。cron 表达式在命令调度时运行：
  
  * 分钟（0 到 59）
  * 小时（0 到 23, 0 代表午夜执行）
  * 日期（1 到 31）
  * 月份（1 到 12）
  * 星期（0 到 6, 星期天是 0）

星号 （`*`） 代表的是“每一个”。例如，下面的表达式在每月每日每小时的 0 分钟运行备份脚本：

```
/opt/backup.sh 0 * * * *
```

下面的表达式在周日的凌晨 3:30 运行备份脚本：

```
/opt/backup.sh 30 3 * * 0
```

### 简写语法

现代的 cron 支持简化的宏，而不是 cron 表达式：

  * `@hourly` 在每天的每小时的 0 分运行
  * `@daily` 在每天的 0 时 0 分运行
  * `@weekly` 在周日的 0 时 0 分运行
  * `@monthly` 在每月的第一天的 0 时 0 分运行

例如，下面的 `crontab` 命令在每天的 0 时运行备份脚本：

```
/opt/backup.sh @daily
```

### 如何停止一个 cronjob

一旦你开始了一个 cronjob，它就会永远按照计划运行。想要在启动后停止 cronjob，你必须编辑 `crontab`，删除触发该作业的命令行，然后保存文件。

```
$ EDITOR=nano crontab -e
```

如需停止一个正在运行的作业，可以 [使用标准的 Linux 进程命令][3] 来停止一个正在运行的进程。

### 它是自动的

一旦你编写完 `crontab`，保存了文件并且退出了编辑器。你的 cronjob 就已经被调度了，剩下的工作都交给 cron 完成。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/cron-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/cron-splash.png?itok=AoBigzts (Cron expression)
[2]: https://opensource.com/article/19/8/what-are-environment-variables
[3]: https://opensource.com/article/18/5/how-kill-process-stop-program-linux
