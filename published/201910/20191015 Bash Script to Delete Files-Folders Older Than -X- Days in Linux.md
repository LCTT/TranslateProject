[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11490-1.html)
[#]: subject: (Bash Script to Delete Files/Folders Older Than “X” Days in Linux)
[#]: via: (https://www.2daygeek.com/bash-script-to-delete-files-folders-older-than-x-days-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 Linux 中使用 Bash 脚本删除早于 “X” 天的文件/文件夹
======

[磁盘使用率][1] 监控工具能够在达到给定阈值时提醒我们。但它们无法自行解决 [磁盘使用率][2] 问题。需要手动干预才能解决该问题。

如果你想完全自动化此类操作，你会做什么。是的，可以使用 bash 脚本来完成。

该脚本可防止来自 [监控工具][3] 的警报，因为我们会在填满磁盘空间之前删除旧的日志文件。

我们过去做了很多 shell 脚本。如果要查看，请进入下面的链接。

* [如何使用 shell 脚本自动化日常活动？][4]

我在本文中添加了两个 bash 脚本，它们有助于清除旧日志。

### 1）在 Linux 中删除早于 “X” 天的文件夹的 Bash 脚本

我们有一个名为 `/var/log/app/` 的文件夹，其中包含 15 天的日志，我们将删除早于 10 天的文件夹。

```
$ ls -lh /var/log/app/

drwxrw-rw- 3 root root  24K Oct  1 23:52 app_log.01
drwxrw-rw- 3 root root  24K Oct  2 23:52 app_log.02
drwxrw-rw- 3 root root  24K Oct  3 23:52 app_log.03
drwxrw-rw- 3 root root  24K Oct  4 23:52 app_log.04
drwxrw-rw- 3 root root  24K Oct  5 23:52 app_log.05
drwxrw-rw- 3 root root  24K Oct  6 23:54 app_log.06
drwxrw-rw- 3 root root  24K Oct  7 23:53 app_log.07
drwxrw-rw- 3 root root  24K Oct  8 23:51 app_log.08
drwxrw-rw- 3 root root  24K Oct  9 23:52 app_log.09
drwxrw-rw- 3 root root  24K Oct 10 23:52 app_log.10
drwxrw-rw- 3 root root  24K Oct 11 23:52 app_log.11
drwxrw-rw- 3 root root  24K Oct 12 23:52 app_log.12
drwxrw-rw- 3 root root  24K Oct 13 23:52 app_log.13
drwxrw-rw- 3 root root  24K Oct 14 23:52 app_log.14
drwxrw-rw- 3 root root  24K Oct 15 23:52 app_log.15
```

该脚本将删除早于 10 天的文件夹，并通过邮件发送文件夹列表。

你可以根据需要修改 `-mtime X` 的值。另外，请替换你的电子邮箱，而不是用我们的。

```
# /opt/script/delete-old-folders.sh

#!/bin/bash
prev_count=0
fpath=/var/log/app/app_log.*
find $fpath -type d -mtime +10  -exec ls -ltrh {} \; > /tmp/folder.out
find $fpath -type d -mtime +10  -exec rm -rf {} \;
count=$(cat /tmp/folder.out | wc -l)
if [ "$prev_count" -lt "$count" ] ; then
MESSAGE="/tmp/file1.out"
TO="[email protected]"
echo "Application log folders are deleted older than 15 days" >> $MESSAGE
echo "+----------------------------------------------------+" >> $MESSAGE
echo "" >> $MESSAGE
cat /tmp/folder.out | awk '{print $6,$7,$9}' >> $MESSAGE
echo "" >> $MESSAGE
SUBJECT="WARNING: Apache log files are deleted older than 15 days $(date)"
mail -s "$SUBJECT" "$TO" < $MESSAGE
rm $MESSAGE /tmp/folder.out
fi
```

给 `delete-old-folders.sh` 设置可执行权限。

```
# chmod +x /opt/script/delete-old-folders.sh
```

最后添加一个 [cronjob][5] 自动化此任务。它于每天早上 7 点运行。

```
# crontab -e

0 7 * * * /bin/bash /opt/script/delete-old-folders.sh
```

你将看到类似下面的输出。

```
Application log folders are deleted  older than 20 days
+--------------------------------------------------------+
Oct 11 /var/log/app/app_log.11
Oct 12 /var/log/app/app_log.12
Oct 13 /var/log/app/app_log.13
Oct 14 /var/log/app/app_log.14
Oct 15 /var/log/app/app_log.15
```

### 2）在 Linux 中删除早于 “X” 天的文件的 Bash 脚本

我们有一个名为 `/var/log/apache/` 的文件夹，其中包含15天的日志，我们将删除 10 天前的文件。

以下文章与该主题相关，因此你可能有兴趣阅读。

  * [如何在 Linux 中查找和删除早于 “X” 天和 “X” 小时的文件？][6]
  * [如何在 Linux 中查找最近修改的文件/文件夹][7]
  * [如何在 Linux 中自动删除或清理 /tmp 文件夹内容？][8]

```
# ls -lh /var/log/apache/

-rw-rw-rw- 3 root root  24K Oct  1 23:52 2daygeek_access.01
-rw-rw-rw- 3 root root  24K Oct  2 23:52 2daygeek_access.02
-rw-rw-rw- 3 root root  24K Oct  3 23:52 2daygeek_access.03
-rw-rw-rw- 3 root root  24K Oct  4 23:52 2daygeek_access.04
-rw-rw-rw- 3 root root  24K Oct  5 23:52 2daygeek_access.05
-rw-rw-rw- 3 root root  24K Oct  6 23:54 2daygeek_access.06
-rw-rw-rw- 3 root root  24K Oct  7 23:53 2daygeek_access.07
-rw-rw-rw- 3 root root  24K Oct  8 23:51 2daygeek_access.08
-rw-rw-rw- 3 root root  24K Oct  9 23:52 2daygeek_access.09
-rw-rw-rw- 3 root root  24K Oct 10 23:52 2daygeek_access.10
-rw-rw-rw- 3 root root  24K Oct 11 23:52 2daygeek_access.11
-rw-rw-rw- 3 root root  24K Oct 12 23:52 2daygeek_access.12
-rw-rw-rw- 3 root root  24K Oct 13 23:52 2daygeek_access.13
-rw-rw-rw- 3 root root  24K Oct 14 23:52 2daygeek_access.14
-rw-rw-rw- 3 root root  24K Oct 15 23:52 2daygeek_access.15
```

该脚本将删除 10 天前的文件并通过邮件发送文件夹列表。

你可以根据需要修改 `-mtime X` 的值。另外，请替换你的电子邮箱，而不是用我们的。

```
# /opt/script/delete-old-files.sh

#!/bin/bash
prev_count=0
fpath=/var/log/apache/2daygeek_access.*
find $fpath -type f -mtime +15  -exec ls -ltrd {} \; > /tmp/file.out
find $fpath -type f -mtime +15  -exec rm -rf {} \;
count=$(cat /tmp/file.out | wc -l)
if [ "$prev_count" -lt "$count" ] ; then
MESSAGE="/tmp/file1.out"
TO="[email protected]"
echo "Apache Access log files are deleted older than 20 days"  >> $MESSAGE
echo "+--------------------------------------------- +" >> $MESSAGE
echo "" >> $MESSAGE
cat /tmp/file.out | awk '{print $6,$7,$9}' >> $MESSAGE
echo "" >> $MESSAGE
SUBJECT="WARNING: Apache log folders are deleted older than 15 days $(date)"
mail -s "$SUBJECT" "$TO" < $MESSAGE
rm $MESSAGE /tmp/file.out
fi
```

给 `delete-old-files.sh` 设置可执行权限。

```
# chmod +x /opt/script/delete-old-files.sh
```

最后添加一个 [cronjob][5] 自动化此任务。它于每天早上 7 点运行。

```
# crontab -e

0 7 * * * /bin/bash /opt/script/delete-old-folders.sh
```

你将看到类似下面的输出。

```
Apache Access log files are deleted older than 20 days
+--------------------------------------------------------+
Oct 11 /var/log/apache/2daygeek_access.11
Oct 12 /var/log/apache/2daygeek_access.12
Oct 13 /var/log/apache/2daygeek_access.13
Oct 14 /var/log/apache/2daygeek_access.14
Oct 15 /var/log/apache/2daygeek_access.15
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bash-script-to-delete-files-folders-older-than-x-days-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-check-disk-usage-files-and-directories-folders-size-du-command/
[2]: https://www.2daygeek.com/linux-check-disk-space-usage-df-command/
[3]: https://www.2daygeek.com/category/monitoring-tools/
[4]: https://www.2daygeek.com/category/shell-script/
[5]: https://www.2daygeek.com/crontab-cronjob-to-schedule-jobs-in-linux/
[6]: https://www.2daygeek.com/how-to-find-and-delete-files-older-than-x-days-and-x-hours-in-linux/
[7]: https://www.2daygeek.com/check-find-recently-modified-files-folders-linux/
[8]: https://www.2daygeek.com/automatically-delete-clean-up-tmp-directory-folder-contents-in-linux/
