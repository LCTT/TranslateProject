邮件传输代理（MTA）基础
======

### 概述

本教程中，你将学习：

  * 使用 `mail` 命令。
  * 创建邮件别名。
  * 配置电子邮件转发。
  * 了解常见邮件传输代理（MTA），比如，postfix、sendmail、qmail、以及 exim。

### 控制邮件去向

Linux 系统上的电子邮件是使用 MTA 投递的。你的 MTA 投递邮件到你的系统上的其他用户，并且 MTA 彼此通讯跨越系统投递到全世界。

Sendmail 是最古老的 Linux MTA。它最初起源于 1979 年用于阿帕网（ARPANET）的 delivermail 程序。如今它有几个替代品，在本教程中，我也会介绍它们。

#### 前提条件

为完成本系列教程的大部分内容，你需要具备 Linux 的基础知识，你需要拥有一个 Linux 系统来实践本教程中的命令。你应该熟悉 GNU 以及 UNIX 命令。有时候不同版本的程序的输出格式可能不同，因此，在你的系统中输出的结果可能与我在下面列出的稍有不同。

在本教程中，我使用的是 Ubuntu 14.04 LTS 和 sendmail 8.14.4 来做的演示。

### 邮件传输

邮件传输代理（比如 sendmail）在用户之间和系统之间投递邮件。大量的因特网邮件使用简单邮件传输协议（SMTP），但是本地邮件可能是通过文件或者套接字等其它可能的方式来传输的。邮件是一种存储和转发的操作，因此，在用户接收邮件或者接收系统和通讯联系可用之前，邮件一直是存储在某种文件或者数据库中。配置和确保 MTA 的安全是非常复杂的任务，它们中的大部分内容都已经超出了本教程的范围。

### mail 命令

如果你使用 SMTP 协议传输电子邮件，你或许知道你可以使用许多邮件客户端，包括 `mail`、`mutt`、`alpine`、`notmuch`、以及其它基于主机控制台或者图形界面的邮件客户端。`mail` 命令是最老的、可用于脚本中的、发送和接收以及管理收到的邮件的备用命令。

你可以使用 `mail` 命令交互式的向列表中的收件人发送信息，或者不使用参数去查看你收到的邮件。清单 1 展示了如何在你的系统上去发送信息到用户 steve 和 pat，同时抄送拷贝给用户 bob。当提示 `Cc:` 和 `subject:` 时，输入相应的抄送用户以及邮件主题，接着输入邮件正文，输入完成后按下 `Ctrl+D` （按下 `Ctrl` 键并保持再按下 `D` 之后全部松开）。

```
ian@attic4-u14:~$ mail steve,pat
Cc: bob
Subject: Test message 1
This is a test message

Ian
```

*清单 1. 使用 `mail` 交互式发送邮件*

如果一切顺利，你的邮件已经发出。如果在这里发生错误，你将看到错误信息。例如，如果你在接收者列表中输入一个无效的用户名，邮件将无法发送。注意在本示例中，所有的用户都在本地系统上存在，因此他们都是有效用户。

你也可以使用命令行以非交互式发送邮件。清单 2 展示了如何给用户 steve 和 pat 发送一封邮件。这种方式可以用在脚本中。在不同的软件包中 `mail` 命令的版本不同。对于抄送（`Cc:`）有些支持一个 `-c` 选项，但是我使用的这个版本不支持这个选项，因此，我仅将邮件发送到收件人。

```
ian@attic4-u14:~$ mail -t steve,pat -s "Test message 2" <<< "Another test.\n\nIan"
```

*清单 2. 使用 `mail` 命令非交互式发送邮件*

如果你使用没有选项的 `mail` 命令，你将看到一个如清单 3 中所展示的那样一个收到信息的列表。你将看到用户 steve 有我上面发送的两个信息，再加上我以前发送的一个信息和后来用户 bob 发送的信息。所有的邮件都用 'N' 标记为新邮件。

```
steve@attic4-u14:~$ mail
"/var/mail/steve": 4 messages 4 new
>N 1 Ian Shields Tue Dec 12 21:03 16/704 test message
 N 2 Ian Shields Tue Dec 12 21:04 18/701 Test message 1
 N 3 Ian Shields Tue Dec 12 21:23 15/661 Test message 2
 N 4 Bob C Tue Dec 12 21:45 17/653 How about lunch tomorrow?
?
```

