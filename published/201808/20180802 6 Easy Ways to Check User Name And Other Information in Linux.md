6 个简单的方式来查看 Linux 中的用户名和其它信息
======

这是一个非常基础的话题，在 Linux 中，每个人都知道如何使用 `id` 来查找用户信息。一些用户也从 `/etc/passwd` 文件中过滤用户信息。

我们还使用其它命令来获取用户信息。

你可能会问，为什么要讨论这个基础话题呢？即使我也这么认为，因为除了这两个之外没有更好的方法了，但是我们也有一些不错的选择。

与这两者相比，那些命令提供了更详细的信息，这对于新手非常有帮助。

这是帮助管理员在 Linux 中查找用户信息的基本命令之一。Linux 中的一切都是文件，甚至用户信息都存储在一个文件中。

建议阅读：

- [怎样在 Linux 上查看用户创建的日期][1]
- [怎样在 Linux 上查看用户属于哪个组][2]
- [怎样在 Linux 上查看强制用户在下次登录时改变密码][3]

所有用户都被添加在 `/etc/passwd` 文件中，这里保留了用户名和其它相关详细信息。在 Linux 中创建用户时，用户详细信息将存储在 `/etc/passwd` 文件中。passwd 文件将每个用户详细信息保存为一行，包含 7 字段。

我们可以使用以下 6 种方法来查看用户信息。

  * `id`：为指定的用户名打印用户和组信息。
  * `getent`：从 Name Service Switch 库中获取条目。
  * `/etc/passwd`： 文件包含每个用户的详细信息，每个用户详情是一行，包含 7 个字段。
  * `finger`：用户信息查询程序
  * `lslogins`：显示系统中已有用户的信息
  * `compgen`：是 bash 内置命令，它将显示用户的所有可用命令。

### 1) 使用 id 命令

`id` 代表<ruby>身份<rt>identity</rt></ruby>。它输出真实有效的用户和组 ID。也可以输出指定用户或当前用户的用户和组信息。

```
# id daygeek
uid=1000(daygeek) gid=1000(daygeek) groups=1000(daygeek),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),118(lpadmin),128(sambashare)
```

下面是上述输出的详细信息：

  * `uid (1000/daygeek)`： 它显示用户 ID 和用户名
  * `gid (1000/daygeek)`： 它显示用户的组 ID 和名称
  * `groups`： 它显示用户的附加组 ID 和名称

### 2) 使用 getent 命令

`getent` 命令显示 Name Service Switch 库支持的数据库中的条目，这些库在 `/etc/nsswitch.conf` 中配置。

`getent` 命令会显示类似于 `/etc/passwd` 文件的用户详情，它将每个用户的详细信息放在一行，包含 7 个字段。

```
# getent passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
uucp:x:10:14:uucp:/var/spool/uucp:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
gopher:x:13:30:gopher:/var/gopher:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
vcsa:x:69:69:virtual console memory owner:/dev:/sbin/nologin
abrt:x:173:173::/etc/abrt:/sbin/nologin
haldaemon:x:68:68:HAL daemon:/:/sbin/nologin
ntp:x:38:38::/etc/ntp:/sbin/nologin
saslauth:x:499:76:Saslauthd user:/var/empty/saslauth:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
tcpdump:x:72:72::/:/sbin/nologin
centos:x:500:500:Cloud User:/home/centos:/bin/bash
prakash:x:501:501:2018/04/12:/home/prakash:/bin/bash
apache:x:48:48:Apache:/var/www:/sbin/nologin
nagios:x:498:498::/var/spool/nagios:/sbin/nologin
rpc:x:32:32:Rpcbind Daemon:/var/lib/rpcbind:/sbin/nologin
nrpe:x:497:497:NRPE user for the NRPE service:/var/run/nrpe:/sbin/nologin
magesh:x:502:503:2g Admin - Magesh M:/home/magesh:/bin/bash
thanu:x:503:504:2g Editor - Thanisha M:/home/thanu:/bin/bash
sudha:x:504:505:2g Editor - Sudha M:/home/sudha:/bin/bash
```

下面是关于 7 个字段的详细信息：

```
magesh:x:502:503:2g Admin - Magesh M:/home/magesh:/bin/bash
```

  * `Username (magesh)`： 已创建的用户名。字符长度应该在 1 到 32 之间。
  * `Password (x)`： 它表明加密密码存储在 `/etc/shadow` 文件中。
  * `User ID (UID-502)`： 它表示用户 ID（UID），每个用户应包含唯一的 UID。UID (0-Zero) 保留给 root，UID（1-99）是为系统用户保留的，UID（100-999）是为系统账户/组保留的。
  * `Group ID (GID-503)`： 它表示组 ID（GID），每个组应该包含唯一的 GID，它存储在 `/etc/group` 文件中。
  * `User ID Info (2g Admin - Magesh M)`： 它表示命令字段。这个字段可用于描述用户信息。
  * `Home Directory (/home/magesh)`： 它表示用户家目录。
  * `shell (/bin/bash)`： 它表示用户的 bash shell。

如果你只想在 `getent` 命令的输出中显示用户名，使用以下命令格式：

```
# getent passwd | cut -d: -f1
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
uucp
operator
games
gopher
ftp
nobody
dbus
vcsa
abrt
haldaemon
ntp
saslauth
postfix
sshd
tcpdump
centos
prakash
apache
nagios
rpc
nrpe
magesh
thanu
sudha
```

只显示用户的家目录，使用以下命令格式：

```
# getent passwd | grep '/home' | cut -d: -f1
centos
prakash
magesh
thanu
sudha
```

### 3) 使用 /etc/passwd 文件

