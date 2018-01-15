Linux 下使用 sudo 进行赋权
======

> 学习怎么在保护 root 密码的安全性的同时，为可信用户赋予所管理的网络功能和特定服务的权限。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_UnspokenBlockers_1110_A.png?itok=x8A9mqVA)

我最近写了一个简短的 Bash 程序来将 MP3 文件从一台网络主机的 USB 盘中拷贝到另一台网络主机上去。拷贝出来的文件存放在一台志愿者组织所属服务器的特定目录下，在那里，这些文件可以被下载和播放。

我的程序还会做些其他事情，比如为了自动在网页上根据日期排序，在拷贝文件之前会先对这些文件重命名。在验证拷贝完成后，还会删掉 USB 盘中的所有文件。这个小程序还有一些其他选项，比如 `-h` 会显示帮助， `-t` 进入测试模式等等。

我的程序需要以 root 运行才能发挥作用。然而，这个组织中之后很少的人对管理音频和计算机系统有兴趣的，这使得我不得不找那些半吊子的人来，并培训他们登录到用于传输的计算机，运行这个小程序。

倒不是说我不能亲自运行这个程序，但由于外出和疾病等等各种原因， 我不是时常在场的。 即使我在场，作为一名 “懒惰的系统管理员”， 我也希望别人能替我把事情给做了。 因此我写了一些脚本来自动完成这些任务并通过 `sudo` 来指定某些人来运行这些脚本。 很多 Linux 命令都需要用户以 root 身份来运行。 `sudo` 能够保护系统免遭一时糊涂造成的意外损坏以及恶意用户的故意破坏。

### 尽可能的使用 sudo

`sudo` 是一个很方便的工具，它让我一个具有 root 权限的管理员可以分配所有或者部分管理性的任务给其他用户， 而且还无需告诉他们 root 密码， 从而保证主机的高安全性。

假设，我给了普通用户 `ruser` 访问我 Bash 程序 `myprog` 的权限， 而这个程序的部分功能需要 root 权限。 那么该用户可以以 `ruser` 的身份登录，然后通过以下命令运行 `myprog`。

```shell
sudo myprog
```

`sudo` 程序会检查 `/etc/sudoers` 文件，并确认 `ruser` 是否被许可运行 `myprog`。如被许可，`sudo` 会要求该用户输入其密码——而非 root 密码。在 `ruser` 输入他的密码之后，该程序就运行了。此外，`sudo` 也记录 `myprog` 该程序运行的日期和时间、完整的命令，以及谁在运行它。这个数据会记录在 `/var/log/security` 中。

我发现在培训时记录下每个用 `sudo` 执行的命令会很有帮助。我可以看到谁执行了哪些命令，他们是否输对了。

我委派了权限给自己和另一个人来运行那一个程序；然而，`sudo` 可以做更多的事情。 它允许系统管理员委派所管理的网络功能或特定的服务给某个受信的人或某组人。这可以让你在保护了 root 密码的安全性的同时，也赋予了那些功能。

### 配置 sudoers 文件

作为一名系统管理员，我使用 `/etc/sudoers` 文件来设置某些用户或某些用户组可以访问某个命令，或某组命令，或所有命令。 这种灵活性是使用 `sudo` 进行委派时能兼顾功能与简易性的关键。

我一开始对 `sudoers` 文件感到很困惑，因此下面我会拷贝并分解我所使用主机上的完整 `sudoers` 文件。 希望在分析的过程中不会让你感到困惑。 我意外地发现， 基于 Red Hat 的发行版中默认的配置文件都会很多注释以及例子来指导你如何做出修改，这使得修改配置文件变得简单了很多，也不需要在互联网上搜索那么多东西了。

不要直接用编辑器来修改 `sudoers` 文件，而应该用 `visudo` 命令，因为该命令会在你保存并退出编辑器后就立即生效这些变更。 `visudo` 也可以使用除了 Vi 之外的其他编辑器。

让我们首先来分析一下文件中的各种别名。

#### 主机别名

