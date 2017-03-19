在 Linux 中无人看守批量创建用户的方法
=============

### 介绍

作为一名 Linux 系统管理员，你有时必须向系统添加新的用户帐户。为此，经常使用 `adduser` 命令。当涉及到多个用户的创建时，`adduser` 命令可能会变得相当无聊和耗时。这篇短文旨在为 Linux 系统管理员提供一种简单而无人值守的方式来批量创建用户。`newusers` 命令将帮助你通过从预填文件中获取信息来创建多个用户。

**要求**

访问 Linux 计算机的特权。

**约定**

- `#` - 给定命令需要以 root 用户权限运行或者使用 `sudo` 命令
- `$` - 给定命令以常规权限用户运行

### 如何进行

**创建一个包含用户名的文件**

首先，你需要创建一个包含用户名列表的文件。

```
$ vi users-list.txt
```

在文件中，一个用户一行，下面是样式：

```
Username:Password:User ID:Group ID:User Info:Home Directory:Default Shell
Username:Password:User ID:Group ID:User Info:Home Directory:Default Shell
Username:Password:User ID:Group ID:User Info:Home Directory:Default Shell
...
```

**创建用户**

在创建了包含用户信息的文件后，使用 `newusers` 命令创建用户。

```
# newusers users-list.txt
```

**检查用户账户**

最后你可以确认用户已经正确创建了，在 `/etc/passwd` 文件中查看它们：

```
# tail /etc/passwd
```

![using newusers for bulk user creation](https://linuxconfig.org/images/newusers-bulk-user-creation.png) 


--------------------------------------------------------------------------------

via: https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux

作者：[Essodjolo Kahanam][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux
[1]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h4-1-create-a-file-containing-the-usernames
[2]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h4-2-create-users
[3]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h4-3-check-user-accounts
[4]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h1-introduction
[5]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h2-requirements
[6]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h3-conventions
[7]:https://linuxconfig.org/simple-way-for-unattended-bulk-user-creation-in-linux#h4-how-to-proceed
