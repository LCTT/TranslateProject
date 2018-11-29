Linux 上的开源日志工具
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/logs-main.jpg?itok=voNrSz4H)

如果你是一位 Linux 系统管理员，你进行故障排除的第一个工具就是日志文件。这些文件会保留关键的信息，可以在很长一段时间内帮你去解决影响你桌面和服务器的问题。对于许多系统管理员（特别是对于老手），在命令行上没有什么比检查日志文件更好的方式了。但是对于那些想要更高效（也可能是更现代）的排除故障的人，这里也有许多的选择。  

在这篇文章中，我将会罗列一些在 Linux 平台上一些值得一用的工具。一些特定于某项服务（例如 Kubernetes 或者 Apache）的日志工具将不会出现在该清单中，取而代之的将会是那些能够挖掘写入 /var/log 的所有神奇信息深度的工具。  


### 什么是 /var/log?

如果你是刚开始使用 Linux ，你可能不知道 /var/log 目录都包含了些什么。然而，这个名字已经说明了一切。这个目录收容了所有系统以及安装在系统上的主要服务（如 Apache，MySQL，MariaDB 等）的日志信息。打开一个终端窗口键入 ``` cd /var/log ``` 命令，接着键入 ```ls``` 命令，您将看到所有可以查看的日志文件。（图 1）  

![/var/log/][2]

图 1：```ls``` 命令显示在 /var/log 下可用的日志。  

[经许可使用][3]

如果你想查看 syslog 日志文件。运行 ```less syslog``` 命令，你就可以滚动查看特定日志的所有细节。但是如果标准的终端不适合你？你还有什么选择呢？其实有很多。让我们来看看以下几个选择。  

### Logs 

