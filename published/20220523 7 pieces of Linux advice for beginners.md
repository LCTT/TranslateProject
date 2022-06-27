[#]: subject: "7 pieces of Linux advice for beginners"
[#]: via: "https://opensource.com/article/22/5/linux-advice-beginners"
[#]: author: "Opensource.com https://opensource.com/users/admin"
[#]: collector: "lkxed"
[#]: translator: "lightchaserhy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14712-1.html"

给 Linux 初学者的 7 条建议
======

> 我们咨询了我们社区作者们，分享了他们的初学经验。

![](https://img.linux.net.cn/data/attachment/album/202206/15/143733yhdrxhbnhojbxn2a.jpg)

对 Linux 的新用户有什么建议？我们请社区的作者们分享了他们初学时的最佳经验。

### 1、用好 Linux 资源

我哥们儿告诉我，Linux 就像一个“软件积木搭建套装”（这是一个过时的词汇，指的是上世纪五六十年代流行的建筑积木玩具），这个比喻比较恰当。在 2001、2002 年那时，我曾经利用 Windows 3.1 和 Windows NT，尝试搭建一个安全、有用的 K12 学区网站，当时网上可用的资料不多。其中被推荐的《ROOT 用户指南》是一本“大部头”专业教程，信息丰富，但是有一定上手难度。

于我而言，Mandrake Linux 的线上课程是最有用的资源。该课程对使用和管理 Linux 桌面或服务器进行了详细的解读。我学习了该课程，并同时利用红帽公司维护的一个邮件列表服务，有问题时就在社区提问寻求帮助。

—— [Don Watkins][2]

### 2、在 Linux 社区寻求帮助

我的建议是要多问，你可以从网上搜索信息开始，看看其他人类似的问题（甚至是更好的提问）。问什么和如何问，需要花一定时间熟悉。

一旦你对 Linux 更加熟悉了，查看你感兴趣的各种相关论坛，在提问前，先看看是否有人已经提过相同问题，并获得了答案。
    
加入邮件列表也很有用，最后你会发现自己也能专业地答复提问。正如他们说的，通过回答他人的问题也会学到更多知识。
    
同时，你会越来越熟悉这个操作系统内部运行机制，再也不是初学时的一无所知。

—— [Greg Pittman][3]

我的建议是利用 `man`、`info` 等帮助命令获取信息。另外，尽可能花时间熟悉命令行界面，且真正理解 UNIX 的设计理念。事实上，我最喜欢的书之一就是一本 80 年代的 UNIX 书籍，对理解文件、目录、设备、基础命令等非常有帮助。

—— [Alan Formy-Duval][4]

我最好的建议是充分相信社区的答复、手册页的详细信息、介绍不同选项的 HOW-TO 文档。不管怎么说，我是在 2009 年左右开始学习的，当时有很多可用的工具和资源。有一个叫 “Linux from Scratch（LFS）”的项目 —— 从源码开始创建 Linux 系统，在这个项目我学会了很多内部原理知识，以及如何创建一个 LFS 镜像。

—— [Sumantro Mukherjee][6]

我的建议是泛读。利用像 “Ask Fedora”、“Fedora Matrix chat” 等论坛，阅读他人的经验观点，并且尝试实践。我通过阅读他人的网上争论学习到很多东西，然后我会尝试找出问题的原因。

—— [Steve Morris][8]

### 3、安装双操作系统

我在 90 年代末就开始安装双操作系统（Windows 和 Linux），虽然我真正想使用的是 Linux 操作系统，但我最终还是启动了 Windows 系统，以便在熟悉的桌面环境中工作。最好的建议之一是改变计算机系统启动顺序，所以每次我都反应不够快，自动进入了 Linux 系统。: )

—— [Heike Jurzik][9]

我的团队里的一个人挑战我，要做一个知识交换。

他是我们的 Linux 系统管理员，利用 Joomla 搭建了一个网站（我们的 Web 团队擅长这个，他想学习更多知识），而我则安装了 Linux（以前一直是用 Windows）。我们一开始就用了双启动，因为我还有一堆依赖于操作系统的软件需要用于业务，但这让我对 Linux 的使用有了一个飞跃。

在我们各自学习新系统时，对方作为专家来互相帮助有助于共同成长，“一个都不能少！”，坚持不懈是一个很大的挑战。

我经历一个相当尴尬的低级错误后，在显示器上贴了一个大便签，上面写着“在使用任何 `rm` 操作前，首先要思考一下”。管理员给我写了一个命令行大全（网上有很多类似的），对于熟悉基础操作非常有用。我开始使用 Ubuntu 的 KDE 桌面环境时，发现对习惯于使用图形界面的初学者很有帮助。

从那以后我就开始长期使用 Linux（除了我的工作计算机），而那位管理员仍然在用 Joomla，看起来我俩都得到了成长。

—— [Ruth Cheesley][12]

### 4、为了安全请先备份

我的建议是使用一个带有简单且强大的备份软件的发行版。Linux 新用户会创建、编辑、破坏和恢复系统配置。当操作系统无法启动、丢失数据时，会让他们非常沮丧。

有了备份软件，他们的数据就有了保障。

我们都喜爱 Linux，因为它能让我们自由飞翔，但这是“双刃剑”，使用不当也有可能发生非常严重的错误。

—— [Giuseppe Cassibba][13]

### 5、分享你的 Linux 经验

我的建议是分享你的 Linux 使用经验。我曾经认为有一些发行版更适合新用户，所以当他们咨询使用 Linux 时，我总是推荐这些为“新用户准备的”发行版。但是当我坐在他们的计算机前，看起来却像是我从未用过 Linux 一样，因为一些新功能我也不熟悉。现在当有人咨询时，我会推荐自己使用的发行版，虽说这不一定是初学者的“最佳”版本，但毕竟我熟悉，他们遇到的问题我能够快速解决（当然我自己也会在分享中学到新东西）。

—— [Seth Kenlon][14]

以前有句俗话叫“不要随便使用杂志封面上宣传的发行版，使用你朋友都在用的，当你遇到问题时才能更好地需求帮助”。将关键词“杂志封面”替换为“互联网”，这句话依然有效 : -) 。我从未听从过这个建议，因为我是方圆五十公里内唯一使用 Linux 的人，周围的人都在用 FreeBSD、IRIX、Solaris 和 Windows 3.11 等操作系统，最后，我就是那个被人们寻求 Linux 帮助的人。

—— [Peter Czanik][15]

### 6、坚持学习 Linux

在到 Red Hat 工作前，我是一名分销商合作伙伴，我有几个提供旅行护士的家庭健康代理机构客户，他们使用了一个叫“Carefacts”的软件包，最初用于 DOS，在旅行笔记本电脑和中心数据库同步中总是出错。

早期我听到的最好建议是认真研究一下开源运动。开源在 2022 年是主流思想，但在一代人以前，从 Red Hat 的零售商购买 Linux 安装光盘是带有革命性的创新行为。开源打破了常规，我认为要客观看待开源，但确实惊叹到了相当一部分人。

我的公司在 20 世纪 90 年代中期搭建了第一个客户防火墙，那是基于 Windows NT 和 Altavista 的一个产品，但是经常发生错误崩溃。我们自己又搭建了一个基于 Linux 的防火墙，再也没有出问题了。因此，我们用 Linux 替换了客户的那套 Altavista 系统，稳定地运行了多年。我们在 1999 年底搭建了另一个客户防火墙，当时我花三周读完了一本关书，介绍了数据包过滤和 ipchains 的正确使用，当我完成时感觉超赞，它解决了所有问题。在接下来的 15 年，我搭建安装了数百个防火墙系统，主要采用 iptables 技术，有些利用桥接或 ARP 代理以及 QOS 保障视频会议传输，有些利用 IPSEC 和 OpenVPN 隧道。我靠管理个人防火墙和一些双机热备系统赚取生活费，非常不错，而以前都是用的 Windows 系统。我甚至还建了一些虚拟防火墙。

但是技术在高速发展，2022 年，iptables 已过时，我以前的防火墙技术也成了美好的回忆。

目前的经验之谈？永远不要停止探索。

—— [Greg Scott][19]

### 7、享受过程

耐心点，Linux 和之前你熟悉的操作系统不太相同，准备拥抱一个充满无限可能的新世界，尽情享受吧。

—— [Alex Callejas][20]

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/linux-advice-beginners

作者：[Opensource.com][a]
选题：[lkxed][b]
译者：[lightchaserhy](https://github.com/lightchaserhy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/admin
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/yearbook-haff-rx-linux-file-lead_0.png
[2]: https://opensource.com/users/don-watkins
[3]: https://opensource.com/users/greg-p
[4]: https://opensource.com/users/alanfdoss
[5]: https://linuxfromscratch.org/
[6]: https://opensource.com/users/sumantro
[7]: https://ask.fedoraproject.org
[8]: https://opensource.com/users/smorris12
[9]: https://opensource.com/users/hej
[10]: https://opensource.com/downloads/linux-common-commands-cheat-sheet
[11]: https://opensource.com/article/22/2/why-i-love-linux-kde
[12]: https://opensource.com/users/rcheesley
[13]: https://opensource.com/users/peppe8o
[14]: https://opensource.com/users/seth
[15]: https://opensource.com/users/czanik
[16]: https://www.redhat.com/sysadmin/run-your-own-vpn-libreswan
[17]: https://opensource.com/article/21/8/openvpn-server-linux
[18]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[19]: https://opensource.com/users/greg-scott
[20]: https://opensource.com/users/darkaxl
