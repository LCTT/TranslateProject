[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11124-1.html)
[#]: subject: (10 ways to get started with Linux)
[#]: via: (https://opensource.com/article/19/7/ways-get-started-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth/users/don-watkins)

Linux 入门十法
======

> 想要进入 Linux 之门，试试这十个方法。

![](https://img.linux.net.cn/data/attachment/album/201907/20/061809wwkmb51vqookoqq5.jpg)

文章《[什么是 Linux 用户？][2]》的作者 Anderson Silva 明确表示，现今人们使用 Linux（在某种程度上）就像使用 Windows 一样，只要你对“使用 Linux”这个事情定义得足够广义。尽管如此，如果你的生活中没有太多的使用 Linux 的机会，现在正是以前所未有的方式尝试 Linux 的好时机。

以下是 Linux 入门的十种方法。你可以试试其中一个或者全部试试。

### 1、加入免费 shell 计划

![Free shell screenshot][3]

有很多人在用不上的服务器上运行 Linux （请记住，“Linux 服务器”可以是从最新的超级计算机到丢弃的、已经用了 12 年的笔记本电脑中的任何一个）。为了充分利用多余的计算机，许多管理员用这些备用的机器提供了免费的 shell 帐户。

如果你想要登录到 Linux 终端中学习命令、shell 脚本、Python 以及 Web 开发的基础知识，那么免费的 shell 帐户是一种简单、免费的入门方式。下面是一个可以体验一下的简短列表：

* [Freeshell.de][4] 是一个自 2002 年以来一直在线服务的公用 Linux 系统。你可以通过 SSH、IPv6 和 OpenSSL 进行访问，以获得 Linux shell 体验，并且可以使用 MySQL 数据库。
* [Blinkenshell][5] 提供了一个学习 Unix、使用 IRC、托管简单网站和共享文件的 Linux shell。它自 2006 年以来一直在线服务。
* [SDF 公用 Unix 系统][6]成立于 1987 年，提供了免费的 NetBSD 账户。当然，NetBSD 不是 Linux，但它是开源的 Unix，因此它提供了类似的体验。它也有几个自制应用程序，因此它不但有普通的免费 shell，还提供了老派 BBS。

免费 shell 帐户常会受到滥用，因此你表现出的可信程度和积极参与协作的意愿越多，你的体验就越好。你可以通过专门请求或小额捐赠来证明你的诚意，通常可以访问数据库引擎、编译器和高级编程语言。你还可以要求安装其他软件或库，但需经管理员批准。

#### 如何使用

公用 shell 帐户是尝试真正的 Linux 系统的好方法。你无法获得 root 权限这一事实意味着你可以学习本地软件管理，而无需做更多的维护工作。你可以做很多实际操作，以完成真正的工作，尽管它们对于学习关键任务还不够。

### 2、试试 Windows WSL 2 里面的 Linux

不管你信不信，微软从 2019 年 6 月开始在 Windows 里面带上了 Linux，这意味着你可以从 Windows 运行 Linux 应用程序，这是 [Windows 里的 Linux 子系统][7]的第二版（WSL 2）。虽然它主要针对开发人员，但 Windows 用户可以发现 WSL 2 是一个来自于他们熟悉的桌面上的 Linux 环境，而没有被任何虚拟化占用额外资源。这是一个以进程方式运行在 Windows 机器上的 Linux。现阶段，它仍然是一个新的动向和正在进行中的工作，因此它可能会发生变化。如果你试图用它承担重任，你可能会遇到一两个错误，但是如果你只是想入门 Linux、学习一些命令，并感受在基于文本的环境如何完成工作，那么 WSL 2 可能正是你所需要的。

#### 如何使用

WSL 还没有明确的用途或目的，但它在 Windows 机器上提供了 Linux 环境。你可以获得 root 访问权限，并可以运行 Linux 发行版和应用程序，因此这是一种简单而无缝的学习方式。但是，即使 WSL *是Linux*，它也不能给你典型的 Linux 体验。它是由 Windows 提供的 Linux，而这不太会是你在现实世界中遇到的情况。WSL 是一个开发和教育工具，但如果你可以使用它，那么你应该试试它。

### 3、把 Linux 放到可启动的 U 盘上

![Porteus Linux][8]

便携 Linux 可以安装到 U 盘上随身携带，并用该 U 盘启动你遇到的任何计算机。你可以获得个性化的 Linux 桌面，而无需担心所用于启动的主机上的数据。该计算机上原有的系统不会与你的 Linux 系统相接触，并且你的 Linux 操作系统也不会影响计算机。它非常适合酒店商务中心、图书馆、学校的公共计算机，或者只是给自己一个不时启动 Linux 的借口。

与许多其他快速获得的 Linux shell 不同，此方法为你提供了一个完整而强大的 Linux 系统，包括桌面环境，可访问你需要的任何软件以及持久的数据存储。

这个系统永远不会改变。你要保存的任何数据都将写入压缩的文件系统中，然后在引导时将其作为覆盖层应用于该系统。这种灵活性允许你选择是以持久模式启动，将所有数据保存回 U 盘；还是以临时模式启动，以便一旦关闭电源，你所做的一切都会消失。换句话说，你可以将其用作不受信任的计算机上的安全信息亭或你信任的计算机上的便携式操作系统。

你可以尝试很多 [U 盘发行版][9]，有些带有精简的桌面环境，适用于低功耗计算机，而另一些带有完整的桌面环境。我偏爱 [Porteus][10] Linux。在过去的八年里，我每天都把它放在我的钥匙链上，在商务旅行中使用它作为我的主要计算平台，如果在工作场所或家中计算机发生问题，它也会用作工具盘。它是一个可靠而稳定的操作系统，有趣且易于使用。

在 Mac 或 Windows 上，下载 [Fedora Media Writer][11] 以创建你下载的任何便携式发行版的可启动 U 盘。

#### 如何使用

从 U 盘启动一个 “实时 Linux” 可提供完整的 Linux 发行版环境。虽然数据存储与你安装到硬盘驱动器的系统略有不同，但其它的所有内容都与你在 Linux 桌面上所期望的一样。在便携式 Linux 操作系统上你几乎没有什么不能做的，所以在你的钥匙串上挂上一个以解锁你遇到的每台计算机的全部潜力吧。

### 4、在线游览

![Linux tour screenshot][12]

Ubuntu 的某个人想到了在浏览器中托管 Ubuntu GNOME 桌面的好主意。如果想要自己尝试一下，可以打开 Web 浏览器并导航到 [tour.ubuntu.com][13]。你可以选择要演示的活动，也可以跳过单个课程并单击 “<ruby>四处看看<rt>Show Yourself Around</rt></ruby>” 按钮。

即使你是 Linux 桌面的新用户，你也可能会发现“四处看看”功能比你想象的更还简单。在线游览中，你可以四处看看，查看可用的应用程序，以及查看典型的默认 Linux 桌面。你不能在 Firefox 中调整设置或启动另一个在线游览（这是我尝试过的第一件事），虽然你可以完成安装应用程序的动作，但你无法启动它们。但是，如果你之前从未使用过 Linux 桌面，并且想要看到各种新奇的东西，那这就是一场旋风之旅。

#### 如何使用

在线游览真的只是一次旅行。如果你从未见过 Linux 桌面，那么这是一个了解它的情况的机会。这不是一个正式的使用，而是一个吸引过客的展示。

### 5、在浏览器中用 JavaScript 运行 Linux

![JSLinux][14]

就在不久之前，虚拟化的计算成本还很高，还仅限于使用先进的硬件的用户。而现在虚拟化已被优化到可以由 JavaScript 引擎执行的程度，这要归功于 Fabrice Bellard，它是优秀的开源 [QEMU][15] 机器仿真器和虚拟器的创建者。

Bellard 还启动了 JSLinux 项目，该项目允许你在浏览器中运行 Linux 和其他操作系统，这算是闲暇时间的一个乐趣。它仍然是一个实验性项目，但它是一个技术奇迹。打开 Web 浏览器导航到 [JSLinux][16] 页面，你可以启动基于文本的 Linux shell 或精简的图形 Linux 环境。你可以上传和下载文件到 JSLinux 主机上或（在理论上可以）将文件发送到一个网络备份位置，因为 JSLinux 可以通过 VPN 套接字访问互联网（尽管上限速度取决于 VPN 服务）。

#### 如何使用

你不会在 JSLinux 上正经使用多少时间，这个环境可能太不寻常了，无法学习 Linux 正常工作的广泛课程。但是，如果你厌倦了在一台普通的 PC 上运行 Linux 并想在一个真正独特的平台上试用 Linux，那么 JSLinux 就属于这种。

### 6、阅读关于它的书

并非每种 Linux 体验都要用到计算机。也许你是那种喜欢在开始新事物之前保持距离先观察和研究的人，或者你可能还不清楚 “Linux” 所包含的内容，或者你喜欢全情投入其中。关于 Linux 如何工作、运行 Linux 的方式以及 Linux 世界中有什么，有很多书可以读。

你越熟悉开源世界，就越容易理解常用术语，将城市神话与实际经验区分开来。我们不时会发布[图书清单] [17]，但我的最爱之一是 Hazel Russman 的《[The Charm of Linux][18]》。这是一个从不同角度巡览 Linux 的过程，是由一位独立作者在发现 Linux 时兴奋之余写作的。

#### 如何使用

没有什么能比一本好书更好。这是体验 Linux 的最不传统的方法，但对于喜欢印刷文字的人来说，它既舒适又有效。

### 7、弄块树莓派

![Raspberry Pi 4][19]

如果你正在使用[树莓派][20]，那么你就正在运行 Linux。Linux 和低功耗计算很容易上手。关于树莓派的好处，除了价格低于 100 美元之外，它的[网站][21]是专为教育而设计的。你可以了解树莓派所能做的一切，当你了解之后，就知道了 Linux 可以为你做些什么。

#### 如何使用

树莓派被设计为低功耗计算机。这意味着你不能像过去那样做那么多的多任务处理，但这是一种避免不堪重负的方便方法。树莓派是学习 Linux 及其附带的所有可能性的好方法，它是发现环保、小型、简化计算能力的有趣方式。并且一定要关注 Opensource.com 上的[提示][22]、[技巧][23]和[有趣的][24][活动] [25]，特别是在每年三月份的树莓派之周的期间。

### 8、赶上容器热潮

如果你从事于神话般的[云服务][26]的后端工作，那么你已经听说过容器热潮。虽然你可以在 Windows、Azure、Mac 和 Linux 上运行 Docker 和 Kubernetes，但你可能不知道容器本身就是 Linux。云计算应用和基础设施实际上是精简的 Linux 系统，部分虚拟化，部分基于裸机。如果启动容器，则会启动微型的超特定的 Linux 发行版。

容器与虚拟机或物理服务器[不同][27]。它们不打算用作通用操作系统。但是，如果你在容器中进行开发，你可以停下来四处打量一下，你将了解到 Linux 系统的结构、保存重要文件的位置以及最常见的命令。你甚至可以[在线尝试容器][28]，你可以在我的文章中[深入到 Linux 容器的背后][29]了解它们如何工作的。

#### 如何使用

根据设计，容器特定于一个单一任务，但它们是 Linux，因此它们非常灵活。你可以如你预期的使用它们，也可以在你的 Linux 实验当中将容器构建到大部分完整系统中。它虽然不提供桌面 Linux 体验，但它是完整的 Linux 体验。

### 9、以虚拟机方式安装 Linux

虚拟化是尝试操作系统的简便方法，[VirtualBox][30] 是一种很好的开源虚拟化方法。VirtualBox 可以在 Windows 和 Mac 上运行，因此你可以将 Linux 安装为虚拟机（VM）并使用它，就好像它只是一个应用程序一样。如果你不习惯安装操作系统，VirtualBox 也是一种尝试 Linux 的非常安全的方式，而不会意外地将其安装覆盖在你通常的操作系统上。

#### 如何使用

将 Linux 作为虚拟机运行既方便又简单，既可以作为试运行使用，也可以在需要 Linux 环境时进行双启动或重启进入。它功能齐全，因为它使用虚拟硬件，宿主操作系统负责驱动你的外围设备。将 Linux 作为虚拟机运行的唯一缺点主要是心理上的。如果你打算使用 Linux 作为主要操作系统，但最终默认在宿主操作系统上做除了特定于 Linux 的大多数任务，那么虚拟机就会让你失望。否则，虚拟机是现代技术的胜利，在 VirtualBox 中使用 Linux 可以为你提供 Linux 所提供的所有最佳功能。

### 10、安装一个 Linux

![Fedora Silverblue][31]

如果对上述方式有疑问，那么总会有传统的方式。如果你想给予 Linux 应有的关注，你可以下载 Linux，将安装程序刻录到 U 盘（或 DVD，如果你更喜欢光学介质的话），并将其安装在你的计算机上。Linux 是开源的，所以任何想要花时间打包 Linux 的人都可以分发 Linux，并且可以将所有可用的部分分配到通常称为发行版的内容中。无论问哪一个 Linux 用户什么发行版是“最好的”，你必然都会得到一个不同的答案（主要是因为这个术语“最佳”通常是尚未定义的）。大多数人都认可：你应该使用适合你的 Linux 发行版，这意味着你应该测试一些流行的发行版，并坚持使你的计算机按照你期望的行为行事。这是一种务实和功能性的方法。例如，如果发行版无法识别你的网络摄像头而你希望它可以正常工作，则可以使用一个可识别该网络摄像头的发行版。

如果你之前从未安装过操作系统，你会发现大多数 Linux 发行版都包含一个友好且简单的安装程序。只需下载一个发行版（它们以 ISO 文件提供），然后下载 [Fedora Media Writer][11] 来创建一个可启动的安装 U 盘。

#### 如何使用

安装 Linux 并将其用作操作系统是迈向熟悉它的一步。怎么使用它都可以。你可能会发现一些你从未了解过的所需的必备功能，你可能会比你想象的更多地了解计算机，并且可能会改变你的世界观。你使用一个 Linux 桌面，或者是因为它易于下载和安装，或者是因为你想要削弱公司中某些人的霸主地位，或者只是因为它可以帮助你完成工作。

无论你的原因是什么，只需尝试使用上面这些任何（或所有）这些方式。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/ways-get-started-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_Penguin_Image_520x292_12324207_0714_mm_v1a.png?itok=p7cWyQv9 (Penguins gathered together in the Artic)
[2]: https://opensource.com/article/19/6/what-linux-user
[3]: https://opensource.com/sites/default/files/uploads/freeshell.png (Free shell screenshot)
[4]: https://freeshell.de
[5]: https://blinkenshell.org/wiki/Start
[6]: https://sdf.org/
[7]: https://devblogs.microsoft.com/commandline/wsl-2-is-now-available-in-windows-insiders/
[8]: https://opensource.com/sites/default/files/uploads/porteus.jpg (Porteus Linux)
[9]: https://linux.cn/article-11040-1.html
[10]: http://porteus.org
[11]: https://getfedora.org/en/workstation/download/
[12]: https://opensource.com/sites/default/files/uploads/linux_tour.jpg (Linux tour screenshot)
[13]: http://tour.ubuntu.com/en/#
[14]: https://opensource.com/sites/default/files/uploads/jslinux.jpg (JSLinux)
[15]: https://www.qemu.org
[16]: https://bellard.org/jslinux/
[17]: https://opensource.com/article/19/1/tech-books-new-skils
[18]: http://www.lulu.com/shop/hazel-russman/the-charm-of-linux/paperback/product-21229401.html
[19]: https://opensource.com/sites/default/files/uploads/raspberry-pi-4-case.jpg (Raspberry Pi 4)
[20]: https://opensource.com/resources/raspberry-pi
[21]: https://www.raspberrypi.org/
[22]: https://opensource.com/article/19/3/raspberry-pi-projects
[23]: https://opensource.com/article/19/3/piflash
[24]: https://opensource.com/article/19/3/gamepad-raspberry-pi
[25]: https://opensource.com/life/16/3/make-music-raspberry-pi-milkytracker
[26]: https://opensource.com/resources/cloud
[27]: https://opensource.com/article/19/6/how-ssh-running-container
[28]: https://linuxcontainers.org/lxd/try-it/
[29]: https://opensource.com/article/18/11/behind-scenes-linux-containers
[30]: https://virtualbox.org
[31]: https://opensource.com/sites/default/files/uploads/fedora-silverblue.png (Fedora Silverblue)
