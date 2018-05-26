Cron 任务入门指南
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/cron-任务s1-720x340.jpg)
** Cron **是您可以在任何类 Unix 操作系统中找到的最有用的实用程序之一。它用于安排命令在特定时间执行。这些预定的命令或任务被称为 “Cron 任务”。Cron 通常用于运行计划备份，监视磁盘空间，定期删除不再需要的文件（例如日志文件），运行系统维护任务等等。在本简要指南中，我们将看到 Linux 中 Cron 任务 的基本用法。

Cron 任务入门指南

cron 任务的典型格式是：
```
Minute(0-59) Hour(0-24) Day_of_month(1-31) Month(1-12) Day_of_week(0-6) Command_to_execute
```

只需记住 cron 任务的格式或打印下面的插图并将其放在你桌面上即可。

![][2]

在上图中，星号表示特定的时间块。

要显示当前登录用户的 ** crontab ** 文件的内容：
```
$ crontab -l

```

要编辑当前用户的 cron 任务，请执行以下操作：
```
$ crontab -e
```

如果这是第一次编辑此文件，你将需要使用编辑器来编辑此文件。
```
no crontab for sk - using an empty one

Select an editor. To change later, run 'select-editor'.
1. /bin/nano <---- easiest
2. /usr/bin/vim.basic
3. /usr/bin/vim.tiny
4. /bin/ed

Choose 1-4 [1]:

```

选择适合你的编辑器。这里是一个示例crontab文件的样子。

![][3]

在这个文件中，你需要添加你的 cron 任务s。

要编辑其他用户的crontab，例如 ostechnix，请执行：
```
$ crontab -u ostechnix -e
```

让我们看看一些例子。

要 **每分钟** 执行一次 cron 任务 , 需使用如下格式.
```
* * * * * <command-to-execute>

```

要每5分钟运行一次cron 任务，请在crontab文件中添加以下内容。
```
*/5 * * * * <command-to-execute>

```

要在每 1/4 个小时（每15分钟）运行一次 cron 任务，请添加以下内容：
```
*/15 * * * * <command-to-execute>

```

要每小时的第30分钟运行一次 cron 任务，请运行：
```
30 * * * * <command-to-execute>

```

您还可以使用逗号定义多个时间间隔。例如，以下 cron 任务 每小时运行三次，分别在第 0, 5 和 10 分钟运行：
```
0,5,10 * * * * <command-to-execute>

```

每半小时运行一次 cron 任务：
```
*/30 * * * * <command-to-execute>

```

每小时运行一次：
```
0 * * * * <command-to-execute>

```

每2小时运行一次：
```
0 */2 * * * <command-to-execute>

```

每天运行一项（在00:00运行）：
```
0 0 * * * <command-to-execute>

```

每天凌晨3点运行：
```
0 3 * * * <command-to-execute>

```

每周日运行：
```
0 0 * * SUN <command-to-execute>

```

或使用，
```
0 0 * * 0 <command-to-execute>

```

它将在每周日的午夜 00:00 运行。

星期一至星期五每天运行一次，亦即每个工作日运行一次：
```
0 0 * * 1-5 <command-to-execute>

```

这项工作将于00:00开始。

每个月运行一次：
```
0 0 1 * * <command-to-execute>

```

于每月第1天的16:15运行：
```
15 16 1 * * <command-to-execute>

```

每季度运行一次，亦即每隔3个月的第1天运行：
```
0 0 1 */3 * <command-to-execute>

```

在特定月份的特定时间运行：
```
5 0 * 4 * <command-to-execute>

```

每个四月的 00:05 运行。

每6个月运行：
```
0 0 1 */6 * <command-to-execute>

```

这个定时任务将在每六个月的第一天的 00:00 运行。

每年运行：
```
0 0 1 1 * <command-to-execute>

```

这项 cron 任务将于 1 月份的第一天的 00:00 运行。

我们也可以使用以下字符串来定义任务。

@reboot 在每次启动时运行一次。 @yearly 每年运行一次。 @annually（和 @yearly 一样）。 @monthly 每月运行一次。 @weekly 每周运行一次。 @daily 每天运行一次。 @midnight （和 @daily 一样）。 @hourly 每小时运行一次。

例如，要在每次重新启动服务器时运行任务，请将此行添加到您的 crontab 文件中。
```
@reboot <command-to-execute>

```

要删除当前用户的所有 cron 任务：
```
$ crontab -r

```

还有一个名为 [** crontab.guru **] [4] 的专业网站，用于学习 cron 任务示例。这个网站提供了很多 cron 任务的例子。

有关更多详细信息，请查看手册页。
```
$ man crontab

```

那么，就是这样。到此为止，您应该对 cron 任务以及如何在世使用它们有了一个基本的了解。后续还会介绍更多的优秀工具。敬请关注！！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/a-beginners-guide-to-cron-任务s/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者KevinSJ](https://github.com/KevinSJ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/05/cron-任务-format-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/05/cron-任务s-1.png
[4]:https://crontab.guru/