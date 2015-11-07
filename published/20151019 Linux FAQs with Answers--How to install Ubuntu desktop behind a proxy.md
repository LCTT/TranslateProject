Linux有问必答： 当使用代理服务器连接互联网时如何安装 Ubuntu 桌面版
================================================================================
> **提问：** 我的电脑连接到的公司网络是使用HTTP代理连上互联网的。当我想使用CD-ROM安装Ubuntu时，安装在尝试获取文件时被停滞了，可能是由于代理的原因。然而问题是Ubuntu的安装程序从来没有在安装过程中提示我配置代理。我该怎样通过代理服务器安装Ubuntu桌面版？

不像Ubuntu服务器版，Ubuntu桌面版的安装非常自动化，没有留下太多的自定义空间，就像自定义磁盘分区，手动网络设置，包选择等等。虽然这种简单的，一键安装被认为是用户友好的，但却是那些寻找“高级安装模式”来定制自己的Ubuntu桌面安装的用户不希望的。

除此之外，默认的Ubuntu桌面版安装器的一个大问题是缺少代理设置。如果你电脑在代理后面，你会看到Ubuntu在准备下载文件的时候停滞了。

![](https://c2.staticflickr.com/6/5683/22195372232_cea81a5e45_c.jpg)

这篇文章描述了如何解除Ubuntu安装限制以及**如何通过代理服务器安装Ubuntu桌面**。

基本的想法是这样的。首先启动到live Ubuntu桌面中而不是直接启动Ubuntu安装器，配置代理设置并且手动在live Ubuntu中启动Ubuntu安装器。下面是步骤。

从Ubuntu桌面版CD/DVD或者USB启动后，在欢迎页面点击“Try Ubuntu”。

![](https://c1.staticflickr.com/1/586/22195371892_3816ba09c3_c.jpg)

当你进入live Ubuntu后，点击左边的设置图标。

![](https://c1.staticflickr.com/1/723/22020327738_058610c19d_c.jpg)

进入网络菜单。

![](https://c2.staticflickr.com/6/5675/22021212239_ba3901c8bf_c.jpg)

手动配置代理。

![](https://c1.staticflickr.com/1/735/22020025040_59415e0b9a_c.jpg)

接下来，打开终端。

![](https://c2.staticflickr.com/6/5642/21587084823_357b5c48cb_c.jpg)

输入下面的命令进入root会话。

    $ sudo su

最后以root权限输入下面的命令。

    # ubiquity gtk_ui

它会启动基于GUI的Ubuntu安装器。

![](https://c1.staticflickr.com/1/723/22020025090_cc64848b6c_c.jpg)

接着完成剩余的安装。

![](https://c1.staticflickr.com/1/628/21585344214_447020e9d6_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-ubuntu-desktop-behind-proxy.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
