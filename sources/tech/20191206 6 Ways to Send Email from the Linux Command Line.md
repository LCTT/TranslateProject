[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 Ways to Send Email from the Linux Command Line)
[#]: via: (https://www.2daygeek.com/6-ways-to-send-email-from-the-linux-command-line/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Linux 命令行发送邮件的 6 种方法
======

当你需要在 shell 脚本中创建邮件时，就需要用到命令行发送邮件的知识。Linux 中有很多命令可以实现发送邮件。本教程中包含了命令行邮件客户端的 Top 6，你可以选择其中一个。6 个命令分别是：

  * mail
  * mailx
  * mutt
  * mpack
  * sendmail
  * ssmtp



### 工作原理

我先从整体上来解释下Linux中邮件命令怎么把邮件传递给收件人的。邮件命令（如 sendmail，postfix）生成邮件并发送给一个本地的邮件传输代理（MTA）。本质上发送和接收邮件时邮件服务器和远程邮件服务器之间的通信。下面的流程可以看得更详细。

![](https://www.2daygeek.com/wp-content/uploads/2019/12/smtp-simple-mail-transfer-protocol.png)

### 1) Linux 安装 mail 命令

mail 命令是 Linux 终端发送邮件使用次数最多的命令。可以运行下面的命令从官方发行库安装 mail 命令。对于 **”Debian/Ubuntu“** 系统，使用 **[APT-GET 命令][3]** 或 **[APT 命令][4]** 安装 mailutils。 

```
$ sudo apt-get install mailutils
```

 对于 **“RHEL/CentOS”** 系统，使用 **[YUM 命令][5]** 安装 mailx。

```
$ sudo yum install mailx
```

对于 **“Fedora”** 系统，使用 **[DNF 命令][6]** 安装 mailx。

```
$ sudo dnf install mailx
```

### 1a) Linux 安装 mail 命令后发送邮件

mail 命令简单易用。如果你不需要发送附件，使用下面的 mail 命令格式就可以发送邮件了。

```
$ echo "This is the mail body" | mail -s "Subject" [email protected]
```

如果你要发送附件，使用下面的 mail 命令格式。

```
$ echo "This is the mail body" | mail -a test1.txt -s "Subject" [email protected]
```

```
+---------+----------------------------------------------------+
| Options |                    Description                     |
+---------+----------------------------------------------------+
|   -a    | It's used for attachment on Red Hat based systems. |
|   -A    | It's used for attachment on Debian based systems.  |
|   -s    | Specify the subject of the message                 |
+--------------------------------------------------------------+
```

### 2) Linux 安装 mutt 命令

mutt 是另一个 Linux 终端发送邮件很受欢迎的命令。mutt 是一个小而强大的基于文本的程序，用来阅读和发送 unix 操作系统的电子邮件，功能支持多彩终端、MIME、OpenPGP和按邮件线索排序的模式。可以运行下面的命令从官方发行库安装 mutt 命令。对于 **”Debian/Ubuntu“** 系统，使用 **[APT-GET 命令][3]** 或 **[APT 命令][4]** 安装 mutt。 

```
$ sudo apt-get install mutt
```

对于 **“RHEL/CentOS”** 系统，使用 **[YUM 命令][5]** 安装 mutt。

```
$ sudo yum install mutt
```

对于 **“Fedora”** 系统，使用 **[DNF 命令][6]** 安装 mutt。

```
$ sudo dnf install mutt
```

### 2b) Linux 使用 mutt 命令发送邮件

mutt 也是简单易用的。如果你不需要发送附件，使用下面的 mutt 命令格式就可以发送邮件了。

```
$ echo "This is the mail body" | mutt -s "Subject" [email protected]
```

如果你要发送附件，使用下面的 mutt 命令格式。

```
$ echo "This is the mail body" | mutt -s "Subject" [email protected] -a test1.txt
```

### 3) Linux 安装 mpack 命令

mpack 是另一个 Linux 终端发送邮件很受欢迎的命令。mpack 程序会对 MIME 消息中文件进行编码。编码后的消息被发送到一个或多个收件人。可以运行下面的命令从官方发行库安装 mpack 命令。对于 **”Debian/Ubuntu“** 系统，使用 **[APT-GET 命令][3]** 或 **[APT 命令][4]** 安装 mpack。 

```
$ sudo apt-get install mpack
```

对于 **“RHEL/CentOS”** 系统，使用 **[YUM 命令][5]** 安装 mpack。

```
$ sudo yum install mpack
```

对于 **“Fedora”** 系统，使用 **[DNF 命令][6]** 安装 mpack。

```
$ sudo dnf install mpack
```

### 3a) Linux 使用 mpack 命令发送邮件

mpack 也是简单易用的。如果你不需要发送附件，使用下面的 mpack 命令格式就可以发送邮件了。

```
$ echo "This is the mail body" | mpack -s "Subject" [email protected]
```

如果你要发送附件，使用下面的 mpack 命令格式。

```
$ echo "This is the mail body" | mpack -s "Subject" [email protected] -a test1.txt
```

### 4) Linux 安装 mailx 命令

mailx 是 mail 命令的更新版本，基于 Berkeley Mail 8.1，意在提供 POSIX mailx 命令的功能和支持MIME、IMAP、POP3、SMTP和S/MIME 的扩展。mailx 在某些交互特性上更加强大，如缓冲邮件消息、排序和过滤等。可以运行下面的命令从官方发行库安装 mailx 命令。对于 **”Debian/Ubuntu“** 系统，使用 **[APT-GET 命令][3]** 或 **[APT 命令][4]** 安装 mailutils。

```
$ sudo apt-get install mailutils
```

 对于 **“RHEL/CentOS”** 系统，使用 **[YUM 命令][5]** 安装 mailx。

```
$ sudo yum install mailx
```

对于 **“Fedora”** 系统，使用 **[DNF 命令][6]** 安装 mailx。

```
$ sudo dnf install mailx
```

### 4a) Linux 使用 mailx 命令发送邮件

mailx 也是简单易用的。如果你不需要发送附件，使用下面的 mail 命令格式就可以发送邮件了。

```
$ echo "This is the mail body" | mail -s "Subject" [email protected]
```

如果你要发送附件，使用下面的 mail 命令格式。

```
$ echo "This is the mail body" | mail -a test1.txt -s "Subject" [email protected]
```

### 5) Linux 安装 sendmail 命令

sendmail 是一个 Linux 上广泛使用的 SMTP 服务器，你也可以从命令行用 sendmail 发邮件。可以运行下面的命令从官方发行库安装 sendmail 命令。对于 **”Debian/Ubuntu“** 系统，使用 **[APT-GET 命令][3]** 或 **[APT 命令][4]** 安装 sendmail。

```
$ sudo apt-get install sendmail
```

对于 **“RHEL/CentOS”** 系统，使用 **[YUM 命令][5]** 安装 sendmail。

```
$ sudo yum install sendmail
```

对于 **“Fedora”** 系统，使用 **[DNF 命令][6]** 安装 sendmail。

```
$ sudo dnf install sendmail
```

### 5a) Linux 使用 sendmail 命令发送邮件

sendmail 也是简单易用的。使用下面的 sendmail 命令格式发送邮件。

```
$ echo -e "Subject: Test Mail\nThis is the mail body" > /tmp/send-mail.txt
```

```
$ sendmail [email protected] < send-mail.txt
```

### 6) Linux 安装 ssmtp 命令

ssmtp 是类似 sendmail 的一个只发送不接收的工具，可以把邮件从本地计算机传递到配置好的 mailhost（mailhub）。用户可以在 Linux 命令行用 SSMTP 把邮件发送到 SMTP 服务器。可以运行下面的命令从官方发行库安装 ssmtp 命令。对于 **”Debian/Ubuntu“** 系统，使用 **[APT-GET 命令][3]** 或 **[APT 命令][4]** 安装 ssmtp。

```
$ sudo apt-get install ssmtp
```

对于 **“RHEL/CentOS”** 系统，使用 **[YUM 命令][5]** 安装 ssmtp。

```
$ sudo yum install ssmtp
```

对于 **“Fedora”** 系统，使用 **[DNF 命令][6]** 安装 ssmtp。

```
$ sudo dnf install ssmtp
```

### 6a) Linux 使用 ssmtp 命令发送邮件

ssmtp 也是简单易用的。使用下面的 sendmail 命令格式发送邮件。

```
$ echo -e "Subject: Test Mail\nThis is the mail body" > /tmp/ssmtp-mail.txt
```

```
$ ssmtp [email protected] < /tmp/ssmtp-mail.txt
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/6-ways-to-send-email-from-the-linux-command-line/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.2daygeek.com/wp-content/uploads/2019/12/smtp-simple-mail-transfer-protocol.png
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[6]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
