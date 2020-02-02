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

I’ll try to keep the list of features up-to-date whenever there’s a piece of new information on Linux 5.6. But, for now, let’s take a look at what we already know so far:

#### 1\. 支持 WireGuard

WireGuard will be added to Linux 5.6 – potentially replacing [OpenVPN][2] for a variety of reasons.

You can learn more about [WireGuard][3] on their official site to know the benefits. Of course, if you’ve used it, you might be aware of the reasons why it’s potentially better than OpenVPN.

Also, [Ubuntu 20.04 LTS will be adding support for WireGuard][4].

#### 2\. 支持 USB4

Linux 5.6 will also include the support of **USB4**.

In case you didn’t know about USB 4.0 (USB4), you can read the [announcement post][5].

As per the announcement – “_USB4 doubles the maximum aggregate bandwidth of USB and enables multiple simultaneous data and display protocols._“

Also, while we know that USB4 is based on the Thunderbolt protocol specification, it will be backward compatible with USB 2.0, USB 3.0, and Thunderbolt 3 – which is great news.

#### 3\. 使用 LZO/LZ4 压缩 F2FS 数据

Linux 5.6 will also come with the support for F2FS data compression using LZO/LZ4 algorithms.

In other words, it is just a new compression technique for the Linux file-system where you will be able to select particular file extensions.

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
