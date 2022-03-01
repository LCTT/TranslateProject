[#]: subject: "5 new sudo features sysadmins need to know in 2022"
[#]: via: "https://opensource.com/article/22/2/new-sudo-features-2022"
[#]: author: "Peter Czanik https://opensource.com/users/czanik"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14301-1.html"

2022 年 5 个新 sudo 功能
======

> 最近的 sudo 版本增加了新的功能，使你能够观察和控制以前隐藏的问题。

![](https://img.linux.net.cn/data/attachment/album/202202/24/124219ye7iqvqkvm7lla5a.jpg)

当你想授予你的一些用户管理权限，同时控制和检查他们在你的系统上做什么时，你会使用 `sudo`。然而，即使是 `sudo`，也有相当多不可控的地方，想想给予 shell 权限的情况就知道了。最近的 `sudo` 版本增加了一些功能，可以让你看到这些问题，甚至控制它们。例如，你可以启用更详细、更容易处理的日志信息，并记录 shell 会话中执行的每个命令。

这些功能中有些是全新的。有些是出现在 1.9.0 甚至更早的版本中的功能。例如，`sudo` 可以记录终端上发生的一切，即使是在 1.8 版本。然而，系统将这些记录保存在本地，它们很容易被删除，特别是那些记录最有用的地方：Shell 会话。1.9.0 版本增加了会话记录集中收集，因此记录不能被本地用户删除，最近的版本还增加了中继功能，使收集功能更加强大。

如果你只知道 `sudo` 的基础知识，或者以前只使用过 1.8 版本，我建议你阅读我以前的 [文章][2]。

### 1、JSON 格式的日志记录

我想介绍的第一个新功能是 JSON 格式的日志记录。我是一个日志狂热者（12 年前我就开始在 `syslog-ng` 项目上工作），而这个功能是我在这里发表文章后引入的第一个功能。启用后，`sudo` 记录了更多的信息，并且以一种更容易解析的方式进行。

传统的 syslog 信息很短，只包含最小的必要信息量。这是由于旧的 `syslog` 实现的限制。超过 1k 大小的信息被丢弃或截断。

```
Jan 28 13:56:27 localhost.localdomain sudo[10419]: czanik : TTY=pts/0 ; PWD=/home/czanik ; USER=root ; COMMAND=/bin/bash
```

最近的 `syslog` 实现可以处理更大的信息量。`syslog-ng` 默认接受 64k 大小的日志信息（当然，它可以更小或更大，取决于实际配置）。

同样的事件，如果以 JSON 格式记录，就会包含更多的信息。更多并不意味着更难处理。JSON 格式的信息更容易被许多日志管理软件应用解析。下面是一个例子：

```
Jan 28 13:58:20 localhost.localdomain sudo[10518]: @cee:{"sudo":{"accept":{"uuid":"616bc9efcf-b239-469d-60ee-deb5af8ce6","server_time":{"seconds":1643374700,"nanoseconds":222446715,"iso8601":"20220128125820Z","localtime":"Jan 28 13:58:20"},"submit_time":{"seconds":1643374700,"nanoseconds":209935349,"iso8601":"20220128125820Z","localtime":"Jan 28 13:58:20"},"submituser":"czanik","command":"/bin/bash","runuser":"root","runcwd":"/home/czanik","ttyname":"/dev/pts/0","submithost":"localhost.localdomain","submitcwd":"/home/czanik","runuid":0,"columns":118,"lines":60,"runargv":["/bin/bash"],"runenv":["LANG=en_US.UTF-8","HOSTNAME=localhost.localdomain","SHELL=/bin/bash","TERM=xterm-256color","PATH=/home/czanik/.local/bin:/home/czanik/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin","MAIL=/var/mail/root","LOGNAME=root","USER=root","HOME=/root","SUDO_COMMAND=/bin/bash","SUDO_USER=czanik","SUDO_UID=1000","SUDO_GID=1000"]}}}
```

你可以在 `sudoers` 文件中启用 JSON 格式的日志信息：

```
Defaults log_format=json
```

你可以从我的 [syslog-ng][3] 博客中了解更多关于如何从 `sudo` 中使用 JSON 格式的日志信息。

### 2、使用 sudo_logsrvd 集中收集日志

1.9.4 中另一个与日志相关的功能是使用 `sudo_logsrvd` 收集所有 `sudo` 日志信息（包括失败的）。以前，系统只在 `sudo_logsrvd` 实际进行记录时记录成功的会话。最后仍然默认通过 `syslog` 进行记录。

为什么这很重要？首先，你可以在一个地方收集任何与 `sudo` 有关的东西。无论是会话记录还是所有相应的日志信息。其次，它还可以保证正确记录所有与 `sudo` 有关的事件，因为如果 `sudo_logsrvd` 无法访问，`sudo` 可以拒绝执行命令。

你可以在 `sudoers` 文件中通过以下设置启用 `sudo_logsrvd` 日志记录（当然要替换 IP 地址）：

```
Defaults log_servers=172.16.167.150
```

如果你想要 JSON 格式的日志信息，你需要在 `sudo_logsrvd` 配置的 `[eventlog]` 部分进行如下设置：

```
log_format = json
```

否则，`sudo_logsrvd` 使用传统的 `sudo` 日志格式，并作了简单的修改。它还包括日志来源的主机的信息：

```
Nov 18 12:40:16 centos8splunk.localdomain sudo[21028]:   czanik : 3 incorrect password attempts ; HOST=centos7sudo.localdomain ; TTY=pts/0 ; PWD=/home/czanik ; USER=root ; COMMAND=/bin/bash
Nov 18 12:40:23 centos8splunk.localdomain sudo[21028]:   czanik : HOST=centos7sudo.localdomain ; TTY=pts/0 ; PWD=/home/czanik ; USER=root ; TSID=00000A ; COMMAND=/bin/bash
Nov 18 12:40:30 centos8splunk.localdomain sudo[21028]:   czanik : command rejected by I/O plugin ; HOST=centos7sudo.localdomain ; TTY=pts/0 ; PWD=/home/czanik ; USER=root ; COMMAND=/bin/bash
```

### 3、中继

当最初引入 `sudo_logsrvd`（1.9.0 版）进行会话记录集中收集时，客户端只能直接发送记录。1.9.7 版本引入了中继的概念。有了中继，你可以不直接发送记录，而是将记录发送到多级中间主机，这些中间主机构成你的网络。

为什么这很重要？首先，中继使收集会话记录成为可能，即使集中主机由于网络问题或维护而不可用。默认情况下，`sudo` 在无法发送记录时拒绝运行，所以中继可以确保你可以全天候使用 `sudo`。

其次，它还允许你对网络有更严格的控制。你不需要为所有的主机向中心的 `sudo_logsrvd` 开放防火墙，而只需要允许你的中继通过。

最后，它允许你从没有直接互联网接入的网络中收集会话记录，比如 AWS 私有网络，你可以在网关主机上以中继模式安装 `sudo_logsrvd`。

当你使用中继时，`sudo` 客户端和中心的 `sudo_logsrvd` 的配置保持不变。在中继主机上，在 `sudo_logsrvd.conf` 的 `[relay]` 部分添加以下一行：

```
relay_host = 172.16.167.161
```

如果知道通往中心服务器的网络连接有问题，你可以配置中继，在转发记录之前储存它：

```
store_first = true
```

### 4、记录子命令

你是否曾经想知道在通过 `sudo` 启动的 shell 会话中发生了什么？是的，会话记录是存在的，但是为了看几个命令的执行情况而看几个小时的记录是很无聊的，也是对时间的巨大浪费。幸运的是，1.9.8 版本引入了子命令日志。现在，只需定期检查你的日志信息，并在发生可疑情况时才观看记录。

你甚至不需要一个允许 shell 访问的规则，只需要访问一个编辑器就可以访问 shell。大多数编辑器可以运行外部命令。我最喜欢的编辑器是 JOE，这是我通过 `sudo` 启动它时可以看到的情况：

```
Aug 30 13:03:00 czplaptop sudo[10150]:   czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/joe
```

不用吃惊，就在一个编辑器里，我生成一个 shell 并从该 shell 中删除一些文件和分区。现在让我们看看当你启用对子命令记录时会发生什么：

```
Aug 30 13:13:14 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/joe
Aug 30 13:13:37 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/bin/sh -c /bin/bash
Aug 30 13:13:37 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/bin/bash
Aug 30 13:13:37 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/readlink /proc/10889/exe
[...]
Aug 30 13:13:37 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/sed -r s@/*:|([^\\\\]):@\1\n@g;H;x;s@/\n@\n@
Aug 30 13:13:37 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/tty
Aug 30 13:13:42 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/id
Aug 30 13:13:56 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/ls -A -N --color=none -T 0 /usr/share/syslog-ng/include/scl/
```

我省略了几十行以节省一些空间，但你仍然可以看到我启动了一个 shell，`bash_profile` 执行的命令也可以在日志中看到。

你可以在 `sudoers` 文件中使用以下设置来启用子命令日志：

```
`Defaults log_subcmds`
```

在传统的 `sudo` 日志中，你可以从 `sudo` 进程 ID 看到这些日志正是来自同一个 `sudo`会话。如果你打开 JSON 格式的日志，如前面所示，`sudo` 在日志中记录了更多的信息，使之更容易进行分析。

### 5、拦截子命令

记录子命令可以消除 `sudo` 的大部分隐患，但在有些情况下，你不只是想观察正在发生的事情，还想控制事件的流程。例如，你需要给一个用户提供 shell 权限，但仍想阻止他们运行一个特定的命令。在这种情况下，拦截是理想的选择。当然，也有一些限制，比如你不能限制 shell 的内置命令。

比方说，`who` 命令很危险。你可以分两步启用拦截。第一个步骤是启用它，第二个步骤是配置它。在这种情况下，我的用户不被允许运行 `who`：

```
Defaults intercept
czanik ALL = (ALL) ALL, !/usr/bin/who
```

当我通过`sudo` 启动一个 root shell 会话并尝试运行 `who` 时，会发生以下情况：

```
$ sudo -s
# who
Sorry, user czanik is not allowed to execute '/usr/bin/who' as root on czplaptop.
bash: /usr/bin/who: Permission denied
```

你可以很容易地完全禁用运行 shell：

```
Defaults intercept
Cmnd_Alias SHELLS=/usr/bin/bash, /usr/bin/sh, /usr/bin/csh
czanik ALL = (ALL) ALL, !SHELLS
```

这意味着你不能通过 `sudo` 启动 shell 会话。不仅如此，你也不能从编辑器中执行外部命令。当我试图从 `vi` 中启动 `ls` 命令时，就会出现这种情况：

```
$ sudo vi /etc/issue
Sorry, user czanik is not allowed to execute '/bin/bash -c /bin/ls' as root on czplaptop.
Cannot execute shell /bin/bash
Press ENTER or type command to continue
```

### 接下来是什么？

我希望读了我的文章后，自己尝试一下这些新功能。你可以通过你的软件包管理器在许多 Linux 发行版和 UNIX 变种上安装最新的 `sudo`，或者使用 [Sudo 网站][4] 上的二进制安装程序。

这篇文章只是为你提供了一个新的可能性的概述。如果你想了解更多关于这些功能的信息，请访问网站，那里有手册页面，也有 [Sudo 博客][5]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/new-sudo-features-2022

作者：[Peter Czanik][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/czanik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_sysadmin_cloud.png?itok=sUciG0Cn (Tools for the sysadmin)
[2]: https://linux.cn/article-12865-1.html
[3]: https://www.syslog-ng.com/community/b/blog/posts/working-with-json-logs-from-sudo-in-syslog-ng
[4]: https://www.sudo.ws/getting/packages
[5]: https://www.sudo.ws/posts
