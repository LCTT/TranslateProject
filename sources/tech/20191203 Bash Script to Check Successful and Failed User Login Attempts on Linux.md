[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to Check Successful and Failed User Login Attempts on Linux)
[#]: via: (https://www.2daygeek.com/bash-script-to-check-successful-and-failed-user-login-attempts-on-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to Check Successful and Failed User Login Attempts on Linux
======

One of the typical tasks of Linux administrators is to check successful and failed login attempts in the Linux system.

This ensures that there are no illegal attempts at the environment.

It is very difficult to manually verify them because the output of the **“/var/log/secure”** file looks awkward.

To make this easier and more effective, we need to write a bash script.

Yes, you can achieve this using the following **[Bash script][1]**.

I’ve included two shell scripts in this tutorial.

These scripts will show the number of users logged into the system for a given date. Also, it shows successful login attempts and failed login attempts.

The first **[shell script][2]** allows you to verify user access information for any date available in the **“/var/log/secure”** file.

The second bash script allows you to send a mail with user access information on a daily basis.

### Method-1 : Shell Script to Check Successful and Failed User Login Attempts on Linux

This script allows you to verify user access information for a given date from the terminal.

```
# vi /opt/scripts/user-access-details.sh

#!/bin/bash
echo ""
echo -e "Enter the Date, Use Double Space for date from 1 to 9 (Nov  3) and use Single Space for date from 10 to 31 (Nov 30): \c"
read yday
MYPATH=/var/log/secure*
yday=$(date --date='yesterday' | awk '{print $2,$3}')
yday=$(date | awk '{print $2,$3}')
tuser=$(grep "$yday" $MYPATH | grep "Accepted|Failed" | wc -l)
suser=$(grep "$yday" $MYPATH | grep "Accepted password|Accepted publickey|keyboard-interactive" | wc -l)
fuser=$(grep "$yday" $MYPATH | grep "Failed password" | wc -l)
scount=$(grep "$yday" $MYPATH | grep "Accepted" | awk '{print $9;}' | sort | uniq -c)
fcount=$(grep "$yday" $MYPATH | grep "Failed" | awk '{print $9;}' | sort | uniq -c)
echo "--------------------------------------------"
echo "       User Access Report on: $yday"
echo "--------------------------------------------"
echo "Number of Users logged on System: $tuser"
echo "Successful logins attempt: $suser"
echo "Failed logins attempt: $fuser"
echo "--------------------------------------------"
echo -e "Success User Details:\n $scount"
echo "--------------------------------------------"
echo -e "Failed User Details:\n $fcount"
echo "--------------------------------------------"
```

Set an executable **[Linux file permission][3]** to **“user-access-details-1.sh”** file.

```
# chmod +x /opt/scripts/user-access-details-1.sh
```

When you run the script you will receive an alert like the one below.

```
# sh /opt/scripts/user-access-details.sh

Enter the Date, Use Double Space for date from 1 to 9 (Nov  3) and use Single Space for date from 10 to 31 (Nov 30): Nov  6
------------------------------------------
        User Access Report on: Nov  6
------------------------------------------
Number of Users logged on System: 1
Successful logins attempt: 1
Failed logins attempt: 0
------------------------------------------
Success User Details:
       1 root
------------------------------------------
Failed User Details:
------------------------------------------
```

When you run the script you will receive an alert like the one below.

```
# sh /opt/scripts/user-access-details.sh

Enter the Date, Use Double Space for date from 1 to 9 (Nov  3) and use Single Space for date from 10 to 31 (Nov 30): Nov 30
------------------------------------------
        User Access Report on: Nov 30
------------------------------------------
Number of Users logged on System: 20
Successful logins attempt: 14
Failed logins attempt: 6
------------------------------------------
Success User Details:
       1 daygeek
      1 root
      3 u1
      4 u2
      1 u3
      2 u4
      2 u5
------------------------------------------
Failed User Details:
       3 u1
      3 u4
------------------------------------------
```

### Method-2 : Bash Script to Check Successful and Failed User Login Attempts With eMail Alert.

This Bash script allows you to send a mail with user access details on a daily basis via email for yesterday’s date.

```
# vi /opt/scripts/user-access-details-2.sh

#!/bin/bash
/tmp/u-access.txt
SUBJECT="User Access Reports on "date""
MESSAGE="/tmp/u-access.txt"
TO="[email protected]"
MYPATH=/var/log/secure*
yday=$(date --date='yesterday' | awk '{print $2,$3}')
tuser=$(grep "$yday" $MYPATH | grep "Accepted|Failed" | wc -l)
suser=$(grep "$yday" $MYPATH | grep "Accepted password|Accepted publickey|keyboard-interactive" | wc -l)
fuser=$(grep "$yday" $MYPATH | grep "Failed password" | wc -l)
scount=$(grep "$yday" $MYPATH | grep "Accepted" | awk '{print $9;}' | sort | uniq -c)
fcount=$(grep "$yday" $MYPATH | grep "Failed" | awk '{print $9;}' | sort | uniq -c)
echo "--------------------------------------------" >> $MESSAGE
echo "       User Access Report on: $yday" >> $MESSAGE
echo "--------------------------------------------" >> $MESSAGE
echo "Number of Users logged on System: $tuser" >> $MESSAGE
echo "Successful logins attempt: $suser" >> $MESSAGE
echo "Failed logins attempt: $fuser" >> $MESSAGE
echo "--------------------------------------------" >> $MESSAGE
echo -e "Success User Details:\n $scount" >> $MESSAGE
echo "--------------------------------------------" >> $MESSAGE
echo -e "Failed User Details:\n $fcount" >> $MESSAGE
echo "--------------------------------------------" >> $MESSAGE
mail -s "$SUBJECT" "$TO" < $MESSAGE
```

Set an executable permission to **“user-access-details-2.sh”** file.

```
# chmod +x /opt/scripts/user-access-details-2.sh
```

Finally add a **[cronjob][4]** to automate this. It will run everyday at 8’o clock.

```
# crontab -e

0 8 * * * /bin/bash /opt/scripts/user-access-details-2.sh
```

**Note:** You will be getting an email alert everyday at 8 o’clock, which is for previous day’s user access information.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bash-script-to-check-successful-and-failed-user-login-attempts-on-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/bash-script/
[2]: https://www.2daygeek.com/category/shell-script/
[3]: https://www.2daygeek.com/understanding-linux-file-permissions/
[4]: https://www.2daygeek.com/linux-crontab-cron-job-to-schedule-jobs-task/
