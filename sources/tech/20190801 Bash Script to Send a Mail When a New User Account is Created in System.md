[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to Send a Mail When a New User Account is Created in System)
[#]: via: (https://www.2daygeek.com/linux-bash-script-to-monitor-user-creation-send-email/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to Send a Mail When a New User Account is Created in System
======

There are many open source monitoring tools are currently available in market to monitor Linux systems performance.

It will send an email alert when the system reaches the specified threshold limit.

It monitors everything such as CPU utilization, Memory utilization, swap utilization, disk space utilization and much more.

But i don’t think they have an option to monitor a new user creation activity and alert when it’s happening.

If not, it doesn’t really matter as we can write our own bash script to achieve this.

We had added many useful shell scripts in the past. If you want to check those, navigate to the below link.

  * **[How to automate day to day activities using shell scripts?][1]**



What the script does? It monitors **`/var/log/secure`**` ` file and alert admin when a new account is created in system.

We can’t run this script frequently since user creation is not happening very often. However, I’m planning to run this script once in a day.

So, that we can get a consolidated report about the user creation.

If useradd string was found in “/var/log/secure” file for yesterday’s date, then the script will send an email alert to given email id with new users details.

**Note:** You need to change the email id instead of ours.

```
# vi /opt/scripts/new-user.sh

#!/bin/bash

#Set the variable which equal to zero
prev_count=0

count=$(grep -i "`date --date='yesterday' '+%b %e'`" /var/log/secure | egrep -wi 'useradd' | wc -l)

if [ "$prev_count" -lt "$count" ] ; then

# Send a mail to given email id when errors found in log

SUBJECT="ATTENTION: New User Account is created on server : `date --date='yesterday' '+%b %e'`"

# This is a temp file, which is created to store the email message.

MESSAGE="/tmp/new-user-logs.txt"

TO="[email protected]"

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

Set an executable permission to **`new-user.sh`**` ` file.

```
$ chmod +x /opt/scripts/new-user.sh
```

Finally add a cronjob to automate this. It will run everyday at 7'o clock.

```
# crontab -e

0 7 * * * /bin/bash /opt/scripts/new-user.sh
```

Note: You will be getting an email alert everyday at 7 o'clock, which is for yesterday's log.

**`Output:`**` ` You will be getting an email alert similar to below.

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/shell-script/
