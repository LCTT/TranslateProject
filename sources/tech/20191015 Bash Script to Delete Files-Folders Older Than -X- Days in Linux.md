[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to Delete Files/Folders Older Than “X” Days in Linux)
[#]: via: (https://www.2daygeek.com/bash-script-to-delete-files-folders-older-than-x-days-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to Delete Files/Folders Older Than “X” Days in Linux
======

**[Disk Usage][1]** Monitoring tools are capable of alerting us when a given threshold is reached.

But they don’t have the ingenuity to fix the **[disk usage][2]** problem on their own.

Manual intervention is needed to solve the problem.

But if you want to fully automate this kind of activity, what you will do.

Yes, it can be done using the bash script.

This script prevents alerts from **[monitoring tool][3]** because we delete old log files before filling the disk space.

We have added many useful shell scripts in the past. If you want to check them out, go to the link below.

  * **[How to automate day to day activities using shell scripts?][4]**



I’ve added two bash scripts to this article, which helps clear up old logs.

### 1) Bash Script to Delete a Folders Older Than “X” Days in Linux

We have a folder named **“/var/log/app/”** that contains 15 days of logs and we are going to delete 10 days old folders.

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

This script will delete 10 days old folders and send folder list via mail.

You can change the value **“-mtime X”** depending on your requirement. Also, replace your email id instead of us.

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

Set an executable permission to **“delete-old-folders.sh”** file.

```
# chmod +x /opt/script/delete-old-folders.sh
```

Finally add a **[cronjob][5]** to automate this. It runs daily at 7AM.

```
# crontab -e

0 7 * * * /bin/bash /opt/script/delete-old-folders.sh
```

You will get an output like the one below.

```
Application log folders are deleted  older than 20 days
+--------------------------------------------------------+
Oct 11 /var/log/app/app_log.11
Oct 12 /var/log/app/app_log.12
Oct 13 /var/log/app/app_log.13
Oct 14 /var/log/app/app_log.14
Oct 15 /var/log/app/app_log.15
```

### 2) Bash Script to Delete a Files Older Than “X” Days in Linux

We have a folder named **“/var/log/apache/”** that contains 15 days of logs and we are going to delete 10 days old files.

The articles below are related to this topic, so you may be interested to read.

  * **[How To Find And Delete Files Older Than “X” Days And “X” Hours In Linux?][6]**
  * **[How to Find Recently Modified Files/Folders in Linux][7]**
  * **[How To Automatically Delete Or Clean Up /tmp Folder Contents In Linux?][8]**



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

This script will delete 10 days old files and send folder list via mail.

You can change the value **“-mtime X”** depending on your requirement. Also, replace your email id instead of us.

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

Set an executable permission to **“delete-old-files.sh”** file.

```
# chmod +x /opt/script/delete-old-files.sh
```

Finally add a **[cronjob][5]** to automate this. It runs daily at 7AM.

```
# crontab -e

0 7 * * * /bin/bash /opt/script/delete-old-folders.sh
```

You will get an output like the one below.

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
