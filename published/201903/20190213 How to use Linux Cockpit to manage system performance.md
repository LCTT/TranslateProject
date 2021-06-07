[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10583-1.html)
[#]: subject: (How to use Linux Cockpit to manage system performance)
[#]: via: (https://www.networkworld.com/article/3340038/linux/sitting-in-the-linux-cockpit.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何使用 Linux Cockpit 来管理系统性能
======

> Linux Cockpit 是一个基于 Web 界面的应用，它提供了对系统的图形化管理。看下它能够控制哪些。

![](https://images.idgesg.net/images/article/2019/02/cockpit_airline_airplane_control_pilot-by-southerlycourse-getty-100787904-large.jpg)

如果你还没有尝试过相对较新的 Linux Cockpit，你可能会对它所能做的一切感到惊讶。它是一个用户友好的基于 web 的控制台，提供了一些非常简单的方法来管理 Linux 系统 —— 通过 web。你可以通过一个非常简单的 web 来监控系统资源、添加或删除帐户、监控系统使用情况、关闭系统以及执行其他一些其他任务。它的设置和使用也非常简单。

虽然许多 Linux 系统管理员将大部分时间花在命令行上，但使用 PuTTY 等工具访问远程系统并不总能提供最有用的命令输出。Linux Cockpit 提供了图形和易于使用的表单，来查看性能情况并对系统进行更改。

Linux Cockpit 能让你查看系统性能的许多方面并进行配置更改，但任务列表可能取决于你使用的特定 Linux。任务分类包括以下内容：

* 监控系统活动（CPU、内存、磁盘 IO 和网络流量） —— **系统**
* 查看系统日志条目 ——  **日志**
* 查看磁盘分区的容量 ——  **存储**
* 查看网络活动（发送和接收） ——  **网络**
* 查看用户帐户 ——  **帐户**
* 检查系统服务的状态 ——  **服务**
* 提取已安装应用的信息 ——  **应用**
* 查看和安装可用更新（如果以 root 身份登录）并在需要时重新启动系统 ——  **软件更新**
* 打开并使用终端窗口 ——  **终端**

某些 Linux Cockpit 安装还允许你运行诊断报告、转储内核、检查 SELinux（安全）设置和列出订阅。

以下是 Linux Cockpit 显示的系统活动示例：

![cockpit activity][1]

*Linux Cockpit 显示系统活动*

### 如何设置 Linux Cockpit

在某些 Linux 发行版（例如，最新的 RHEL）中，Linux Cockpit 可能已经安装并可以使用。在其他情况下，你可能需要采取一些简单的步骤来安装它并使其可使用。

例如，在 Ubuntu 上，这些命令应该可用：

```
$ sudo apt-get install cockpit
$ man cockpit    <== just checking
$ sudo systemctl enable --now cockpit.socket
$ netstat -a | grep 9090
tcp6 0 0 [::]:9090 [::]:* LISTEN
$ sudo systemctl enable --now cockpit.socket
$ sudo ufw allow 9090
```

启用 Linux Cockpit 后，在浏览器中打开 `https://<system-name-or-IP>:9090`

可以在 [Cockpit 项目][2] 中找到可以使用 Cockpit 的发行版列表以及安装说明。

没有额外的配置，Linux Cockpit 将无法识别 `sudo` 权限。如果你被禁止使用 Cockpit 进行更改，你将会在你点击的按钮上看到一个红色的通用禁止标志。

要使 `sudo` 权限有效，你需要确保用户位于 `/etc/group` 文件中的 `wheel`（RHEL）或 `adm` （Debian）组中，即服务器当以 root 用户身份登录 Cockpit 并且用户在登录 Cockpit 时选择“重用我的密码”时，已勾选了 “Server Administrator”。

在你管理的系统位在千里之外或者没有控制台时，能使用图形界面控制也不错。虽然我喜欢在控制台上工作，但我偶然也乐于见到图形或者按钮。Linux Cockpit 为日常管理任务提供了非常有用的界面。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3340038/linux/sitting-in-the-linux-cockpit.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/cockpit-activity-100787994-large.jpg
[2]: https://cockpit-project.org/running.html
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
