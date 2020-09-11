[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10690-1.html)
[#]: subject: (Learn about computer security with the Raspberry Pi and Kali Linux)
[#]: via: (https://opensource.com/article/19/3/computer-security-raspberry-pi)
[#]: author: (Anderson Silva https://opensource.com/users/ansilva)

树莓派使用入门：通过树莓派和 kali Linux 学习计算机安全
======

> 树莓派是学习计算机安全的一个好方法。在我们这个系列的第十一篇文章中会进行学习。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_privacy_lock.png?itok=ZWjrpFzx)

在技术方面是否有比保护你的计算机更热门的话题？一些专家会告诉你，没有绝对安全的系统。他们开玩笑说，如果你想要你的服务器或者应用程序真正的安全，就关掉你的服务器，从网络上断线，然后把它放在一个安全的地方。但问题是显而易见的：没人能用的应用程序或者服务器有什么用？

这是围绕安全的一个难题，我们如何才能在保证安全性的同时，让服务器或应用程序依然可用且有价值？我无论如何都不是一个安全专家，虽然我希望有一天我能是。因此，分享可以用树莓派来做些什么以学习计算机安全的知识，我认为是有意义的。

我要提示一下，就像本系列中其他写给树莓派初学者的文章一样，我的目标不是深入研究，而是起个头，让你有兴趣去了解更多与这些主题相关的东西。

### Kali Linux

当我们谈到“做一些安全方面的事”的时候，出现在脑海中的一个 Linux 发行版就是 [Kali Linux][1]。Kali Linux 的开发主要集中在调查取证和渗透测试方面。它有超过 600 个已经预先安装好了的用来测试你的计算机的安全性的[渗透测试工具][2]，还有一个[取证模式][3]，它可以避免自身接触到被检查系统的内部的硬盘驱动器或交换空间。

![](https://opensource.com/sites/default/files/uploads/raspberrypi_11_kali.png)

就像 Raspbian 一样，Kali Linux 基于 Debian 的发行版，你可以在 Kali 的主要[文档门户][4]的网页上找到将它安装在树莓派上的文档。如果你已经在你的树莓派上安装了 Raspbian 或者是其它的 Linux 发行版。那么你装 Kali 应该是没问题的，Kali 的创造者甚至将[培训、研讨会和职业认证][5]整合到了一起，以此来帮助提升你在安全领域内的职业生涯。

### 其他的 Linux 发行版

大多数的标准 Linux 发行版，比如 Raspbian、Ubuntu 和 Fedora 这些，在它们的仓库里同样也有[很多可用的安全工具][6]。一些很棒的探测工具你可以试试，包括 [Nmap][7]、[Wireshark][8]、[auditctl][9]，和 [SELinux][10]。

### 项目

你可以在树莓派上运行很多其他的安全相关的项目，例如[蜜罐][11]，[广告拦截器][12]和 [USB 清洁器][13]。花些时间了解它们！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/computer-security-raspberry-pi

作者：[Anderson Silva][a]
选题：[lujun9972][b]
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ansilva
[b]: https://github.com/lujun9972
[1]: https://www.kali.org/
[2]: https://en.wikipedia.org/wiki/Kali_Linux#Development
[3]: https://docs.kali.org/general-use/kali-linux-forensics-mode
[4]: https://docs.kali.org/kali-on-arm/install-kali-linux-arm-raspberry-pi
[5]: https://www.kali.org/penetration-testing-with-kali-linux/
[6]: https://linuxblog.darkduck.com/2019/02/9-best-linux-based-security-tools.html
[7]: https://nmap.org/
[8]: https://www.wireshark.org/
[9]: https://linux.die.net/man/8/auditctl
[10]: https://opensource.com/article/18/7/sysadmin-guide-selinux
[11]: https://trustfoundry.net/honeypi-easy-honeypot-raspberry-pi/
[12]: https://pi-hole.net/
[13]: https://www.circl.lu/projects/CIRCLean/
