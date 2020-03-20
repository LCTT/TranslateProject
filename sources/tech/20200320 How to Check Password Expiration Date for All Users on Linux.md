[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Check Password Expiration Date for All Users on Linux)
[#]: via: (https://www.2daygeek.com/linux-check-user-password-expiration-date/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Check Password Expiration Date for All Users on Linux
======

If you enable a **[password policy on Linux][1]**.

The password must be changed before it expires, and you will be notified when you log in to the system.

If you rarely use your account, it may be locked due to password expiration.

In many cases, this can happen in service accounts with a **[password-less login][2]**, because nobody will monitor it.

This will lead to stop the **[cronjobs/crontab][3]** configured on the server.

If so, how to mitigate this situation.

You can write a **[shell script][4]** to get a notification about it, for which we wrote an article some time ago.

  * **[Bash Script to Send eMail With a List of User Accounts Expiring in “X” Days][5]**



This will give you the number of days, but this article aims to give you a actual date on your terminal.

This can be achieved with the chage command.

### What is chage Command?

chage stands for change age. It changes user password expiration information.

The chage command changes the number of days between password changes and the date of the last password change.

This information is used by the system to determine when a user should change his/her password.

It allows the user to perform other functions such as setting the account expiration date, setting the password inactive after the expiration, displaying account aging information, setting minimum and maximum days before password change, and setting expiry warning days.

### 1) How to Check the Password Expiration Date for a Specific User on Linux

If you want to check the password expiration date for a specific user on Linux, use the following command.

```
# chage -l daygeek

Last password change                                    : Feb 13, 2020
Password expires                                        : May 13, 2020
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 7
Maximum number of days between password change          : 90
Number of days of warning before password expires       : 7
```

### 2) How To Check Password Expiration Date For All Users On Linux

You can use the chage command directly for a single user, which may not work as expected for many users, but you can use it.

To achieve this you need to write a small shell script. The shell script below allows you to list all users added to your system, including system users.

```
# for user in $(cat /etc/passwd |cut -d: -f1); do echo $user; chage -l $user | grep "Password expires"; done | paste -d " "  - - | sed 's/Password expires//g'
```

You will get an output like the one below, but the username may differ.

```
root                : never
bin                 : never
daemon              : never
adm                 : never
lp                  : never
sync                : never
shutdown            : never
u1               : Nov 12, 2018
u2               : Jun 17, 2019
u3               : Jun 17, 2019
u4               : Jun 17, 2019
u5               : Jun 17, 2019
```

### 3) How To Check Password Expiration Date For All Users Except System Users On Linux

The below shell script will display a list of users who has an expiry date.

```
# for user in $(cat /etc/passwd |cut -d: -f1); do echo $user; chage -l $user | grep "Password expires"; done | paste -d " "  - - | sed 's/Password expires//g' | grep -v "never"
```

You will get an output like the one below, but the username may differ.

```
u1               : Nov 12, 2018
u2               : Jun 17, 2019
u3               : Jun 17, 2019
u4               : Jun 17, 2019
u5               : Jun 17, 2019
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-check-user-password-expiration-date/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-set-password-complexity-policy-on-linux/
[2]: https://www.2daygeek.com/configure-setup-passwordless-ssh-key-based-authentication-linux/
[3]: https://www.2daygeek.com/linux-crontab-cron-job-to-schedule-jobs-task/
[4]: https://www.2daygeek.com/category/shell-script/
[5]: https://www.2daygeek.com/bash-script-to-check-user-account-password-expiry-linux/
