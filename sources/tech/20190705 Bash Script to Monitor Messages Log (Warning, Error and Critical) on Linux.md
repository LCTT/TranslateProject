[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to Monitor Messages Log (Warning, Error and Critical) on Linux)
[#]: via: (https://www.2daygeek.com/linux-bash-script-to-monitor-messages-log-warning-error-critical-send-email/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to Monitor Messages Log (Warning, Error and Critical) on Linux
======

There are many open source monitoring tools are currently available in market to monitor Linux systems performance.

It will send an email alert when the system reaches the specified threshold limit.

It monitors everything such as CPU utilization, Memory utilization, swap utilization, disk space utilization and much more.

If you only have few systems and want to monitor them then writing a small shell script can make your task very easy.

In this tutorial we have added a shell script to monitor Messages Log on Linux system.

We had added many useful shell scripts in the past. If you want to check those, navigate to the below link.

  * **[How to automate day to day activities using shell scripts?][1]**



This script will check **“warning, error and critical”** in the `/var/log/messages` file and trigger a mail to given email id, if it’s found anything related it.

We can’t run this script frequently that may fill up your inbox if the server has many matching strings, instead we can run once in a day.

To overcome this issue, i made the script to trigger an email in a different manner.

If any given strings are found in the **“/var/log/messages”** file for yesterday’s date then the script will send an email alert to given email id.

**Note:** You need to change the email id instead of ours. Also, you can change the Memory utilization threshold value as per your requirement.

```
# vi /opt/scripts/os-log-alert.sh

#!/bin/bash

#Set the variable which equal to zero

prev_count=0

count=$(grep -i "`date --date='yesterday' '+%b %e'`" /var/log/messages | egrep -wi 'warning|error|critical' | wc -l)

if [ "$prev_count" -lt "$count" ] ; then

# Send a mail to given email id when errors found in log

SUBJECT="WARNING: Errors found in log on "`date --date='yesterday' '+%b %e'`""

# This is a temp file, which is created to store the email message.

MESSAGE="/tmp/logs.txt"

TO="[email protected]"

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

Set an executable permission to `os-log-alert.sh` file.

```
$ chmod +x /opt/scripts/os-log-alert.sh
```

Finally add a cronjob to automate this. It will run everyday at 7'o clock.

```
# crontab -e
0 7 * * * /bin/bash /opt/scripts/os-log-alert.sh
```

**Note:** You will be getting an email alert everyday at 7 o'clock, which is for yesterday's log.

**Output:** You will be getting an email alert similar to below.

```
ATTENTION: Errors are found in /var/log/messages. Please Check with Linux admin.

+-----------------------------------------------------+
Error messages in the log file as below
+-----------------------------------------------------+
Jul  3 02:40:11 ns1 kernel: php-fpm[3175]: segfault at 299 ip 000055dfe7cc7e25 sp 00007ffd799d7d38 error 4 in php-fpm[55dfe7a89000+3a7000]
Jul  3 02:50:14 ns1 kernel: lmtp[8249]: segfault at 20 ip 00007f9cc05295e4 sp 00007ffc57bca1a0 error 4 in libdovecot-storage.so.0.0.0[7f9cc04df000+148000]
Jul  3 15:36:09 ns1 kernel: php-fpm[17846]: segfault at 299 ip 000055dfe7cc7e25 sp 00007ffd799d7d38 error 4 in php-fpm[55dfe7a89000+3a7000]
Jul  3 15:45:54 ns1 pure-ftpd: ([email protected]) [WARNING] Authentication failed for user [daygeek]
Jul  3 16:25:36 ns1 pure-ftpd: ([email protected]) [WARNING] Sorry, cleartext sessions and weak ciphers are not accepted on this server.#012Please reconnect using TLS security mechanisms.
Jul  3 16:44:20 ns1 kernel: php-fpm[8979]: segfault at 299 ip 000055dfe7cc7e25 sp 00007ffd799d7d38 error 4 in php-fpm[55dfe7a89000+3a7000]
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-bash-script-to-monitor-messages-log-warning-error-critical-send-email/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/shell-script/