*清单 3. 使用 `mail` 查看收到的邮件*

当前选中的信息使用一个 `>` 来标识，它是清单 3 中的第一封邮件。如果你按下回车键（`Enter`），将显示下一封未读邮件的第一页。按下空格楗将显示这个邮件的下一页。当你读完这个邮件并想返回到 `?` 提示符时，按下回车键再次查看下一封邮件，依次类推。在 `?` 提示符下，你可以输入 `h` 再次去查看邮件头。你看过的邮件前面将显示一个 `R` 状态，如清单 4 所示。

```
? h
 R 1 Ian Shields Tue Dec 12 21:03 16/704 test message
 R 2 Ian Shields Tue Dec 12 21:04 18/701 Test message 1
>R 3 Ian Shields Tue Dec 12 21:23 15/661 Test message 2
 N 4 Bob C Tue Dec 12 21:45 17/653 How about lunch tomorrow?
?
```

*清单 4. 使用 `h` 去显示邮件头*

在这个图中，Steve 已经读了三个邮件，但是没有读来自 bob 的邮件。你可以通过数字来选择单个的信息，你也可以通过输入 `d` 删除你不想要的信息，或者输入 `3d` 去删除第三个信息。如果你输入 `q` 你将退出 `mail` 命令。已读的信息将被转移到你的家目录下的 `mbox` 文件中，而未读的信息仍然保留在你的收件箱中，默认在 `/var/mail/$(id -un)`。如清单 5 所示。

```
? h
 R 1 Ian Shields Tue Dec 12 21:03 16/704 test message
 R 2 Ian Shields Tue Dec 12 21:04 18/701 Test message 1
>R 3 Ian Shields Tue Dec 12 21:23 15/661 Test message 2
 N 4 Bob C Tue Dec 12 21:45 17/653 How about lunch tomorrow?
? q
Saved 3 messages in /home/steve/mbox
Held 1 message in /var/mail/steve
You have mail in /var/mail/steve
```

*清单 5. 使用 `q` 退出 `mail`*

如果你输入 `x` 而不是使用 `q` 去退出，你的邮箱在退出后将不保留你做的改变。因为这在 `/var` 文件系统中，你的系统管理员可能仅允许邮件在一个有限的时间范围内保留。要重新读取或者以其它方式再次处理保存在你的本地邮箱中的邮件，你可以使用 `-f` 选项去指定想要去读的文件。比如，`mail -f mbox`。

### 邮件别名

在前面的节中，看了如何在系统上给许多用户发送邮件。你可以使用一个全限定名字（比如  ian@myexampledomain.com）给其它系统上的用户发送邮件。

有时候你可能希望用户的所有邮件都可以发送到其它地方。比如，你有一个服务器群，你希望所有的 root 用户的邮件都发给中心的系统管理员。或者你可能希望去创建一个邮件列表，将邮件发送给一些人。为实现上述目标，你可以使用别名，别名允许你为一个给定的用户名定义一个或者多个目的地。这个目的地或者是其它用户的邮箱、文件、管道、或者是某个进一步处理的命令。你可以在 `/etc/mail/aliases` 或者 `/etc/aliases` 中创建别名来实现上述目的。根据你的系统的不同，你可以找到上述其中一个，符号链接到它们、或者其中之一。改变别名文件你需要有 root 权限。

别名的格式一般是：

```
name: addr_1, addr_2, addr_3, ...
```

这里 `name` 是一个要别名的本地用户名字（即别名），而 `addr_1`，`addr_2`，... 可以是一个或多个别名。别名可以是一个本地用户、一个本地文件名、另一个别名、一个命令、一个包含文件，或者一个外部地址。

因此，发送邮件时如何区分别名呢（addr-N）？

  * 本地用户名是你机器上系统中的一个用户名字。从技术角度来说，它可以通过调用 `getpwnam` 命令找到它。
  * 本地文件名是以 `/` 开始的完全路径和文件名。它必须是 `sendmail` 可写的。信息会追加到这个文件上。
  * 命令是以一个管道符号开始的（`|`）。信息是通过标准输入的方式发送到命令的。
  * 包含文件别名是以 `:include:` 和指定的路径和文件名开始的。在该文件中的别名被添加到该名字所代表的别名中。
  * 外部地址是一个电子邮件地址，比如 john@somewhere.com。

