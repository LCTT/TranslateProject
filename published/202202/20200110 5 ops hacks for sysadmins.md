[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14232-1.html)
[#]: subject: (5 ops hacks for sysadmins)
[#]: via: (https://opensource.com/article/20/1/ops-hacks-sysadmins)
[#]: author: (Stephen Bancroft https://opensource.com/users/stevereaver)

系统管理员排除故障的五种武器
======

> 当你不知道从哪里开始时，这五个工具可以帮助你找到用户的 IT 问题的源头。

![](https://img.linux.net.cn/data/attachment/album/202202/01/005623l3v5lm73vzv755nn.jpg)

作为系统管理员，我每天都面临着需要快速解决的问题，用户和管理人员期望事情能够顺利地进行。在我管理的这样的一个大型环境中，几乎不可能从头到尾了解所有的系统和产品，所以我必须使用创造性的技术来找到问题的根源，并（希望可以）提出解决方案。

这是我 20 多年来的日常经验！每天上班时，我从不知道会发生什么。因此，我有一些快速而简陋的技巧，当一个问题落在我的身上，而我又不知道从哪里开始时，我一般就会采用这些技巧。

但等一下！在你直接打开命令行之前，请花一些时间与你的用户交谈。是的，这可能很乏味，但他们可能会有一些好的信息给你。请记住，用户可能没有你那么多的经验，你需要对他们说的东西进行一些解释。试着清楚地了解正在发生什么和应该发生什么，然后用技术语言自己描述故障。请注意，大多数用户并不阅读他们面前的屏幕上的内容；这很可悲，但却是事实。确保你和用户都阅读了所有的文字，以收集尽可能多的信息。一旦你收集到了这些信息，就打开命令行，使用这五个工具。

### Telnet

让我从一个经典开始。[Telnet][2] 是 SSH 的前身，在过去，它在 Unix 系统上用来连接到远程终端，就像 SSH 一样，但它没有加密。Telnet 在诊断网络连接问题方面有一个非常巧妙和宝贵的技巧：你可以 Telnet 到不是专属于它 TCP 端口（23/TCP）。要做到这一点，可以像平时一样使用 Telnet，但在末尾加上 TCP 端口（例如 `telnet localhost 80`），以连接到一个网络服务器。这可以让你能够检查一个服务器，看看服务是否正在运行，或者防火墙是否阻挡了它。因此，在没有应用程序客户端，甚至没有登录应用程序的情况下，你可以检查 TCP 端口是否有反应。如果你知道怎么做，有时你可以通过在 Telnet 提示符手动输入并获得响应以检查。网络服务器和邮件服务器是你可以这样做的两个例子。

![用 Telnet 获得网络服务器的响应][3]

### Tcpdump

[tcpdump][4] 工具可以让你检查网络上正在传输的数据。大多数网络协议都相当简单，如果你把 `tcpdump` 和一个像 [Wireshark][5] 这样的工具结合起来，你会得到一个简单而好用的方法来浏览你所捕获的流量。在如下的例子中，我在下面的窗口中检查数据包，在上面的窗口连接到 TCP 3260 端口。

![用 tcpdump 实时检查数据包][6]

这张截图显示了在现实世界中使用 Wireshark 查看 iSCSI 协议的情况；在这种情况下，我能够确定我们的 QNAP 网络附加存储的配置方式有问题。

![使用 Wireshark 检查 TCP 会话][7]

### find

如果你不知道从哪里开始，[find][8] 命令就是最好的工具。在其最简单的形式中，你可以用它来“寻找”文件。例如，如果我想在所有的目录中进行递归搜索，得到一个 conf 文件的列表，我可以输入：

```
find . -name '*.conf'.
```

![find 命令输出][9]

但是，`find` 的一个隐藏的宝藏是，你可以用它对它找到的每个项目执行一个命令。例如，如果我想得到每个文件的长列表，我可以输入；

```
find . -name '*.conf' -exec ls -las {}\;
```

![查找命令输出][10]

一旦你掌握了这种技术，你就可以用各种创造性的方法来寻找、搜索和以特定方式执行程序。

### strace

我是在 Solaris 上认识 [strace][11] 这个概念的，在那里它被称为 `truss`。今天，它仍然像多年前一样有用。`strace` 允许你在进程实时运行时检查它在做什么。使用它很简单，只要使用命令 `ps -ef`，找到你感兴趣的进程 ID。用 `strace -p <进程 ID>` 启动 `strace`，它会开始打印出一大堆东西，一开始看起来像垃圾信息。但如果你仔细观察，你会看到你认识的文字，如 `OPEN` 和 `CLOSE` 这样的词和文件名。如果你想弄清楚一个程序为什么不工作，这可以引导你走向正确的方向。

### grep

把最好的留到最后：[grep][12]。这个工具是如此有用和强大，以至于我很难想出一个简洁的方法来描述它。简单地说，它是一个搜索工具，但它的搜索方式使它如此强大。在问题分析中，我通常会用 `grep` 搜索一堆日志来寻找一些东西。一个叫 `zgrep` 的配套命令可以对压缩文件做同样的事情。在下面的例子中，我使用 `zgrep bancroft /var/log/*` 在所有的日志文件中进行 grep，以查看我在系统中的工作情况。我使用 `zgrep` 是因为该目录中有压缩文件。

![grep 命令输出][13]

使用 `grep` 的另一个好方法是将其他工具的输出通过管道输送到它里面；这样，它就可以作为一种过滤器来使用。在下面的例子中，我列出了 auth 文件，并通过使用 `cat auth.log |grep bancroft` 来搜索我的登录信息，看看我都做了什么。这也可以写成 `grep bancroft auth.log`，但我这里用管道（`|`）来证明这一点。

![grep 命令输出][14]

### 其他需要考虑的工具

你可以用这些工具做更多的事情，但我希望这个简单的介绍能给你一个窗口，让你了解如何用它们来解决你遇到的讨厌的问题。另一个值得你注意的工具是 [Nmap][15]，我没有包括它，因为它是如此全面，需要一整篇文章（或更多）来解释它。最后，我建议学习一些白帽和黑客技术；在试图找出问题的根源时，它们可能非常有益，因为它们可以帮助你收集对决策至关重要的信息。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/ops-hacks-sysadmins

作者：[Stephen Bancroft][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stevereaver
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4 (Wratchet set tools)
[2]: https://en.wikipedia.org/wiki/Telnet
[3]: https://opensource.com/sites/default/files/uploads/telnet_1.png (Getting a response from a webserver with Telnet)
[4]: https://www.tcpdump.org/
[5]: https://www.wireshark.org/
[6]: https://opensource.com/sites/default/files/uploads/tcpdump_1.png (Inspecting packets in real time with tcpdump)
[7]: https://opensource.com/sites/default/files/uploads/tcpdump_2.png (Using Wireshark to inspect a TCP session)
[8]: https://en.wikipedia.org/wiki/Find_%28Unix%29
[9]: https://opensource.com/sites/default/files/uploads/find_1_0.png (find command output)
[10]: https://opensource.com/sites/default/files/uploads/find_2.png (find command output)
[11]: https://strace.io/
[12]: https://en.wikipedia.org/wiki/Grep
[13]: https://opensource.com/sites/default/files/uploads/grep_1.png (grep command output)
[14]: https://opensource.com/sites/default/files/uploads/grep_2.png (grep command output)
[15]: https://nmap.org/
