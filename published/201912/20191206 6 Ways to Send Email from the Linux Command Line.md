[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11663-1.html)
[#]: subject: (6 Ways to Send Email from the Linux Command Line)
[#]: via: (https://www.2daygeek.com/6-ways-to-send-email-from-the-linux-command-line/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Linux 命令行发送邮件的 5 种方法
======

当你需要在 shell 脚本中创建邮件时，就需要用到命令行发送邮件的知识。Linux 中有很多命令可以实现发送邮件。本教程中包含了最流行的 5 个命令行邮件客户端，你可以选择其中一个。这 5 个命令分别是：

  * `mail` / `mailx`
  * `mutt`
  * `mpack`
  * `sendmail`
  * `ssmtp`

### 工作原理

我先从整体上来解释下 Linux 中邮件命令怎么把邮件传递给收件人的。邮件命令撰写邮件并发送给一个本地邮件传输代理（MTA，如 sendmail、Postfix）。邮件服务器和远程邮件服务器之间通信以实际发送和接收邮件。下面的流程可以看得更详细。

![](https://www.2daygeek.com/wp-content/uploads/2019/12/smtp-simple-mail-transfer-protocol.png)

### 1) 如何在 Linux 上安装 mail/mailx 命令

`mail` 命令是 Linux 终端发送邮件用的最多的命令。`mailx` 是 `mail` 命令的更新版本，基于 Berkeley Mail 8.1，意在提供 POSIX `mailx` 命令的功能，并支持 MIME、IMAP、POP3、SMTP 和 S/MIME 扩展。mailx 在某些交互特性上更加强大，如缓冲邮件消息、垃圾邮件评分和过滤等。在 Linux 发行版上，`mail` 命令是 `mailx` 命令的软链接。可以运行下面的命令从官方发行版仓库安装 `mail` 命令。

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][3] 或 [APT 命令][4] 安装 mailutils。 

```
$ sudo apt-get install mailutils
```

对于 RHEL/CentOS 系统，使用 [YUM 命令][5] 安装 mailx。

```
$ sudo yum install mailx
```

对于 Fedora 系统，使用 [DNF 命令][6] 安装 mailx。

```
$ sudo dnf install mailx
```

#### 1a) 如何在 Linux 上使用 mail 命令发送邮件

`mail` 命令简单易用。如果你不需要发送附件，使用下面的 `mail` 命令格式就可以发送邮件了：

```
$ echo "This is the mail body" | mail -s "Subject" 2daygeek@gmail.com
```

如果你要发送附件，使用下面的 `mail` 命令格式：

```
$ echo "This is the mail body" | mail -a test1.txt -s "Subject" 2daygeek@gmail.com
```

- `-a`：用于在基于 Red Hat 的系统上添加附件。
- `-A`：用于在基于 Debian 的系统上添加附件。
- `-s`：指定消息标题。

### 2) 如何在 Linux 上安装 mutt 命令

`mutt` 是另一个很受欢迎的在 Linux 终端发送邮件的命令。`mutt` 是一个小而强大的基于文本的程序，用来在 unix 操作系统下阅读和发送电子邮件，并支持彩色终端、MIME、OpenPGP 和按邮件线索排序的模式。可以运行下面的命令从官方发行版仓库安装 `mutt` 命令。

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][3] 或 [APT 命令][4] 安装 mutt。 

```
$ sudo apt-get install mutt
```

对于 RHEL/CentOS 系统，使用 [YUM 命令][5] 安装 mutt。

```
$ sudo yum install mutt
```

对于 Fedora 系统，使用 [DNF 命令][6] 安装 mutt。

```
$ sudo dnf install mutt
```

#### 2b) 如何在 Linux 上使用 mutt 命令发送邮件

`mutt` 一样简单易用。如果你不需要发送附件，使用下面的 `mutt` 命令格式就可以发送邮件了：

```
$ echo "This is the mail body" | mutt -s "Subject" 2daygeek@gmail.com
```

如果你要发送附件，使用下面的 `mutt` 命令格式：

```
$ echo "This is the mail body" | mutt -s "Subject" 2daygeek@gmail.com -a test1.txt
```

### 3) 如何在 Linux 上安装 mpack 命令

`mpack` 是另一个很受欢迎的在 Linux 终端上发送邮件的命令。`mpack` 程序会在一个或多个 MIME 消息中对命名的文件进行编码。编码后的消息被发送到一个或多个收件人。可以运行下面的命令从官方发行版仓库安装 `mpack` 命令。

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][3] 或 [APT 命令][4] 安装 mpack。 

