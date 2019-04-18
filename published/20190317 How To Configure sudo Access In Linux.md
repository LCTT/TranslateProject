[#]: collector: (lujun9972)
[#]: translator: (liujing97)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10746-1.html)
[#]: subject: (How To Configure sudo Access In Linux?)
[#]: via: (https://www.2daygeek.com/how-to-configure-sudo-access-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 中配置 sudo 访问权限
======

Linux 系统中 root 用户拥有 Linux 中全部控制权力。Linux 系统中 root 是拥有最高权力的用户，可以在系统中实施任意的行为。

如果其他用户想去实施一些行为，不能为所有人都提供 root 访问权限。因为如果他或她做了一些错误的操作，没有办法去纠正它。

为了解决这个问题，有什么方案吗？

我们可以把 sudo 权限发放给相应的用户来克服这种情况。

`sudo` 命令提供了一种机制，它可以在不用分享 root 用户的密码的前提下，为信任的用户提供系统的管理权限。

他们可以执行大部分的管理操作，但又不像 root 一样有全部的权限。

### 什么是 sudo？

`sudo` 是一个程序，普通用户可以使用它以超级用户或其他用户的身份执行命令，是由安全策略指定的。

sudo 用户的访问权限是由 `/etc/sudoers` 文件控制的。

### sudo 用户有什么优点？

在 Linux 系统中，如果你不熟悉一个命令，`sudo` 是运行它的一个安全方式。

* Linux 系统在 `/var/log/secure` 和 `/var/log/auth.log` 文件中保留日志，并且你可以验证 sudo 用户实施了哪些行为操作。
* 每一次它都为当前的操作提示输入密码。所以，你将会有时间去验证这个操作是不是你想要执行的。如果你发觉它是不正确的行为，你可以安全地退出而且没有执行此操作。

基于 RHEL 的系统（如 Redhat (RHEL)、 CentOS 和 Oracle Enterprise Linux (OEL)）和基于 Debian 的系统（如 Debian、Ubuntu 和 LinuxMint）在这点是不一样的。

我们将会教你如何在本文中提及的两种发行版中执行该操作。

这里有三种方法可以应用于两个发行版本。

* 增加用户到相应的组。基于 RHEL 的系统，我们需要添加用户到 `wheel` 组。基于 Debain 的系统，我们添加用户到 `sudo` 或 `admin` 组。
* 手动添加用户到 `/etc/group` 文件中。
* 用 `visudo` 命令添加用户到 `/etc/sudoers` 文件中。

### 如何在 RHEL/CentOS/OEL 系统中配置 sudo 访问权限？

在基于 RHEL 的系统中（如 Redhat (RHEL)、 CentOS 和 Oracle Enterprise Linux (OEL)），使用下面的三个方法就可以做到。

#### 方法 1：在 Linux 中如何使用 wheel 组为普通用户授予超级用户访问权限？

wheel 是基于 RHEL 的系统中的一个特殊组，它提供额外的权限，可以授权用户像超级用户一样执行受到限制的命令。

注意，应该在 `/etc/sudoers` 文件中激活 `wheel` 组来获得该访问权限。

```
# grep -i wheel /etc/sudoers

## Allows people in group wheel to run all commands
%wheel ALL=(ALL) ALL
# %wheel ALL=(ALL) NOPASSWD: ALL
```

假设我们已经创建了一个用户账号来执行这些操作。在此，我将会使用 `daygeek` 这个用户账号。

执行下面的命令，添加用户到 `wheel` 组。

```
# usermod -aG wheel daygeek
```

我们可以通过下面的命令来确定这一点。

```
# getent group wheel
wheel:x:10:daygeek
```

我将要检测用户 `daygeek` 是否可以访问属于 root 用户的文件。

```
$ tail -5 /var/log/secure
tail: cannot open /var/log/secure for reading: Permission denied
```

当我试图以普通用户身份访问 `/var/log/secure` 文件时出现错误。 我将使用 `sudo` 访问同一个文件，让我们看看这个魔术。

```
$ sudo tail -5 /var/log/secure
[sudo] password for daygeek:
Mar 17 07:01:56 CentOS7 sudo: daygeek : TTY=pts/0 ; PWD=/home/daygeek ; USER=root ; COMMAND=/bin/tail -5 /var/log/secure
Mar 17 07:01:56 CentOS7 sudo: pam_unix(sudo:session): session opened for user root by daygeek(uid=0)
Mar 17 07:01:56 CentOS7 sudo: pam_unix(sudo:session): session closed for user root
Mar 17 07:05:10 CentOS7 sudo: daygeek : TTY=pts/0 ; PWD=/home/daygeek ; USER=root ; COMMAND=/bin/tail -5 /var/log/secure
Mar 17 07:05:10 CentOS7 sudo: pam_unix(sudo:session): session opened for user root by daygeek(uid=0)
```

#### 方法 2：在 RHEL/CentOS/OEL 中如何使用 /etc/group 文件为普通用户授予超级用户访问权限？

我们可以通过编辑 `/etc/group` 文件来手动地添加用户到 `wheel` 组。

只需打开该文件，并在恰当的组后追加相应的用户就可完成这一点。

```
$ grep -i wheel /etc/group
wheel:x:10:daygeek,user1
```

在该例中，我将使用 `user1` 这个用户账号。

我将要通过在系统中重启 Apache httpd 服务来检查用户 `user1` 是不是拥有 sudo 访问权限。让我们看看这个魔术。

```
$ sudo systemctl restart httpd
[sudo] password for user1:

$ sudo grep -i user1 /var/log/secure
[sudo] password for user1:
Mar 17 07:09:47 CentOS7 sudo: user1 : TTY=pts/0 ; PWD=/home/user1 ; USER=root ; COMMAND=/bin/systemctl restart httpd
Mar 17 07:10:40 CentOS7 sudo: user1 : TTY=pts/0 ; PWD=/home/user1 ; USER=root ; COMMAND=/bin/systemctl restart httpd
Mar 17 07:12:35 CentOS7 sudo: user1 : TTY=pts/0 ; PWD=/home/user1 ; USER=root ; COMMAND=/bin/grep -i httpd /var/log/secure
```

#### 方法 3：在 Linux 中如何使用 /etc/sudoers 文件为普通用户授予超级用户访问权限？

sudo 用户的访问权限是被 `/etc/sudoers` 文件控制的。因此，只需将用户添加到 `sudoers` 文件中 的 `wheel` 组下即可。

只需通过 `visudo` 命令将期望的用户追加到 `/etc/sudoers` 文件中。

```
# grep -i user2 /etc/sudoers
user2 ALL=(ALL) ALL
```

在该例中，我将使用 `user2` 这个用户账号。

我将要通过在系统中重启 MariaDB 服务来检查用户 `user2` 是不是拥有 sudo 访问权限。让我们看看这个魔术。

```
$ sudo systemctl restart mariadb
[sudo] password for user2:

$ sudo grep -i mariadb /var/log/secure
[sudo] password for user2:
Mar 17 07:23:10 CentOS7 sudo: user2 : TTY=pts/0 ; PWD=/home/user2 ; USER=root ; COMMAND=/bin/systemctl restart mariadb
Mar 17 07:26:52 CentOS7 sudo: user2 : TTY=pts/0 ; PWD=/home/user2 ; USER=root ; COMMAND=/bin/grep -i mariadb /var/log/secure
```

### 在 Debian/Ubuntu 系统中如何配置 sudo 访问权限？

在基于 Debian 的系统中（如 Debian、Ubuntu 和 LinuxMint），使用下面的三个方法就可以做到。

#### 方法 1：在 Linux 中如何使用 sudo 或 admin 组为普通用户授予超级用户访问权限？

`sudo` 或 `admin` 是基于 Debian 的系统中的特殊组，它提供额外的权限，可以授权用户像超级用户一样执行受到限制的命令。

注意，应该在 `/etc/sudoers` 文件中激活 `sudo` 或 `admin` 组来获得该访问权限。

```
# grep -i 'sudo\|admin' /etc/sudoers

# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo ALL=(ALL:ALL) ALL
```

假设我们已经创建了一个用户账号来执行这些操作。在此，我将会使用 `2gadmin` 这个用户账号。

执行下面的命令，添加用户到 `sudo` 组。

```
# usermod -aG sudo 2gadmin
```

我们可以通过下面的命令来确定这一点。

```
# getent group sudo
sudo:x:27:2gadmin
```

我将要检测用户 `2gadmin` 是否可以访问属于 root 用户的文件。

```
$ less /var/log/auth.log
/var/log/auth.log: Permission denied
```

当我试图以普通用户身份访问 `/var/log/auth.log` 文件时出现错误。 我将要使用 `sudo` 访问同一个文件，让我们看看这个魔术。

```
$ sudo tail -5 /var/log/auth.log
[sudo] password for 2gadmin:
Mar 17 20:39:47 Ubuntu18 sudo: 2gadmin : TTY=pts/0 ; PWD=/home/2gadmin ; USER=root ; COMMAND=/bin/bash
Mar 17 20:39:47 Ubuntu18 sudo: pam_unix(sudo:session): session opened for user root by 2gadmin(uid=0)
Mar 17 20:40:23 Ubuntu18 sudo: pam_unix(sudo:session): session closed for user root
Mar 17 20:40:48 Ubuntu18 sudo: 2gadmin : TTY=pts/0 ; PWD=/home/2gadmin ; USER=root ; COMMAND=/usr/bin/tail -5 /var/log/auth.log
Mar 17 20:40:48 Ubuntu18 sudo: pam_unix(sudo:session): session opened for user root by 2gadmin(uid=0)
```

或者，我们可以通过添加用户到 `admin` 组来执行相同的操作。

运行下面的命令，添加用户到 `admin` 组。

```
# usermod -aG admin user1
```

我们可以通过下面的命令来确定这一点。

```
# getent group admin
admin:x:1011:user1
```

让我们看看输出信息。

```
$ sudo tail -2 /var/log/auth.log
[sudo] password for user1:
Mar 17 20:53:36 Ubuntu18 sudo: user1 : TTY=pts/0 ; PWD=/home/user1 ; USER=root ; COMMAND=/usr/bin/tail -2 /var/log/auth.log
Mar 17 20:53:36 Ubuntu18 sudo: pam_unix(sudo:session): session opened for user root by user1(uid=0)
```

#### 方法 2：在 Debian/Ubuntu 中如何使用 /etc/group 文件为普通用户授予超级用户访问权限？

我们可以通过编辑 `/etc/group` 文件来手动地添加用户到 `sudo` 组或 `admin` 组。

只需打开该文件，并在恰当的组后追加相应的用户就可完成这一点。

```
$ grep -i sudo /etc/group
sudo:x:27:2gadmin,user2
```

在该例中，我将使用 `user2` 这个用户账号。

我将要通过在系统中重启 Apache httpd 服务来检查用户 `user2` 是不是拥有 `sudo` 访问权限。让我们看看这个魔术。

```
$ sudo systemctl restart apache2
[sudo] password for user2:

$ sudo tail -f /var/log/auth.log
[sudo] password for user2:
Mar 17 21:01:04 Ubuntu18 systemd-logind[559]: New session 22 of user user2.
Mar 17 21:01:04 Ubuntu18 systemd: pam_unix(systemd-user:session): session opened for user user2 by (uid=0)
Mar 17 21:01:33 Ubuntu18 sudo: user2 : TTY=pts/0 ; PWD=/home/user2 ; USER=root ; COMMAND=/bin/systemctl restart apache2
```

#### 方法 3：在 Linux 中如何使用 /etc/sudoers 文件为普通用户授予超级用户访问权限？

sudo 用户的访问权限是被 `/etc/sudoers` 文件控制的。因此，只需将用户添加到 `sudoers` 文件中的 `sudo` 或 `admin` 组下即可。

只需通过 `visudo` 命令将期望的用户追加到 `/etc/sudoers` 文件中。

```
# grep -i user3 /etc/sudoers
user3 ALL=(ALL:ALL) ALL
```

在该例中，我将使用 `user3` 这个用户账号。

我将要通过在系统中重启 MariaDB 服务来检查用户 `user3` 是不是拥有 `sudo` 访问权限。让我们看看这个魔术。

```
$ sudo systemctl restart mariadb
[sudo] password for user3:

$ sudo tail -f /var/log/auth.log
[sudo] password for user3:
Mar 17 21:12:32 Ubuntu18 systemd-logind[559]: New session 24 of user user3.
Mar 17 21:12:49 Ubuntu18 sudo: user3 : TTY=pts/0 ; PWD=/home/user3 ; USER=root ; COMMAND=/bin/systemctl restart mariadb
Mar 17 21:12:49 Ubuntu18 sudo: pam_unix(sudo:session): session opened for user root by user3(uid=0)
Mar 17 21:12:53 Ubuntu18 sudo: pam_unix(sudo:session): session closed for user root
Mar 17 21:13:08 Ubuntu18 sudo: user3 : TTY=pts/0 ; PWD=/home/user3 ; USER=root ; COMMAND=/usr/bin/tail -f /var/log/auth.log
Mar 17 21:13:08 Ubuntu18 sudo: pam_unix(sudo:session): session opened for user root by user3(uid=0)
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-configure-sudo-access-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[liujing97](https://github.com/liujing97)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
