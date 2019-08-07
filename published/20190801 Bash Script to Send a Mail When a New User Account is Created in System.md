[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11199-1.html)
[#]: subject: (Bash Script to Send a Mail When a New User Account is Created in System)
[#]: via: (https://www.2daygeek.com/linux-bash-script-to-monitor-user-creation-send-email/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在系统创建新用户时发送邮件的 Bash 脚本
======

![](https://img.linux.net.cn/data/attachment/album/201908/07/232807l7x4j7y77555j1j5.jpg)

目前市场上有许多开源监测工具可用于监控 Linux 系统的性能。当系统到达指定的阈值时，它将发送邮件提醒。

它会监控 CPU 利用率、内存利用率、交换内存利用率、磁盘空间利用率等所有内容。但我不认为它们可以选择监控新用户创建活动，并发送提醒。

如果没有，这并不重要，因为我们可以编写自己的 bash 脚本来实现这一点。

我们过去写了许多有用的 shell 脚本。如果要查看它们，请点击以下链接。

* [如何使用 shell 脚本自动化执行日常任务？][1]

这个脚本做了什么？它监测 `/var/log/secure` 文件，并在系统创建新帐户时提醒管理员。

我们不会经常运行此脚本，因为创建用户不经常发生。但是，我打算一天运行一次这个脚本。因此，我们可以获得有关用户创建的综合报告。

如果在昨天的 `/var/log/secure` 中找到了 “useradd” 字符串，那么该脚本将向指定的邮箱发送邮件提醒，其中包含了新用户的详细信息。

**注意：**你需要更改邮箱而不是使用我们的邮箱。

```
# vi /opt/scripts/new-user.sh
```

```
#!/bin/bash

#Set the variable which equal to zero
prev_count=0
count=$(grep -i "`date --date='yesterday' '+%b %e'`" /var/log/secure | egrep -wi 'useradd' | wc -l)

if [ "$prev_count" -lt "$count" ] ; then
  # Send a mail to given email id when errors found in log
  SUBJECT="ATTENTION: New User Account is created on server : `date --date='yesterday' '+%b %e'`"
  # This is a temp file, which is created to store the email message.
  MESSAGE="/tmp/new-user-logs.txt"
  TO="2daygeek@gmail.com"
  echo  "Hostname: `hostname`" >> $MESSAGE
  echo -e "\n" >> $MESSAGE
  echo "The New User Details are below." >> $MESSAGE
  echo "+------------------------------+" >> $MESSAGE
  grep -i "`date --date='yesterday' '+%b %e'`" /var/log/secure | egrep -wi 'useradd' | grep -v 'failed adding'| awk '{print $4,$8}' | uniq | sed 's/,/ /' >>  $MESSAGE
  echo "+------------------------------+" >> $MESSAGE
  mail -s "$SUBJECT" "$TO" < $MESSAGE
  rm $MESSAGE
fi
```

给 `new-user.sh` 添加可执行权限。

```
$ chmod +x /opt/scripts/new-user.sh
```

最后添加一个 cron 任务来自动化执行它。它会在每天 7 点运行。

```
# crontab -e

0 7 * * * /bin/bash /opt/scripts/new-user.sh
```

注意：你将在每天 7 点收到一封邮件提醒，但这是昨天的日志。

你将会看到类似下面的邮件提醒。

```
# cat /tmp/logs.txt

Hostname: 2g.server10.com

The New User Details are below.
+------------------------------+
2g.server10.com name=magesh
2g.server10.com name=daygeek
+------------------------------+
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-bash-script-to-monitor-user-creation-send-email/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/shell-script/
