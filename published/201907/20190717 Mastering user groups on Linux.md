[#]: collector: (lujun9972)
[#]: translator: (0x996)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11148-1.html)
[#]: subject: (Mastering user groups on Linux)
[#]: via: (https://www.networkworld.com/article/3409781/mastering-user-groups-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

掌握 Linux 用户组
======

> 在 Linux 系统中管理用户组并不费力，但相关命令可能比你所知的更为灵活。

![Scott 97006 \(CC BY 2.0\)][1]

在 Linux 系统中用户组起着重要作用。用户组提供了一种简单方法供一组用户互相共享文件。用户组也允许系统管理员更加有效地管理用户权限，因为管理员可以将权限分配给用户组而不是逐一分配给单个用户。

尽管通常只要在系统中添加用户账户就会创建用户组，关于用户组如何工作以及如何运用用户组还有很多需要了解的。

### 一个用户一个用户组？

Linux 系统中多数用户账户被设为用户名与用户组名相同。用户 `jdoe` 会被赋予一个名为 `jdoe` 的用户组，且成为该新建用户组的唯一成员。如本例所示，该用户的登录名，用户 id 和用户组 id 在新建账户时会被添加到 `/etc/passwd` 和 `/etc/group` 文件中：

```
$ sudo useradd jdoe
$ grep jdoe /etc/passwd
jdoe:x:1066:1066:Jane Doe:/home/jdoe:/bin/sh
$ grep jdoe /etc/group
jdoe:x:1066:
```

这些文件中的配置使系统得以在文本（`jdoe`）和数字（`1066`）这两种用户 id 形式之间互相转换—— `jdoe` 就是 `1006`，且 `1006` 就是 `jdoe`。

分配给每个用户的 UID（用户 id）和 GID（用户组 id）通常是一样的，并且顺序递增。若上例中 Jane Doe 是最近添加的用户，分配给下一个新用户的用户 id 和用户组 id 很可能都是 1067。

### GID = UID？

UID 和 GID 可能不一致。例如，如果你用 `groupadd` 命令添加一个用户组而不指定用户组 id，系统会分配下一个可用的用户组 id（在本例中为 1067）。下一个添加到系统中的用户其 UID 会是 1067 而 GID 则为 1068。

你可以避免这个问题，方法是添加用户组的时候指定一个较小的用户组 id 而不是接受默认值。在下面的命令中我们添加一个用户组并提供一个 GID，这个 GID 小于用于用户账户的 GID 取值范围。

```
$ sudo groupadd -g 500 devops
```

创建账户时你可以指定一个共享用户组，如果这样对你更合适的话。例如你可能想把新来的开发人员加入同一个 DevOps 用户组而不是一人一个用户组。

```
$ sudo useradd -g staff bennyg
$ grep bennyg /etc/passwd
bennyg:x:1064:50::/home/bennyg:/bin/sh
```

### 主要用户组和次要用户组

用户组实际上有两种：<ruby>主要用户组<rt>primary group</rt></ruby>和<ruby>次要用户组<rt>secondary group</rt></ruby>。

主要用户组是保存在 `/etc/passwd` 文件中的用户组，该用户组在账户创建时配置。当用户创建一个文件时，用户的主要用户组与此文件关联。

```
$ whoami
jdoe
$ grep jdoe /etc/passwd
jdoe:x:1066:1066:John Doe:/home/jdoe:/bin/bash
             ^
             |
             +-------- 主要用户组
$ touch newfile
$ ls -l newfile
-rw-rw-r-- 1 jdoe jdoe 0 Jul 16 15:22 newfile
                   ^
                   |
                   +-------- 主要用户组
```

用户一旦拥有账户之后被加入的那些用户组是次要用户组。次要用户组成员关系在 `/etc/group` 文件中显示。

```
$ grep devops /etc/group
devops:x:500:shs,jadep
          ^
          |
          +-------- shs 和 jadep 的次要用户组
```

`/etc/group` 文件给用户组分配组名称（例如 `500` = `devops`）并记录次要用户组成员。

### 首选的准则

每个用户是他自己的主要用户组成员，并可以成为任意多个次要用户组成员，这样的一种准则允许用户更加容易地将个人文件和需要与同事分享的文件分开。当用户创建一个文件时，用户所属的不同用户组的成员不一定有访问权限。用户必须用 `chgrp` 命令将文件和次要用户组关联起来。

### 哪里也不如自己的家目录

添加新账户时一个重要的细节是 `useradd` 命令并不一定为新用户添加一个<ruby>家目录<rt>/home</rt></ruby>家目录。若你只有某些时候想为用户添加家目录，你可以在 `useradd` 命令中加入 `-m` 选项（可以把它想象成“安家”选项）。

```
$ sudo useradd -m -g devops -c "John Doe" jdoe2
```

此命令中的选项如下：

* `-m` 创建家目录并在其中生成初始文件
* `-g` 指定用户归属的用户组
* `-c` 添加账户描述信息（通常是用户的姓名）

若你希望总是创建家目录，你可以编辑 `/etc/login.defs` 文件来更改默认工作方式。更改或添加 `CREATE_HOME` 变量并将其设置为 `yes`：

```
$ grep CREATE_HOME /etc/login.defs
CREATE_HOME     yes
```

另一种方法是用自己的账户设置别名从而让 `useradd` 一直带有 `-m` 选项。

```
$ alias useradd=’useradd -m’
```

确保将该别名添加到你的 `~/.bashrc` 文件或类似的启动文件中以使其永久生效。

### 深入了解 /etc/login.defs

下面这个命令可列出 `/etc/login.defs` 文件中的全部设置。下面的 `grep` 命令会隐藏所有注释和空行。

```
$ cat /etc/login.defs | grep -v "^#" | grep -v "^$"
MAIL_DIR        /var/mail
FAILLOG_ENAB            yes
LOG_UNKFAIL_ENAB        no
LOG_OK_LOGINS           no
SYSLOG_SU_ENAB          yes
SYSLOG_SG_ENAB          yes
FTMP_FILE       /var/log/btmp
SU_NAME         su
HUSHLOGIN_FILE  .hushlogin
ENV_SUPATH      PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV_PATH        PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
TTYGROUP        tty
TTYPERM         0600
ERASECHAR       0177
KILLCHAR        025
UMASK           022
PASS_MAX_DAYS   99999
PASS_MIN_DAYS   0
PASS_WARN_AGE   7
UID_MIN                  1000
UID_MAX                 60000
GID_MIN                  1000
GID_MAX                 60000
LOGIN_RETRIES           5
LOGIN_TIMEOUT           60
CHFN_RESTRICT           rwh
DEFAULT_HOME    yes
CREATE_HOME         yes                 <===
USERGROUPS_ENAB yes
ENCRYPT_METHOD SHA512
```

注意此文件中的各种设置会决定用户 id 的取值范围以及密码使用期限和其他设置（如 umask）。

### 如何显示用户所属的用户组

出于各种原因用户可能是多个用户组的成员。用户组成员身份给与用户对用户组拥有的文件和目录的访问权限，有时候这种工作方式是至关重要的。要生成某个用户所属用户组的清单，用 `groups` 命令即可。

```
$ groups jdoe
jdoe : jdoe adm admin cdrom sudo dip plugdev lpadmin staff sambashare
```

你可以键入不带任何参数的 `groups` 命令来列出你自己的用户组。

### 如何添加用户至用户组

如果你想添加一个已有用户至别的用户组，你可以仿照下面的命令操作：

```
$ sudo usermod -a -G devops jdoe
```

你也可以指定逗号分隔的用户组列表来添加一个用户至多个用户组：

```
$ sudo usermod -a -G devops,mgrs jdoe
```

参数 `-a` 意思是“添加”，`-G` 指定用户组列表。

你可以编辑 `/etc/group` 文件将用户名从用户组成员名单中删除，从而将用户从用户组中移除。`usermod` 命令或许也有个选项用于从用户组中删除某个成员。

```
fish:x:16:nemo,dory,shark
           |
           V
fish:x:16:nemo,dory
```

### 提要

添加和管理用户组并非特别困难，但长远来看配置账户时的一致性可使这项工作更容易些。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3409781/mastering-user-groups-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[0x996](https://github.com/0x996)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/07/carrots-100801917-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.networkworld.com/article/3391029/must-know-linux-commands.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
