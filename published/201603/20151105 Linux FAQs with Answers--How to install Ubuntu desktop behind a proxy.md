Linux 有问必答：如何通过代理服务器安装 Ubuntu 桌面版
================================================================================
> **问题**: 我的电脑通过 HTTP 代理连接到公司网络。当我尝试从 CD-ROM 在计算机上安装 Ubuntu 桌面时，在检索文件时安装程序会被挂起，检索则不会完成，这可能是由于代理造成的。然而问题是，Ubuntu 的安装程序从不要求我在安装过程中配置代理。那我该怎么使用代理来安装 Ubuntu 桌面？

与 Ubuntu 服务器不太一样，安装 Ubuntu 桌面几乎都是自动安装，没有留下太多自定义的空间，如自定义磁盘分区，手动网络设置，包选择等等。尽管非常简单，一键安装被认为是用户友好的，它不需要用户寻找“高级安装模式”来定制自己的 Ubuntu 桌面。

此外，Ubuntu 默认桌面的安装程序中一个大问题是代理设置。如果你的计算机连接在一个代理上，你会发现 Ubuntu 安装时会卡在准备下载文件处。

![](https://c2.staticflickr.com/6/5683/22195372232_cea81a5e45_c.jpg)

这篇文章描述了如何解决当使用代理时 Ubuntu **安装程序的限制和安装 Ubuntu 桌面**。 

其基本思路如下。不是直接使用 Ubuntu 的安装程序开始安装，首先进入 live Ubuntu 桌面，配置代理服务器，最后从 live 桌面手动启动 Ubuntu 的安装程序。以下是程序的安装步骤。

从 CD/DVD 或 USB 启动 Ubuntu 桌面后，点击第一个欢迎屏幕上的"Try Ubuntu"。

![](https://c1.staticflickr.com/1/586/22195371892_3816ba09c3_c.jpg)

一旦进入 live Ubuntu 桌面，点击左侧设置图标。

![](https://c1.staticflickr.com/1/723/22020327738_058610c19d_c.jpg)

进入 Network 菜单。

![](https://c2.staticflickr.com/6/5675/22021212239_ba3901c8bf_c.jpg)

手动配置代理服务器。

![](https://c1.staticflickr.com/1/735/22020025040_59415e0b9a_c.jpg)

接下来，打开一个终端。

![](https://c2.staticflickr.com/6/5642/21587084823_357b5c48cb_c.jpg)

通过输入以下命令切换到 root 用户：

    $ sudo su

最后，在 root 用户下输入以下命令。

    # ubiquity gtk_ui

然后将启动基于 GUI 的 Ubuntu 安装程序。


![](https://c1.staticflickr.com/1/723/22020025090_cc64848b6c_c.jpg)

继续安装其余部分。

![](https://c1.staticflickr.com/1/628/21585344214_447020e9d6_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-ubuntu-desktop-behind-proxy.html

作者：[Dan Nanni][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
