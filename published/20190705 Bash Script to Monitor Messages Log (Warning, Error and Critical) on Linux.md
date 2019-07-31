[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11171-1.html)
[#]: subject: (Bash Script to Monitor Messages Log (Warning, Error and Critical) on Linux)
[#]: via: (https://www.2daygeek.com/linux-bash-script-to-monitor-messages-log-warning-error-critical-send-email/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 Linux 上用 Bash 脚本监控 messages 日志
======

目前市场上有许多开源监控工具可用于监控 Linux 系统的性能。当系统达到指定的阈值限制时，它将发送电子邮件警报。它可以监视 CPU 利用率、内存利用率、交换利用率、磁盘空间利用率等所有内容。

如果你只有很少的系统并且想要监视它们，那么编写一个小的 shell 脚本可以使你的任务变得非常简单。

在本教程中，我们添加了一个 shell 脚本来监视 Linux 系统上的 messages 日志。

我们过去添加了许多有用的 shell 脚本。如果要查看这些内容，请导航至以下链接。

- [如何使用 shell 脚本监控系统的日常活动？][1]

此脚本将检查 `/var/log/messages` 文件中的 “warning“、“error” 和 “critical”，如果发现任何有关的东西，就给指定电子邮件地址发邮件。

如果服务器有许多匹配的字符串，我们就不能经常运行这个可能填满收件箱的脚本，我们可以在一天内运行一次。

为了解决这个问题，我让脚本以不同的方式触发电子邮件。

如果 `/var/log/messages` 文件中昨天的日志中找到任何给定字符串，则脚本将向给定的电子邮件地址发送电子邮件警报。

**注意：**你需要更改电子邮件地址，而不是我们的电子邮件地址。

```
# vi /opt/scripts/os-log-alert.sh
```

```
#!/bin/bash
#Set the variable which equal to zero
prev_count=0

count=$(grep -i "`date --date='yesterday' '+%b %e'`" /var/log/messages | egrep -wi 'warning|error|critical' | wc -l)

if [ "$prev_count" -lt "$count" ] ; then
    # Send a mail to given email id when errors found in log
    SUBJECT="WARNING: Errors found in log on "`date --date='yesterday' '+%b %e'`""
    # This is a temp file, which is created to store the email message.
    MESSAGE="/tmp/logs.txt"
    TO="2daygeek@gmail.com"
    echo "ATTENTION: Errors are found in /var/log/messages. Please Check with Linux admin." >> $MESSAGE
    echo  "Hostname: `hostname`" >> $MESSAGE
    echo -e "\n" >> $MESSAGE
    echo "+------------------------------------------------------------------------------------+" >> $MESSAGE
    echo "Error messages in the log file as below" >> $MESSAGE
    echo "+------------------------------------------------------------------------------------+" >> $MESSAGE
    grep -i "`date --date='yesterday' '+%b %e'`" /var/log/messages | awk '{ $3=""; print}' | egrep -wi 'warning|error|critical' >>  $MESSAGE
    mail -s "$SUBJECT" "$TO" < $MESSAGE
    #rm $MESSAGE
fi
```

为 `os-log-alert.sh` 文件设置可执行权限。

```
$ chmod +x /opt/scripts/os-log-alert.sh
```

最后添加一个 cron 任务来自动执行此操作。它将每天 7 点钟运行。

```
# crontab -e
```

```
0 7 * * * /bin/bash /opt/scripts/os-log-alert.sh
```

**注意：**你将在每天 7 点收到昨天日志的电子邮件提醒。

**输出：**你将收到类似下面的电子邮件提醒。

```
ATTENTION: Errors are found in /var/log/messages. Please Check with Linux admin.

+-----------------------------------------------------+
Error messages in the log file as below
+-----------------------------------------------------+
Jul  3 02:40:11 ns1 kernel: php-fpm[3175]: segfault at 299 ip 000055dfe7cc7e25 sp 00007ffd799d7d38 error 4 in php-fpm[55dfe7a89000+3a7000]
Jul  3 02:50:14 ns1 kernel: lmtp[8249]: segfault at 20 ip 00007f9cc05295e4 sp 00007ffc57bca1a0 error 4 in libdovecot-storage.so.0.0.0[7f9cc04df000+148000]
Jul  3 15:36:09 ns1 kernel: php-fpm[17846]: segfault at 299 ip 000055dfe7cc7e25 sp 00007ffd799d7d38 error 4 in php-fpm[55dfe7a89000+3a7000]
Jul  3 15:45:54 ns1 pure-ftpd: (?@5.188.62.5) [WARNING] Authentication failed for user [daygeek]
Jul  3 16:25:36 ns1 pure-ftpd: (?@104.140.148.58) [WARNING] Sorry, cleartext sessions and weak ciphers are not accepted on this server.#012Please reconnect using TLS security mechanisms.
Jul  3 16:44:20 ns1 kernel: php-fpm[8979]: segfault at 299 ip 000055dfe7cc7e25 sp 00007ffd799d7d38 error 4 in php-fpm[55dfe7a89000+3a7000]
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-bash-script-to-monitor-messages-log-warning-error-critical-send-email/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/shell-script/
