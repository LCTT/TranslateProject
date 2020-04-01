[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12062-1.html)
[#]: subject: (How to Check Password Expiration Date for All Users on Linux)
[#]: via: (https://www.2daygeek.com/linux-check-user-password-expiration-date/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 上检查所有用户密码到期日期
======

![](https://img.linux.net.cn/data/attachment/album/202004/01/104918dn0n0anhxoia40rc.jpg)

如果你在 [Linux 上启用了密码策略][1]。密码必须在到期前进行更改，并且登录到系统时会收到通知。

如果你很少使用自己的帐户，那么可能由于密码过期而被锁定。在许多情况下，这可能会在[无需密码登录][2]的服务帐户中发生，因为没人会注意到它。

这将导致停止服务器上配置的 [cronjob/crontab][3]。

如果如此，该如何缓解这种情况。

你可以写一个 shell 脚本来获得有关它的通知，我们前一段时间为此写了一篇文章。

 * [使用 Bash 脚本发送包含几天内到期的用户账号列表的电子邮件][5]

它将给出天数，但是本文旨在在终端中给你实际日期。

这可以使用 `chage` 命令来实现。

### 什么是 chage 命令？

`chage` 代表<ruby>更改时效<rt>change age</rt></ruby>。它更改用户密码到期信息。

`chage` 命令可以修改两次密码更改之间的天数，以及最后一次更改密码的日期。

系统使用此信息来确定用户何时应更改密码。

它还允许用户执行其他功能，例如设置帐户到期日期、在到期后将密码设置为无效、显示帐户时效信息、设置密码更改之前的最小和最大天数以及设置到期警告天数。

### 1）如何在 Linux 上检查特定用户的密码到期日期

如果要检查 Linux 上特定用户的密码到期日期，请使用以下命令。

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

### 2）如何在 Linux 上检查所有用户的密码到期日期

你可以直接对单个用户使用 chage 命令，不过可能你对多个用户使用时可能无效。

为此，你需要编写一个小的 shell 脚本。下面的 shell 脚本可以列出添加到系统中的所有用户，包括系统用户。

```
# for user in $(cat /etc/passwd |cut -d: -f1); do echo $user; chage -l $user | grep "Password expires"; done | paste -d " "  - - | sed 's/Password expires//g'
```

你将得到类似以下的输出，但是用户名可能不同。

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

### 3）如何检查 Linux 上除系统用户外的所有用户的密码有效期

下面的 shell 脚本将显示有到期日期的用户列表。

```
# for user in $(cat /etc/passwd |cut -d: -f1); do echo $user; chage -l $user | grep "Password expires"; done | paste -d " "  - - | sed 's/Password expires//g' | grep -v "never"
```

你将得到类似以下的输出，但是用户名可能不同。

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
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10698-1.html
[2]: https://www.2daygeek.com/configure-setup-passwordless-ssh-key-based-authentication-linux/
[3]: https://www.2daygeek.com/linux-crontab-cron-job-to-schedule-jobs-task/
[4]: https://www.2daygeek.com/category/shell-script/
[5]: https://linux.cn/article-11781-1.html