```
$ sudo apt-get install mpack
```

对于 RHEL/CentOS 系统，使用 [YUM 命令][5] 安装 mpack。

```
$ sudo yum install mpack
```

对于 Fedora 系统，使用 [DNF 命令][6] 安装 mpack。

```
$ sudo dnf install mpack
```

#### 3a) 如何在 Linux 上使用 mpack 命令发送邮件

`mpack` 同样简单易用。如果你不需要发送附件，使用下面的 `mpack` 命令格式就可以发送邮件了：

```
$ echo "This is the mail body" | mpack -s "Subject" 2daygeek@gmail.com
```

如果你要发送附件，使用下面的 mpack 命令格式：

```
$ echo "This is the mail body" | mpack -s "Subject" 2daygeek@gmail.com -a test1.txt
```

### 4) 如何在 Linux 上安装 sendmail 命令

sendmail 是一个上广泛使用的通用 SMTP 服务器，你也可以从命令行用 `sendmail` 发邮件。可以运行下面的命令从官方发行版仓库安装 `sendmail` 命令。

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][3] 或 [APT 命令][4]安装 sendmail。

```
$ sudo apt-get install sendmail
```

对于 RHEL/CentOS 系统，使用 [YUM 命令][5] 安装 sendmail。

```
$ sudo yum install sendmail
```

对于 Fedora 系统，使用 [DNF 命令][6] 安装 sendmail。

```
$ sudo dnf install sendmail
```

#### 4a) 如何在 Linux 上使用 sendmail 命令发送邮件

`sendmail` 同样简单易用。使用下面的 `sendmail` 命令发送邮件。

```
$ echo -e "Subject: Test Mail\nThis is the mail body" > /tmp/send-mail.txt
```

```
$ sendmail 2daygeek@gmail.com < send-mail.txt
```

### 5) 如何在 Linux 上安装 ssmtp 命令

`ssmtp` 是类似 `sendmail` 的一个只发送不接收的工具，可以把邮件从本地计算机传递到配置好的 邮件主机（mailhub）。用户可以在 Linux 命令行用 `ssmtp` 把邮件发送到 SMTP 服务器。可以运行下面的命令从官方发行版仓库安装 `ssmtp` 命令。

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][3] 或 [APT 命令][4]安装 ssmtp。

```
$ sudo apt-get install ssmtp
```

对于 RHEL/CentOS 系统，使用 [YUM 命令][5] 安装 ssmtp。

```
$ sudo yum install ssmtp
```

对于 Fedora 系统，使用 [DNF 命令][6] 安装 ssmtp。

```
$ sudo dnf install ssmtp
```

### 5a) 如何在 Linux 上使用 ssmtp 命令发送邮件

`ssmtp` 同样简单易用。使用下面的 `ssmtp` 命令格式发送邮件。

```
$ echo -e "Subject: Test Mail\nThis is the mail body" > /tmp/ssmtp-mail.txt
```

```
$ ssmtp 2daygeek@gmail.com < /tmp/ssmtp-mail.txt
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/6-ways-to-send-email-from-the-linux-command-line/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.2daygeek.com/wp-content/uploads/2019/12/smtp-simple-mail-transfer-protocol.png
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[6]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
