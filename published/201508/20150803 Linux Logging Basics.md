Linux 日志基础
================================================================================
首先，我们将描述有关 Linux 日志是什么，到哪儿去找它们，以及它们是如何创建的基础知识。如果你已经知道这些，请随意跳至下一节。

### Linux 系统日志 ###

许多有价值的日志文件都是由 Linux 自动地为你创建的。你可以在 `/var/log` 目录中找到它们。下面是在一个典型的 Ubuntu 系统中这个目录的样子：

![](http://www.loggly.com/ultimate-guide/wp-content/uploads/2015/05/Linux-system-log-terminal.png)

一些最为重要的 Linux 系统日志包括：

- `/var/log/syslog` 或 `/var/log/messages` 存储所有的全局系统活动数据，包括开机信息。基于 Debian 的系统如 Ubuntu 在 `/var/log/syslog` 中存储它们，而基于 RedHat 的系统如 RHEL 或 CentOS 则在 `/var/log/messages` 中存储它们。
- `/var/log/auth.log` 或 `/var/log/secure` 存储来自可插拔认证模块(PAM)的日志，包括成功的登录，失败的登录尝试和认证方式。Ubuntu 和 Debian 在 `/var/log/auth.log` 中存储认证信息，而 RedHat 和 CentOS 则在 `/var/log/secure` 中存储该信息。
- `/var/log/kern` 存储内核的错误和警告数据，这对于排除与定制内核相关的故障尤为实用。
- `/var/log/cron` 存储有关 cron 作业的信息。使用这个数据来确保你的 cron 作业正成功地运行着。

Digital Ocean 有一个关于这些文件的完整[教程][1]，介绍了 rsyslog 如何在常见的发行版本如 RedHat 和 CentOS 中创建它们。

应用程序也会在这个目录中写入日志文件。例如像 Apache，Nginx，MySQL 等常见的服务器程序可以在这个目录中写入日志文件。其中一些日志文件由应用程序自己创建，其他的则通过 syslog (具体见下文)来创建。

### 什么是 Syslog？ ###

Linux 系统日志文件是如何创建的呢？答案是通过 syslog 守护程序，它在 syslog 套接字 `/dev/log` 上监听日志信息，然后将它们写入适当的日志文件中。

单词“syslog” 代表几个意思，并经常被用来简称如下的几个名称之一：

1. **Syslog 守护进程** — 一个用来接收、处理和发送 syslog 信息的程序。它可以[远程发送 syslog][2] 到一个集中式的服务器或写入到一个本地文件。常见的例子包括 rsyslogd 和 syslog-ng。在这种使用方式中，人们常说“发送到 syslog”。
1. **Syslog 协议** — 一个指定日志如何通过网络来传送的传输协议和一个针对 syslog 信息(具体见下文) 的数据格式的定义。它在 [RFC-5424][3] 中被正式定义。对于文本日志，标准的端口是 514，对于加密日志，端口是 6514。在这种使用方式中，人们常说“通过 syslog 传送”。
1. **Syslog 信息** — syslog 格式的日志信息或事件，它包括一个带有几个标准字段的消息头。在这种使用方式中，人们常说“发送 syslog”。

Syslog 信息或事件包括一个带有几个标准字段的消息头，可以使分析和路由更方便。它们包括时间戳、应用程序的名称、在系统中信息来源的分类或位置、以及事件的优先级。

下面展示的是一个包含 syslog 消息头的日志信息，它来自于控制着到该系统的远程登录的 sshd 守护进程，这个信息描述的是一次失败的登录尝试：

    <34>1 2003-10-11T22:14:15.003Z server1.com sshd - - pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=10.0.2.2

### Syslog 格式和字段 ###

每条 syslog 信息包含一个带有字段的信息头，这些字段是结构化的数据，使得分析和路由事件更加容易。下面是我们使用的用来产生上面的 syslog 例子的格式，你可以将每个值匹配到一个特定的字段的名称上。

    <%pri%>%protocol-version% %timestamp:::date-rfc3339% %HOSTNAME% %app-name% %procid% %msgid% %msg%n

下面，你将看到一些在查找或排错时最常使用的 syslog 字段：

#### 时间戳 ####

[时间戳][4] (上面的例子为 2003-10-11T22:14:15.003Z) 暗示了在系统中发送该信息的时间和日期。这个时间在另一系统上接收该信息时可能会有所不同。上面例子中的时间戳可以分解为：

- **2003-10-11** 年，月，日。
- **T** 为时间戳的必需元素，它将日期和时间分隔开。
- **22:14:15.003** 是 24 小时制的时间，包括进入下一秒的毫秒数(**003**)。
- **Z** 是一个可选元素，指的是 UTC 时间，除了 Z，这个例子还可以包括一个偏移量，例如 -08:00，这意味着时间从 UTC 偏移 8 小时，即 PST 时间。

#### 主机名 ####

[主机名][5] 字段(在上面的例子中对应 server1.com) 指的是主机的名称或发送信息的系统.

#### 应用名 ####

[应用名][6] 字段(在上面的例子中对应 sshd:auth) 指的是发送信息的程序的名称.

#### 优先级 ####

优先级字段或缩写为 [pri][7] (在上面的例子中对应 <34>) 告诉我们这个事件有多紧急或多严峻。它由两个数字字段组成：设备字段和紧急性字段。紧急性字段从代表 debug 类事件的数字 7 一直到代表紧急事件的数字 0 。设备字段描述了哪个进程创建了该事件。它从代表内核信息的数字 0 到代表本地应用使用的 23 。

Pri 有两种输出方式。第一种是以一个单独的数字表示，可以这样计算：先用设备字段的值乘以 8，再加上紧急性字段的值：(设备字段)(8) + (紧急性字段)。第二种是 pri 文本，将以“设备字段.紧急性字段” 的字符串格式输出。后一种格式更方便阅读和搜索，但占据更多的存储空间。

--------------------------------------------------------------------------------

via: http://www.loggly.com/ultimate-guide/logging/linux-logging-basics/

作者：[Jason Skowronski][a1]，[Amy Echeverri][a2]，[Sadequl Hussain][a3]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a1]:https://www.linkedin.com/in/jasonskowronski
[a2]:https://www.linkedin.com/in/amyecheverri
[a3]:https://www.linkedin.com/pub/sadequl-hussain/14/711/1a7
[1]:https://www.digitalocean.com/community/tutorials/how-to-view-and-configure-linux-logs-on-ubuntu-and-centos
[2]:https://docs.google.com/document/d/11LXZxWlkNSHkcrCWTUdnLRf_CiZz9kK0cr3yGM_BU_0/edit#heading=h.y2e9tdfk1cdb
[3]:https://tools.ietf.org/html/rfc5424
[4]:https://tools.ietf.org/html/rfc5424#section-6.2.3
[5]:https://tools.ietf.org/html/rfc5424#section-6.2.4
[6]:https://tools.ietf.org/html/rfc5424#section-6.2.5
[7]:https://tools.ietf.org/html/rfc5424#section-6.2.1