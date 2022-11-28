[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12490-1.html)
[#]: subject: (10 cheat sheets for Linux sysadmins)
[#]: via: (https://opensource.com/article/20/7/sysadmin-cheat-sheets)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Linux 系统管理员的 10 份速查表
======

> 这些快速参考指南让系统管理员的生活和日常工作变得更轻松，而且它们都是免费提供的。

![](https://img.linux.net.cn/data/attachment/album/202008/05/222202qildlyr1lnqwq0o4.jpg)

作为一名系统管理员，你做所的不是一件工作，而是**全部**工作，而且往往每一件工作都是随时随地出现，毫无预兆。除非你每天都只做一项任务，否则当需要的时候，你可能并不总是都能将所有的命令和选项都记在脑海里。这就是为什么我喜欢速查表的原因。

速查表可以帮助你避免愚蠢的错误，它们可以让你不必翻阅数页的文档，并让你高效地完成任务。我为每位系统管理员挑选了我最喜欢的 10 个速查表，无论他的经验水平如何。

### 网络

我们的《[Linux 网络][2]》速查表是速查表界的的瑞士军刀，它包含了最常见的网络命令的简单提醒，包括 `nslookup`、`tcpdump`、`nmcli`、`netstat`、`traceroute` 等。最重要的是，它用了 `ip` 命令，所以你终于可以不用再默认使用 `ifconfig` 命令了！

### 防火墙

系统管理员有两种：了解 `iptables` 的和使用前一类人编写的 `iptables` 配置文件的。如果你是第一类人，你可以继续使用你的 `iptables` 配置，有没有 [firewalld][3] 都无所谓。

如果你是第二类人，你终于可以放下你的 iptables 焦虑，拥抱 firewalld 的轻松。阅读《[用 firewall-cmd 保护你的 Linux 网络][4]》，然后下载我们的《[firewalld 速查表][5]》来记住你所学到的东西，保护你的网络端口从未如此简单。

### SSH

许多系统管理员都用的是 [POSIX][6] shell，所以可以在别人的计算机上运行的远程 shell 是 Linux 上最重要的工具之一也就不足为奇了。任何学习服务器管理的人通常很早就学会了使用 SSH，但我们中的许多人只学习了基础知识。

当然，SSH 可以在远程机器上打开一个交互式的 shell，但它的功能远不止这些。比如说，你需要在远程机器上进行图形化登录。远程主机的用户要么不在键盘旁边，要么无法理解你启用 VNC 的指令。只要你有 SSH 权限，就可以为他们打开端口。

```
$ ssh -L 5901:localhost:5901 <remote_host>
```

通过我们的《[SSH 速查表][7]》了解更多。

### Linux 用户和权限

传统的大型机和 UNIX 超级计算机风格的用户账户现在基本上已经被 Samba、LDAP 和 OpenShift等系统所取代。然而，这并没有改变对管理员和服务账户仔细管理的需求。为此，你仍然需要熟悉`useradd`、`usermod`、`chown`、`chmod`、`passwd`、`gpasswd`、`umask` 等命令。

把我的《[用户和权限速查表][8]》放在手边，你就可以随时对与用户管理有关的任务进行合理的概览，并有实例命令演示你需要做的任何事情的正确语法。

### 基本的 Linux 命令

并不是所有的系统管理员都会把所有的时间花在终端上。无论你是否喜欢在桌面上工作，还是刚开始使用 Linux，有时为常用的终端命令提供一个任务导向的参考是很好的。

对于一个为灵活性和即兴性而设计的界面来说，找到所有你可能需要的东西是很困难的，但我的《[常用命令速查表][9]》是相当全面的。这张速查表以任何技术型桌面用户的典型生活为蓝本，涵盖了用命令在计算机内导航、寻找文件的绝对路径、复制和重命名文件、建立目录、启动系统服务等内容。

### Git

在计算机的历史上，版本控制曾经是只有开发者才需要的东西。但那是过去，而 Git 是现在。对于任何希望跟踪从 Bash 脚本到配置文件、文档和代码的变化的人来说，版本控制是一个重要的工具。Git 适用于每个人，包括程序员、网站可靠性工程师（SRE），甚至系统管理员。

获取我们的《[Git 速查表][10]》来学习要领、基本工作流程和最重要的 Git 标志。

### Curl

Curl 不一定是系统管理员专用的工具，从技术上讲，它“只是”一个用于终端的非交互式 Web 浏览器。你可能几天都不用它一次。然而，你很有可能会发现 Curl 对你每天要做的事情很有用，不管是快速参考网站上的一些信息，还是排除网络主机的故障，或者是验证你运行或依赖的一个重要 API。

Curl 是一个向服务器传输数据的命令，它支持的协议包括 HTTP、FTP、IMAP、LDAP、POP3、SCP、SFTP、SMB、SMTP 等。它是一个重要的网络工具，所以下载我们的《[Curl 速查表][11]》，开始探索 Curl 吧。

### SELinux

Linux 的安全策略在默认情况下是很好的，root 权限和用户权限之间有很强的分离，但 SELinux 使用标签系统对其进行了改进。在配置了 SELinux 的主机上，每个进程和每个文件对象（或目录、网络端口、设备等）都有一个标签。SELinux 提供了一套规则来控制进程标签对对象（如文件）标签的访问。

有时候你需要调整 SELinux 策略，或者调试一些安装时没有正确设置的东西，或者深入了解当前的策略。我们的《[SELinux 速查表][12]》可以提供帮助。

### Kubectl

无论你是已经迁移到了开放的混合云、封闭的私有云，还是你还在研究这样的迁移需要准备什么，你都需要了解 Kubernetes。虽然云确实还需要人去摆弄物理服务器，但作为一个系统管理员，你的未来肯定会涉及到容器，而没有什么比 Kubernetes 更能做到这一点。

虽然 [OpenShift][13] 为 Kubernetes 提供了流畅的“仪表盘”体验，但有时需要一种直接的方法，这正是 `kubectl` 提供的。下一次当你不得不到处推送容器时，请确保你手头有我们的《[kubectl 速查表][14]》。

### awk

近几年来，Linux 经历了很多创新，有虚拟机、容器、新的安全模型、新的初始化系统、云等等。然而有些东西似乎永远不会改变。尤其是，系统管理员需要从日志文件和其它无尽的数据流中解析和隔离信息。仍然没有比 Aho、Weinberger 和 Kernighan 的经典 `awk` 命令更适合这项工作的工具。

当然，自从 1977 年它被编写出来后，`awk` 已经走过了很长的路，新的选项和功能使它更容易使用。但如果你不是每天都在使用 `awk`，那么多的选项和语法可能会让你有点不知所措。下载我们的《[awk 速查表][15]》，了解 GNU awk 的工作原理。

### 赠品：Bash 脚本编程

速查表是有用的，但如果你想找更全面的东西，你可以下载我们的《[Bash 脚本编程手册][16]》。这本指南教你如何将你从速查表中了解到的所有命令和经验结合到脚本中，帮助你建立一个随时能用的自动化解决方案库来解决你的日常问题。本书内容丰富，详细讲解了 Bash 的工作原理、脚本与交互式命令的区别、如何捕捉错误等。

### 赋能系统管理员

你是一名系统管理员吗？

你正在成为一名系统管理员的路上吗？

你是否对系统管理员一天都在做什么感到好奇？

如果是的话，请查看《[赋能系统管理员][17]》，这里有来自业界最勤奋的系统管理员的新文章，讲述他们的工作，以及 Linux 和开源如何让这一切成为可能。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/sysadmin-cheat-sheets

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR (People work on a computer server with devices)
[2]: https://opensource.com/downloads/cheat-sheet-networking
[3]: https://firewalld.org/
[4]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[5]: https://opensource.com/downloads/firewall-cheat-sheet
[6]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[7]: https://opensource.com/downloads/advanced-ssh-cheat-sheet
[8]: https://opensource.com/downloads/linux-permissions-cheat-sheet
[9]: https://opensource.com/downloads/linux-common-commands-cheat-sheet
[10]: https://opensource.com/downloads/cheat-sheet-git
[11]: https://opensource.com/downloads/curl-command-cheat-sheet
[12]: https://opensource.com/downloads/cheat-sheet-selinux
[13]: https://opensource.com/tags/openshift
[14]: https://opensource.com/downloads/kubectl-cheat-sheet
[15]: https://opensource.com/downloads/cheat-sheet-awk-features
[16]: https://opensource.com/downloads/bash-scripting-ebook
[17]: http://redhat.com/sysadmin
