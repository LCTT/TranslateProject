[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11362-1.html)
[#]: subject: (Bash Script to Send a Mail About New User Account Creation)
[#]: via: (https://www.2daygeek.com/linux-shell-script-to-monitor-user-creation-send-email/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

用 Bash 脚本发送新用户帐户创建的邮件
======

![](https://img.linux.net.cn/data/attachment/album/201909/20/093308a615tcuiopctvp5t.jpg)

出于某些原因，你可能需要跟踪 Linux 上的新用户创建信息。同时，你可能需要通过邮件发送详细信息。这或许是审计目标的一部分，或者安全团队出于跟踪目的可能希望对此进行监控。

我们可以通过其他方式进行此操作，正如我们在上一篇文章中已经描述的那样。

* [在系统中创建新用户帐户时发送邮件的 Bash 脚本][1]

Linux 有许多开源监控工具可以使用。但我不认为他们有办法跟踪新用户创建过程，并在发生时提醒管理员。

那么我们怎样才能做到这一点？

我们可以编写自己的 Bash 脚本来实现这一目标。我们过去写过许多有用的 shell 脚本。如果你想了解，请进入下面的链接。

* [如何使用 shell 脚本自动化日常活动？][2]

### 这个脚本做了什么？

这将每天两次（一天的开始和结束）备份 `/etc/passwd` 文件，这将使你能够获取指定日期的新用户创建详细信息。

我们需要添加以下两个 cron 任务来复制 `/etc/passwd` 文件。

```
# crontab -e

1 0 * * * cp /etc/passwd /opt/scripts/passwd-start-$(date +"%Y-%m-%d")
59 23 * * * cp /etc/passwd /opt/scripts/passwd-end-$(date +"%Y-%m-%d")
```

它使用 `diff` 命令来检测文件之间的差异，如果发现与昨日有任何差异，脚本将向指定 email 发送新用户详细信息。

我们不用经常运行此脚本，因为用户创建不经常发生。但是，我们计划每天运行一次此脚本。

这样，你可以获得有关新用户创建的综合报告。

**注意：**我们在脚本中使用了我们的电子邮件地址进行演示。因此，我们要求你用自己的电子邮件地址。

```
# vi /opt/scripts/new-user-detail.sh

#!/bin/bash
mv /opt/scripts/passwd-start-$(date --date='yesterday' '+%Y-%m-%d') /opt/scripts/passwd-start
mv /opt/scripts/passwd-end-$(date --date='yesterday' '+%Y-%m-%d') /opt/scripts/passwd-end
ucount=$(diff /opt/scripts/passwd-start /opt/scripts/passwd-end | grep ">" | cut -d":" -f6 | cut -d"/" -f3 | wc -l)
if [ $ucount -gt 0 ]
then
  SUBJECT="ATTENTION: New User Account is created on server : `date --date='yesterday' '+%b %e'`"
  MESSAGE="/tmp/new-user-logs.txt"
  TO="2daygeek@gmail.com"
  echo  "Hostname: `hostname`" >> $MESSAGE
  echo -e "\n" >> $MESSAGE
  echo "The New User Details are below." >> $MESSAGE
  echo "+------------------------------+" >> $MESSAGE
  diff /opt/scripts/passwd-start /opt/scripts/passwd-end | grep ">" | cut -d":" -f6 | cut -d"/" -f3 >>  $MESSAGE
  echo "+------------------------------+" >> $MESSAGE
  mail -s "$SUBJECT" "$TO" < $MESSAGE
  rm $MESSAGE
fi 
```

给 `new-user-detail.sh` 文件添加可执行权限。

```
$ chmod +x /opt/scripts/new-user-detail.sh
```

最后添加一个 cron 任务来自动执行此操作。它在每天早上 7 点运行。

```
# crontab -e

0 7 * * * /bin/bash /opt/scripts/new-user.sh
```

**注意：**你会在每天早上 7 点都会收到一封关于昨日详情的邮件提醒。

**输出：**输出与下面的输出相同。

```
# cat /tmp/new-user-logs.txt

Hostname: CentOS.2daygeek.com

The New User Details are below.
+------------------------------+
tuser3
+------------------------------+
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-shell-script-to-monitor-user-creation-send-email/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-bash-script-to-monitor-user-creation-send-email/
[2]: https://www.2daygeek.com/category/shell-script/
