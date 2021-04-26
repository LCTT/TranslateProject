[#]: collector: (lujun9972)
[#]: translator: (wyxplus)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13262-1.html)
[#]: subject: (How to set up a homelab from hardware to firewall)
[#]: via: (https://opensource.com/article/19/3/home-lab)
[#]: author: (Michael Zamot  https://opensource.com/users/mzamot)

如何从硬件到防火墙建立一个家庭实验室
======

> 了解一下用于构建自己的家庭实验室的硬件和软件方案。

![](https://img.linux.net.cn/data/attachment/album/202104/02/215222t2fiqpt17gfpkkii.jpg)

你有想过创建一个家庭实验室吗？或许你想尝试不同的技术，构建开发环境、亦或是建立自己的私有云。拥有一个家庭实验室的理由很多，本教程旨在使入门变得更容易。

规划家庭实验室时，需要考虑三方面：硬件、软件和维护。我们将在这里查看前两方面，并在以后的文章中讲述如何节省维护计算机实验室的时间。

### 硬件

在考虑硬件需求时，首先要考虑如何使用实验室以及你的预算、噪声、空间和电力使用情况。

如果购买新硬件过于昂贵，请搜索当地的大学、广告以及诸如 eBay 或 Craigslist 之类的网站，能获取二手服务器的地方。它们通常很便宜，并且服务器级的硬件可以使用很多年。你将需要三类硬件：虚拟化服务器、存储设备和路由器/防火墙。

#### 虚拟化服务器

一个虚拟化服务器允许你去运行多个共享物理机资源的虚拟机，同时最大化利用和隔离资源。如果你弄坏了一台虚拟机，无需重建整个服务器，只需虚拟一个好了。如果你想进行测试或尝试某些操作而不损坏整个系统，仅需要新建一个虚拟机来运行即可。

在虚拟服务器中，需考虑两个最重要的因素是 CPU 的核心数及其运行速度以及内存容量。如果没有足够的资源够全部虚拟机共享，那么它们将被过度分配并试着获取其他虚拟机的 CPU 的周期和内存。

因此，考虑一个多核 CPU 的平台。你要确保 CPU 支持虚拟化指令（因特尔的 VT-x 指令集和 AMD 的 AMD-V 指令集）。能够处理虚拟化的优质的消费级处理器有因特尔的 i5 或 i7 和 AMD 的 Ryzen 处理器。如果你考虑服务器级的硬件，那么因特尔的志强系列和 AMD 的 EPYC 都是不错的选择。内存可能很昂贵，尤其是最近的 DDR4 内存。当我们估计所需多少内存时，请为主机操作系统的内存至少分配 2 GB 的空间。

如果你担心电费或噪声，则诸如因特尔 NUC 设备之类的解决方案虽然外形小巧、功耗低、噪音低，但是却以牺牲可扩展性为代价。

#### NAS

如果希望装有硬盘驱动器的计算机存储你的所有个人数据，电影，图片等，并为虚拟化服务器提供存储，则需要<ruby>网络附加存储<rt>Network-attached storage</rt></ruby>（NAS）。

在大多数情况下，你不太可能需要一颗强力的 CPU。实际上，许多商业 NAS 的解决方案使用低功耗的 ARM CPU。支持多个 SATA 硬盘的主板是必须的。如果你的主板没有足够的端口，请使用<ruby>主机总线适配器<rt>host bus adapter</rt><ruby>（HBA）SAS 控制器添加额外的端口。

网络性能对于 NAS 来说是至关重要的，因此最好选择<ruby>千兆<rt>gigabit</rt></ruby>网络（或更快网络）。

内存需求根据你的文件系统而有所不同。ZFS 是 NAS 上最受欢迎的文件系统之一，你需要更多内存才能使用诸如缓存或重复数据删除之类的功能。<ruby>纠错码<rt>Error-correcting code</rt></ruby>（ECC）的内存是防止数据损坏的最佳选择（但在购买前请确保你的主板支持）。最后但同样重要的，不要忘记使用<ruby>不间断电源<rt>uninterruptible power supply</rt></ruby>（UPS），因为断电可能会使得数据出错。

#### 防火墙和路由器

你是否曾意识到，廉价的路由器/防火墙通常是保护你的家庭网络不受外部环境影响的主要部分？这些路由器很少及时收到安全更新（如果有的话）。现在害怕了吗？好吧，[确实][2]！

通常，你不需要一颗强大的 CPU 或是大量内存来构建你自己的路由器/防火墙，除非你需要高吞吐率或是执行 CPU 密集型任务，像是虚拟私有网络服务器或是流量过滤。在这种情况下，你将需要一个支持 AES-NI 的多核 CPU。

你可能想要至少 2 个千兆或更快的<ruby>以太网卡<rt>Ethernet network interface cards</rt></ruby>（NIC），这不是必需的，但我推荐使用一个管理型交换机来连接你自己的装配的路由器，以创建 VLAN 来进一步隔离和保护你的网络。

![Home computer lab PfSense][4]

### 软件

在选择完你的虚拟化服务器、NAS 和防火墙/路由器后，下一步是探索不同的操作系统和软件，以最大程度地发挥其作用。尽管你可以使用 CentOS、Debian或 Ubuntu 之类的常规 Linux 发行版，但是与以下软件相比，它们通常花费更多的时间进行配置和管理。

#### 虚拟化软件

[KVM][5]（<ruby>基于内核的虚拟机<rt>Kernel-based Virtual Machine</rt></ruby>）使你可以将 Linux 变成虚拟机监控程序，以便可以在同一台机器中运行多个虚拟机。最好的是，KVM 作为 Linux 的一部分，它是许多企业和家庭用户的首选。如果你愿意，可以安装 [libvirt][6] 和 [virt-manager][7] 来管理你的虚拟化平台。

[Proxmox VE][8] 是一个强大的企业级解决方案，并且是一个完全开源的虚拟化和容器平台。它基于 Debian，使用 KVM 作为其虚拟机管理程序，并使用 LXC 作为容器。Proxmox 提供了强大的网页界面、API，并且可以扩展到许多群集节点，这很有用，因为你永远不知道何时实验室容量不足。

[oVirt][9]（RHV）是另一种使用 KVM 作为虚拟机管理程序的企业级解决方案。不要因为它是企业级的，就意味着你不能在家中使用它。oVirt 提供了强大的网页界面和 API，并且可以处理数百个节点（如果你运行那么多服务器，我可不想成为你的邻居！）。oVirt 用于家庭实验室的潜在问题是它需要一套最低限度的节点：你将需要一个外部存储（例如 NAS）和至少两个其他虚拟化节点（你可以只在一个节点上运行，但你会遇到环境维护方面的问题）。

#### 网络附加存储软件

[FreeNAS][10] 是最受欢迎的开源 NAS 发行版，它基于稳定的 FreeBSD 操作系统。它最强大的功能之一是支持 ZFS 文件系统，该文件系统提供了数据完整性检查、快照、复制和多个级别的冗余（镜像、条带化镜像和条带化）。最重要的是，所有功能都通过功能强大且易于使用的网页界面进行管理。在安装 FreeNAS 之前，请检查硬件是否支持，因为它不如基于 Linux 的发行版那么广泛。

另一个流行的替代方法是基于 Linux 的 [OpenMediaVault][11]。它的主要功能之一是模块化，带有可扩展和添加特性的插件。它包括的功能包括基于网页管理界面，CIFS、SFTP、NFS、iSCSI 等协议，以及卷管理，包括软件 RAID、资源配额，<ruby>访问控制列表<rt>access control lists</rt></ruby>（ACL）和共享管理。由于它是基于 Linux 的，因此其具有广泛的硬件支持。

#### 防火墙/路由器软件

[pfSense][12] 是基于 FreeBSD 的开源企业级路由器和防火墙发行版。它可以直接安装在服务器上，甚至可以安装在虚拟机中（以管理虚拟或物理网络并节省空间）。它有许多功能，可以使用软件包进行扩展。尽管它也有命令行访问权限，但也可以完全使用网页界面对其进行管理。它具有你所希望路由器和防火墙提供的所有功能，例如 DHCP 和 DNS，以及更高级的功能，例如入侵检测（IDS）和入侵防御（IPS）系统。你可以侦听多个不同接口或使用 VLAN 的网络，并且只需鼠标点击几下即可创建安全的 VPN 服务器。pfSense 使用 pf，这是一种有状态的数据包筛选器，它是为 OpenBSD 操作系统开发的，使用类似 IPFilter 的语法。许多公司和组织都有使用 pfSense。

* * *

考虑到所有的信息，是时候动手开始建立你的实验室了。在之后的文章中，我将介绍运行家庭实验室的第三方面：自动化进行部署和维护。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/home-lab

作者：[Michael Zamot (Red Hat)][a]
选题：[lujun9972][b]
译者：[wyxplus](https://github.com/wyxplus)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mzamot
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb
[2]: https://opensource.com/article/18/5/how-insecure-your-router
[3]: /file/427426
[4]: https://opensource.com/sites/default/files/uploads/pfsense2.png (Home computer lab PfSense)
[5]: https://www.linux-kvm.org/page/Main_Page
[6]: https://libvirt.org/
[7]: https://virt-manager.org/
[8]: https://www.proxmox.com/en/proxmox-ve
[9]: https://ovirt.org/
[10]: https://freenas.org/
[11]: https://www.openmediavault.org/
[12]: https://www.pfsense.org/
