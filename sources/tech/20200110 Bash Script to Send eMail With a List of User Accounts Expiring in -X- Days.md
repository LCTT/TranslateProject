[#]: collector: (lujun9972)
[#]: translator: (qianmingtian)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to Send eMail With a List of User Accounts Expiring in “X” Days)
[#]: via: (https://www.2daygeek.com/bash-script-to-check-user-account-password-expiry-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to Send eMail With a List of User Accounts Expiring in “X” Days
======

The password enforcement policy is common to all operating systems and applications.

If you want to **[implement a password enforcement policy on Linux][1]**, go to the following article.

The password enforcement policy will be enforced by most companies by default, but the time period will be different depending on the company’s requirements.

Usually everyone uses a 90-days password cycle.

The user will only **[change the password][2]** on some of the servers they use, and they won’t change the password on the servers they don’t use often.

In particular, most team forget to change the service account password, which can lead to breaking regular jobs even if they are configured to work with **[SSH key-based authentication][3]**.

SSH key-based authentication and **[cronjobs][4]** will not work if the user account password expires.

To avoid this situation, we have created a **[shell script][5]** that sends you a list of user accounts that expire within 10 days.

There are two **[bash scripts][6]** included in this tutorial that will help you collect information about user expiration days on your system.

### 1) Bash Script to Check List of User Accounts Expiring in 10 Days

This script will help you to check the list of user accounts that expire in 10 days on your terminal.

```
# vi /opt/script/user-password-expiry.sh

#!/bin/sh
/tmp/user-expiry-1.txt
/tmp/user-expiry.txt
echo "-------------------------------------------------"
echo "UserName  The number of days the password expires"
echo "-------------------------------------------------"
for usern in u1 u2 u3 u4
do
today=$(date +%s)
userexpdate=$(chage -l $usern | grep 'Password expires' |cut -d: -f2)
passexp=$(date -d "$userexpdate" "+%s")
exp=`expr \( $passexp - $today \)`
expday=`expr \( $exp / 86400 \)`
echo "$usern $expday" >> /tmp/user-expiry.txt
done
cat /tmp/user-expiry.txt | awk '$2 <= 10' > /tmp/user-expiry-1.txt
cat /tmp/user-expiry-1.txt | column -t
```

Set an executable Linux file permission to **“user-password-expiry.sh”** file.

```
# chmod +x /opt/script/user-password-expiry.sh
```

You will get an output like the one below. But the username and days may be different

```
# sh /opt/script/user-password-expiry.sh

-------------------------------------------------
UserName  The number of days the password expires
-------------------------------------------------
u1         -25
u2          9
u3          3
u4          5
```

### 2) Bash Script to Send eMail With a List of User Accounts Expiring in 10 Days

This script will send a mail with a list of user accounts expiring in 10 days.

```
# vi /opt/script/user-password-expiry-mail.sh

#!/bin/sh
SUBJECT="Information About User Password Expiration on "`date`""
MESSAGE="/tmp/user-expiry.txt"
MESSAGE1="/tmp/user-expiry-1.txt"
TO="[email protected]"
echo "-------------------------------------------------" >> $MESSAGE1
echo "UserName  The number of days the password expires" >> $MESSAGE1
echo "-------------------------------------------------" >> $MESSAGE1
for usern in u1 u2 u3 u4
do
today=$(date +%s)
userexpdate=$(chage -l $usern | grep 'Password expires' |cut -d: -f2)
passexp=$(date -d "$userexpdate" "+%s")
exp=`expr \( $passexp - $today \)`
expday=`expr \( $exp / 86400 \)`
echo "$usern $expday" >> $MESSAGE
done
cat $MESSAGE | awk '$2 <= 10' >> $MESSAGE1
mail -s "$SUBJECT" "$TO" < $MESSAGE1
rm $MESSAGE
rm $MESSAGE1
```

Set an executable Linux file permission to **“user-password-expiry-mail.sh”** file.

```
# chmod +x /opt/script/user-password-expiry-mail.sh
```

Finally add a **[cronjob][4]** to automate this. It runs once in a day at 8AM.

```
# crontab -e
0 8 * * * /bin/bash /opt/script/user-password-expiry-mail.sh
```

You will receive a mail similar to the first shell script output.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bash-script-to-check-user-account-password-expiry-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-set-password-complexity-policy-on-linux/
[2]: https://www.2daygeek.com/linux-passwd-chpasswd-command-set-update-change-users-password-in-linux-using-shell-script/
[3]: https://www.2daygeek.com/configure-setup-passwordless-ssh-key-based-authentication-linux/
[4]: https://www.2daygeek.com/linux-crontab-cron-job-to-schedule-jobs-task/
[5]: https://www.2daygeek.com/category/shell-script/
[6]: https://www.2daygeek.com/category/bash-script/
