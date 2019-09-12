[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to Send a Mail About New User Account Creation)
[#]: via: (https://www.2daygeek.com/linux-shell-script-to-monitor-user-creation-send-email/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to Send a Mail About New User Account Creation
======

For some purposes you may need to keep track of new user creation details on Linux.

Also, you may need to send the details by mail.

This may be part of the audit objective or the security team may wish to monitor this for the tracking purposes.

We can do this in other way, as we have already described in the previous article.

  * **[Bash script to send a mail when new user account is created in system][1]**



There are many open source monitoring tools are available for Linux.

But I don’t think they have a way to track the new user creation process and alert the administrator when that happens.

So how can we achieve this?

We can write our own Bash script to achieve this.

We have added many useful shell scripts in the past. If you want to check them out, go to the link below.

  * **[How to automate day to day activities using shell scripts?][2]**



### What does this script really do?

This will take a backup of the “/etc/passwd” file twice a day (beginning of the day and end of the day), which will enable you to get new user creation details for the specified date.

We need to add the below two cronjobs to copy the “/etc/passwd” file.

```
# crontab -e

1 0 * * * cp /etc/passwd /opt/scripts/passwd-start-$(date +"%Y-%m-%d")
59 23 * * * cp /etc/passwd /opt/scripts/passwd-end-$(date +"%Y-%m-%d")
```

It uses the “difference” command to detect the difference between files, and if any difference is found to yesterday’s date, the script will send an email alert to the email id given with new user details.

We can’t run this script often because user creation is not happening frequently. However, we plan to run this script once a day.

Therefore, you can get a consolidated report on new user creation.

**Note:** We used our email id in the script for demonstration purpose. So we ask you to use your email id instead.

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
TO="[email protected]"
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

Set an executable permission to "new-user-detail.sh" file.

```
$ chmod +x /opt/scripts/new-user-detail.sh
```

Finally add a cronjob to automate this. It runs daily at 7AM.

```
# crontab -e

0 7 * * * /bin/bash /opt/scripts/new-user.sh
```

**Note:** You will receive an email alert at 7AM every day, which is for yesterday's date details.

**Output:** The output will be the same as the one below.

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-bash-script-to-monitor-user-creation-send-email/
[2]: https://www.2daygeek.com/category/shell-script/
