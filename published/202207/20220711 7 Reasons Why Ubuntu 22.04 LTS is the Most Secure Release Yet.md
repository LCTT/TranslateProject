[#]: subject: "7 Reasons Why Ubuntu 22.04 LTS is the Most Secure Release Yet"
[#]: via: "https://news.itsfoss.com/reasons-ubuntu-22-04-secure/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14820-1.html"

Ubuntu 22.04 LTS 是目前最安全的版本的七大原因
======

> Ubuntu 22.04 LTS 是迄今为止最好的 Ubuntu 版本之一。是什么让它如此安全？

![ubuntu 22.04][1]

早在今年 4 月就发布了的 [Ubuntu 22.04 LTS][2]，是迄今为止最安全的 Ubuntu 版本。

其安全更新的延长支持、新的硬件支持和其他林林总总的改进，使它在安全方面远远超过了之前的所有版本。

但它是如何做到这一点的呢？还有，是什么让这个版本与以前的版本不同的呢？

嗯，有几个原因，Canonical 在一篇新的博客文章中为我们重点指出了这些。在这里，让我总结一下，以帮助你了解更多。

### 是什么让 Ubuntu 22.04 LTS 变得安全？

在这个版本中，Ubuntu 团队似乎投入了大量的工作来确保其长期的安全性和可靠性。尽管多年来他们以难以想象的方式做到了这一点，但我将强调其中的几件事：

* 改进的硬件安全措施支持
* 更新了安全包
* 私有家目录
* OpenSSL 3
* GCC 11
* nftables 作为默认的防火墙后端
* Linux 内核改进

#### 1、改进的硬件安全措施支持

![][3]

随着英特尔、AMD 和 ARM 的 CPU/SoC 开始推出更多的安全措施，拥有足够的软件来让这些功能发挥作用就变得越来越重要。

截至目前，Ubuntu 22.04 支持三种主要的硬件安全措施。

英特尔的 “<ruby>软件保护扩展<rt>Software Guard eXtensions</rt></ruby>”（SGX）提供了一个安全独立的区域来进行敏感计算。例如，理想情况下，密码处理将在这里进行，因为它确保没有其他应用程序可以访问这些数据。

还有 AMD 的“<ruby>安全加密虚拟化<rt>Secure Encrypted Virtualization</rt></ruby>”（SEV）。这项技术旨在防止主机操作系统干扰正在运行的虚拟机。

尽管这与桌面用户的相关性不如其他技术，但要知道，很多数据中心的基础设施都依赖虚拟机来实现应用的容器化。总的来说，此类针对硬件的安全措施应该会加强对桌面和服务器用户的保护。

#### 2、Linux 内核安全的改进

随着 Ubuntu 的每一次发布，Linux 内核都会得到升级，提供了许多有用的功能和支持。

但是，这一次，Canonical 推出了针对不同的平台的优化内核版本。对于 OEM 认证的桌面设备，它提供了 [Linux 内核 5.17][4]。

而对于所有的桌面和服务器用户，可以使用 [Linux 内核 5.15 LTS][5]。

不仅仅限于这个概念，在 [博文][6] 中提到的一些基本内核安全增强措施包括：

* 支持 [核心调度][7]，它允许进程控制哪些线程可以在 SMT 同级之间调度，以便让它们保护敏感信息，而不泄露给系统中其他不受信任的进程。
* 内核堆栈随机化提供了一种加固措施，以挫败希望在内核内进行内存破坏攻击的攻击者。
* BPF 子系统也有一些安全方面的增强，包括默认情况下限制为只有特权进程可以使用，以及对签名的 BPF 程序的初步支持。
* 新的 Landlock Linux 安全模块的加入为应用程序沙箱提供了另一种机制，可以通过 AppArmor 或 SELinux 与更传统的方式结合使用。

总之，所有这些改进使 Ubuntu 22.04 LTS 成为开发者、用户和系统管理员的更安全的选择。

#### 3、更新的安全软件包

![][8]

让我们从技术性的安全概念退后一步，回到每个 Ubuntu 用户都应该已经熟悉的概念：软件包。每一个新的 Ubuntu 版本，软件库中的大多数软件包都会更新，以带来更好的安全性和新功能。

尽管对于 Ubuntu 22.04 来说，这并不完全是新的东西，但这确实包括了很多安全方面的更新。这方面的例子包括 openSSL 3 和 GCC 11。

#### 4、OpenSSL 3

OpenSSL 是所有安全通信的支柱。

考虑到包括 MD2 和 DES 在内的许多传统算法已经被废弃并默认禁用，OpenSSL 3 作为一个重大的升级特别值得关注。

因此，除非用户特别想使用不太安全的算法，否则你将在默认情况下获得最好的安全性。

#### 5、GCC 11

另一方面，GCC 是许多开发者用来将他们的代码变成可以在你的计算机上运行的程序的编译器。

它带来了许多改进，但有一项特别显著地提高了安全性。静态分析得到了极大的加强，使开发人员能够更快地发现软件的漏洞，在第一步就防止有漏洞的代码被发布。

这可能不会直接影响到用户，许多开发人员使用 Ubuntu 来开发他们的应用程序。因此，你下载的很多程序，即使在非 Ubuntu 系统上，也应该比以前更安全。

#### 6、私有家目录

![][9]

作为一个传统上以桌面为重点的发行版，Ubuntu 经常选择方便而不是安全。然而，随着他们越来越努力地推动云计算的采用，这种情况必须改变。

以前，任何有权限进入电脑的人都可以打开并查看任何用户的家目录。然而，你可以想象，这给非桌面用户带来了很多问题。因此，需要改变为私有家目录。

对于多用户系统来说，这可能稍显不方便，但这可以相对容易地改变。而且，对于那些不太熟悉技术的人来说，他们不需要做任何事情就可以得到更好的安全保障。

#### 7、nftables 作为默认防火墙后端

![][10]

25 年来，防火墙一直是将你的计算机与更广泛的互联网隔离开来的一个关键部分。这些年来，Linux 发行版通常使用两种不同的防火墙解决方案：iptables 和 xtables。

然而，近些年来，一种不同的解决方案进入了人们的视野：nftables。它提供了显著的性能和灵活性的改进，使网络管理员能够更好地保护你的设备。

### 总结

毋庸置疑，Ubuntu 22.04 LTS 做了很多不错的升级。不仅仅是用户体验，它在安全方面也是一个重大的飞跃。

当然，还有更多，但上面提到的改进是很好的成就！

关于更多的技术细节，你可以查看这篇 [Ubuntu 的官方博客文章][11]。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/reasons-ubuntu-22-04-secure/

作者：[Jacob Crume][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/07/ubuntu-22-04-is-most-secure-release.jpg
[2]: https://news.itsfoss.com/ubuntu-22-04-release/
[3]: https://news.itsfoss.com/wp-content/uploads/2022/07/hardware-security-illustration-1024x576.jpg
[4]: https://news.itsfoss.com/linux-kernel-5-17-release/
[5]: https://news.itsfoss.com/linux-kernel-5-15-release/
[6]: https://ubuntu.com/blog/whats-new-in-security-for-ubuntu-22-04-lts
[7]: https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/core-scheduling.html
[8]: https://news.itsfoss.com/wp-content/uploads/2021/07/open-source-security-illustration-1024x576.png
[9]: https://news.itsfoss.com/wp-content/uploads/2021/04/private-home-directory-ubuntu-21.png
[10]: https://news.itsfoss.com/wp-content/uploads/2022/07/firewall-illustration-1024x576.jpg
[11]: https://ubuntu.com/blog/whats-new-in-security-for-ubuntu-22-04-lts