`/etc/passwd` 是一个文本文件，它包含每个用户登录 Linux 系统所必需的的信息。它维护用户的有用信息，如用户名，密码，用户 ID，组 ID，用户 ID 信息，家目录和 shell。`/etc/passwd` 文件将每个用户详细信息放在一行中，包含 7 个字段，如下所示：

```
# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
uucp:x:10:14:uucp:/var/spool/uucp:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
gopher:x:13:30:gopher:/var/gopher:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
vcsa:x:69:69:virtual console memory owner:/dev:/sbin/nologin
abrt:x:173:173::/etc/abrt:/sbin/nologin
haldaemon:x:68:68:HAL daemon:/:/sbin/nologin
ntp:x:38:38::/etc/ntp:/sbin/nologin
saslauth:x:499:76:Saslauthd user:/var/empty/saslauth:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
tcpdump:x:72:72::/:/sbin/nologin
centos:x:500:500:Cloud User:/home/centos:/bin/bash
prakash:x:501:501:2018/04/12:/home/prakash:/bin/bash
apache:x:48:48:Apache:/var/www:/sbin/nologin
nagios:x:498:498::/var/spool/nagios:/sbin/nologin
rpc:x:32:32:Rpcbind Daemon:/var/lib/rpcbind:/sbin/nologin
nrpe:x:497:497:NRPE user for the NRPE service:/var/run/nrpe:/sbin/nologin
magesh:x:502:503:2g Admin - Magesh M:/home/magesh:/bin/bash
thanu:x:503:504:2g Editor - Thanisha M:/home/thanu:/bin/bash
sudha:x:504:505:2g Editor - Sudha M:/home/sudha:/bin/bash
```

以下是 7 个字段的详细信息。

```
magesh:x:502:503:2g Admin - Magesh M:/home/magesh:/bin/bash
```

  * `Username (magesh)`： 已创建的用户名。字符长度应该在 1 到 32 之间。
  * `Password (x)`： 它表明加密密码存储在 `/etc/shadow` 文件中。
  * `User ID (UID-502)`： 它表示用户 ID（UID），每个用户应包含唯一的 UID。UID (0-Zero) 保留给 root，UID（1-99）是为系统用户保留的，UID（100-999）是为系统账户/组保留的。
  * `Group ID (GID-503)`： 它表示组 ID（GID），每个组应该包含唯一的 GID，它存储在 `/etc/group` 文件中。
  * `User ID Info (2g Admin - Magesh M)`： 它表示命令字段。这个字段可用于描述用户信息。
  * `Home Directory (/home/magesh)`： 它表示用户家目录。
  * `shell (/bin/bash)`： 它表示用户的 bash shell。

如果你只想显示 `/etc/passwd` 文件中的用户名，使用以下格式：

```
# cut -d: -f1 /etc/passwd
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
uucp
operator
games
gopher
ftp
nobody
dbus
vcsa
abrt
haldaemon
ntp
saslauth
postfix
sshd
tcpdump
centos
prakash
apache
nagios
rpc
nrpe
magesh
thanu
sudha
```

只显示用户的家目录，使用以下格式：

```
# cat /etc/passwd | grep '/home' | cut -d: -f1
centos
prakash
magesh
thanu
sudha
```

### 4) 使用 finger 命令

`finger` 命令显示有关系统用户的信息。它显示用户的真实姓名，终端名称和写入状态（如果没有写入权限，那么最为终端名称后面的 `*`），空闲时间和登录时间。

```
# finger magesh
Login: magesh Name: 2g Admin - Magesh M
Directory: /home/magesh Shell: /bin/bash
Last login Tue Jul 17 22:46 (EDT) on pts/2 from 103.5.134.167
No mail.
No Plan.
```

以下是上述输出的详细信息：

  * `Login`： 用户名
  * `Name`： 附加/有关用户的其它信息
  * `Directory`： 用户家目录的信息
  * `Shell`： 用户的 shell 信息
  * `LAST-LOGIN`： 上次登录日期和其它信息

### 5) 使用 lslogins 命令

它显示系统已知用户的信息。默认情况下，它将列出系统中所有用户的信息。

`lslogins` 使用程序的灵感来自于 `logins` 实用程序，该实用程序最初出现在 FreeBSD 4.10 中。

```
# lslogins -u
UID USER PWD-LOCK PWD-DENY LAST-LOGIN GECOS
 0 root 0 0 00:17:28 root
500 centos 0 1 Cloud User
501 prakash 0 0 Apr12/04:08 2018/04/12
502 magesh 0 0 Jul17/22:46 2g Admin - Magesh M
503 thanu 0 0 Jul18/00:40 2g Editor - Thanisha M
504 sudha 0 0 Jul18/01:18 2g Editor - Sudha M
```

以下是上述输出的详细信息：

  * `UID`： 用户 id
  * `USER`： 用户名
  * `PWD-LOCK`： 密码已设置，但是已锁定
  * `PWD-DENY`： 登录密码是否禁用
  * `LAST-LOGIN`： 上次登录日期
  * `GECOS`： 有关用户的其它信息

### 6) 使用 compgen 命令

`compgen` 是 bash 内置命令，它将显示所有可用的命令，别名和函数。（LCTT 译注：它的 `-u` 参数可以列出系统中用户。）

```
# compgen -u
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
uucp
operator
games
gopher
ftp
nobody
dbus
vcsa
abrt
haldaemon
ntp
saslauth
postfix
sshd
tcpdump
centos
prakash
apache
nagios
rpc
nrpe
magesh
thanu
sudha

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/6-easy-ways-to-check-user-name-and-other-information-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/how-to-check-user-created-date-on-linux/
[2]:https://www.2daygeek.com/how-to-check-which-groups-a-user-belongs-to-on-linux/
[3]:https://www.2daygeek.com/how-to-force-user-to-change-password-on-next-login-in-linux/