你可以在你的系统中找到一个示例文件，它是与你的 sendmail 包一起安装的，它的位置在 `/usr/share/sendmail/examples/db/aliases`。它包含一些给 `postmaster`、`MAILER-DAEMON`、`abuse` 和 `spam 的别名建议。在清单 6，我把我的 Ubuntu 14.04 LTS 系统上的一些示例文件，和人工修改的示例结合起来说明一些可能的情况。

```
ian@attic4-u14:~$ cat /etc/mail/aliases
# First include some default system aliases from
# /usr/share/sendmail/examples/db/aliases

#
# Mail aliases for sendmail
#
# You must run newaliases(1) after making changes to this file.
#

# Required aliases
postmaster: root
MAILER-DAEMON:  postmaster

# Common aliases
abuse:    postmaster
spam:   postmaster

# Other aliases

# Send steve's mail to bob and pat instead
steve: bob,pat

# Send pat's mail to a file in her home directory and also to her inbox.
# Finally send it to a command that will make another copy.
pat: /home/pat/accumulated-mail,
 \pat,
 |/home/pat/makemailcopy.sh

# Mailing list for system administrators
sysadmins: :include: /etc/aliases-sysadmins
```

*清单 6. 人工修改的 /etc/mail/aliases 示例*

注意那个 pat 既是一个别名也是一个系统中的用户。别名是以递归的方式展开的，因此，如果一个别名也是一个名字，那么它将被展开。Sendmail 并不会给同一个用户发送相同的邮件两遍，因此，如果你正好将 pat 作为 pat 的别名，那么 sendmail 在已经找到并处理完用户 pat 之后，将忽略别名 pat。为避免这种问题，你可以在别名前使用一个 `\` 做为前缀去指示它是一个不要进一步引起混淆的名字。在这种情况下，pat 的邮件除了文件和命令之外，其余的可能会被发送到他的正常的邮箱中。

在 `aliases` 文件中以 `#` 开始的行是注释，它会被忽略。以空白开始的行会以延续行来处理。

清单 7 展示了包含文件 `/etc/aliases-sysadmins`。

```
ian@attic4-u14:~$ cat /etc/aliases-sysadmins

# Mailing list for system administrators
bob,pat
```

*清单 7 包含文件 /etc/aliases-sysadmins*

### newaliases 命令

sendmail 使用的主要配置文件会被编译成数据库文件。邮件别名也是如此。你可以使用 `newaliases` 命令去编译你的 `/etc/mail/aliases` 和任何包含文件到 `/etc/mail/aliases.db` 中。注意，`newaliases` 命令等价于 `sendmail -bi`。清单 8 展示了一个示例。

```
ian@attic4-u14:~$ sudo newaliases
/etc/mail/aliases: 7 aliases, longest 62 bytes, 184 bytes total
ian@attic4-u14:~$ ls -l /etc/mail/aliases*
lrwxrwxrwx 1 root smmsp 10 Dec 8 15:48 /etc/mail/aliases -> ../aliases
-rw-r----- 1 smmta smmsp 12288 Dec 13 23:18 /etc/mail/aliases.db
```

*清单 8. 为邮件别名重建数据库*

### 使用别名的示例

清单 9 展示了一个简单的 shell 脚本，它在我的别名示例中以一个命令的方式来使用。

```
ian@attic4-u14:~$ cat ~pat/makemailcopy.sh
#!/bin/bash

# Note: Target file ~/mail-copy must be writeable by sendmail!
cat >> ~pat/mail-copy
```

*清单 9. makemailcopy.sh 脚本*

清单 10 展示了用于测试时更新的文件。

```
ian@attic4-u14:~$ date
Wed Dec 13 22:54:22 EST 2017
ian@attic4-u14:~$ mail -t sysadmins -s "sysadmin test 1" <<< "Testing mail"
ian@attic4-u14:~$ ls -lrt $(find /var/mail ~pat -type f -mmin -3 2>/dev/null )
-rw-rw---- 1 pat mail 2046 Dec 13 22:54 /home/pat/mail-copy
-rw------- 1 pat mail 13240 Dec 13 22:54 /var/mail/pat
-rw-rw---- 1 pat mail 9442 Dec 13 22:54 /home/pat/accumulated-mail
-rw-rw---- 1 bob mail 12522 Dec 13 22:54 /var/mail/bob
```

