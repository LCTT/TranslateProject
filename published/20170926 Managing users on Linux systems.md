管理 Linux 系统中的用户
======

![](https://images.idgesg.net/images/article/2017/09/charging-bull-100735753-large.jpg)

也许你的 Linux 用户并不是愤怒的公牛，但是当涉及管理他们的账户的时候，能让他们一直满意也是一种挑战。你需要监控他们的访问权限，跟进他们遇到问题时的解决方案，并且把他们在使用系统时出现的重要变动记录下来。这里有一些方法和工具可以让这个工作轻松一点。

### 配置账户

添加和删除账户是管理用户中比较简单的一项，但是这里面仍然有很多需要考虑的方面。无论你是用桌面工具或是命令行选项，这都是一个非常自动化的过程。你可以使用 `adduser jdoe` 命令添加一个新用户，同时会触发一系列的反应。在创建 John 这个账户时会自动使用下一个可用的 UID，并有很多自动生成的文件来完成这个工作。当你运行 `adduser` 后跟一个参数时（要创建的用户名），它会提示一些额外的信息，同时解释这是在干什么。

```
$ sudo adduser jdoe
Adding user 'jdoe' ...
Adding new group `jdoe' (1001) ...
Adding new user `jdoe' (1001) with group `jdoe' ...
Creating home directory `/home/jdoe' ...
Copying files from `/etc/skel' …
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Changing the user information for jdoe
Enter the new value, or press ENTER for the default
    Full Name []: John Doe
    Room Number []:
    Work Phone []:
    Home Phone []:
    Other []:
Is the information correct? [Y/n] Y
```

如你所见，`adduser` 会添加用户的信息（到 `/etc/passwd` 和 `/etc/shadow` 文件中），创建新的<ruby>家目录<rt>home directory</rt></ruby>，并用 `/etc/skel` 里设置的文件填充家目录，提示你分配初始密码和认证信息，然后确认这些信息都是正确的，如果你在最后的提示 “Is the information correct?” 处的回答是 “n”，它会回溯你之前所有的回答，允许修改任何你想要修改的地方。

创建好一个用户后，你可能会想要确认一下它是否是你期望的样子，更好的方法是确保在添加第一个帐户**之前**，“自动”选择与你想要查看的内容是否匹配。默认有默认的好处，它对于你想知道他们定义在哪里很有用，以便你想做出一些变动 —— 例如，你不想让用户的家目录在 `/home` 里，你不想让用户 UID 从 1000 开始，或是你不想让家目录下的文件被系统中的**每个人**都可读。

`adduser` 的一些配置细节设置在 `/etc/adduser.conf` 文件里。这个文件包含的一些配置项决定了一个新的账户如何配置，以及它之后的样子。注意，注释和空白行将会在输出中被忽略，因此我们更关注配置项。

```
$ cat /etc/adduser.conf | grep -v "^#" | grep -v "^$"
DSHELL=/bin/bash
DHOME=/home
GROUPHOMES=no
LETTERHOMES=no
SKEL=/etc/skel
FIRST_SYSTEM_UID=100
LAST_SYSTEM_UID=999
FIRST_SYSTEM_GID=100
LAST_SYSTEM_GID=999
FIRST_UID=1000
LAST_UID=29999
FIRST_GID=1000
LAST_GID=29999
USERGROUPS=yes
USERS_GID=100
DIR_MODE=0755
SETGID_HOME=no
QUOTAUSER=""
SKEL_IGNORE_REGEX="dpkg-(old|new|dist|save)"
```

可以看到，我们有了一个默认的 shell（`DSHELL`），UID（`FIRST_UID`）的起始值，家目录（`DHOME`）的位置，以及启动文件（`SKEL`）的来源位置。这个文件也会指定分配给家目录（`DIR_HOME`）的权限。

其中 `DIR_HOME` 是最重要的设置，它决定了每个家目录被使用的权限。这个设置分配给用户创建的目录权限是 755，家目录的权限将会设置为 `rwxr-xr-x`。用户可以读其他用户的文件，但是不能修改和移除它们。如果你想要更多的限制，你可以更改这个设置为 750（用户组外的任何人都不可访问）甚至是 700（除用户自己外的人都不可访问）。

任何用户账号在创建之前都可以进行手动修改。例如，你可以编辑 `/etc/passwd` 或者修改家目录的权限，开始在新服务器上添加用户之前配置 `/etc/adduser.conf` 可以确保一定的一致性，从长远来看可以节省时间和避免一些麻烦。

`/etc/adduser.conf` 的修改将会在之后创建的用户上生效。如果你想以不同的方式设置某个特定账户，除了用户名之外，你还可以选择使用 `adduser` 命令提供账户配置选项。或许你想为某些账户分配不同的 shell，分配特殊的 UID，或完全禁用该账户登录。`adduser` 的帮助页将会为你显示一些配置个人账户的选择。

```
adduser [options] [--home DIR] [--shell SHELL] [--no-create-home]
[--uid ID] [--firstuid ID] [--lastuid ID] [--ingroup GROUP | --gid ID]
[--disabled-password] [--disabled-login] [--gecos GECOS]
[--add_extra_groups] [--encrypt-home] user
```

每个 Linux 系统现在都会默认把每个用户放入对应的组中。作为一个管理员，你可能会选择以不同的方式。你也许会发现把用户放在一个共享组中更适合你的站点，你就可以选择使用 `adduser` 的 `--gid` 选项指定一个特定的组。当然，用户总是许多组的成员，因此也有一些选项来管理主要和次要的组。

### 处理用户密码

一直以来，知道其他人的密码都不是一件好事，在设置账户时，管理员通常使用一个临时密码，然后在用户第一次登录时运行一条命令强制他修改密码。这里是一个例子：

```
$ sudo chage -d 0 jdoe
```

当用户第一次登录时，会看到类似下面的提示：

```
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for jdoe.
(current) UNIX password:
```

### 添加用户到副组

添加用户到副组中，你可能会用如下所示的 `usermod` 命令添加用户到组中并确认已经做出变动。

```
$ sudo usermod -a -G sudo jdoe
$ sudo grep sudo /etc/group
sudo:x:27:shs,jdoe
```

记住在一些组意味着特别的权限，如 sudo 或者 wheel 组，一定要特别注意这一点。

### 移除用户，添加组等

Linux 系统也提供了移除账户，添加新的组，移除组等一些命令。例如，`deluser` 命令，将会从 `/etc/passwd` 和 `/etc/shadow` 中移除用户记录，但是会完整保留其家目录，除非你添加了 `--remove-home` 或者 `--remove-all-files` 选项。`addgroup` 命令会添加一个组，默认按目前组的次序分配下一个 id（在用户组范围内），除非你使用 `--gid` 选项指定 id。

```
$ sudo addgroup testgroup --gid=131
Adding group `testgroup' (GID 131) ...
Done.
```

### 管理特权账户

一些 Linux 系统中有一个 wheel 组，它给组中成员赋予了像 root 一样运行命令的权限。在这种情况下，`/etc/sudoers` 将会引用该组。在 Debian 系统中，这个组被叫做 sudo，但是原理是相同的，你在 `/etc/sudoers` 中可以看到像这样的信息：

```
%sudo   ALL=(ALL:ALL) ALL
```

这行基本的配置意味着任何在 wheel 或者 sudo 组中的成员只要在他们运行的命令之前添加 `sudo`，就可以以 root 的权限去运行命令。

你可以向 sudoers 文件中添加更多有限的权限 —— 也许给特定用户几个能以 root 运行的命令。如果你是这样做的，你应该定期查看 `/etc/sudoers` 文件以评估用户拥有的权限，以及仍然需要提供的权限。

在下面显示的命令中，我们过滤了 `/etc/sudoers` 中有效的配置行。其中最有意思的是，它包含了能使用 `sudo` 运行命令的路径设置，以及两个允许通过 `sudo` 运行命令的组。像刚才提到的那样，单个用户可以通过包含在 sudoers 文件中来获得权限，但是更有实际意义的方法是通过组成员来定义各自的权限。

```
# cat /etc/sudoers | grep -v "^#" | grep -v "^$"
Defaults env_reset
Defaults mail_badpass
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
root    ALL=(ALL:ALL) ALL
%admin  ALL=(ALL) ALL       <== admin group
%sudo   ALL=(ALL:ALL) ALL   <== sudo group
```

### 登录检查

你可以通过以下命令查看用户的上一次登录：

```
# last jdoe
jdoe pts/18 192.168.0.11 Thu Sep 14 08:44 - 11:48 (00:04)
jdoe pts/18 192.168.0.11 Thu Sep 14 13:43 - 18:44 (00:00)
jdoe pts/18 192.168.0.11 Thu Sep 14 19:42 - 19:43 (00:00)
```

如果你想查看每一个用户上一次的登录情况，你可以通过一个像这样的循环来运行 `last` 命令：

```
$ for user in `ls /home`; do last $user | head -1; done

jdoe pts/18 192.168.0.11 Thu Sep 14 19:42 - 19:43 (00:03)

rocket pts/18 192.168.0.11 Thu Sep 14 13:02 - 13:02 (00:00)
shs pts/17 192.168.0.11 Thu Sep 14 12:45 still logged in
```

此命令仅显示自当前 wtmp 文件登录过的用户。空白行表示用户自那以后从未登录过，但没有将他们显示出来。一个更好的命令可以明确地显示这期间从未登录过的用户：

```
$ for user in `ls /home`; do echo -n "$user"; last $user | head -1 | awk '{print substr($0,40)}'; done
dhayes
jdoe pts/18 192.168.0.11 Thu Sep 14 19:42 - 19:43
peanut pts/19 192.168.0.29 Mon Sep 11 09:15 - 17:11
rocket pts/18 192.168.0.11 Thu Sep 14 13:02 - 13:02
shs pts/17 192.168.0.11 Thu Sep 14 12:45 still logged
tsmith
```

这个命令要打很多字，但是可以通过一个脚本使它更加清晰易用。

```
#!/bin/bash

for user in `ls /home`
do
    echo -n "$user ";last $user | head -1 | awk '{print substr($0,40)}'
done
```

有时这些信息可以提醒你用户角色的变动，表明他们可能不再需要相关帐户了。

### 与用户沟通

Linux 提供了许多和用户沟通的方法。你可以向 `/etc/motd` 文件中添加信息，当用户从终端登录到服务器时，将会显示这些信息。你也可以通过例如 `write`（通知单个用户）或者 `wall`（write 给所有已登录的用户）命令发送通知。

```
$ wall System will go down in one hour

Broadcast message from shs@stinkbug (pts/17) (Thu Sep 14 14:04:16 2017):

System will go down in one hour
```

重要的通知应该通过多个渠道传达，因为很难预测用户实际会注意到什么。mesage-of-the-day（motd），`wall` 和 email 通知可以吸引用户大部分的注意力。

### 注意日志文件

多注意日志文件也可以帮你理解用户的活动情况。尤其 `/var/log/auth.log` 文件将会显示用户的登录和注销活动，组的创建记录等。`/var/log/message` 或者 `/var/log/syslog` 文件将会告诉你更多有关系统活动的日志。

### 追踪问题和需求

无论你是否在 Linux 系统上安装了事件跟踪系统，跟踪用户遇到的问题以及他们提出的需求都非常重要。如果需求的一部分久久不见回应，用户必然不会高兴。即使是记录在纸上也是有用的，或者最好有个电子表格，这可以让你注意到哪些问题仍然悬而未决，以及问题的根本原因是什么。确认问题和需求非常重要，记录还可以帮助你记住你必须采取的措施来解决几个月甚至几年后重新出现的问题。

### 总结

在繁忙的服务器上管理用户帐号，部分取决于配置良好的默认值，部分取决于监控用户活动和遇到的问题。如果用户觉得你对他们的顾虑有所回应并且知道在需要系统升级时会发生什么，他们可能会很高兴。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3225109/linux/managing-users-on-linux-systems.html

作者：[Sandra Henry-Stocker][a]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)、[pityonline](https://github.com/pityonline)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
