Linux 有问必答：如何在Ubuntu上配置网桥
===============================================================================
> **Question**: 我需要在我的Ubuntu主机上建立一个Linux网桥,共享一个网卡给其他一些虚拟主机或在主机上创建的容器。我目前正在Ubuntu上使用网络管理器（Network Manager），所以最好>能使用网络管理器来配置一个网桥。我该怎么做？

网桥是一个硬件装备，用来将两个或多个数据链路层（OSI七层模型中第二层）互联，以使得不同网段上的网络设备可以互相访问。当你想要互联一个主机里的多个虚拟机器或者以太接口时，就需要在Linux主机里有一个类似桥接的概念。这里使用的是一种软网桥。

有很多的方法来配置一个Linux网桥。举个例子，在一个无外接显示/键盘的服务器环境里，你可以使用[brct][1]手动地配置一个网桥。而在桌面环境下，在网络管理器里也支持网桥设置。那就让我们测试一下如何用网络管理器配置一个网桥吧。

### 要求 ###

为了避免[任何问题][2]，建议你的网络管理器版本为0.9.9或者更高，它用在 Ubuntu 15.04或者更新的版本。

    $ apt-cache show network-manager | grep Version

----------

    Version: 0.9.10.0-4ubuntu15.1
	Version: 0.9.10.0-4ubuntu15

### 创建一个网桥 ###

使用网络管理器创建网桥最简单的方式就是通过nm-connection-editor。这款GUI（图形用户界面）的工具允许你傻瓜式地配置一个网桥。

首先，启动nm-connection-editor。

	$ nm-connection-editor

该编辑器的窗口会显示给你一个列表，列出目前配置好的网络连接。点击右上角的“添加”按钮，创建一个网桥。

![](https://farm9.staticflickr.com/8781/17139502730_c3ca920f7f.jpg)

接下来，选择“Bridge”（网桥）作为连接类型。

![](https://farm9.staticflickr.com/8873/17301102406_4f75133391_z.jpg)

现在，开始配置网桥，包括它的名字和所桥接的连接。如果没有创建过其他网桥，那么默认的网桥接口会被命名为bridge0。

回顾一下，创建网桥的目的是为了通过网桥共享你的以太网卡接口，所以你需要添加以太网卡接口到网桥。在图形界面添加一个新的“桥接的连接”可以实现上述目的。点击“Add”按钮。

![](https://farm9.staticflickr.com/8876/17327069755_52f1d81f37_z.jpg)

选择“以太网”作为连接类型。

![](https://farm9.staticflickr.com/8832/17326664591_632a9001da_z.jpg)

在“设备的 MAC 地址”区域，选择你想要从属于网桥的接口。本例中，假设该接口是eth0。

![](https://farm9.staticflickr.com/8842/17140820559_07a661f30c_z.jpg)

点击“常规”标签，并且选中两个复选框，分别是“当其可用时自动连接到该网络”和“所有用户都可以连接到该网络”。

![](https://farm8.staticflickr.com/7776/17325199982_801290e172_z.jpg)

切换到“IPv4 设置”标签，为网桥配置DHCP或者是静态IP地址。注意，你应该为从属的以太网卡接口eth0使用相同的IPv4设定。本例中，我们假设eth0是用过DHCP配置的。因此，此处选择“自动（DHCP）”。如果eth0被指定了一个静态IP地址，那么你也应该指定相同的IP地址给网桥。

![](https://farm8.staticflickr.com/7737/17140820469_99955cf916_z.jpg)

最后，保存网桥的设置。

现在，你会看见一个新增的网桥连接被创建在“网络连接”窗口里。因为已经从属与网桥，以前配置好的有线连接 eth0 就不再需要了，所以去删除原来的有线连接吧。

![](https://farm9.staticflickr.com/8700/17140820439_272a6d5c4e.jpg)

这时候，网桥连接会被自动激活。从指定给eth0的IP地址被网桥接管起，你将会暂时丢失一下连接。当IP地址赋给了网桥，你将会通过网桥连接回你的以太网卡接口。你可以通过“Network”设置确认一下。

![](https://farm8.staticflickr.com/7742/17325199902_9ceb67ddc1_c.jpg)

同时，检查可用的接口。提醒一下，网桥接口必须已经取代了任何你的以太网卡接口拥有的IP地址。

![](https://farm8.staticflickr.com/7717/17327069605_6143f1bd6a_b.jpg)

就这么多了，现在，网桥已经可以用了。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/configure-linux-bridge-network-manager-ubuntu.html

作者：[Dan Nanni][a]
译者：[wi-cuckoo](https://github.com/wi-cuckoo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://xmodulo.com/how-to-configure-linux-bridge-interface.html
[2]:https://bugs.launchpad.net/ubuntu/+source/network-manager/+bug/1273201
