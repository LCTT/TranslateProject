[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 Key Changes to Look Out for in Linux Kernel 5.6)
[#]: via: (https://itsfoss.com/linux-kernel-5-6/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

四大亮点带你看 Linux Kernel 5.6
======

当我们体验 Linux 5.5 稳定发行版带来更好的硬件支持时，Linux 5.6 已经来了。

说实话，Linux 5.6 比 5.5 更令人兴奋。即使即将发布的 Ubuntu 20.04 LTS 发行版将开箱集成 Linux 5.5，你也需要真正了解 Linux 5.6 kernel 为我们提供的功能。

我将在本文中重点介绍Linux 5.6 发行版中值得期待的关键更改和功能：

### Linux 5.6 功能亮点

![][1]

当 Linux 5.6 有新消息时，我将努力更新这份功能列表。但现在让我们先看一下当前已知的内容：

#### 1\. 支持 WireGuard

WireGuard 将被添加到 Linux 5.6，出于各种原因的考虑它可能将取代 [OpenVPN][2]。

你可以在官网上进一步了解 [WireGuard][3] 的优点。当然，如果你使用过它，那你可能已经知道它比 OpenVPN 更好的原因。

同样，[Ubuntu 20.04 LTS 将支持 WireGuard][4]。

#### 2\. 支持 USB4

Linux 5.6 也将支持 **USB4**。

如果你不了解 USB 4.0 (USB4)，你可以阅读这份[文档][5].

根据文档，“_USB4 将使 USB 的最大带宽增加一倍并支持同时多个数据传输和显示接口并行。_”

另外，虽然我们都知道 USB4 基于 Thunderbolt 接口协议，但它将向后兼容 USB 2.0、USB 3.0 以及 Thunderbolt 3，这将是一个好消息。

#### 3\. 使用 LZO/LZ4 压缩 F2FS 数据

Linux 5.6 也将支持使用LZO/LZ4 算法压缩 F2FS 数据。

换句话说，这只是 Linux 文件系统的一种新压缩技术，你可以选择待定的文件扩展名。

#### 4\. 解决 32 位系统的 2038 年问题

Unix and Linux store the time value in a 32-bit signed integer format which has the maximum value of 2147483647. Beyond this number, due to integer overflow, the values will be stored as a negative number.

This means that for a 32-bit system, the time value cannot go beyond 2147483647 seconds after Jan. 1, 1970. In simpler terms, after 03:14:07 UTC on Jan. 19, 2038, due to integer overflow, the time will read as Dec. 13, 1901 instead of Jan. 19, 2038.

Linux kernel 5.6 has a fix for this problem so that 32-bit systems can run beyond the year 2038.

#### 5\. 改进硬件支持

Obviously, with the next release, the hardware support will improve as well. The plan to support newer wireless peripherals will be a priority too.

The new kernel will also add the support for MX Master 3 mouse and other wireless Logitech products.

In addition to Logitech products, you can expect a lot of different hardware support as well (including the support for AMD GPUs, NVIDIA GPUs, and Intel Tiger Lake chipset support).

#### 6\. 其他更新

Also, in addition to all these major additions/support in Linux 5.6, there are several other changes that would be coming with the next kernel release:

  * Improvements in AMD Zen temperature/power reporting
  * A fix for AMD CPUs overheating in ASUS TUF laptops
  * Open-source NVIDIA RTX 2000 “Turing” graphics support
  * FSCRYPT inline encryption.



[Phoronix][6] 跟踪了 Linux 5.6 带来的许多技术性更改。因此，如果你好奇 Linux 5.6 所涉及的全部更改，则可以亲自了解一下。

现在你已经了解了 Linux 5.6 发布版带来的新功能，对此有什么看法呢？在下方评论中留下你的看法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-kernel-5-6/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[LazyWolfLin](https://github.com/LazyWolfLin)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/linux-kernel-5.6.jpg?ssl=1
[2]: https://openvpn.net/
[3]: https://www.wireguard.com/
[4]: https://www.phoronix.com/scan.php?page=news_item&px=Ubuntu-20.04-Adds-WireGuard
[5]: https://www.usb.org/sites/default/files/2019-09/USB-IF_USB4%20spec%20announcement_FINAL.pdf
[6]: https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.6-Spectacular
