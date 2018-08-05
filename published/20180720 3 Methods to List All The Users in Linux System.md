列出 Linux 系统上所有用户的 3 种方法
=======

> 通过使用 `/etc/passwd` 文件，`getent` 命令，`compgen` 命令这三种方法查看系统中用户的信息

大家都知道，Linux 系统中用户信息存放在 `/etc/passwd` 文件中。

这是一个包含每个用户基本信息的文本文件。当我们在系统中创建一个用户，新用户的详细信息就会被添加到这个文件中。

`/etc/passwd` 文件将每个用户的基本信息记录为文件中的一行，一行中包含 7 个字段。

`/etc/passwd` 文件的一行代表一个单独的用户。该文件将用户的信息分为 3 个部分。

    * 第 1 部分：`root` 用户信息
    * 第 2 部分：系统定义的账号信息
    * 第 3 部分：真实用户的账户信息

第一部分是 `root` 账户，这代表管理员账户，对系统的每个方面都有完全的权力。

第二部分是系统定义的群组和账户，这些群组和账号是正确安装和更新系统软件所必需的。

第三部分在最后，代表一个使用系统的真实用户。

在创建新用户时，将修改以下 4 个文件。

    * `/etc/passwd`： 用户账户的详细信息在此文件中更新。
    * `/etc/shadow`： 用户账户密码在此文件中更新。
    * `/etc/group`： 新用户群组的详细信息在此文件中更新。
    * `/etc/gshadow`： 新用户群组密码在此文件中更新。

** 建议阅读 : ** 

- [ 如何在 Linux 上查看创建用户的日期 ][1] 
- [ 如何在 Linux 上查看 A 用户所属的群组 ][2]  
- [ 如何强制用户在下一次登录 Linux 系统时修改密码 ][3] 

### 方法 1 ：使用 `/etc/passwd` 文件

使用任何一个像 `cat`、`more`、`less` 等文件操作命令来打印 Linux 系统上创建的用户列表。

`/etc/passwd` 是一个文本文件，其中包含了登录 Linux 系统所必需的每个用户的信息。它保存用户的有用信息，如用户名、密码、用户 ID、群组 ID、用户 ID 信息、用户的家目录和 Shell 。

`/etc/passwd` 文件将每个用户的详细信息写为一行，其中包含七个字段，每个字段之间用冒号 `:` 分隔：

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
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
tcpdump:x:72:72::/:/sbin/nologin
2gadmin:x:500:10::/home/viadmin:/bin/bash
apache:x:48:48:Apache:/var/www:/sbin/nologin
zabbix:x:498:499:Zabbix Monitoring System:/var/lib/zabbix:/sbin/nologin
mysql:x:497:502::/home/mysql:/bin/bash
zend:x:502:503::/u01/zend/zend/gui/lighttpd:/sbin/nologin
rpc:x:32:32:Rpcbind Daemon:/var/cache/rpcbind:/sbin/nologin
2daygeek:x:503:504::/home/2daygeek:/bin/bash
named:x:25:25:Named:/var/named:/sbin/nologin
mageshm:x:506:507:2g Admin - Magesh M:/home/mageshm:/bin/bash

```
7 个字段的详细信息如下。

* **用户名** （`magesh`）： 已创建用户的用户名，字符长度 1 个到 12 个字符。
* **密码**（`x`）：代表加密密码保存在 `/etc/shadow 文件中。
* **用户 ID（`506`）：代表用户的 ID 号，每个用户都要有一个唯一的 ID 。UID 号为 0 的是为 `root` 用户保留的，UID 号 1 到 99 是为系统用户保留的，UID 号 100-999 是为系统账户和群组保留的。
* **群组 ID （`507`）：代表群组的 ID 号，每个群组都要有一个唯一的 GID ，保存在 `/etc/group` 文件中。
* **用户信息（`2g Admin - Magesh M`）：代表描述字段，可以用来描述用户的信息（LCTT 译注：此处原文疑有误）。
* **家目录（`/home/mageshm`）：代表用户的家目录。
* **Shell（`/bin/bash`）：代表用户使用的 shell 类型。

你可以使用 `awk` 或 `cut` 命令仅打印出 Linux 系统中所有用户的用户名列表。显示的结果是相同的。

```
# awk -F':' '{ print $1}' /etc/passwd
or
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
ftp
postfix
sshd
tcpdump
2gadmin
apache
zabbix
mysql
zend
rpc
2daygeek
named
mageshm
```
### 方法 2 ：使用 `getent` 命令

`getent` 命令显示 Name Service Switch 库支持的数据库中的条目。这些库的配置文件为 `/etc/nsswitch.conf`。

`getent` 命令显示类似于 `/etc/passwd` 文件的用户详细信息，它将每个用户详细信息显示为包含七个字段的单行。

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
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
tcpdump:x:72:72::/:/sbin/nologin
2gadmin:x:500:10::/home/viadmin:/bin/bash
apache:x:48:48:Apache:/var/www:/sbin/nologin
zabbix:x:498:499:Zabbix Monitoring System:/var/lib/zabbix:/sbin/nologin
mysql:x:497:502::/home/mysql:/bin/bash
zend:x:502:503::/u01/zend/zend/gui/lighttpd:/sbin/nologin
rpc:x:32:32:Rpcbind Daemon:/var/cache/rpcbind:/sbin/nologin
2daygeek:x:503:504::/home/2daygeek:/bin/bash
named:x:25:25:Named:/var/named:/sbin/nologin
mageshm:x:506:507:2g Admin - Magesh M:/home/mageshm:/bin/bash
```

7 个字段的详细信息如上所述。（LCTT 译注：此处内容重复，删节）

你同样可以使用 `awk` 或 `cut` 命令仅打印出 Linux 系统中所有用户的用户名列表。显示的结果是相同的。

### 方法 3 ：使用 `compgen` 命令

`compgen` 是 `bash` 的内置命令，它将显示所有可用的命令，别名和函数。

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
ftp
postfix
sshd
tcpdump
2gadmin
apache
zabbix
mysql
zend
rpc
2daygeek
named
mageshm
```

------------------------

via: https://www.2daygeek.com/3-methods-to-list-all-the-users-in-linux-system/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[SunWave](https://github.com/SunWave)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/how-to-check-user-created-date-on-linux/
[2]:https://www.2daygeek.com/how-to-check-which-groups-a-user-belongs-to-on-linux/
[3]:https://www.2daygeek.com/how-to-force-user-to-change-password-on-next-login-in-linux/