如果你使用 Gnome 桌面（或是其他的桌面，Logs 不仅能安装在 Gnome），你就已经有了这样的一个工具了，它仅仅在日志文件上加上了一个轻量的图形化界面，却使得查看日志的过程更加简单和高效。（从标准库中）安装完成后，从桌面菜单中打开 Logs，然后你将看到一个（图 2 的）界面，在这里允许你从各种类型的日志中进行选择（重要、所有、系统、安全和硬件），也可以选择一个启动时段 (从顶部中间的下拉菜单中），甚至是从所有可用的日志中进行搜索。  

![Logs tool][5]

图 2：Gnome 日志工具是你可以找到的为 Linux 最简易的日志图形化软件之一。  

[经许可使用][3]

Logs 是一个非常好的工具，特别是如果你不想要太多花里胡哨，妨碍你查看日志的功能，Logs 对于你查看系统日志来说就是一个很好的工具。  

### KSystemLog

KSystemLog 是 KDE 的，Logs 是 GNOME 的，但是有许多功能都融合到了里面。尽管两者都使得查看系统的日志文件变得非常简单，但只有 KsystemLog 有彩色的日志行、分页查看、复制日志行到桌面剪贴板、内置直接发送日志信息到系统的功能、详细阅读每行日志的信息、以及更多。KSystemLog 查看的所有日志都可以从 Gnome 的 Logs 中找到，只是各有不同的格式。  

从主窗口上（图 3），你可以看到许多不同的日志（来自于系统日志，认证日志，X.org 日志，Journald 日志），通过日期、拥有者、进程、信息选择一个日志优先级可以过滤日志。  

![KSystemLog][7]

图 3：KSystemLog 主界面  

[经许可使用][3]

如果你点击窗口菜单，你可以打开一个新的标签，你可以在里面选择一个不同的日志/筛选组合去查看。在同一个标签中，你甚至可以复制当前标签。你可以通过以下操作，手动添加一个日志到一个文件中。  

  1. 打开 KSystemLog。

  2. 点击文件的标签 > 添加日志入口

  3. 创建你的日志入口（图 4）。

  4. 点击 OK。



![log entry][9]

图 4：使用 KystemLog 创建一个手册日志  

[经许可使用][3]

KsystemLogs 使得在 KDE 下查看日志变为一个非常简单的操作。  

### Logwatch

Logwatch 不是一个花俏的图形化工具。相反，Logwatch 允许你设置一个日志记录系统 e-mail 给你重要的警告。你可以通过一个 SMTP 服务 e-mail 这些重要通知，或者你可以只是在本地机器上查看。你可以在几乎所有发行版的标准库中找到 Logwatch，所以可以使用一个简单的命令完成安装：  

```
sudo apt-get install logwatch
```

或者:

```
sudo dnf install logwatch
```

在安装期间，你需要选择一个发送警告的方式（图 5）。如果你选择仅以本地邮件的方式发达，你需要安装 mailutils（这样你就能通过 ```mail``` 命令查看本地邮件）。  

![ Logwatch][11]

图 5：配置 Logwatch 警告发送方式  

[经许可使用][3]

所有的 Logwatch 配置文件都被放在一个文件中。可以使用 ``` sudo nano /usr/share/logwatch/default.conf/logwatch.conf``` 命令编辑该文件。你可能想要编辑 MailTo = 选项。如果你是在本地查看日志，设置这项为你想要为你想要接收日志的 Linux 用户名（例如 MailTo = jack）。如果你想要发送这些日志到一个外部的邮件地址，你需要修改 MailTo = 为一个正确的邮件地址。在同一个配置文件中你还可以设置日志的细节层级和发送范围。保存并关闭该文件。设置成功后，你就可以使用以下命令发送你的第一封邮件：  

```
logwatch --detail Med --mailto ADDRESS --service all --range today
Where ADDRESS is either the local user or an email address.

```

使用 ```man logwatch``` 可以查看更多有关使用 Logwatch 的信息。通过阅读手册页可以看到这个工具的不同选项。  

### Rsyslog

Rsyslog 是一个发送远程客户端的日志到集群服务的简便方式。你只有一台服务器，但你想收集在你数据中心的其他 Linux 服务的日志。有了 Rsyslog，这可以很方便的实现。Rsyslog 必须被安装在所有的客户端和集群服务上（通过运行```sudo apt-get install rsyslog```）。 安装完成后，在集群服务上创建 /etc/rsyslog.d/server.conf 文件，包含以下内容：  

```
# Provide UDP syslog reception
$ModLoad imudp
$UDPServerRun 514

# Provide TCP syslog reception
$ModLoad imtcp
$InputTCPServerRun 514

# Use custom filenaming scheme
$template FILENAME,"/var/log/remote/%HOSTNAME%.log"
*.* ?FILENAME

$PreserveFQDN on

```

保存并退出这个文件。现在，在任意一台客户端机器上，创建这个文件 /etc/rsyslog.d/client.conf，包含以下内容：  

```
$PreserveFQDN on
$ActionQueueType LinkedList
$ActionQueueFileName srvrfwd
$ActionResumeRetryCount -1
$ActionQueueSaveOnShutdown on
*.* @@SERVER_IP:514

```

SERVER_IP 处是你的集群服务的 IP 地址。保存并关闭该文件。使用以下命令在所有机器上重启 rsyslog。  

```
sudo systemctl restart rsyslog

```

你现在可以使用以下命令（运行在集群服务器上）查看集群日志文件。  

```
tail -f /var/log/remote/*.log

```

```tail``` 命令允许你实时查看写入这些文件中的内容。你应该可以看到包含主机名的日志条目（图 6）。  

![Rsyslog][13]

图 6：Rsyslog 为一个已连接的客户端显示条目。  

[经许可使用][3]

如果你想要为你的 Linux 服务器上的所有用户，创建单一的日志查看入口点， Rsyslog 是一个非常好的工具。  

### 了解更多  

这篇文章仅仅搜集了为 Linux 平台创建的日志记录工具的一点皮毛。上述每个工具都能够比此处概述的内容做到更多。这篇梗概应该会对你开始你漫长的日志记录历程有一点帮助。  

你可以从 Linux 基金会和 edx 的免费课程 ["Introduction to Linux" ][14]了解更多。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/10/open-source-logging-tools-linux

作者：[JACK WALLEN][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[1]: /files/images/logs1jpg
[2]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/logs_1.jpg?itok=8yO2q1rW (/var/log/)
[3]: /licenses/category/used-permission
[4]: /files/images/logs2jpg
[5]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/logs_2.jpg?itok=kF6V46ZB (Logs tool)
[6]: /files/images/logs3jpg
[7]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/logs_3.jpg?itok=PhrIzI1N (KSystemLog)
[8]: /files/images/logs4jpg
[9]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/logs_4.jpg?itok=OxsGJ-TJ (log entry)
[10]: /files/images/logs5jpg
[11]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/logs_5.jpg?itok=GeAR551e (Logwatch)
[12]: /files/images/logs6jpg
[13]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/logs_6.jpg?itok=ira8UZOr (Rsyslog)
[14]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
