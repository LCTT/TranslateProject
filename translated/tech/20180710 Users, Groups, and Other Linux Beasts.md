用户、组及其它 Linux 特性 
======

> Linux 和其他类 Unix 操作系统依赖于用户组，而不是逐个为用户分配权限和特权。一个组就是你想象的那样：一群在某种程度上相关的用户。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/flamingo-2458782_1920.jpg?itok=_gkzGGx5)

到这个阶段，[在看到如何操作目录或文件夹之后][1]，但在让自己一头扎进文件之前，我们必须重新审视 _权限_、_用户_ 和 _组_。幸运的是，[有一个网站上已经有了一个优秀而全面的教程，讲到了权限][2]，所以你应该去立刻阅读它。简而言之，你使用权限来确定谁可以对文件和目录执行操作，以及他们可以对每个文件和目录执行什么操作 —— 从中读取、写入、移动、擦除等等。

要尝试本教程涵盖的所有内容，你需要在系统上创建新用户。让我们实践起来，为每一个需要借用你电脑的人创建一个用户，我们称之为 `guest` 账户。

**警告：** 例如，如果你错误地删除了自己的用户和目录，那么创建用户，特别是删除用户以及主目录会严重损坏系统。你可能不想在你日常的工作机中练习，那么请在另一台机器或者虚拟机上练习。无论你是否想要安全地练习，经常备份你的东西总是一个好主意。检查备份是否正常工作，为你自己以后避免很多咬牙切齿的事情。

### 一个新用户

你可以使用 `useradd` 命令来创建一个新用户。使用超级用户或 root 权限运行 `useradd`，即使用 `sudo` 或 `su`，这具体取决于你的系统，你可以： 

```
sudo useradd -m guest
```

然后输入你的密码。或者也可以这样：

```
su -c "useradd -m guest"
```

然后输入 root 或超级用户的密码。

（ _为了简洁起见，我们将从现在开始假设你使用 `sudo` 获得超级用户或 root 权限。_ ）

通过使用 `-m` 参数，`useradd` 将为新用户创建一个主目录。你可以通过列出 `/home/guest` 来查看其内容。

然后你可以使用以下命令来为新用户设置密码：

```
sudo passwd guest
```

或者你也可以使用 `adduser`，这是一个交互式的命令，它会询问你一些问题，包括你要为用户分配的 shell（是的，shell 有不止一种），你希望其主目录在哪里，你希望他们属于哪些组（有关这点稍后会讲到）等等。在运行 `adduser` 结束时，你可以设置密码。注意，默认情况下，在许多发行版中都没有安装 `adduser`，但安装了 `useradd`。

顺便说一下，你可以使用 `userdel` 来移除一个用户：

```
sudo userdel -r guest
```

使用 `-r` 选项，`userdel` 不仅删除了 `guest` 用户，还删除了他们的主目录和邮件中的条目（如果有的话）。

### 主目录中的内容

谈到用户的主目录，它依赖于你所使用的发行版。你可能已经注意到，当你使用 `-m` 选项时，`useradd` 使用子目录填充用户的目录，包括音乐、文档和诸如此类的内容以及各种各样的隐藏文件。要查看 `guest` 主目录中的所有内容，运行 `sudo ls -la /home/guest`。

进入新用户目录的内容通常是由 `/etc/skel` 架构目录确定的。有时它可能是一个不同的目录。要检查正在使用的目录，运行：

```
useradd -D
GROUP=100
HOME=/home
INACTIVE=-1
EXPIRE=
SHELL=/bin/bash
SKEL=/etc/skel
CREATE_MAIL_SPOOL=no
```

这会给你一些额外的有趣信息，但你现在感兴趣的是 `SKEL=/etc/skel` 这一行，在这种情况下，按照惯例，它指向 `/etc/skel/`。

由于 Linux 中的所有东西都是可定制的，因此你可以更改那些放入新创建的用户目录的内容。试试这样做：在 `/etc/skel/` 中创建一个新目录：

```
sudo mkdir /etc/skel/Documents
```

然后创建一个包含欢迎消息的文件，并将其复制过来：

```
sudo cp welcome.txt /etc/skel/Documents
```

现在删除 `guest` 账户:

```
sudo userdel -r guest
```

再次创建：

```
sudo useradd -m guest
```

嘿！你的 `Documents/` 目录和 `welcome.txt` 文件神奇地出现在了 `guest` 的主目录中。

你还可以在创建用户时通过编辑 `/etc/default/useradd` 来修改其他内容。我的看起来像这样：

```
GROUP=users
HOME=/home
INACTIVE=-1
EXPIRE=
SHELL=/bin/bash
SKEL=/etc/skel
CREATE_MAIL_SPOOL=no
```

这些选项大多数都是不言自明的，但让我们仔细看看 `GROUP` 选项。

### 群组心态

Linux 和其他类 Unix 操作系统依赖于用户组，而不是逐个为用户分配权限和特权。一个组就是你想象的那样：一群在某种程度上相关的用户。在你的系统上可能有一组允许使用打印机的用户，他们属于 `lp`（即 “_line printer_”）组。传统上 `wheel` 组的成员是唯一可以通过使用 `su` 成为超级用户或 root 的成员。`network` 用户组可以启动或关闭网络。还有许多诸如此类的。

不同的发行版有不同的组，具有相同或相似名称的组具有不同的权限，这也取决于你使用的发行版。因此，如果你在前一段中读到的内容与你系统中的内容不匹配，不要感到惊讶。

不管怎样，要查看系统中有哪些组，你可以使用：

```
getent group
```

`getent` 命令列出了某些系统数据库的内容。

要查找当前用户所属的组，尝试：

```
groups
```

当你使用 `useradd` 创建新用户时，除非你另行指定，否则用户将只属于一个组：他们自己。`guest` 用户属于 `guest` 组。组使用户有权管理自己的东西，仅此而已。

你可以使用 `groupadd` 命令创建新组，然后添加用户：

```
sudo groupadd photos
```

例如，这将创建 `photos` 组。下一次，我们将使用它来构建一个共享目录，该组的所有成员都可以读取和写入，我们将更多地了解权限和特权。敬请关注！


--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/7/users-groups-and-other-linux-beasts

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://linux.cn/article-10066-1.html
[2]:https://www.linux.com/learn/understanding-linux-file-permissions
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
