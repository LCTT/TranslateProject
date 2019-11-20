[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11571-1.html)
[#]: subject: (How to Schedule and Automate tasks in Linux using Cron Jobs)
[#]: via: (https://www.linuxtechi.com/schedule-automate-tasks-linux-cron-jobs/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

如何使用 cron 任务在 Linux 中计划和自动化任务
======

有时，你可能需要定期或以预定的时间间隔执行任务。这些任务包括备份数据库、更新系统、执行定期重新引导等。这些任务称为 “cron 任务”。cron 任务用于“自动执行的任务”，它有助于简化重复的、有时是乏味的任务的执行。cron 是一个守护进程，可让你安排这些任务，然后按指定的时间间隔执行这些任务。在本教程中，你将学习如何使用 cron 来安排任务。

![Schedule -tasks-in-Linux-using cron][2]

### crontab 文件

crontab 即 “cron table”，是一个简单的文本文件，其中包含指定任务执行时间间隔的规则和命令。 crontab 文件分为两类：

1）系统范围的 crontab 文件

这些通常由需要 root 特权的 Linux 服务及关键应用程序使用。系统 crontab 文件位于 `/etc/crontab` 中，并且只能由 root 用户访问和编辑。通常用于配置系统范围的守护进程。`crontab` 文件的看起来类似如下所示：

![etc-crontab-linux][3]

2）用户创建的 crontab 文件

Linux 用户还可以在 `crontab` 命令的帮助下创建自己的 cron 任务。创建的 cron 任务将以创建它们的用户身份运行。

所有 cron 任务都存储在 `/var/spool/cron`（对于 RHEL 和 CentOS 发行版）和 `/var/spool/cron/crontabs`（对于 Debian 和 Ubuntu 发行版）中，cron 任务使用创建该文件的用户的用户名列出。

cron 守护进程在后台静默地检查 `/etc/crontab` 文件和 `/var/spool/cron` 及 `/etc/cron.d*/` 目录。

`crontab` 命令用于编辑 cron 文件。让我们看一下 crontab 文件的结构。

### crontab 文件剖析

在继续之前，我们要首先探索 crontab 文件的格式。crontab 文件的基本语法包括 5 列，由星号表示，后跟要执行的命令。

```
*    *    *    *    *    command
```

此格式也可以表示如下：

```
m h d moy dow command
```

或

```
m h d moy dow /path/to/script
```

让我们来解释一下每个条目

* `m`：代表分钟。范围是 0 到 59
* `h`：表示小时，范围是 0 到 23 
* `d`：代表一个月中的某天，范围是 1 到 31
* `moy`：这是一年中的月份。范围是 1 到 12
* `dow`：这是星期几。范围是 0 到 6，其中 0 代表星期日
* `command`：这是要执行的命令，例如备份命令、重新启动和复制命令等

### 管理 cron 任务

看完 crontab 文件的结构之后，让我们看看如何创建、编辑和删除 cron 任务。

#### 创建 cron 任务

要以 root 用户身份创建或编辑 cron 任务，请运行以下命令：

```
# crontab -e
```

要为另一个用户创建或安排 cron 任务，请使用以下语法：

```
# crontab -u username -e
```

例如，要以 Pradeep 用户身份运行 cron 任务，请发出以下命令：

```
# crontab -u Pradeep -e
```

如果该 crontab 文件尚不存在，那么你将打开一个空白文本文件。如果该 crontab 文件已经存在，则 `-e` 选项会让你编辑该文件，

#### 列出 crontab 文件

要查看已创建的 cron 任务，只需传递 `-l` 选项：

```
# crontab -l
```

#### 删除 crontab 文件

要删除 cron 任务，只需运行 `crontab -e` 并删除所需的 cron 任务行，然后保存该文件。

要删除所有的 cron 任务，请运行以下命令：

```
# crontab -r
```

然后，让我们看一下安排任务的不同方式。

### 使用 crontab 安排任务示例

如图所示，所有 cron 任务文件都带有<ruby>释伴<rt>shebang</rt></ruby>标头。

```
#!/bin/bash
```

这表示你正在使用的 shell，在这种情况下，即 bash shell。

接下来，使用我们之前指定的 cron 任务条目指定要安排任务的时间间隔。

要每天下午 12:30 重启系统，请使用以下语法：

```
30  12 *  *  * /sbin/reboot
```

要安排在凌晨 4:00 重启，请使用以下语法：

```
0  4  *  *  *  /sbin/reboot
```

注：星号 `*` 用于匹配所有记录。

要每天两次运行脚本（例如，凌晨 4:00 和下午 4:00），请使用以下语法：

```
0  4,16  *  *  *  /path/to/script
```

要安排 cron 任务在每个星期五下午 5:00 运行，请使用以下语法：

```
0  17  *  *  Fri  /path/to/script
```

或

```
0 17  *  *  *  5  /path/to/script
```

如果你希望每 30 分钟运行一次 cron 任务，请使用：

```
*/30  *  *  *  * /path/to/script
```

要安排 cron 任务每 5 小时运行一次，请运行：

```
*  */5  *  *  *  /path/to/script
```

要在选定的日期（例如，星期三和星期五的下午 6:00）运行脚本，请执行以下操作：

```
0  18  *  *  wed,fri  /path/to/script
```

要使用单个 cron 任务运行多个命令，请使用分号分隔任务，例如：

```
*  *  *  *  *  /path/to/script1 ; /path/to/script2
```

### 使用特殊字符串节省编写 cron 任务的时间

某些 cron 任务可以使用对应于特定时间间隔的特殊字符串轻松配置。例如，

1）`@hourly` 时间戳等效于 `0 * * * *`

它将在每小时的第一分钟执行一次任务。

```
@hourly /path/to/script
```

2）`@daily` 时间戳等效于 `0 0 * * *`

它在每天的第一分钟（午夜）执行任务。它可以在执行日常工作时派上用场。

```
@daily /path/to/script
```

3）`@weekly` 时间戳等效于 `0 0 * * 0`

它在每周的第一分钟执行 cron 任务，一周第一天是从星期日开始的。

```
@weekly /path/to/script
```

3）`@monthly` 时间戳等效于 `0 0 1 * *`

它在每月第一天的第一分钟执行任务。

```
@monthly /path/to/script
```

4）`@yearly` 时间戳等效于 `0 0 1 1 *`

它在每年的第一分钟执行任务，可以用于发送新年问候。

```
@yearly /path/to/script
```

### 限制 crontab 

作为 Linux 用户，你可以控制谁有权使用 `crontab` 命令。可以使用 `/etc/cron.deny` 和 `/etc/cron.allow` 文件来控制。默认情况下，只有一个 `/etc/cron.deny` 文件，并且不包含任何条目。要限制用户使用 `crontab` 实用程序，只需将用户的用户名添加到该文件中即可。当用户添加到该文件中，并且该用户尝试运行 `crontab` 命令时，他/她将遇到以下错误。

![restricted-cron-user][4]

要允许用户继续使用 `crontab` 实用程序，只需从 `/etc/cron.deny` 文件中删除用户名即可。

如果存在 `/etc/cron.allow` 文件，则仅文件中列出的用户可以访问和使用 `crontab` 实用程序。

如果两个文件都不存在，则只有 root 用户具有使用 `crontab` 命令的特权。

### 备份 crontab 条目

始终建议你备份 crontab 条目。为此，请使用语法：

```
# crontab -l > /path/to/file.txt
```

例如：

```
# crontab -l > /home/james/backup.txt
```

### 检查 cron 日志

cron 日志存储在 `/var/log/cron` 文件中。要查看 cron 日志，请运行以下命令：

```
# cat /var/log/cron
```

![view-cron-log-files-linux][5]

要实时查看日志，请使用 `tail` 命令，如下所示：

```
# tail -f /var/log/cron
```

![view-live-cron-logs][6]

### 总结

在本指南中，你学习了如何创建 cron 任务以自动执行重复性任务，如何备份和查看 cron 日志。我们希望本文提供有关 cron 作业的有用见解。请随时分享你的反馈和意见。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/schedule-automate-tasks-linux-cron-jobs/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/11/Schedule-tasks-in-Linux-using-cron.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/11/etc-crontab-linux.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/11/restricted-cron-user.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/11/view-cron-log-files-linux.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/11/view-live-cron-logs.png
