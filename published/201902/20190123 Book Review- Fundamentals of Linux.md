[#]: collector: (lujun9972)
[#]: translator: (mySoul8012)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10565-1.html)
[#]: subject: (Book Review: Fundamentals of Linux)
[#]: via: (https://itsfoss.com/fundamentals-of-linux-book-review)
[#]: author: (John Paul https://itsfoss.com/author/john/)

书评：《Linux 基础》
======

介绍 Linux 的基础知识以及它的工作原理的书很多，今天，我们将会点评这样一本书。这次讨论的主题为 Oliver Pelz 所写的 《<ruby>[Linux 基础][1]<rt>Fundamentals of Linux</rt></ruby>》，由 [PacktPub][2] 出版。

[Oliver Pelz][3] 是一位拥有超过十年软件开发经验的开发者和系统管理员，拥有生物信息学学位证书。

### 《Linux 基础》

![Fundamental of Linux books][4]

正如可以从书名中猜到那样，《Linux 基础》的目标是为读者打下一个从了解 Linux 到学习 Linux 命令行的坚实基础。这本书一共有两百多页，因此它专注于教给用户日常任务和解决经常遇到的问题。本书是为想要成为 Linux 管理员的读者而写的。

第一章首先概述了虚拟化。本书作者指导了读者如何在 [VirtualBox][6] 中创建 [CentOS][5] 实例。如何克隆实例，如何使用快照。并且同时你也会学习到如何通过 SSH 命令连接到虚拟机。

第二章介绍了 Linux 命令行的基础知识，包括 shell 通配符，shell 展开，如何使用包含空格和特殊字符的文件名称。如何来获取命令手册的帮助页面。如何使用 `sed`、`awk` 这两个命令。如何浏览 Linux 的文件系统。

第三章更深入的介绍了 Linux 文件系统。你将了解如何在 Linux 中文件是如何链接的，以及如何搜索它们。你还将获得用户、组，以及文件权限的大概了解。由于本章的重点介绍了如何与文件进行交互。因此还将会介绍如何从命令行中读取文本文件，以及初步了解如何使用 vim 编辑器。

第四章重点介绍了如何使用命令行。以及涵盖的重要命令。如 `cat`、`sort`、`awk`、`tee`、`tar`、`rsync`、`nmap`、`htop` 等。你还将会了解到进程，以及它们如何彼此通讯。这一章还介绍了 Bash shell 脚本编程。

第五章同时也是本书的最后一章，将会介绍 Linux 和其他高级命令，以及网络的概念。本书的作者讨论了 Linux 是如何处理网络，并提供使用多个虚拟机的示例。同时还将会介绍如何安装新的程序，如何设置防火墙。

### 关于这本书的思考

Linux 的基础知识只有五章和少少的 200 来页可能看起来有些短，但是也涵盖了相当多的信息。同时也将会获得如何使用命令行所需要的知识的一切。

使用本书的时候，需要注意一件事情，即，本书专注于对命令行的关注，没有任何关于如何使用图形化的用户界面的任何教程。这是因为在 Linux 中有太多不同的桌面环境，以及很多的类似的系统应用，因此很难编写一本可以涵盖所有变种的书。此外，还有部分原因还因为本书的面向的用户群体为潜在的 Linux 管理员。

当我看到作者使用 Centos 教授 Linux 的时候有点惊讶。我原本以为他会使用更为常见的 Linux 的发行版本，例如 Ubuntu、Debian 或者 Fedora。原因在于 Centos 是为服务器设计的发行版本。随着时间的推移变化很小，能够为 Linux 的基础知识打下一个非常坚实的基础。

我自己使用 Linux 已经操作五年了。我大部分时间都在使用桌面版本的 Linux。我有些时候会使用命令行操作。但我并没有花太多的时间在那里。我使用鼠标完成了本书中涉及到的很多操作。现在呢。我同时也知道了如何通过终端做到同样的事情。这种方式不会改变我完成任务的方式，但是会有助于自己理解幕后发生的事情。

如果你刚刚使用 Linux，或者计划使用。我不会推荐你阅读这本书。这可能有点绝对化。但是如何你已经花了一些时间在 Linux 上。或者可以快速掌握某种技术语言。那么这本书很适合你。

如果你认为本书适合你的学习需求。你可以从以下链接获取到该书：

- [下载《Linux 基础》](https://www.packtpub.com/networking-and-servers/fundamentals-linux)

我们将在未来几个月内尝试点评更多 Linux 书籍，敬请关注我们。

你最喜欢的关于 Linux 的入门书籍是什么？请在下面的评论中告诉我们。
 
如果你发现这篇文章很有趣，请花一点时间在社交媒体、Hacker News或 [Reddit][8] 上分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/fundamentals-of-linux-book-review

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[mySoul8012](https://github.com/mySoul8012)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://www.packtpub.com/networking-and-servers/fundamentals-linux
[2]: https://www.packtpub.com/
[3]: http://www.oliverpelz.de/index.html
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/fundamentals-of-linux-book-review.jpeg?resize=800%2C450&ssl=1
[5]: https://centos.org/
[6]: https://www.virtualbox.org/
[7]: https://www.centos.org/
[8]: http://reddit.com/r/linuxusersgroup
