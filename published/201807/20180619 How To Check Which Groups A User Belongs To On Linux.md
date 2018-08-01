如何在 Linux 上检查用户所属组
======

将用户添加到现有组是 Linux 管理员的常规活动之一。这是一些在大环境中工作的管理员的日常活动。

甚至我会因为业务需求而在我的环境中每天都在进行这样的活动。它是帮助你识别环境中现有组的重要命令之一。

此外，这些命令还可以帮助你识别用户所属的组。所有用户都列在 `/etc/passwd` 中，组列在 `/etc/group` 中。

无论我们使用什么命令，都将从这些文件中获取信息。此外，每个命令都有其独特的功能，可帮助用户单独获取所需的信息。

### 什么是 /etc/passwd？

`/etc/passwd` 是一个文本文件，其中包含登录 Linux 系统所必需的每个用户信息。它维护有用的用户信息，如用户名、密码、用户 ID、组 ID、用户 ID 信息、家目录和 shell。passwd 每行包含了用户的详细信息，共有如上所述的 7 个字段。

```
$ grep "daygeek" /etc/passwd
daygeek:x:1000:1000:daygeek,,,:/home/daygeek:/bin/bash
```

### 什么是 /etc/group？

`/etc/group` 是一个文本文件，用于定义用户所属的组。我们可以将多个用户添加到单个组中。它允许用户访问其他用户文件和文件夹，因为 Linux 权限分为三类：用户、组和其他。它维护有关组的有用信息，例如组名、组密码，组 ID（GID）和成员列表。每个都在一个单独的行。组文件每行包含了每个组的详细信息，共有 4 个如上所述字段。

这可以通过使用以下方法来执行。

  * `groups`： 显示一个组的所有成员。
  * `id`： 打印指定用户名的用户和组信息。
  * `lid`： 显示用户的组或组的用户。
  * `getent`： 从 Name Service Switch 库中获取条目。
  * `grep`： 代表“<ruby>全局正则表达式打印<rt>global regular expression print</rt></ruby>”，它能打印匹配的模式。

### 什么是 groups 命令？

`groups` 命令打印每个给定用户名的主要组和任何补充组的名称。

```
$ groups daygeek
daygeek : daygeek adm cdrom sudo dip plugdev lpadmin sambashare
```

如果要检查与当前用户关联的组列表。只需运行 `groups` 命令，无需带任何用户名。

```
$ groups
daygeek adm cdrom sudo dip plugdev lpadmin sambashare
```

### 什么是 id 命令？

id 代表 “<ruby>身份<rt>identity</rt></ruby>”。它打印真实有效的用户和组 ID。打印指定用户或当前用户的用户和组信息。

```
$ id daygeek
uid=1000(daygeek) gid=1000(daygeek) groups=1000(daygeek),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),118(lpadmin),128(sambashare)
```

如果要检查与当前用户关联的组列表。只运行 `id` 命令，无需带任何用户名。

```
$ id
uid=1000(daygeek) gid=1000(daygeek) groups=1000(daygeek),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),118(lpadmin),128(sambashare)
```

### 什么是 lid 命令？

它显示用户的组或组的用户。显示有关包含用户名的组或组名称中包含的用户的信息。此命令需要管理员权限。

```
$ sudo lid daygeek
 adm(gid=4)
 cdrom(gid=24)
 sudo(gid=27)
 dip(gid=30)
 plugdev(gid=46)
 lpadmin(gid=108)
 daygeek(gid=1000)
 sambashare(gid=124)
```

### 什么是 getent 命令？

`getent` 命令显示 Name Service Switch 库支持的数据库中的条目，它们在 `/etc/nsswitch.conf` 中配置。

```
$ getent group | grep daygeek
adm:x:4:syslog,daygeek
cdrom:x:24:daygeek
sudo:x:27:daygeek
dip:x:30:daygeek
plugdev:x:46:daygeek
lpadmin:x:118:daygeek
daygeek:x:1000:
sambashare:x:128:daygeek
```

如果你只想打印关联的组名称，请在上面的命令中使用 `awk`。

```
$ getent group | grep daygeek | awk -F: '{print $1}'
adm
cdrom
sudo
dip
plugdev
lpadmin
daygeek
sambashare
```

运行以下命令仅打印主群组信息。

```
$ getent group daygeek
daygeek:x:1000:

```

### 什么是 grep 命令？

`grep` 代表 “<ruby>全局正则表达式打印<rt>global regular expression print</rt></ruby>”，它能打印文件匹配的模式。

```
$ grep "daygeek" /etc/group
adm:x:4:syslog,daygeek
cdrom:x:24:daygeek
sudo:x:27:daygeek
dip:x:30:daygeek
plugdev:x:46:daygeek
lpadmin:x:118:daygeek
daygeek:x:1000:
sambashare:x:128:daygeek
```

如果你只想打印关联的组名称，请在上面的命令中使用 `awk`。

```
$ grep "daygeek" /etc/group | awk -F: '{print $1}'
adm
cdrom
sudo
dip
plugdev
lpadmin
daygeek
sambashare
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-which-groups-a-user-belongs-to-on-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
