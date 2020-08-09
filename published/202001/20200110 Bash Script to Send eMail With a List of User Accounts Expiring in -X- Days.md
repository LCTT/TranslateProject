[#]: collector: (lujun9972)
[#]: translator: (qianmingtian)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11781-1.html)
[#]: subject: (Bash Script to Send eMail With a List of User Accounts Expiring in “X” Days)
[#]: via: (https://www.2daygeek.com/bash-script-to-check-user-account-password-expiry-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

使用 Bash 脚本发送包含几天内到期的用户账号列表的电子邮件
======

![](https://img.linux.net.cn/data/attachment/album/202001/13/232047vfxkrr47mn7eapda.jpg)

密码强制策略对所有操作系统和应用程序都是通用的。如果要[在 Linux 上实现密码强制策略][1]，请参阅以下文章。

默认情况下，大多数公司都会强制执行密码强制策略，但根据公司的要求，密码的时间周期会有所不同。通常每个人都使用 90 天的密码周期。用户只会在他们使用的一些服务器上[更改密码][2]，而不会在他们不经常使用的服务器上更改密码。

特别地，大多数团队忘记更改服务帐户密码，这可能导致日常工作的中断，即使他们配置有[基于 SSH 密钥的身份验证][3]。如果用户帐户密码过期，基于SSH密钥的身份验证和 [cronjob][4] 将不起作用。

为了避免这种情况，我们创建了一个 [shell 脚本][5]来向你发送 10 天内到期的用户帐户列表。

本教程中包含两个 [bash 脚本][6]可以帮助你收集系统中用户到期天数的信息。

### 1) 检查 10 天后到期的用户帐户列表

此脚本将帮助你在终端上检查 10 天内到期的用户帐户列表。

```
# vi /opt/script/user-password-expiry.sh
```

```
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

将文件 `user-password-expiry.sh` 设置为可执行的  Linux 文件权限。

```
# chmod +x /opt/script/user-password-expiry.sh
```

你将得到如下输出，但用户与天数可能不同。

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

### 2) 发送包含 10 天内到期的用户帐户列表的电子邮件

此脚本将发送一封包含 10 天内到期的用户帐户列表的邮件。

```
# vi /opt/script/user-password-expiry-mail.sh
```

```
#!/bin/sh
SUBJECT="Information About User Password Expiration on "`date`""
MESSAGE="/tmp/user-expiry.txt"
MESSAGE1="/tmp/user-expiry-1.txt"
TO="magesh.m@rentacenter.com"
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

将文件 `user-password-expiry-mail.sh` 设置为可执行的 Linux 文件权限。

```
# chmod +x /opt/script/user-password-expiry-mail.sh
```

最后，添加一个 [cronjob][4] 去自动执行脚本。每天早上 8 点运行一次。

```
# crontab -e
0 8 * * * /bin/bash /opt/script/user-password-expiry-mail.sh
```

你将收到一封与第一个脚本输出类似的电子邮件。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bash-script-to-check-user-account-password-expiry-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[qianmingtian][c]
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[c]: https://github.com/qianmingtian
[1]: https://linux.cn/article-11709-1.html
[2]: https://www.2daygeek.com/linux-passwd-chpasswd-command-set-update-change-users-password-in-linux-using-shell-script/
[3]: https://www.2daygeek.com/configure-setup-passwordless-ssh-key-based-authentication-linux/
[4]: https://www.2daygeek.com/linux-crontab-cron-job-to-schedule-jobs-task/
[5]: https://www.2daygeek.com/category/shell-script/
[6]: https://www.2daygeek.com/category/bash-script/
