[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11066-1.html)
[#]: subject: (How To Find The Port Number Of A Service In Linux)
[#]: via: (https://www.ostechnix.com/how-to-find-the-port-number-of-a-service-in-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

如何在 Linux 中查找服务的端口号
======

![Find The Port Number Of A Service In Linux OS][1]

由于某些原因，你可能经常需要查找端口名称和端口号。如果是这样，你很幸运。今天，在这个简短的教程中，我们将看到在 Linux 系统中最简单、最快捷的查找服务端口号的方法。可能有很多方法可以做到，但我目前只知道以下三种方法。请继续阅读。

### 在 Linux 中查找服务的端口号

#### 方法1：使用 grep 命令

要使用 `grep` 命令在 Linux 中查找指定服务的默认端口号，只需运行：

```
$ grep <port> /etc/services
```

例如，要查找 SSH 服务的默认端口，只需运行：

```
$ grep ssh /etc/services
```

就这么简单。此命令应该适用于大多数 Linux 发行版。以下是我的 Arch Linux 测试机中的示例输出：

```
ssh 22/tcp
ssh 22/udp
ssh 22/sctp
sshell 614/tcp
sshell 614/udp
netconf-ssh 830/tcp
netconf-ssh 830/udp
sdo-ssh 3897/tcp
sdo-ssh 3897/udp
netconf-ch-ssh 4334/tcp
snmpssh 5161/tcp
snmpssh-trap 5162/tcp
tl1-ssh 6252/tcp
tl1-ssh 6252/udp
ssh-mgmt 17235/tcp
ssh-mgmt 17235/udp
```

正如你在上面的输出中所看到的，SSH 服务的默认端口号是 22。

让我们找到 Apache Web 服务器的端口号。为此，命令是：

```
$ grep http /etc/services
# http://www.iana.org/assignments/port-numbers
http 80/tcp www www-http # WorldWideWeb HTTP
http 80/udp www www-http # HyperText Transfer Protocol
http 80/sctp # HyperText Transfer Protocol
https 443/tcp # http protocol over TLS/SSL
https 443/udp # http protocol over TLS/SSL
https 443/sctp # http protocol over TLS/SSL
gss-http 488/tcp
gss-http 488/udp
webcache 8080/tcp http-alt # WWW caching service
webcache 8080/udp http-alt # WWW caching service
[...]
```

FTP 端口号是什么？这很简单！

```
$ grep ftp /etc/services
ftp-data 20/tcp
ftp-data 20/udp
# 21 is registered to ftp, but also used by fsp
ftp 21/tcp
ftp 21/udp fsp fspd
tftp 69/tcp
[...]
```

#### 方法 2：使用 getent 命令

如你所见，上面的命令显示指定搜索词 “ssh”、“http” 和 “ftp” 的所有端口名称和数字。这意味着，你将获得与给定搜索词匹配的所有端口名称的相当长的输出。

但是，你可以使用 `getent` 命令精确输出结果，如下所示：

```
$ getent services ssh
ssh 22/tcp

$ getent services http
http 80/tcp www www-http

$ getent services ftp
ftp 21/tcp
```

如果你不知道端口名称，但是知道端口号，那么你只需将端口名称替换为数字：

```
$ getent services 80
http 80/tcp
```

要显示所有端口名称和端口号，只需运行：

```
$ getent services
```

#### 方法 3：使用 Whatportis 程序

Whatportis 是一个简单的 Python 脚本，来用于查找端口名称和端口号。与上述命令不同，此程序以漂亮的表格形式输出。

确保已安装 pip 包管理器。如果没有，请参考以下链接。

- [如何使用 pip 管理 Python 包][6]

安装 pip 后，运行以下命令安装 Whatportis 程序。

```
$ pip install whatportis
```

现在，你可以找到与服务关联的端口，如下所示。

```
$ whatportis ssh

$ whatportis ftp

$ whatportis http
```

我的 CentOS 7 服务器的示例输出：

![][7]

*在 Linux 中查找服务的端口号*

如果你不知道服务的确切名称，请使用 `–like` 标志来显示相关结果。

```
$ whatportis mysql --like
```

上述命令帮助你查找与服务关联的端口。你还可以找到与端口号相关联的服务，如下所示。

```
$ whatportis 993
```

你甚至可以以 JSON 格式显示结果。

```
$ whatportis 993 --json
```

![][8]

有关更多详细信息，请参阅 GitHub 仓库。

* [Whatportis GitHub 仓库][9]

就是这些了。你现在知道了如何使用三种简单方法在 Linux 中查找端口名称和端口号。如果你知道任何其他方法/命令，请在下面的评论栏告诉我。我会查看并更相应地更新本指南。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-find-the-port-number-of-a-service-in-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2018/06/Find-The-Port-Number-720x340.png
[2]: https://www.ostechnix.com/the-grep-command-tutorial-with-examples-for-beginners/
[6]: https://www.ostechnix.com/manage-python-packages-using-pip/
[7]: https://www.ostechnix.com/wp-content/uploads/2018/06/whatportis.png
[8]: https://www.ostechnix.com/wp-content/uploads/2018/06/whatportis-1.png
[9]: https://github.com/ncrocfer/whatportis
