戴文的Linux内核专题：19 配置内核 (15)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.578/)

你好！在这篇Linux系列文章中，我们将继续配置USB网络驱动。接着我们将进入输入设备。

首先，我们可以启用/禁用"Multi-purpose USB Networking Framework"，这允许连接笔记本到桌面系统上。

下面，可以启用/禁用ASIX USB-to-Ethernet适配器驱动(ASIX AX88xxx Based USB 2.0 Ethernet Adapters)。

那么，还有一个ASIX适配器驱动(ASIX AX88179/178A USB 3.0/2.0 to Gigabit Ethernet)。

注意：通常地，最好将适配器驱动作为模块加入。

通信设备类规范(Communication Device Class specification)在这个驱动中提供(CDC Ethernet support (smart devices such as cable modems))。这个规范用于USB调制解调器。Linux系统可以将USB网络接口识别为以太网网络接口并且指定为"ethX",这里的"X"是以太设备编号。

下面是一个与上面类似的规范(CDC EEM support)。CDC EEM代表的是"Communication Device Class Ethernet Emulation Model"(通信设备类以太网仿真模型)。

CDC网络控制模型(NCM)同样有一个驱动提供了规范(CDC NCM support)。

这个驱动提供了"CDC MBIM (Mobile Broadband Interface Model)"规范同样也在Linux内核中(CDC MBIM support)。

下面，有一些供货商/设备特定驱动用于不同的USB网络设备和芯片组。

在这之后，有一个用于USB网络设备的通用驱动，它不需要任何特殊的驱动(Simple USB Network Links (CDC Ethernet subset))。

再说一次，还有更多的驱动用于供货商特定设备。

	有趣的事实：Linux被用于制作James Cameron的电影"泰坦尼克"的特效。

"CDC Phonet support"是用于使用Phonet的Nokia USB调制解调器。(译注：Phonet是Nokia开发的面向数据包的通信协议,仅用于Nokia maemo/meego产品)

现在，我们可以进入使用802.11规范的无线局域网驱动了。

主要地，这里有一个供货商/设备特定驱动列表。

"SoftLED Support"控制着关于Wifi卡/设备的LED灯。

一些芯片组支持的SDIO在这个驱动中(Atheros ath6kl SDIO support)。SDIO是用于无线SD卡的SD(Secure Digital)规范的扩展。SDIO代表的是"Secure Digital Input/Output"

内核开发者可能注意到一些无线设备可以支持QoS。QoS代表"Quality of Service"(服务质量)。这个特性给予网络传输优先级。假设需要通过网络传输两组数据。只有一个可以先发送。QoS会先发送最重要的数据。

	有趣的事实：技术上来说，Linux并不是一个操作系统。Linux是一种内核而GNU/Linux才是操作系统。

WAN卡需要"Generic HDLC layer"。HDLC代表"High-Level Data Link Control"(高级数据链路控制)。这是一个数据链路层协议。

原生HDLC可以通过"Raw HDLC support"驱动启用。

"Raw HDLC Ethernet device support"驱动允许HDLC层模拟以太网。

cHDLC驱动提供了一个HDLC的扩展，同样也称作Cisco HDLC(Cisco HDLC support)。

Linux内核同样也提供了一个HDLC的"Frame Relay support"(帧中继)驱动。帧中继是2层协议。

HDLC同样支持PPP(Synchronous Point-to-Point Protocol (PPP) support)和X.25(X.25 protocol support)。

接下来，这个驱动提供了DLCI下的帧中继(Frame Relay DLCI support)。

"LAPB over Ethernet driver"创建一个允许用户在以太网上使用LAPB的点到点连接到另一台计算机的设备文件。这个设备文件对于第一个此类设备通常是/dev/lapb0。

用这个驱动，X.25帧可以通过电话线发送(X.25 async driver)。特别地，这个驱动允许X.25使用异步串行。

对于ISA SBNI12-xx有一种特殊的驱动(Granch SBNI12 Leased Line adapter support)。这种卡对于租用线路的调制解调器是一种便宜的替代。

