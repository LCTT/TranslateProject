配置 logrotate 的最终指导
============================================================


Generally speaking Logs are very much important part of any troubleshooting activity, However these logs grows in size with time. In this case we need to perform log cleanup manually in order to reclaim the space and its tedious task to administer these logs. To overcome this we can configure logrotate utility available in Linux which automatically does rotation, compression , removal and mailing of logfile.

We can configure logrotate utility so that each log file may be handled daily, weekly, monthly,or when it grows too large.

How logrotate utility works:

By default, the logrotate command runs as a cron job once a day from `/etc/cron.daily`, and it helps you set a policy where log-files that grow beyond a certain age or size are rotated.
一般来说，日志是任何故障排除中非常重要的一部分，但这些日志会随着时间增长。在这种情况下，我们需要手动执行日志清理，以回收空间以及管理这些日志的繁琐的任务。为了克服这个问题，我们可以在 Linux 中配置 logrotate 程序，它可以自动执行日志文件的轮换、压缩、删除和邮件发送。

我们可以配置 logrotate 程序，以便每个日志文件可以每天、每周、每月或当它变得太大时处理。

logrotate 是如何工作的：

默认情况下，logrotate 命令作为 cron 作业从 /etc/cron.daily 中每天运行一次，它会帮助你设置一个策略，其中超过某个时间或大小的日志文件被轮换。

命令： `/usr/sbin/logrotate`

配置文件： `/etc/logrotate.conf`

这是 logrotate 的主配置文件。logrotate 还在 “`/etc/logrotate.d/`” 中存储了特殊服务配置。确保下面的那行包含在 `/etc/logrotate.conf` 中，以读取特定服务日志配置。

` include  /etc/logrotate.d`

logrotate 历史: `/var/lib/logrotate.status`

重要的 logrotate 选项：


```
compress             --> 压缩日志文件的所有非当前版本
daily,weekly,monthly --> 按指定计划上轮换日志文件
delaycompress        --> 压缩所有版本，除了当前和下一个最近的
endscript            --> 标记 prerotate 或 postrotate 脚本的结束
errors "emailid"     --> 给指定邮箱发送错误通知
missingok            --> 如果日志文件丢失，不要显示错误
notifempty           --> 如果日志文件为空，则不轮换日志文件
olddir "dir"         --> 指定日志文件的旧版本放在 “dir” 中
postrotate           --> 引入一个在日志被轮换后执行的脚本
prerotate            --> 引入一个在日志被轮换前执行的脚本
rotate 'n'           --> 在轮换方案中包含日志的 N 个版本
sharedscripts        --> 对于整个日志组只运行一次脚本
size='logsize'       --> 在日志大小大于 logsize（例如100K，4M）时轮换
```

让我们为我们自己的示例日志文件 “`/tmp/sample_output.log`” 配置 logrotate。

第一步：在 “`/etc/logrotate.conf`” 中添加下面的行。

```
/tmp/sample_output.log {
size 1k
create 700 root root
rotate 4
compress
}
```

在上面的配置文件中：

*   size 1k - logrotate 仅在文件大小等于（或大于）此大小时运行。
*   create - 轮换原始文件并创建具有指定权限、用户和组的新文件。
*   rotate - 限制日志文件轮转的数量。因此，这将只保留最近的4个轮转的日志文件。
*   compress - 这将压缩文件。

第二步：通常，你需要等待一天直到 logrotate 在 `/etc/cron.daily` 中执行。如此之外，你可以用下面的命令在命令行中运行：

```
/usr/sbin/logrotate  /etc/logrotate.conf
```

在执行 logrotate 命令之前的输出：

```
[root@rhel1 tmp]# ls -l /tmp/
total 28
-rw-------. 1 root root 20000 Jan 1 05:23 sample_output.log
```

在执行 logrotate 之后的输出：

```
[root@rhel1 tmp]# ls -l /tmp
total 12
-rwx------. 1 root root 0 Jan 1 05:24 sample_output.log
-rw-------. 1 root root 599 Jan 1 05:24 sample_output.log-20170101.gz
[root@rhel1 tmp]#
```

这样就能确认 logrotate 成功实现了。

--------------------------------------------------------------------------------

作者简介：

大家好！我是 Manmohan Mirkar。我很高兴你们在这里！我在 10 多年前开始使用 Linux，我从来没有想过我会到今天这个地步。我的激情是帮助你们获取 Linux 知识。谢谢你们在这！

--------------------------------------------------------------------------------

via: http://www.linuxroutes.com/configure-logrotate/

作者：[Manmohan Mirkar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxroutes.com/author/admin/
[1]:http://www.linuxroutes.com/configure-logrotate/#
[2]:http://www.linuxroutes.com/configure-logrotate/#
[3]:http://www.linuxroutes.com/configure-logrotate/#
[4]:http://www.linuxroutes.com/configure-logrotate/#
[5]:http://www.linuxroutes.com/configure-logrotate/#
[6]:http://www.linuxroutes.com/configure-logrotate/#
[7]:http://www.linuxroutes.com/configure-logrotate/#
[8]:http://www.linuxroutes.com/configure-logrotate/#
[9]:http://www.linuxroutes.com/configure-logrotate/#
[10]:http://www.linuxroutes.com/configure-logrotate/#
[11]:http://www.linuxroutes.com/configure-logrotate/#
[12]:http://www.linuxroutes.com/author/admin/
[13]:http://www.linuxroutes.com/configure-logrotate/#respond
[14]:http://www.linuxroutes.com/configure-logrotate/#
