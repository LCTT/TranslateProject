[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10851-1.html)
[#]: subject: (How To Create SSH Alias In Linux)
[#]: via: (https://www.ostechnix.com/how-to-create-ssh-alias-in-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

如何在 Linux 中创建 SSH 别名
======

![How To Create SSH Alias In Linux](https://img.linux.net.cn/data/attachment/album/201905/13/222910h2uwy06um3byr68r.jpg)

如果你经常通过 SSH 访问许多不同的远程系统，这个技巧将为你节省一些时间。你可以通过 SSH 为频繁访问的系统创建 SSH 别名，这样你就不必记住所有不同的用户名、主机名、SSH 端口号和 IP 地址等。此外，它避免了在 SSH 到 Linux 服务器时重复输入相同的用户名、主机名、IP 地址、端口号。

### 在 Linux 中创建 SSH 别名

在我知道这个技巧之前，我通常使用以下任意一种方式通过 SSH 连接到远程系统。

使用 IP 地址：

```
$ ssh 192.168.225.22
```

或使用端口号、用户名和 IP 地址：

```
$ ssh -p 22 sk@192.168.225.22
```

或使用端口号、用户名和主机名：

```
$ ssh -p 22 sk@server.example.com
```

这里

  * `22` 是端口号，
  * `sk` 是远程系统的用户名，
  * `192.168.225.22` 是我远程系统的 IP，
  * `server.example.com` 是远程系统的主机名。

我相信大多数 Linux 新手和（或一些）管理员都会以这种方式通过 SSH 连接到远程系统。但是，如果你通过 SSH 连接到多个不同的系统，记住所有主机名或 IP 地址，还有用户名是困难的，除非你将它们写在纸上或者将其保存在文本文件中。别担心！这可以通过为 SSH 连接创建别名（或快捷方式）轻松解决。

我们可以用两种方法为 SSH 命令创建别名。

#### 方法 1 – 使用 SSH 配置文件

这是我创建别名的首选方法。

我们可以使用 SSH 默认配置文件来创建 SSH 别名。为此，编辑 `~/.ssh/config` 文件（如果此文件不存在，只需创建一个）：

```
$ vi ~/.ssh/config
```

添加所有远程主机的详细信息，如下所示：

```
Host webserver
    HostName 192.168.225.22
    User sk

Host dns
    HostName server.example.com
    User root

Host dhcp
    HostName 192.168.225.25
    User ostechnix
    Port 2233
```

![][2]

*使用 SSH 配置文件在 Linux 中创建 SSH 别名*

将 `Host`、`Hostname`、`User` 和 `Port` 配置的值替换为你自己的值。添加所有远程主机的详细信息后，保存并退出该文件。

现在你可以使用以下命令通过 SSH 进入系统：

```
$ ssh webserver
$ ssh dns
$ ssh dhcp
```

就是这么简单!

看看下面的截图。

![][3]

*使用 SSH 别名访问远程系统*

看到了吗？我只使用别名（例如 `webserver`）来访问 IP 地址为 `192.168.225.22` 的远程系统。

请注意，这只使用于当前用户。如果要为所有用户（系统范围内）提供别名，请在 `/etc/ssh/ssh_config` 文件中添加以上行。 

你还可以在 SSH 配置文件中添加许多其他内容。例如，如果你[已配置基于 SSH 密钥的身份验证][4]，说明 SSH 密钥文件的位置，如下所示：

```
Host ubuntu
    HostName 192.168.225.50
    User senthil
    IdentityFIle ~/.ssh/id_rsa_remotesystem
```

确保已使用你自己的值替换主机名、用户名和 SSH 密钥文件路径。

现在使用以下命令连接到远程服务器：

```
$ ssh ubuntu
```

这样，你可以添加希望通过 SSH 访问的任意多台远程主机，并使用别名快速访问它们。

#### 方法 2 – 使用 Bash 别名

这是创建 SSH 别名的一种应急变通的方法，可以加快通信的速度。你可以使用 [alias 命令][5]使这项任务更容易。

打开 `~/.bashrc` 或者 `~/.bash_profile` 文件：

```
alias webserver='ssh sk@server.example.com'
alias dns='ssh sk@server.example.com'
alias dhcp='ssh sk@server.example.com -p 2233'
alias ubuntu='ssh sk@server.example.com -i ~/.ssh/id_rsa_remotesystem'
```

再次确保你已使用自己的值替换主机、主机名、端口号和 IP 地址。保存文件并退出。

然后，使用命令应用更改：

```
$ source ~/.bashrc
```

或者

```
$ source ~/.bash_profile
```

在此方法中，你甚至不需要使用 `ssh 别名` 命令。相反，只需使用别名，如下所示。

```
$ webserver
$ dns
$ dhcp
$ ubuntu
```

![][6]

这两种方法非常简单，但对于经常通过 SSH 连接到多个不同系统的人来说非常有用，而且非常方便。使用适合你的上述任何一种方法，通过 SSH 快速访问远程 Linux 系统。

建议阅读：

  * [允许或拒绝 SSH 访问 Linux 中的特定用户或组][7]
  * [如何在 Linux 上 SSH 到特定目录][8]
  * [如何在 Linux 中断开 SSH 会话][9]
  * [4 种方式在退出 SSH 会话后保持命令运行][10]
  * [SSLH – 共享相同端口的 HTTPS 和 SSH][11]

目前这就是全部了，希望它对你有帮助。更多好东西要来了，敬请关注！

干杯！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-create-ssh-alias-in-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/ssh-alias-720x340.png
[2]: http://www.ostechnix.com/wp-content/uploads/2019/04/Create-SSH-Alias-In-Linux.png
[3]: http://www.ostechnix.com/wp-content/uploads/2019/04/create-ssh-alias.png
[4]: https://www.ostechnix.com/configure-ssh-key-based-authentication-linux/
[5]: https://www.ostechnix.com/the-alias-and-unalias-commands-explained-with-examples/
[6]: http://www.ostechnix.com/wp-content/uploads/2019/04/create-ssh-alias-1.png
[7]: https://www.ostechnix.com/allow-deny-ssh-access-particular-user-group-linux/
[8]: https://www.ostechnix.com/how-to-ssh-into-a-particular-directory-on-linux/
[9]: https://www.ostechnix.com/how-to-stop-ssh-session-from-disconnecting-in-linux/
[10]: https://www.ostechnix.com/4-ways-keep-command-running-log-ssh-session/
[11]: https://www.ostechnix.com/sslh-share-port-https-ssh/
