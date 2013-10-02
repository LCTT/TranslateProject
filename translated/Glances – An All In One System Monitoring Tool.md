Glances -- 多合一系统监控工具
===

有很少的命令行工具无论终端大小针对用户提供一个最大限度的信息。在类似方式上许多工具相应 -- 要么显示的信息混乱了或工具给出一个错误信息。但是，一个这样的工具从80X24终端到任何更大尺寸终端显示大量系统/网络监控相关信息，是 **Glances** 。

![](https://github-camo.global.ssl.fastly.net/a55bfddc9069bcda490232261c896e783b23b667/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f676c616e6365732d6d61696e2e706e67)

**注意** -- 这篇文章中的所有例子在Ubuntu 13.04的bash shell上测试过。

**简短教程**  

Glances是一个系统监控工具，它在你的终端上能展示各种各样的系统相关信息。这些信息包括：

- CPU相关信息
- 磁盘IO相关信息
- 内存相关信息
- 挂载点相关信息
- 网络接口相关信息
- 进程相关信息
- 等等

这是glances示例截图：

![](https://github-camo.global.ssl.fastly.net/0a0527508989662890baa998ac309277c41e6099/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f676c616e6365732d312d31303234783635342e706e67)

它是用python写的并且利用[psutils][1]库获取所有系统相关信息的显示。Glances非常灵活的显示，如，它尝试在终端小至80X24上显示更多的信息。

这是在较小终端上的glances截图：

![](https://github-camo.global.ssl.fastly.net/0cf0ba9390edc7c3222b0a34152181816feb69a1/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f676c616e6365732d736d616c6c2d7465726d696e616c2e706e67)

所以你能看到甚至在较小终端上它也能显示一些信息。

你不仅可以用Glances对本地系统监控，它也能用于监控远程系统。在远程系统使用glances，运行以下命令：

	glances -s

并且在客户端执行：

	glances -c [ip-address-of-server]

然而在C/S模式中使用glances有一些重点用户应该记住[取自glances官方文档]：

![](https://github-camo.global.ssl.fastly.net/837d111a8f56cdda1cea0664c7eec4cba8bc9e25/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f676c616e6365732d6f746865722d696e666f2e706e67)

此外，这有几个命令行选项可用于自定义信息，像：

- 使用 -m 禁止挂载相关信息
- 使用 -n 禁止网络相关信息
- 使用 -P 限定密码同时在C/S模式中运行
- 使用 -t 设置屏幕刷新时间间隔
- 等等

通过[man手册页][2]探索和发现更多这样的选项。

除了命令行选项，glances提供许多帮助选项，你可以当glances正在运行的时候使用，这是选项列表：

![](https://github-camo.global.ssl.fastly.net/ec58a59980772856d3a2d1ab0c14271c8b99913d/687474703a2f2f6d796c696e7578626f6f6b2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031332f30392f676c616e6365732d68656c702e706e67)

所以你可以看到glances不仅灵活显示也高可定制。

**下载/安装**  

这是一些与glances工具有关的重要链接：

- [主页][3]
- [下载页][4]
- [文档][5]

你可以从软件源下载和安装Glances，但这需要预装python-dev模块。Ubuntu用户可以通过Ubuntu软件中心直接下载和安装。本文使用的版本是1.7.1与PsUtil 0.6.1。

**优点**  

- 在同一高度下提供许多系统相关信息
- 灵活的显示

**缺点**

- 较小终端必须包括一些指示，可以显示更多信息。
- 从源代码构建依赖于附加库，像python-dev。

**总结**  

Glances是个工具，可以用于系统管理员快速获取一个完整的系统概述。在你的kitty(宝贝电脑?)上是个很好的工具，可以在你调试一些系统相关问题上派上用场。灵活的显示上总是添加上的。

你曾今用过Glances或类似的工具吗？你的经历是什么？分享你的故事。

via: http://mylinuxbook.com/glances-an-all-in-one-system-monitoring-tool/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Vito][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Vito]:http://linux.cn/space/Vito
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://code.google.com/p/psutil/
[2]:http://linux.die.net/man/1/glances
[3]:http://nicolargo.github.io/glances/
[4]:http://nicolargo.github.io/glances/
[5]:https://github.com/nicolargo/glances/blob/master/docs/glances-doc.rst#introduction