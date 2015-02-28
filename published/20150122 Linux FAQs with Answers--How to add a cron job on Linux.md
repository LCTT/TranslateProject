Linux 有问必答： 如何在Linux中加入cron任务
================================================================================
> **提问**： 我想在我的Linux中安排一个计划任务，该任务在固定时间周期性地运行。我该如何在Linux中添加一个cron任务？

cron是Linux中默认的计划任务。使用cron，你可以安排一个计划（比如：命令或者shell脚本）周期性地运行或者在指定的分钟、小时、天、周、月等特定时间运行。cron在你安排不同的常规维护任务时是很有用的，比如周期性地备份、日志循环、检查文件系统、监测磁盘空间等等。

### 从命令行中添加cron任务 ###

要添加cron任务，你可以使用称为crontab的命令行工具。

输入下面的命令会创建一个以当前用户运行的新cron任务。

    $ crontab -e

如果你想要以其他用户运行cron任务，输入下面的命令。

    $ sudo crontab -u <username> -e

你将会看见一个文本编辑窗口，这里你可以添加或者编辑cron任务。默认使用nono编辑器。

![](https://farm9.staticflickr.com/8586/16200331362_1385807ac0_b.jpg)

每个cron任务的格式如下。

    <分钟> <小时> <日> <月> <星期> <命令>

前5个元素定义了任务的计划，最后一个元素是命令或者脚本的完整路径。

![](https://farm8.staticflickr.com/7472/16199272841_dffe0b2873_b.jpg)

下面是一些cron任务示例。

- **\* * * * * /home/dan/bin/script.sh**: 每分钟运行。
- **0 * * * * /home/dan/bin/script.sh**: 每小时运行。
- **0 0 * * * /home/dan/bin/script.sh**: 每天零点运行。
- **0 9,18 * * * /home/dan/bin/script.sh**: 在每天的9AM和6PM运行。
- **0 9-18 * * * /home/dan/bin/script.sh**: 在9AM到6PM的每个小时运行。
- **0 9-18 * * 1-5 /home/dan/bin/script.sh**: 周一到周五的9AM到6PM每小时运行。
- **\*/10 * * * * /home/dan/bin/script.sh**: 每10分钟运行。

一旦完成上面的设置步骤后，按下Ctrl+X来保存并退出编辑器。此时，新增的计划任务应该已经激活了。

要查看存在的计划任务，使用下面的命令：

    $ crontab -l

### 从GUI添加计划任务 ###

如果你在Linux桌面环境中，你可以使用crontab的更加友好的GUI前端来添加或者添加一个cron任务。

在Gnome桌面中，有一个Gnome Schedule（gnome-schedule包）。

![](https://farm8.staticflickr.com/7484/16015054699_d96f0e9b6a_c.jpg)

在KDE桌面中，有一个Task Scheduler（kcron包）。

![](https://farm8.staticflickr.com/7473/16175298266_825376c901_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/add-cron-job-linux.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出