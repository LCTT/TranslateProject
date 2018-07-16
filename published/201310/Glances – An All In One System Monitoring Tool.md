Glances：自适应显示的多合一系统监控工具
===================================

很少有命令行工具可以适应不同的终端尺寸，为用户提供最大限度的信息。绝大多数的工具的显示都是类似的——要么显示的信息混乱了或工具给出一个错误信息。不过， **Glances**  却是一个支持在80X24终端到任何更大尺寸终端上显示大量系统/网络监控相关信息的工具。

![](http://mylinuxbook.com/wp-content/uploads/2013/09/glances-main.png)

**提示** -- 这篇文章中的所有例子在Ubuntu 13.04的bash shell上测试过。

###简短教程

Glances是一个系统监控工具，它在你的终端上能展示各种各样的系统相关信息。这些信息包括：

- CPU相关信息
- 磁盘IO相关信息
- 内存相关信息
- 挂载点相关信息
- 网络接口相关信息
- 进程相关信息
- 等等

这是glances示例截图：

![](http://mylinuxbook.com/wp-content/uploads/2013/09/glances-1-1024x654.png)

它是用python写的并且利用[psutils][1]库获取所有系统相关信息的显示。Glances在终端上的显示非常灵活，比如，它可以在小至80X24的终端上显示更多的信息。

这是在较小终端上的glances截图：

![](http://mylinuxbook.com/wp-content/uploads/2013/09/glances-small-terminal.png)

你可以看到甚至在较小终端上它也能显示一些信息。

你不仅可以用Glances对本地系统监控，它也能用于监控远程系统。在远程系统使用glances，运行以下命令：

	glances -s

并且在客户端执行：

	glances -c [ip-address-of-server]

在C/S模式中，使用glances有一些用户应该记住的重点[取自glances官方文档]：

在服务器端，你可以用 `-B address` 和 `-p port` 来设置绑定的IP地址和端口。

在客户端，使用 `-p port` 来指定连接的服务器端的端口。

默认的绑定地址是0.0.0.0（即监听在全部网络接口上）和61209/TCP端口上。

在C/S模式下，限制是在服务器端设置的。

你也可以通过 `-P password` 来指定一个连接口令。

Glances 也支持IPv6，可以通过 `-B ::` 来绑定到全部的IPv6地址上。

此外，这有几个命令行选项可用于自定义信息，像：

- 使用 -m 禁止显示挂载相关信息
- 使用 -n 禁止显示网络相关信息
- 使用 -t 设置屏幕刷新时间间隔
- 等等

通过[man手册页][2]探索和发现更多这样的选项。

除了命令行选项，glances提供许多帮助选项，你可以当glances正在运行的时候使用，这是选项列表：

![](http://mylinuxbook.com/wp-content/uploads/2013/09/glances-help.png)

所以你可以看到glances不仅灵活显示也高度可定制。

###下载/安装

这是一些与glances工具有关的重要链接：

- [主页][3]
- [下载页][4]
- [文档][5]

你可以从软件源下载和安装Glances，但这需要预装python-dev模块。Ubuntu用户可以通过Ubuntu软件中心直接下载和安装。本文使用的版本是1.7.1与PsUtil 0.6.1。

###总结

Glances是个工具，可以用于系统管理员快速了解完整的系统概况。在你的宝贝电脑上是个很好的工具，可以在你调试一些系统相关问题上派上用场。显示灵活想必是极好的。

**优点**  

- 在同等情况下提供许多系统相关信息
- 灵活的显示

**缺点**

- 较小终端时必须指定一些选项，以便显示更多信息。
- 从源代码构建依赖于附加库，像python-dev。


你曾今用过Glances或类似的工具吗？你的经历是什么？分享你的故事吧。

---

via: http://mylinuxbook.com/glances-an-all-in-one-system-monitoring-tool/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[wxy][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[wxy]:http://linux.cn/space/wxy

[1]:http://code.google.com/p/psutil/
[2]:http://linux.die.net/man/1/glances
[3]:http://nicolargo.github.io/glances/
[4]:http://nicolargo.github.io/glances/
[5]:https://github.com/nicolargo/glances/blob/master/docs/glances-doc.rst#introduction