下一个驱动允许使用并行连接携带已安排的流量(Multiple line feature support)。这允许Linux系统更加有效地在SBNI12适配器上管理并行连接。一些Linux用户声称这个驱动双倍加速了他们的速度。然而，这个我没有亲身测试了解。

接下来，可以配置"IEEE 802.15.4 drivers"。这个是对于慢速WAN设备。这是一个控制媒体和无线网络物理层的标准。这个规范在不同的大洲使用不同的频率。不如，在欧洲，这类无线设备会使用868.0-868.6MHz的频率。

这个目录中的第一个设定是fake LR-WPAN驱动(Fake LR-WPAN driver with several interconnected devices)。LR-WPAN代表"Low-Rate Wireless Personal Area Network"(低速无线个人网络)。

有趣的事实：目前内核中只有大约2%的代码是由Linus Torvalds写的。

VMware使用vmxnet3虚拟以太网需要这个驱动(VMware VMXNET3 ethernet driver)。当在为大量用户编译内核时，最好将这个启用为一个模块，因为一些人可能并不希望在VMware上使用以太网。

Hyper-V虚拟网络需要这个驱动(Microsoft Hyper-V virtual network driver)。你可能想知道这个是否与微软的Hyper-V相同？是的，Linux支持Hyper-V。

数字电话服务ISDN由这个驱动提供(ISDN support)。ISDN代表"Integrated Services Digital Network"(综合业务数字网)。在法国，ISDN被称为RNIS，代表" Réseau numérique à intégration de services"。有一台ISDN适配器，计算机可以开始并接收语音呼叫。这允许计算机用来做因待机或者其他一些电话服务设备。ISDN同样也可以携带视频信息。

现在，我们可以进入输入设备了(Input device support)。这些是给计算机信息的设备。鼠标和键盘是最常被使用和了解的输入设备。扫描仪是另外一种输入设备的例子。

首先是一个支持不同触觉反馈设备的驱动(Support for memoryless force-feedback devices)。比如，许多游戏控制器的震动就是一种触觉反馈。

一些输入设备会检测硬件的状态(Polled input device skeleton)。这类行为需要这个驱动。

使用稀疏键盘映射的输入设备需要这个驱动(Sparse keymap support library)。键盘映射是键盘的布局信息。

下面，是另外一种键盘映射(Matrix keymap support library)。

注意：当为广泛的用户组编译内核时，包含大多数或者全部输入设备作为模块，因为通常不知道用户可能插到计算机上的设备类型。

	有趣的事实：Vanilla内核就是Linux自己的原始内核，是未改变的状态。

"Mouse interface"对于鼠标创建了两个不同的设备文件。这两个设备文件是/dev/input/mouseX 和 /dev/input/mice。

下一个驱动创建了一个psaux设备文件并且它是/dev/input/mice的别名 (Provide legacy /dev/psaux device)。psaux设备文件是/dev/psaux。

如果系统有一块数位板，那么需要设置水平分辨率(Horizontal screen resolution)和垂直分辨率(Vertical screen resolution)。数位板是一种支持允许用户绘画的触控笔的触摸屏。另外的触摸屏无法支持如此复杂的输入。

下一个驱动支持操纵杆和游戏手柄(Joystick interface)。这个驱动会创建/dev/input/jsX文件。

"Event interface"驱动允许输入设备通过dev/input/eventX访问。

"Event debugging"驱动会输出所有的输入事件到系统日志中。除了要调试系统否则不要以任何理由启用它。显然地，这么做为了性能原因，但是我这么建议禁用的主要原因是安全目的。所有的按键都会被明文记录下来包括密码。

下面，列出了不同的键盘(Keyboards)配置驱动，接下来是鼠标(Mice)驱动和操纵杆和游戏手柄(joystick/gamepad)驱动。

在这之后，列出了不同特定的平板硬件/供货商的不同驱动(Tablets)。在这之后是触摸屏的驱动列表。

最后一组输入设备驱动是对于特定硬件和供货商的杂项驱动列表(Miscellaneous devices)。

这个系列的下一篇文章会讨论输入端口。不要忘记阅读这个系列的其他文章和这个网站。谢谢！

**致粉丝: 谢谢**你们的邮件告诉我你们对这些文章的喜爱。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-15.4793/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出