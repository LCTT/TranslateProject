如何在 Linux 上查看用户的创建日期
======

你知道吗，如何在 Linux 系统上查看帐户的创建日期？如果知道，那么有些什么办法。

你成功了么？如果是的话，该怎么做？

基本上 Linux 系统不会跟踪这些信息，因此，获取这些信息的替代方法是什么？

你可能会问为什么我要查看这个？

是的，在某些情况下，你可能需要查看这些信息，那时就会对你会有帮助。

可以使用以下 7 种方法进行验证。

  * 使用 `/var/log/secure`
  * 使用 `aureport` 工具
  * 使用 `.bash_logout`
  * 使用 `chage` 命令
  * 使用 `useradd` 命令
  * 使用 `passwd` 命令
  * 使用 `last` 命令

### 方式 1：使用 /var/log/secure

它存储所有安全相关的消息，包括身份验证失败和授权特权。它还会通过系统安全守护进程跟踪 `sudo` 登录、SSH 登录和其他错误记录。

```
# grep prakash /var/log/secure
Apr 12 04:07:18 centos.2daygeek.com useradd[21263]: new group: name=prakash, GID=501
Apr 12 04:07:18 centos.2daygeek.com useradd[21263]: new user: name=prakash, UID=501, GID=501, home=/home/prakash, shell=/bin/bash
Apr 12 04:07:34 centos.2daygeek.com passwd: pam_unix(passwd:chauthtok): password changed for prakash
Apr 12 04:08:32 centos.2daygeek.com sshd[21269]: Accepted password for prakash from 103.5.134.167 port 60554 ssh2
Apr 12 04:08:32 centos.2daygeek.com sshd[21269]: pam_unix(sshd:session): session opened for user prakash by (uid=0)
```

### 方式 2：使用 aureport 工具

`aureport` 工具可以根据记录在审计日志中的事件记录生成汇总和柱状报告。默认情况下，它会查询 `/var/log/audit/` 目录中的所有 `audit.log` 文件来创建报告。

```
# aureport --auth | grep prakash
46. 04/12/2018 04:08:32 prakash 103.5.134.167 ssh /usr/sbin/sshd yes 288
47. 04/12/2018 04:08:32 prakash 103.5.134.167 ssh /usr/sbin/sshd yes 291
```

### 方式 3：使用 .bash_logout

家目录中的 `.bash_logout` 对 bash 有特殊的含义，它提供了一种在用户退出系统时执行命令的方式。

我们可以查看用户家目录中 `.bash_logout` 的更改日期。该文件是在用户第一次注销时创建的。

```
# stat /home/prakash/.bash_logout
 File: `/home/prakash/.bash_logout'
 Size: 18 Blocks: 8 IO Block: 4096 regular file
Device: 801h/2049d Inode: 256153 Links: 1
Access: (0644/-rw-r--r--) Uid: ( 501/ prakash) Gid: ( 501/ prakash)
Access: 2017-03-22 20:15:00.000000000 -0400
Modify: 2017-03-22 20:15:00.000000000 -0400
Change: 2018-04-12 04:07:18.283000323 -0400
```

### 方式 4：使用 chage 命令

`chage` 意即 “change age”。该命令让用户管理密码过期信息。`chage` 命令可以修改上次密码更改日期后需要更改密码的天数。

系统使用此信息来确定用户何时必须更改其密码。如果用户自帐户创建日期以来没有更改密码，这个就有用。

```
# chage --list prakash
Last password change : Apr 12, 2018
Password expires : never
Password inactive : never
Account expires : never
Minimum number of days between password change : 0
Maximum number of days between password change : 99999
Number of days of warning before password expires : 7
```

### 方式 5：使用 useradd 命令

`useradd` 命令用于在 Linux 中创建新帐户。默认情况下，它不会添加用户创建日期，我们必须使用 “备注” 选项添加日期。

```
# useradd -m prakash -c `date +%Y/%m/%d`

# grep prakash /etc/passwd
prakash:x:501:501:2018/04/12:/home/prakash:/bin/bash
```

### 方式 6：使用 passwd 命令

`passwd` 命令用于将密码分配给本地帐户或用户。如果用户在帐户创建后没有修改密码，那么可以使用 `passwd` 命令查看最后一次密码修改的日期。

```
# passwd -S prakash
prakash PS 2018-04-11 0 99999 7 -1 (Password set, MD5 crypt.)
```

### 方式 7：使用 last 命令

`last` 命令读取 `/var/log/wtmp`，并显示自该文件创建以来所有登录（和退出）用户的列表。

```
# last | grep "prakash"
prakash pts/2 103.5.134.167 Thu Apr 12 04:08 still logged in
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-user-created-date-on-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