主机别名这一节用于创建主机分组，授予该组主机可以访问哪些命令或命令别名。 它的基本思想是，该文件由组织中的所有主机共同维护，然后拷贝到每台主机中的 `/etc` 中。 其中有些主机， 例如各种服务器， 可以配置成一个组来赋予用户访问特定命令的权限， 比如可以启停类似 HTTPD、DNS 以及网络服务；可以挂载文件系统等等。

在设置主机别名时也可以用 IP 地址替代主机名。

```
## Host Aliases
## Groups of machines. You may prefer to use hostnames (perhaps using 
## wildcards for entire domains) or IP addresses instead.
# Host_Alias     FILESERVERS = fs1, fs2
# Host_Alias     MAILSERVERS = smtp, smtp2
```

#### 用户别名

用户别名允许 root 将用户整理成别名组中，并按组来分配特定的 root 权限。在这部分内容中我加了一行 `User_Alias AUDIO = dboth, ruser`，定义了一个别名 `AUDIO` 用来指代了两个用户。

正如 `sudoers` 文件中所阐明的，也可以直接使用 `/etc/groups` 中定义的组而不用自己设置别名。 如果你定义好的组（假设组名为 `audio`）已经能满足要求了， 那么在后面分配命令时只需要在组名前加上 `%` 号，像这样: `%audio`。

```
## User Aliases
## These aren't often necessary, as you can use regular groups
## (ie, from files, LDAP, NIS, etc) in this file - just use %groupname 
## rather than USERALIAS
# User_Alias ADMINS = jsmith, mikem
User_Alias AUDIO = dboth, ruser
```

#### 命令别名

再后面是命令别名的部分。这些别名表示的是一系列相关的命令， 比如网络相关命令，或者 RPM 包管理命令。 这些别名允许系统管理员方便地为一组命令分配权限。

该部分内容已经设置好了许多别名，这使得分配权限给某类命令变得方便很多。

```
## Command Aliases
## These are groups of related commands...

## Networking
# Cmnd_Alias NETWORKING = /sbin/route, /sbin/ifconfig, /bin/ping, /sbin/dhclient, /usr/bin/net, /sbin/iptables, /usr/bin/rfcomm, /usr/bin/wvdial, /sbin/iwconfig, /sbin/mii-tool

## Installation and management of software
# Cmnd_Alias SOFTWARE = /bin/rpm, /usr/bin/up2date, /usr/bin/yum

## Services
# Cmnd_Alias SERVICES = /sbin/service, /sbin/chkconfig

## Updating the locate database
# Cmnd_Alias LOCATE = /usr/bin/updatedb

## Storage
# Cmnd_Alias STORAGE = /sbin/fdisk, /sbin/sfdisk, /sbin/parted, /sbin/partprobe, /bin/mount, /bin/umount

## Delegating permissions
# Cmnd_Alias DELEGATING = /usr/sbin/visudo, /bin/chown, /bin/chmod, /bin/chgrp 

## Processes
# Cmnd_Alias PROCESSES = /bin/nice, /bin/kill, /usr/bin/kill, /usr/bin/killall

## Drivers
# Cmnd_Alias DRIVERS = /sbin/modprobe
```

#### 环境默认值

下面部分内容设置默认的环境变量。这部分最值得关注的是 `!visiblepw` 这一行， 它表示当用户环境设置成显示密码时禁止 `sudo` 的运行。 这个安全措施不应该被修改掉。

```

# Defaults specification

#
# Refuse to run if unable to disable echo on the tty.
#
Defaults   !visiblepw

Defaults    env_reset
Defaults    env_keep =  "COLORS DISPLAY HOSTNAME HISTSIZE KDEDIR LS_COLORS"
Defaults    env_keep += "MAIL PS1 PS2 QTDIR USERNAME LANG LC_ADDRESS LC_CTYPE"
Defaults    env_keep += "LC_COLLATE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES"
Defaults    env_keep += "LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE"
Defaults    env_keep += "LC_TIME LC_ALL LANGUAGE LINGUAS _XKB_CHARSET XAUTHORITY"


Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin
```

#### 命令部分

命令部分是 `sudoers` 文件的主体。不使用别名并不会影响你完成要实现的效果，别名只是让整个配置工作大幅简化而已。

