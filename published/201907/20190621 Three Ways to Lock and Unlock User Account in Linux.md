[#]: collector: (lujun9972)
[#]: translator: (heguagnzhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11043-1.html)
[#]: subject: (Three Ways to Lock and Unlock User Account in Linux)
[#]: via: (https://www.2daygeek.com/lock-unlock-disable-enable-user-account-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 Linux 中锁定和解锁用户帐户的三种方法
======

![](https://linux.cn/article-11043-1.html)

如果你已经在你的组织中实施了某种密码策略，你无需看这篇文章了。但是在这种情况下，如果你给账户设置了 24 小时的锁定期，你需要手动解锁用户帐户。

本教程将帮助你在 Linux 中手动锁定和解锁用户帐户。 

这可以通过三种方式使用以下两个 Linux 命令来完成。

* `passwd`：用于更新用户的身份验证令牌。这个任务是通过调用 Linux PAM 和 libuser API 来实现。
* `usermod`：用于修改/更新给定用户的帐户信息。它用于将用户添加到特定的组中等等功能。

为了说明这一点，我们选择 `daygeek` 用户帐户。让我们看看，怎么一步步来实现的。

请注意，你必须使用你需要锁定或解锁的用户的帐户，而不是我们的帐户。你可以使用 `id` 命令检查给定的用户帐户在系统中是否可用。是的，我的这个帐户在我的系统中是可用的。

```
# id daygeek

uid=2240(daygeek) gid=2243(daygeek) groups=2243(daygeek),2244(ladmin)
```

### 方法1: 如何使用 passwd 命令锁定、解锁和检查 Linux 中给定用户帐户的状态？

`passwd` 命令是 Linux 管理员经常使用的命令之一。它用于更新 `/etc/shadow` 文件中用户的身份验证令牌。

使用 `-l` 开关运行 `passwd` 命令，锁定给定的用户帐户。

```
# passwd -l daygeek

Locking password for user daygeek.
passwd: Success
```

你可以通过 `passwd` 命令或从 `/etc/shadow` 文件中获取给定用户名来检查锁定的帐户状态。

使用 `passwd` 命令检查用户帐户锁定状态。

```
# passwd -S daygeek
或
# passwd --status daygeek

daygeek LK 2019-05-30 7 90 7 -1 (Password locked.)
```

这将输出给定帐户密码状态的简短信息。

* `LK`：密码被锁定
* `NP`：没有设置密码
* `PS`：密码已设置

使用 `/etc/shadow` 文件检查锁定的用户帐户状态。如果帐户已被锁定，密码前面将添加两个感叹号。

```
# grep daygeek /etc/shadow

daygeek:!!$6$tGvVUhEY$PIkpI43HPaEoRrNJSRpM3H0YWOsqTqXCxtER6rak5PMaAoyQohrXNB0YoFCmAuh406n8XOvBBldvMy9trmIV00:18047:7:90:7:::
```

使用 `-u` 开关运行 `passwd` 命令，可以解锁给定的用户帐户。

```
# passwd -u daygeek

Unlocking password for user daygeek.
passwd: Success
```

### 方法2：如何使用 usermod 命令在 Linux 中锁定、解锁和检查给定用户帐户的状态？

`usermod` 命令也经常被 Linux 管理员使用。`usermod` 命令用于修改/更新给定用户的帐户信息。它用于将用户添加到特定的组中，等等。

使用 `-L` 开关运行 `usermod` 命令，锁定给定的用户帐户。 

```
# usermod --lock daygeek
或
# usermod -L daygeek
```

你可以通过 `passwd` 命令或从 `/etc/shadow` 文件中获取给定用户名来检查锁定的帐户状态。

使用 `passwd` 命令检查用户帐户锁定状态。

```
# passwd -S daygeek
或
# passwd --status daygeek

daygeek LK 2019-05-30 7 90 7 -1 (Password locked.)
```

这将输出给定帐户密码状态的简短信息。

* `LK`：密码被锁定
* `NP`：没有设置密码
* `PS`：密码已设置

使用 `/etc/shadow` 文件检查锁定的用户帐户状态。如果帐户已被锁定，密码前面将添加两个感叹号。

```
# grep daygeek /etc/shadow

daygeek:!!$6$tGvVUhEY$PIkpI43HPaEoRrNJSRpM3H0YWOsqTqXCxtER6rak5PMaAoyQohrXNB0YoFCmAuh406n8XOvBBldvMy9trmIV00:18047:7:90:7:::
```

使用 `-U` 开关运行 `usermod` 命令以解锁给定的用户帐户。

```
# usermod --unlock daygeek
或
# usermod -U daygeek
```

### 方法-3：如何在 Linux 中使用 usermod 命令禁用、启用对给定用户帐户的 SSH 访问？

`usermod` 命令也是经常被 Linux 管理员使用的命令。`usermod` 命令用于修改/更新给定用户的帐户信息。它用于将用户添加到特定的组中，等等。

替代的，锁定可以通过将 `nologin` shell 分配给给定用户来完成。为此，可以运行以下命令。

```
# usermod -s /sbin/nologin daygeek
```

你可以通过从 `/etc/passwd` 文件中给定用户名来检查锁定的用户帐户详细信息。

```
# grep daygeek /etc/passwd

daygeek:x:2240:2243::/home/daygeek:/sbin/nologin
```

我们可以通过分配回原来的 shell 来启用用户的 ssh 访问。

```
# usermod -s /bin/bash daygeek
```

### 如何使用 shell 脚本锁定、解锁和检查 Linux 中多个用户帐户的状态？

如果你想锁定/解锁多个帐户，那么你需要找个脚本。

是的，我们可以编写一个小的 shell 脚本来执行这个操作。为此，请使用以下 shell 脚本。

创建用户列表。每个用户信息在单独的行中。

```
$ cat user-lists.txt

u1
u2
u3
u4
u5
```

使用以下 shell 脚本锁定 Linux中 的多个用户帐户。

```
# user-lock.sh

#!/bin/bash
for user in `cat user-lists.txt`
do
  passwd -l $user
done
```

将 `user-lock.sh` 文件设置为可执行权限。

```
# chmod + user-lock.sh
```

最后运行脚本来达成目标。

```
# sh user-lock.sh

Locking password for user u1.
passwd: Success
Locking password for user u2.
passwd: Success
Locking password for user u3.
passwd: Success
Locking password for user u4.
passwd: Success
Locking password for user u5.
passwd: Success
```

使用以下 shell 脚本检查锁定的用户帐户。

```
# vi user-lock-status.sh

#!/bin/bash
for user in `cat user-lists.txt`
do
  passwd -S $user
done
```

设置 `user-lock-status.sh` 可执行权限。

```
# chmod + user-lock-status.sh
```

最后运行脚本来达成目标。

```
# sh user-lock-status.sh

u1 LK 2019-06-10 0 99999 7 -1 (Password locked.)
u2 LK 2019-06-10 0 99999 7 -1 (Password locked.)
u3 LK 2019-06-10 0 99999 7 -1 (Password locked.)
u4 LK 2019-06-10 0 99999 7 -1 (Password locked.)
u5 LK 2019-06-10 0 99999 7 -1 (Password locked.)
```

使用下面的 shell 脚本来解锁多个用户。

```
# user-unlock.sh

#!/bin/bash
for user in `cat user-lists.txt`
do
  passwd -u $user
done
```

设置 `user-unlock.sh` 可执行权限。

```
# chmod + user-unlock.sh
```

最后运行脚本来达成目标。

```
# sh user-unlock.sh

Unlocking password for user u1.
passwd: Success
Unlocking password for user u2.
passwd: Success
Unlocking password for user u3.
passwd: Success
Unlocking password for user u4.
passwd: Success
Unlocking password for user u5.
passwd: Success
```

运行相同的 shell 脚本 `user-lock-status.sh`，检查这些锁定的用户帐户在 Linux 中是否被解锁。

```
# sh user-lock-status.sh

u1 PS 2019-06-10 0 99999 7 -1 (Password set, SHA512 crypt.)
u2 PS 2019-06-10 0 99999 7 -1 (Password set, SHA512 crypt.)
u3 PS 2019-06-10 0 99999 7 -1 (Password set, SHA512 crypt.)
u4 PS 2019-06-10 0 99999 7 -1 (Password set, SHA512 crypt.)
u5 PS 2019-06-10 0 99999 7 -1 (Password set, SHA512 crypt.)
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/lock-unlock-disable-enable-user-account-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
