[#]: collector:	"lujun9972"
[#]: translator:	"hello-wn"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-11156-1.html"
[#]: subject: "How to Create a User Account Without useradd Command in Linux?"
[#]: via: "https://www.2daygeek.com/linux-user-account-creation-in-manual-method/"
[#]: author: "Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/"

在 Linux 中不使用 useradd 命令如何创建用户账号
========

Linux 中有三个命令可以用来创建用户账号。你尝试过在 Linux 中手动创建用户吗？我的意思是不使用上面说的三个命令。

如果你不知道怎么做，本文可以手把手教你，并向你展示细节部分。

你可能想，这怎么可能？别担心，正如我们多次提到的那样，在 Linux 上任何事都可以搞定。这只是其中一例。

是的，我们可以做到的。想了解更多吗？

- [在 Linux 中创建用户的三种方法][1]
- [在 Linux 中批量创建用户的两种方法][2]

话不多说，让我们开始吧。

首先，我们要找出最后创建的 UID 和 GID 信息。 掌握了这些信息之后，就可以继续下一步。

```
# cat /etc/passwd | tail -1
tuser1:x:1153:1154:Test User:/home/tuser1:/bin/bash
```

根据以上输出，最后创建的用户 UID 是 1153，GID 是 1154。为了试验，我们将在系统中添加 `tuser2` 用户。

现在，在`/etc/passwd` 文件中添加一条用户信息。 总共七个字段，你需要添加一些必要信息。

```
+-----------------------------------------------------------------------+
|username:password:UID:GID:Comments:User Home Directory:User Login Shell|
+-----------------------------------------------------------------------+
    |         |     |   |      |            |                  |
    1         2     3   4      5            6                  7
```

1. 用户名：这个字段表示用户名称。字符长度必须在 1 到 32 之间。
2. 密码（`x`）：表示存储在 `/etc/shadow` 文件中的加密密码。
3. 用户 ID：表示用户的 ID（UID），每个用户都有独一无二的 UID。UID 0 保留给 root 用户，UID 1-99 保留给系统用户，UID 100-999 保留给系统账号/组。
4. 组 ID：表示用户组的 ID（GID），每个用户组都有独一无二的 GID，存储在 `/etc/group` 文件中。
5. 注释/用户 ID 信息：这个字段表示备注，用于描述用户信息。
6. 主目录（`/home/$USER`）：表示用户的主目录。
7. shell（`/bin/bash`）：表示用户使用的 shell。

在文件最后添加用户信息。

```
# vi /etc/passwd

tuser2:x:1154:1155:Test User2:/home/tuser2:/bin/bash
```

你需要创建相同名字的用户组。同样地，在 `/etc/group` 文件中添加用户组信息。

```
# vi /etc/group

tuser2:x:1155:
```

做完以上两步之后，给用户设置一个密码。

```
# passwd tuser2

Changing password for user tuser2.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
```

最后，试着登录新创建的用户。

```
# ssh [email protected]

[email protected]'s password:
Creating directory '/home/tuser2'.

$ls -la

total 16
drwx------.  2 tuser2 tuser2   59 Jun 17 09:46 .
drwxr-xr-x. 15 root   root   4096 Jun 17 09:46 ..
-rw-------.  1 tuser2 tuser2   18 Jun 17 09:46 .bash_logout
-rw-------.  1 tuser2 tuser2  193 Jun 17 09:46 .bash_profile
-rw-------.  1 tuser2 tuser2  231 Jun 17 09:46 .bashrc
```

------

via: https://www.2daygeek.com/linux-user-account-creation-in-manual-method/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[hello-wn](https://github.com/hello-wn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-user-account-creation-useradd-adduser-newusers/
[2]: https://www.2daygeek.com/linux-bulk-users-creation-useradd-newusers/