这部分使用之前定义的别名来告诉 `sudo` 哪些人可以在哪些机器上执行哪些操作。一旦你理解了这部分内容的语法，你会发现这些例子都非常的直观。 下面我们来看看它的语法。

```
ruser           ALL=(ALL) ALL 
```

*意即 `ruser` 可以在任意主机上以任意用户身份运行任意命令*

这是一条为用户 `ruser` 做出的配置。行中第一个 `ALL` 表示该条规则在所有主机上生效。 第二个 `ALL` 允许 `ruser` 以任意其他用户的身份运行命令。 默认情况下， 命令以 `root` 用户的身份运行， 但 `ruser` 可以在 `sudo` 命令行指定程序以其他用户的身份运行。 最后这个 `ALL` 表示 `ruser` 可以运行所有命令而不受限制。 这让 `ruser` 实际上就变成了 `root`。

注意到下面还有一条针对 `root` 的配置。这允许 `root` 能通过 `sudo` 在任何主机上运行任何命令。

```
root    ALL=(ALL) ALL 
```

*意即 `root` 可以在任意主机上以任意用户身份运行任意命令*

为了实验一下效果，我注释掉了这行， 然后以 root 的身份试着直接运行 `chown`。 出乎意料的是这样是能成功的。 然后我试了下 `sudo chown`，结果失败了，提示信息 “Root is not in the sudoers file。 This incident will be reported”。 也就是说 root 可以直接运行任何命令， 但当加上 `sudo` 时则不行。 这会阻止 root 像其他用户一样使用 `sudo` 命令来运行其他命令， 但是 root 有太多种方法可以绕过这个约束了。

下面这行是我新增来控制访问 `myprog` 的。它指定了只有上面定义的 `AUDIO` 组中的用户才能在 `guest1`  这台主机上使用 `myprog` 这个命令。

```
AUDIO   guest1=/usr/local/bin/myprog
```

*允许 AUDIO 组成员在 guest1 主机上访问 myprog*

注意，上面这一行只指定了允许访问的主机名和程序，而没有说用户可以以其他用户的身份来运行该程序。

#### 省略密码

你也可以通过 `NOPASSWORD` 来让 `AUDIO` 组中的用户无需密码就能运行 `myprog`。像这样：

```
AUDIO   guest1=NOPASSWORD : /usr/local/bin/myprog
```

*允许 AUDIO 组成员在 guest1 主机上不用输入密码即可访问 myprog*

我并没有这样做，因为我觉得使用 `sudo` 的用户必须要停下来想清楚他们正在做的事情，这对他们有好处。 我这里只是举个例子。

#### wheel

`sudoers` 文件中命令部分的 `wheel` 说明（如下所示）允许所有在 `wheel` 组中的用户在任何机器上运行任何命令。`wheel` 组在 `/etc/group` 文件中定义， 用户必须加入该组后才能工作。 组名前面的 `%` 符号表示 `sudo` 应该去 `/etc/group` 文件中查找该组。

```
%wheel          ALL = (ALL) ALL
```

*运行所有定义在 /etc/group 文件中的 “wheel” 组成员可以在任意主机上运行全部命令*

这种方法很好的实现了为多个用户赋予完全的 root 权限而不用提供 root 密码。只需要把该用户加入 `wheel` 组中就能给他们提供完整的 root 的能力。 它也提供了一种通过 `sudo` 创建的日志来监控他们行为的途径。 有些 Linux 发行版， 比如 Ubuntu， 会自动将用户的 ID 加入 `/etc/group` 中的 `wheel` 组中， 这使得他们能够用 `sudo` 命令运行所有的特权命令。

### 结语

我这里只是小试了一把 `sudo` — 我只是给一到两个用户以 root 权限运行单个命令的权限。完成这些只添加了两行配置（不考虑注释）。 将某项任务的权限委派给其他非 root 用户非常简单，而且可以节省你大量的时间。 同时它还会产生日志来帮你发现问题。

`sudoers` 文件还有许多其他的配置和能力。查看 `sudo` 和 `sudoers` 的 man 手册可以深入了解详细信息。


--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/using-sudo-delegate

作者：[David Both][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
