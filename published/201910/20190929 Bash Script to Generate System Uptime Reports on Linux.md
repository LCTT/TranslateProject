[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11455-1.html)
[#]: subject: (Bash Script to Generate System Uptime Reports on Linux)
[#]: via: (https://www.2daygeek.com/bash-script-generate-linux-system-uptime-reports/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

生成 Linux 运行时间报告的 Bash 脚本
======

出于一些原因，你可能需要每月收集一次 [Linux 系统运行时间][1]报告。如果是这样，你可以根据需要使用以下 [bash 脚本][2] 之一。

我们为什么要收集这份报告？在一段时间后重启 Linux 服务器是解决某些未解决问题的好方法。（LCTT 译注：本文这些观点值得商榷，很多服务器可以稳定运行几千天，尤其是有了内核热补丁之后，启动并不是必须的。）

建议每 180 天重新启动一次。但时间段也许取决于你公司的政策。如果你已经长时间运行服务器而没有重启。这可能导致服务器上出现一些性能或内存问题，我在许多服务器上都注意到了这一点。

这些脚本一次性提供了所有系统运行报告。

### 什么是 uptime 命令

`uptime` 命令将告诉你系统已经运行了多长时间。它在一行中显示以下信息：当前时间、系统运行了多长时间、当前登录了多少用户以及过去 1、5 和 15 分钟的平均系统负载。

### 什么是 tuptime?

[tuptime][3] 是用于报告系统的历史和统计运行时间的工具，可在重启之间保存。它类似于 `uptime` 命令，但输出更有趣。

### 1）检查 Linux 系统运行时间的 Bash 脚本

该 bash 脚本将收集所有服务器正常运行时间，并将报告发送到给定的电子邮箱地址。

请替换为你的电子邮箱地址，而不是用我们的，否则你将不会收到邮件。

```
# vi /opt/scripts/system-uptime-script.sh

#!/bin/bash
> /tmp/uptime-report.out
for host in cat /tmp/servers.txt
do
echo -n "$host: "
ssh $host uptime | awk '{print $3,$4}' | sed 's/,//'
done | column -t >> /tmp/uptime-report.out
cat /tmp/uptime-report.out | mail -s "Linux Servers Uptime Report" "2daygeek@gmail.com"
```

给 `system-uptime-script.sh` 设置可执行权限。

```
$ chmod +x /opt/scripts/system-uptime-script.sh
```

最后运行 bash 脚本获取输出。

```
# sh /opt/scripts/system-uptime-script.sh
```

你将收到类似以下的报告。

```
# cat /tmp/uptime-report.out

192.168.1.5:          2      days
192.168.1.6:          15     days
192.168.1.7:          30     days
192.168.1.8:          7      days
192.168.1.9:          67     days
192.168.1.10:         130    days
192.168.1.11:         23     days
```

### 2）检查 Linux 系统是否运行了 30 天以上的 Bash 脚本

此 bash 脚本会收集运行 30 天以上的服务器，并将报告发送到指定的邮箱地址。你可以根据需要更改天数。

```
# vi /opt/scripts/system-uptime-script-1.sh

#!/bin/bash
> /tmp/uptime-report-1.out 
for host in cat /tmp/servers.txt
do
echo -n "$host: "
ssh $host uptime | awk '{print $3,$4}' | sed 's/,//'
done | column -t >> /tmp/uptime-report-1.out
cat /tmp/uptime-report-1.out | awk ' $2 >= 30' > /tmp/uptime-report-2.out
cat /tmp/uptime-report-2.out | mail -s "Linux Servers Uptime Report" "2daygeek@gmail.com"
```

给 `system-uptime-script-1.sh` 设置可执行权限。

```
$ chmod +x /opt/scripts/system-uptime-script-1.sh
```

最后添加一条 [cronjob][4] 来自动执行。它会在每天早上 7 点运行。

```
# crontab -e

0 7 * * * /bin/bash /opt/scripts/system-uptime-script-1.sh
```

**注意：** 你会在每天早上 7 点会收到一封电子邮件提醒，它是昨天的详情。

你将收到类似下面的报告。

```
# cat /tmp/uptime-report-2.out

192.168.1.7:          30     days
192.168.1.9:          67     days
192.168.1.10:         130    days
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bash-script-generate-linux-system-uptime-reports/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-system-server-uptime-check/
[2]: https://www.2daygeek.com/category/shell-script/
[3]: https://www.2daygeek.com/linux-tuptime-check-historical-uptime/
[4]: https://www.2daygeek.com/crontab-cronjob-to-schedule-jobs-in-linux/
