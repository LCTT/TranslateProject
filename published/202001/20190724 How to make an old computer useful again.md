[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11746-1.html)
[#]: subject: (How to make an old computer useful again)
[#]: via: (https://opensource.com/article/19/7/how-make-old-computer-useful-again)
[#]: author: (Howard Fosdick https://opensource.com/users/howtech)

如何把你的老爷机重新利用起来
======

> 按照下面各个步骤，让你的老爷机焕然一新。

![](https://img.linux.net.cn/data/attachment/album/202001/04/064017ztl28cn6jjhnjnaj.jpg)

你的地下室里是不是有一台用来落灰的旧电脑？为什么不把它利用起来呢？如果你常用的电脑坏了，又想用一个比手机更大的屏幕上网，这时候一台备用电脑可能就派上用场了。或者，它也可以充当一台全家人共用的廉价备用电脑，甚至还可以改造为一台复古游戏机。

哪怕是一台有十余年历史的老爷机，只要选对了软件，也可以胜任很多新电脑能够完成的任务。其中的关键在于，要使用开源软件。

我进行电脑翻新已经有二十年了。在这篇文章里，我会分享一下电脑翻新的技巧。此处讨论的范围包括双核笔记本，以及机龄在 5 到 12 年之间的台式机。

### 检查硬件

第一步是检查硬件是否运转正常。如果在这个环节忽略了一个问题，后面可能会让你非常头疼。

灰尘是电子器件的天敌，所以第一件事应该是打开机箱，清除灰尘。[压缩空气设备][2]这时候可能会派上用场。请注意，进行任何接触电脑的操作时，都应该确保[接地][3]。此外，**不要**用清洁布擦拭任何东西。即使是一次小到你无法察觉的静电放电，也可能会导致电路损毁。

清洁工作完成之后，关闭机箱，检查是否所有硬件都可以正常工作。需要测试的项目包括：

* 内存
* 硬盘
* 主板
* 外围设备（DVD 驱动器、USB 接口、声卡，等等）

首先，将计算机启动界面（[UEFI][4] 或者是 [BIOS][5] 界面）上的诊断测试依次运行一遍。如果不知道按哪个功能键进入你电脑的启动界面，可以参考 [这份列表][6]。

此外，也可以使用诸如 [Hirens BootCD][7] 和 [Ultimate Boot CD][8] 之类的免费资源工具包，进行启动界面覆盖不到的测试。这些资源工具包涵盖了数百个测试程序，并且都是免费的，尽管不都开源。运行这些工具包无需安装任何软件，因为它们都是从 U 盘或者 DVD 驱动器启动的。

测试一定要彻底！对于内存和硬盘来说，基础测试还不够，应该运行深度测试，哪怕是运行一整夜也无妨。只有这样，才能够查出那些不易发现的瞬时故障。

如果发现了问题，可以参考我的[硬件故障排除快速指南][9]，可以帮你解决最常见的硬件问题。

### 选择软件

电脑翻新的关键在于，根据手头的硬件资源，恰如其分地安装软件。最核心的三种硬件资源分别是：

1. 处理器（内核数、速度）
2. 内存
3. 显存

可以在启动时的 UEFI/BIOS 界面上，弄清楚你电脑的硬件资源。记得抄下数据，以免遗忘。接下来，可以在 [CPU Benchmark][10] 网站上查看你的处理器，该网站除了提供 CPU 的背景资料，还提供一个 CPU 的性能分数。

了解了硬件性能之后，就可以选择能够在硬件上高效运行的软件了。软件的选择涉及四个重要的层面：

1. 操作系统（OS）
2. 桌面环境（DE）
3. 浏览器
4. 应用

一个优秀的 Linux 发行版可以满足上述全部四个层面。不要试图使用已经停止维护的 Windows 版本，例如 Windows 8、Vista 或者 XP，哪怕已经安装在电脑上了。恶意软件的[风险][11]你是承受不起的。明智的做法是，使用一个更抗病毒的最新版本操作系统。

那 Windows 7 呢？[维护宽限期][12]至 2020 年 1 月 14 日结束，也就是说，在此日期之前你还可以获得安全补丁，之后就想都别想了。现在正是迁出 Windows 7 的绝佳时机。

Linux 的巨大优势在于，有许多专门为过时硬件设计的[发行版][13]。此外，[桌面环境][14]和操作系统在 Linux 的设计中是分开的，你可以自行选择搭配。这一点非常重要，因为桌面环境对低端系统的性能有很大影响。（对于 Windows 和 MacOS 来说，你选择的操作系统版本决定了桌面环境，没得可选。）

Linux 的另一个好处是，拥有数以千计自由且开源的应用，不需要担心激活或者许可的问题。此外，Linux 是可移植的，可以在不同的分区、硬盘、设备或计算机之间，对操作系统和应用进行复制、移动或克隆。（Windows 则不然，使用注册表将系统捆绑在了所安装的计算机上。）

### 翻新后的电脑能够做什么？

这里讨论的是大约在 2006 年到 2013 年之间生产的双核计算机，尤其是装载了 [Intel 酷睿 2][15] CPU 或 [AMD 速龙 64 X2][16] 系列处理器的计算机。它们的 [CPU 分数][10] 大多在 1000 到 4000 分之间。这种电脑卖不了几个钱，但用在运行轻量级 Linux 软件上，性能还是足够的。

有一点需要注意：你的电脑应该至少拥有 2 GB 内存，如果不够就进行升级。就我翻新过的电脑来说，使用者用到的内存（不包括数据缓存）一般在 0.5 到 2 GB 之间，很少超过 2 GB。如果将内存升级到 2GB，系统就不至于进行**内存交换**，即将硬盘当做内存使用。如果想要获得良好性能，这一点十分关键。

以我自己为例，我用来写作这篇文章的是一台有十年机龄的翻新电脑。取下 1 GB 内存条之后，它只剩下了 1 GB 内存，然后就慢得像一只乌龟。用它浏览网页，或者是做类似的事情，都让人感到灰心，甚至痛苦。一旦把内存条重新装回去，有了 2 GB 内存，它就立马回到了可以使用的状态。

一台 2 GB 的双核计算机可以满足大多数人的需求，只要安装的是轻量级发行版和浏览器。你可以用它浏览网页、发送电子邮件、编辑文档和电子表格、观看 YouTube 视频、参与 eBay 拍卖竞标、在社交网络上发帖、听播客、查看相簿、管理家庭收支和个人日程、玩游戏，等等。

### 翻新电脑的局限

那么，这些老爷机又有什么局限呢？由于它们的并发性能比不上最先进的计算机，所以应该使用轻量级浏览器，同时拦截广告（广告正是让网页加载变慢的罪魁祸首）。如果可以使用虚拟专用网络（VPN）拦截广告，为处理器免除加载广告的负荷，那就再好不过。此外，还需要禁用视频自动播放、Flash 以及网页动画效果；将浏览器上的标签页控制在少数几个，不要同时打开 20 个；以及下载可以开启/禁用 JavaScript 的浏览器扩展。

让处理器专注于你目前正在做的事情吧，不要同时打开一堆应用，也不要在后台运行很多程序。图像编辑和视频编辑的高级工具可能会很慢；至于运行虚拟机，还是别想了吧。

那游戏呢？开源软件仓库提供了数以千计的游戏。这就是我为什么将显存列为三种核心硬件资源之一。如果你的电脑没有独立显卡，那很可能只有 32 或者 64 MB 的显存。可以增加一张显卡，将显存提升到 256 或者 512 MB，这样一来，处理器密集型的游戏就会顺畅很多了。如果不确定你的电脑有多少显存，可以参考[这里][17]。请注意，需要确保显卡与电脑的[显卡插槽][18]（AGP、PCI-Express 或者 PCI）相匹配，同时使用正确的[连接线][19]（VGA、DVI 或者 HDMI）。

#### 与 Windows 系统的兼容性如何？

许多人关心 Linux 与 Windows 系统的兼容性如何。首先，对于任何一个 Windows 程序，都有一个 [Linux 版本的替代品][20]。

退一步说，即使你真的必须要运行某个特定的 Windows 程序，通常也可以借助 [Wine][21] 在 Linux 上运行。可以在 [Wine 数据库][22] 里查找一下你的应用，看看是否可以在 Wine 上运行，顺便学一些特殊安装技巧。[Winetricks][23] 和 [PlayOnLinux][24] 这两个辅助工具可以帮助你进行安装和配置。

Wine 的另一个优势是可以运行旧版本 Windows（例如 Vista、XP、ME/98/95 和 3.1）上的程序。我认识一个家伙，搭建了一台特别赞的游戏电脑，然后用来玩 XP 上的老游戏。借助 [DOSBox][26]，你甚至还可以运行数以千计的[免费 DOS 程序][25]。但是有一点需要注意，如果 Windows 程序可以运行，那么 Windows [病毒][27]也同样可以。你需要保护 Linux 上的 Wine 环境，正如保护任何其他 Windows 环境一样。

对了，与 Microsoft Office 的兼容性又如何呢？我使用的是 LibreOffice，经常编辑并交换 Word 和 Excel 文件，完全没有问题。不过，你应该避免使用隐晦或者过于专业的功能。  

### 如何选择发行版？

假设选择了 Linux 作为操作系统，那么你还需要选择桌面环境、浏览器和各种应用。最简单的方法是，安装一个包含了你所需要的一切的发行版。

通过从 [live USB][28] U 盘或者 DVD 启动，你无需安装任何程序，就可以尝试不同的发行版。关于在 Linux 或 Windows 上创建可启动的 Linux 的方法，可以参考[这里][29]。

我进行电脑翻新的目的是做慈善，所以无法指望电脑使用者具备任何相应知识。我需要的发行版应该具有以下特性：

* 用户友好
* 具有轻量级界面
* 自带各种轻量级应用
* 拥有足够大的软件仓库
* 历史表现良好
* 拥有庞大的用户社区和活跃的论坛
* 通过长期维护版本（而不是滚动发布版本）确保稳定性
* 更重视可靠性，而不是尖端功能
* 可以通过图形化用户界面进行设置，而不是只能通过文本文件进行设置

许多发行版都能够满足上面的要求。我曾经尝试成功的有 [Mint/Xfce][30]、[Xubuntu][31] 和 [Lubuntu][32]。前两个发行版使用 Xfce 桌面环境，第三个使用 LXQt。相比 GNOME、Unity、KDE、MATE 和 Cinnamon 这些桌面环境，运行上面这两种桌面环境只需要[更少][33]的处理器和内存资源。

Xfce 和 LXQt 用起来非常简单，我的客户们之前从未见过 Linux，但是都可以自如使用这些简单的、菜单驱动的用户界面。

对于旧电脑来说，运行最快速、最高效的浏览器是一件非常重要的事情。[很多人觉得][34] Chromium 是最好的浏览器；此外，我还安装了 Firefox Quantum，因为大家比较熟悉它，并且[它的性能][35]可以和 [Chromium 的性能][36]媲美。我还加上了 Opera，因为它速度快，而且有一些独特功能，比如内置的广告拦截，以及免费的[虚拟专用网络][37]。Opera 是免费的，但并非开源。

无论你使用什么浏览器，一定要拦截广告和追踪器，尽量降低浏览器的负荷。此外，除非得到你的明确批准，否则视频和 Flash 都不应该被允许运行。

至于应用，我使用的是 Mint/Xfce、Xubuntu 和 Lubuntu 自带的轻量级应用。它们足以满足一切需求了。

### 行动起来吧

你是否会对翻新后的电脑感到满意呢？就我来说，我所使用的两台电脑的机龄都已经超过十年了，其中一个装载的是 Intel 双核处理器（[eMachines T5274a][38]），另一个装载的是 AMD 速龙 64 x2 处理器（[HP dc5750][39]），两台电脑都有 2 GB 内存。它们和我的另一台具备四核 i5 处理器和 16 GB 内存的电脑一样，完全能够胜任我的办公工作。如果说有什么功能是这两台电脑缺失的，那就是运行虚拟机了。

我们生活在一个非常神奇的年代。只需要付出一点努力，就可以将一台机龄在 5 到 12 年之间的旧电脑，翻新为一台具备实用价值的机器。还有什么比这更有趣吗？

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/how-make-old-computer-useful-again

作者：[Howard Fosdick][a]
选题：[lujun9972][b]
译者：[chen-ni](https://github.com/chen-ni)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/howtech
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://www.amazon.com/s/ref=nb_sb_noss_1?url=search-alias%3Daps&field-keywords=compressed+air+for+computers&rh=i%3Aaps%2Ck%3Acompressed+air+for+computers
[3]: https://www.wikihow.com/Ground-Yourself-to-Avoid-Destroying-a-Computer-with-Electrostatic-Discharge
[4]: https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface
[5]: http://en.wikipedia.org/wiki/BIOS
[6]: http://www.disk-image.com/faq-bootmenu.htm
[7]: http://www.hirensbootcd.org/download/
[8]: http://www.ultimatebootcd.com/
[9]: http://www.rexxinfo.org/Quick_Guide/Quick_Guide_To_Fixing_Computer_Hardware
[10]: http://www.cpubenchmark.net/
[11]: https://askleo.com/unsupported-software-really-mean/
[12]: http://home.bt.com/tech-gadgets/computing/windows-7/windows-7-support-end-11364081315419
[13]: https://fossbytes.com/best-lightweight-linux-distros/
[14]: http://en.wikipedia.org/wiki/Desktop_environment
[15]: https://en.wikipedia.org/wiki/Intel_Core_2
[16]: https://en.wikipedia.org/wiki/Athlon_64_X2
[17]: http://www.cyberciti.biz/faq/howto-find-linux-vga-video-card-ram/
[18]: https://www.onlinecomputertips.com/support-categories/hardware/493-pci-vs-agp-vs-pci-express-video-cards/
[19]: https://silentpc.com/articles/video-connectors
[20]: http://wiki.linuxquestions.org/wiki/Linux_software_equivalent_to_Windows_software
[21]: https://en.wikipedia.org/wiki/Wine_%28software%29
[22]: https://appdb.winehq.org/
[23]: https://en.wikipedia.org/wiki/Winetricks
[24]: https://en.wikipedia.org/wiki/PlayOnLinux
[25]: https://archive.org/details/softwarelibrary_msdos
[26]: https://en.wikipedia.org/wiki/DOSBox
[27]: https://wiki.winehq.org/FAQ#Is_Wine_malware-compatible.3F
[28]: https://www.howtogeek.com/howto/linux/create-a-bootable-ubuntu-usb-flash-drive-the-easy-way/
[29]: https://unetbootin.github.io/
[30]: https://linuxmint.com/
[31]: https://xubuntu.org/
[32]: https://lubuntu.me/
[33]: https://www.makeuseof.com/tag/best-lean-linux-desktop-environment-lxde-vs-xfce-vs-mate/
[34]: https://www.zdnet.com/article/chrome-is-the-most-popular-web-browser-of-all/
[35]: https://www.laptopmag.com/articles/firefox-quantum-vs-chrome
[36]: https://www.zdnet.com/article/just-how-fast-is-firefox-quantum/
[37]: http://en.wikipedia.org/wiki/Virtual_private_network
[38]: https://www.cnet.com/products/emachines-t5274/specs/
[39]: https://community.spiceworks.com/products/7727-hewlett-packard-dc5750-microtower
