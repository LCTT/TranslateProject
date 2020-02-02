[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 Key Changes to Look Out for in Linux Kernel 5.6)
[#]: via: (https://itsfoss.com/linux-kernel-5-6/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

4 Key Changes to Look Out for in Linux Kernel 5.6
======

While we’ve already witnessed the stable release of Linux 5.5 with better hardware support, Linux 5.6 is next.

To be honest, Linux 5.6 is much more exciting than 5.5. Even though the upcoming Ubuntu 20.04 LTS release will feature Linux 5.5 out of the box, you should really know what Linux 5.6 kernel has in store for us.

In this article, I’ll be highlighting the key changes and features that you can expect with Linux 5.6 release:

### Linux 5.6 features highlight

![][1]

I’ll try to keep the list of features up-to-date whenever there’s a piece of new information on Linux 5.6. But, for now, let’s take a look at what we already know so far:

#### 1\. WireGuard Support

WireGuard will be added to Linux 5.6 – potentially replacing [OpenVPN][2] for a variety of reasons.

You can learn more about [WireGuard][3] on their official site to know the benefits. Of course, if you’ve used it, you might be aware of the reasons why it’s potentially better than OpenVPN.

Also, [Ubuntu 20.04 LTS will be adding support for WireGuard][4].

#### 2\. USB4 Support

Linux 5.6 will also include the support of **USB4**.

In case you didn’t know about USB 4.0 (USB4), you can read the [announcement post][5].

As per the announcement – “_USB4 doubles the maximum aggregate bandwidth of USB and enables multiple simultaneous data and display protocols._“

Also, while we know that USB4 is based on the Thunderbolt protocol specification, it will be backward compatible with USB 2.0, USB 3.0, and Thunderbolt 3 – which is great news.

#### 3\. F2FS Data Compression Using LZO/LZ4

Linux 5.6 will also come with the support for F2FS data compression using LZO/LZ4 algorithms.

In other words, it is just a new compression technique for the Linux file-system where you will be able to select particular file extensions.

#### 4\. Fixing the Year 2038 problem for 32-bit systems

Unix and Linux store the time value in a 32-bit signed integer format which has the maximum value of 2147483647. Beyond this number, due to integer overflow, the values will be stored as a negative number.

This means that for a 32-bit system, the time value cannot go beyond 2147483647 seconds after Jan. 1, 1970. In simpler terms, after 03:14:07 UTC on Jan. 19, 2038, due to integer overflow, the time will read as Dec. 13, 1901 instead of Jan. 19, 2038.

Linux kernel 5.6 has a fix for this problem so that 32-bit systems can run beyond the year 2038.

#### 5\. Improved Hardware Support

Obviously, with the next release, the hardware support will improve as well. The plan to support newer wireless peripherals will be a priority too.

The new kernel will also add the support for MX Master 3 mouse and other wireless Logitech products.

In addition to Logitech products, you can expect a lot of different hardware support as well (including the support for AMD GPUs, NVIDIA GPUs, and Intel Tiger Lake chipset support).

#### 6\. Other Changes

Also, in addition to all these major additions/support in Linux 5.6, there are several other changes that would be coming with the next kernel release:

  * Improvements in AMD Zen temperature/power reporting
  * A fix for AMD CPUs overheating in ASUS TUF laptops
  * Open-source NVIDIA RTX 2000 “Turing” graphics support
  * FSCRYPT inline encryption.



[Phoronix][6] tracked a lot of technical changes arriving with Linux 5.6. So, if you’re curious about every bit of the changes involved in Linux 5.6, you can check for yourself.

Now that you’ve known about what’s coming with Linux 5.6 release – what do you think about it? Let me know your thoughts in the comments below.

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
