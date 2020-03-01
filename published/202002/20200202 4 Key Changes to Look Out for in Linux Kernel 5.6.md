[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11853-1.html)
[#]: subject: (4 Key Changes to Look Out for in Linux Kernel 5.6)
[#]: via: (https://itsfoss.com/linux-kernel-5-6/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

四大亮点带你看 Linux 内核 5.6
======

当我们还在体验 Linux 5.5 稳定发行版带来更好的硬件支持时，Linux 5.6 已经来了。

说实话，Linux 5.6 比 5.5 更令人兴奋。即使即将发布的 Ubuntu 20.04 LTS 发行版将自带 Linux 5.5，你也需要切实了解一下 Linux 5.6 内核为我们提供了什么。

我将在本文中重点介绍 Linux 5.6 发布版中值得期待的关键更改和功能：

### Linux 5.6 功能亮点

![][1]

当 Linux 5.6 有新消息时，我会努力更新这份功能列表。但现在让我们先看一下当前已知的内容：

#### 1、支持 WireGuard

WireGuard 将被添加到 Linux 5.6，出于各种原因的考虑它可能将取代 [OpenVPN][2]。

你可以在官网上进一步了解 [WireGuard][3] 的优点。当然，如果你使用过它，那你可能已经知道它比 OpenVPN 更好的原因。

同样，[Ubuntu 20.04 LTS 将支持 WireGuard][4]。

#### 2、支持 USB4

Linux 5.6 也将支持 **USB4**。

如果你不了解 USB 4.0 (USB4)，你可以阅读这份[文档][5]。

根据文档，“USB4 将使 USB 的最大带宽增大一倍并支持<ruby>多并发数据和显示协议<rt>multiple simultaneous data and display protocols</rt></ruby>。”

另外，虽然我们都知道 USB4 基于 Thunderbolt 接口协议，但它将向后兼容 USB 2.0、USB 3.0 以及 Thunderbolt 3，这将是一个好消息。

#### 3、使用 LZO/LZ4 压缩 F2FS 数据

Linux 5.6 也将支持使用 LZO/LZ4 算法压缩 F2FS 数据。

换句话说，这只是 Linux 文件系统的一种新压缩技术，你可以选择待定的文件扩展技术。

#### 4、解决 32 位系统的 2038 年问题

Unix 和 Linux 将时间值以 32 位有符号整数格式存储，其最大值为 2147483647。时间值如果超过这个数值则将由于整数溢出而存储为负数。

这意味着对于 32 位系统，时间值不能超过 1970 年 1 月 1 日后的 2147483647 秒。也就是说，在 UTC 时间 2038 年 1 月 19 日 03:14:07 时，由于整数溢出，时间将显示为 1901 年 12 月 13 日而不是 2038 年 1 月 19 日。

Linux kernel 5.6 解决了这个问题，因此 32 位系统也可以运行到 2038 年以后。

#### 5、改进硬件支持

很显然，在下一个发布版中，硬件支持也将继续提升。而支持新式无线外设的计划也同样是优先的。

新内核中将增加对 MX Master 3 鼠标以及罗技其他无线产品的支持。

除了罗技的产品外，你还可以期待获得许多不同硬件的支持（包括对 AMD GPU、NVIDIA GPU 和 Intel Tiger Lake 芯片组的支持）。

#### 6、其他更新

此外，Linux 5.6 中除了上述主要的新增功能或支持外，下一个内核版本也将进行其他一些改进：

  * 改进 AMD Zen 的温度/功率报告
  * 修复华硕飞行堡垒系列笔记本中 AMD CPU 过热
  * 开源支持 NVIDIA RTX 2000 图灵系列显卡
  * 内建 FSCRYPT 加密

[Phoronix][6] 跟踪了 Linux 5.6 带来的许多技术性更改。因此，如果你好奇 Linux 5.6 所涉及的全部更改，则可以亲自了解一下。

现在你已经了解了 Linux 5.6 发布版带来的新功能，对此有什么看法呢？在下方评论中留下你的看法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-kernel-5-6/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[LazyWolfLin](https://github.com/LazyWolfLin)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/linux-kernel-5.6.jpg?ssl=1
[2]: https://openvpn.net/
[3]: https://www.wireguard.com/
[4]: https://www.phoronix.com/scan.php?page=news_item&px=Ubuntu-20.04-Adds-WireGuard
[5]: https://www.usb.org/sites/default/files/2019-09/USB-IF_USB4%20spec%20announcement_FINAL.pdf
[6]: https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.6-Spectacular
