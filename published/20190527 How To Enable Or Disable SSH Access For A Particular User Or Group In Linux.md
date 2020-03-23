[#]: collector: "lujun9972"
[#]: translator: "way-ww"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12027-1.html"
[#]: subject: "How To Enable Or Disable SSH Access For A Particular User Or Group In Linux?"
[#]: via: "https://www.2daygeek.com/allow-deny-enable-disable-ssh-access-user-group-in-linux/"
[#]: author: "2daygeek http://www.2daygeek.com/author/2daygeek/"

如何在 Linux 上为特定的用户或用户组启用或禁用 SSH？
======

![](https://img.linux.net.cn/data/attachment/album/202003/23/105915r1azn34i82sp48ca.jpg)

由于你的公司标准规定，你可能只能允许部分人访问 Linux 系统。或者你可能只能够允许几个用户组中的用户访问 Linux 系统。那么如何实现这样的要求呢？最好的方法是什么呢？如何使用一个简单的方法去实现呢？

是的，我们会有很多种方法去实现它。但是我们应该使用简单轻松的方法。为了简单轻松的完成目的，我们可以通过对 `/etc/ssh/sshd_config` 文件做必要的修改来实现。在这篇文章中我们将会向你展示实现要求的详细步骤。

为什么我们要这样做呢？是出于安全的原因。你可以访问[这个链接][1]来获取更多关于 openSSH 的使用方法。

### 什么是 SSH ？

openssh 全称为 OpenBSD Secure Shell。Secure Shell（ssh）是一个自由开源的网络工具，它能让我们在一个不安全的网络中通过使用 Secure Shell（SSH）协议来安全访问远程主机。

它采用了客户端-服务器架构（C/S），拥有用户身份认证、加密、在计算机和隧道之间传输文件等功能。

我们也可以用 `telnet` 或 `rcp` 等传统工具来完成，但是这些工具都不安全，因为它们在执行任何动作时都会使用明文来传输密码。

### 如何在 Linux 中允许用户使用 SSH？

通过以下内容，我们可以为指定的用户或用户列表启用 `ssh` 访问。如果你想要允许多个用户，那么你可以在添加用户时在同一行中用空格来隔开他们。

为了达到目的只需要将下面的值追加到 `/etc/ssh/sshd_config` 文件中去。 在这个例子中， 我们将会允许用户 `user3` 使用 ssh。

```
# echo "AllowUsers user3" >> /etc/ssh/sshd_config
```

你可以运行下列命令再次检查是否添加成功。

```
# cat /etc/ssh/sshd_config | grep -i allowusers
AllowUsers user3
```

这样就行了， 现在只需要重启 `ssh` 服务和见证奇迹了。（下面这两条命令效果相同， 请根据你的服务管理方式选择一条执行即可）

```
# systemctl restart sshd
或
# service restart sshd
```

接下来很简单，只需打开一个新的终端或者会话尝试用不同的用户身份访问 Linux 系统。是的，这里 `user2` 用户是不被允许使用 SSH 登录的并且会得到如下所示的错误信息。

```
# ssh user2@192.168.1.4
user2@192.168.1.4's password: 
Permission denied, please try again.
```

输出:

```
Mar 29 02:00:35 CentOS7 sshd[4900]: User user2 from 192.168.1.6 not allowed because not listed in AllowUsers
Mar 29 02:00:35 CentOS7 sshd[4900]: input_userauth_request: invalid user user2 [preauth]
Mar 29 02:00:40 CentOS7 unix_chkpwd[4902]: password check failed for user (user2)
Mar 29 02:00:40 CentOS7 sshd[4900]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.6  user=user2
Mar 29 02:00:43 CentOS7 sshd[4900]: Failed password for invalid user user2 from 192.168.1.6 port 42568 ssh2
```

与此同时用户 `user3` 被允许登入系统因为他在被允许的用户列表中。

```
# ssh user3@192.168.1.4
user3@192.168.1.4's password: 
[user3@CentOS7 ~]$
```

输出:

```
Mar 29 02:01:13 CentOS7 sshd[4939]: Accepted password for user3 from 192.168.1.6 port 42590 ssh2
Mar 29 02:01:13 CentOS7 sshd[4939]: pam_unix(sshd:session): session opened for user user3 by (uid=0)
```

### 如何在 Linux 中阻止用户使用 SSH ？

通过以下内容，我们可以配置指定的用户或用户列表禁用 `ssh`。如果你想要禁用多个用户，那么你可以在添加用户时在同一行中用空格来隔开他们。

为了达到目的只需要将以下值追加到 `/etc/ssh/sshd_config` 文件中去。 在这个例子中， 我们将禁用用户 `user1` 使用 `ssh`。

```
# echo "DenyUsers user1" >> /etc/ssh/sshd_config
```

你可以运行下列命令再次检查是否添加成功。

```
# cat /etc/ssh/sshd_config | grep -i denyusers
DenyUsers user1
```

这样就行了， 现在只需要重启 `ssh` 服务和见证奇迹了。

```
# systemctl restart sshd
活
# service restart sshd
```

接下来很简单，只需打开一个新的终端或者会话，尝试使用被禁用的用户身份被访问 Linux 系统。是的，这里 `user1` 用户在禁用名单中。所以，当你尝试登录时，你将会得到如下所示的错误信息。

```
# ssh user1@192.168.1.4
user1@192.168.1.4's password: 
Permission denied, please try again.
```

输出:

```
Mar 29 01:53:42 CentOS7 sshd[4753]: User user1 from 192.168.1.6 not allowed because listed in DenyUsers
Mar 29 01:53:42 CentOS7 sshd[4753]: input_userauth_request: invalid user user1 [preauth]
Mar 29 01:53:46 CentOS7 unix_chkpwd[4755]: password check failed for user (user1)
Mar 29 01:53:46 CentOS7 sshd[4753]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.6  user=user1
Mar 29 01:53:48 CentOS7 sshd[4753]: Failed password for invalid user user1 from 192.168.1.6 port 42522 ssh2
```

### 如何在 Linux 中允许用户组使用 SSH?

通过以下内容，我们可以允许一个指定的组或多个组使用 `ssh`。

如果你想要允许多个组使用 `ssh` 那么你在添加用户组时需要在同一行中使用空格来隔开他们。

为了达到目的只需将以下值追加到 `/etc/ssh/sshd_config` 文件中去。在这个例子中，我们将允许 `2g-admin` 组使用 ssh。

```
# echo "AllowGroups 2g-admin" >> /etc/ssh/sshd_config
```

你可以运行下列命令再次检查是否添加成功。

```
# cat /etc/ssh/sshd_config | grep -i allowgroups
AllowGroups 2g-admin
```

运行下列命令查看属于该用户组的用户有哪些。

```
# getent group 2g-admin
2g-admin:x:1005:user1,user2,user3
```

这样就行了， 现在只需要重启 `ssh` 服务和见证奇迹了。

```
# systemctl restart sshd
或
# service restart sshd
```

是的， `user1` 被允许登入系统因为用户 `user1` 属于 `2g-admin` 组。

```
# ssh user1@192.168.1.4
user1@192.168.1.4's password: 
[user1@CentOS7 ~]$
```

输出:

```
Mar 29 02:10:21 CentOS7 sshd[5165]: Accepted password for user1 from 192.168.1.6 port 42640 ssh2
Mar 29 02:10:22 CentOS7 sshd[5165]: pam_unix(sshd:session): session opened for user user1 by (uid=0)
```

是的， `user2` 被允许登入系统因为用户 `user2` 同样属于 `2g-admin` 组。

```
# ssh user2@192.168.1.4
user2@192.168.1.4's password: 
[user2@CentOS7 ~]$
```

输出:

```
Mar 29 02:10:38 CentOS7 sshd[5225]: Accepted password for user2 from 192.168.1.6 port 42642 ssh2
Mar 29 02:10:38 CentOS7 sshd[5225]: pam_unix(sshd:session): session opened for user user2 by (uid=0)
```

当你尝试使用其他不在被允许的组中的用户去登入系统时， 你将会得到如下所示的错误信息。

```
# ssh ladmin@192.168.1.4
ladmin@192.168.1.4's password: 
Permission denied, please try again.
```

输出:

```
Mar 29 02:12:36 CentOS7 sshd[5306]: User ladmin from 192.168.1.6 not allowed because none of user's groups are listed in AllowGroups
Mar 29 02:12:36 CentOS7 sshd[5306]: input_userauth_request: invalid user ladmin [preauth]
Mar 29 02:12:56 CentOS7 unix_chkpwd[5310]: password check failed for user (ladmin)
Mar 29 02:12:56 CentOS7 sshd[5306]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.6  user=ladmin
Mar 29 02:12:58 CentOS7 sshd[5306]: Failed password for invalid user ladmin from 192.168.1.6 port 42674 ssh2
```

### 如何在 Linux 中阻止用户组使用 SSH？

通过以下内容，我们可以禁用指定的组或多个组使用 `ssh`。

如果你想要禁用多个用户组使用 `ssh`，那么你需要在添加用户组时在同一行中使用空格来隔开他们。

为了达到目的只需要将下面的值追加到 `/etc/ssh/sshd_config` 文件中去。

```
# echo "DenyGroups 2g-admin" >> /etc/ssh/sshd_config
```

你可以运行下列命令再次检查是否添加成功。

```
# # cat /etc/ssh/sshd_config | grep -i denygroups
DenyGroups 2g-admin

# getent group 2g-admin
2g-admin:x:1005:user1,user2,user3
```

这样就行了， 现在只需要重启 `ssh` 服务和见证奇迹了。

```
# systemctl restart sshd
或
# service restart sshd
```

是的 `user1` 不被允许登入系统，因为他是 `2g-admin` 用户组中的一员。他属于被禁用 `ssh` 的组中。

```
# ssh user1@192.168.1.4
user1@192.168.1.4's password: 
Permission denied, please try again.
```

输出:

```
Mar 29 02:17:32 CentOS7 sshd[5400]: User user1 from 192.168.1.6 not allowed because a group is listed in DenyGroups
Mar 29 02:17:32 CentOS7 sshd[5400]: input_userauth_request: invalid user user1 [preauth]
Mar 29 02:17:38 CentOS7 unix_chkpwd[5402]: password check failed for user (user1)
Mar 29 02:17:38 CentOS7 sshd[5400]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=192.168.1.6  user=user1
Mar 29 02:17:41 CentOS7 sshd[5400]: Failed password for invalid user user1 from 192.168.1.6 port 42710 ssh2
```

除了 `2g-admin` 用户组之外的用户都可以使用 ssh 登入系统。 例如，`ladmin` 等用户就允许登入系统。

```
# ssh ladmin@192.168.1.4
ladmin@192.168.1.4's password: 
[ladmin@CentOS7 ~]$
```

输出:

```
Mar 29 02:19:13 CentOS7 sshd[5432]: Accepted password for ladmin from 192.168.1.6 port 42716 ssh2
Mar 29 02:19:13 CentOS7 sshd[5432]: pam_unix(sshd:session): session opened for user ladmin by (uid=0)
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/allow-deny-enable-disable-ssh-access-user-group-in-linux/

作者：[2daygeek][a]
选题：[lujun9972][b]
译者：[way-ww](https://github.com/way-ww)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.2daygeek.com/author/2daygeek/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/ssh-tutorials/