*清单 10. /etc/aliases-sysadmins 包含文件*

需要注意的几点：

  * sendmail 使用的用户和组的名字是 mail。
  * sendmail 在 `/var/mail` 保存用户邮件，它也是用户 mail 的家目录。用户 ian 的默认收件箱在 `/var/mail/ian` 中。
  * 如果你希望 sendmail 在用户目录下写入文件，这个文件必须允许 sendmail 可写入。与其让任何人都可以写入，还不如定义一个组可写入，组名称为 mail。这需要系统管理员来帮你完成。

### 使用一个 `.forward` 文件去转发邮件

别名文件是由系统管理员来管理的。个人用户可以使用它们自己的家目录下的 `.forward` 文件去转发他们自己的邮件。你可以在你的 `.forward` 文件中放任何可以出现在别名文件的右侧的东西。这个文件的内容是明文的，不需要编译。当你收到邮件时，sendmail 将检查你的家目录中的 `.forward` 文件，然后就像处理别名一样处理它。

### 邮件队列和 mailq 命令

Linux 邮件使用存储-转发的处理模式。你已经看到的已接收邮件，在你读它之前一直保存在文件 `/var/mail` 中。你发出的邮件在接收服务器连接可用之前也会被保存。你可以使用 `mailq` 命令去查看邮件队列。清单 11 展示了一个发送给外部用户 ian@attic4-c6 的一个邮件示例，以及运行 `mailq` 命令的结果。在这个案例中，当前服务器没有连接到 attic4-c6，因此邮件在与对方服务器连接可用之前一直保存在队列中。

```
ian@attic4-u14:~$ mail -t ian@attic4-c6 -s "External mail" <<< "Testing external mail queues"
ian@attic4-u14:~$ mailq
MSP Queue status...
/var/spool/mqueue-client is empty
    Total requests: 0
MTA Queue status...
    /var/spool/mqueue (1 request)
-----Q-ID----- --Size-- -----Q-Time----- ------------Sender/Recipient-----------
vBE4mdE7025908* 29 Wed Dec 13 23:48 <ian@attic4-u14.hopto.org>
           <ian@attic4-c6.hopto.org>
    Total requests: 1
```

*清单 11. 使用 `mailq` 命令*

### 其它邮件传输代理

为解决使用 sendmail 时安全方面的问题，在上世纪九十年代开发了几个其它的邮件传输代理。Postfix 或许是最流行的一个，但是 qmail 和 exim 也大量使用。

Postfix 是 IBM 为代替 sendmail 而研发的。它更快、也易于管理、安全性更好一些。从外表看它非常像 sendmail，但是它的内部完全与 sendmail 不同。

Qmail 是一个安全、可靠、高效、简单的邮件传输代理，它由 Dan Bernstein 开发。但是，最近几年以来，它的核心包已经不再更新了。Qmail 和几个其它的包已经被吸收到 IndiMail 中了。

Exim 是另外一个 MTA，它由 University of Cambridge 开发。最初，它的名字是 `EXperimental Internet Mailer`。

所有的这些 MTA 都是为代替 sendmail 而设计的，因此，它们它们都兼容 sendmail 的一些格式。它们都能够处理别名和 `.forward` 文件。有些封装了一个 `sendmail` 命令作为一个到特定的 MTA 自有命令的前端。尽管一些选项可能会被静默忽略，但是大多数都允许使用常见的 sendmail 选项。`mailq` 命令是被直接支持的，或者使用一个类似功能的命令来代替。比如，你可以使用 `mailq` 或者 `exim -bp` 去显示 exim 邮件队列。当然，输出可以看到与 sendmail 的 `mailq` 命令的不同之外。

查看相关的主题，你可以找到更多的关于这些 MTA 的更多信息。

对 Linux 上的邮件传输代理的介绍到此结束。

--------------------------------------------------------------------------------

via: https://www.ibm.com/developerworks/library/l-lpic1-108-3/index.html

作者：[Ian Shields][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ibm.com
[1]:http://www.lpi.org
[2]:https://www.ibm.com/developerworks/library/l-lpic1-map/
