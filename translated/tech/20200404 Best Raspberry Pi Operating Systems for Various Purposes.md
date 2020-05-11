[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Best Raspberry Pi Operating Systems for Various Purposes)
[#]: via: (https://itsfoss.com/raspberry-pi-os/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

不同需求下各自最适合的树莓派操作系统
======

[树莓派][1] 是一种具有很多功能且使用便捷的不可或缺的卡片式计算机。不相信？那就[浏览下这个树莓派项目列表][2]，来领会下这个小设备能做什么。

考虑到树莓派用途这么多，为它选择一个合适的操作系统就极其重要。当然，你可以用 Linux 做很多事，但是一个为某个目的特意配置的操作系统可以节省你大量的时间和精力。

因此，本文中我要介绍一些专门为树莓派量身定制的流行和有用的操作系统。

### 由于有树莓派镜像工具，安装任何操作系统到树莓派上都很容易

[把树莓派操作系统安装到 SD 卡上][3] 比以前容易得多。你可以很容易地下载[树莓派镜像][4]和很快地安装树莓派操作系统。看一下官方视频，你就知道有多简单。 

你也可以使用 [NOOBS][5]（New Out Of the Box Software）来很容易地安装不同的操作系统到树莓派上。你还可以从 [NOOBS官方下载页面][5] 提及的他们支持的零售商那里获取预先安装好系统的 SD 卡。

尽情去他们的[官方文档][6]里找更多关于安装操作系统的信息吧。

[下载树莓派操作系统][4]

现在你知道了怎么安装它（以及从哪儿获取），让我来重点介绍下几个有用的树莓派操作系统来帮助你。

### 适用于树莓派的不同操作系统

请注意，我花了一些精力来筛选出那些被积极维护的树莓派操作系统项目。如果某个项目在不久的将来会停止维护，请在评论区告诉我，我会更新本文。

另一件事是，我关注到现在最新的版本是 Raspberry 4，但是下面的列表不应被认为是适 Raspberry 4 的操作系统列表。这些系统应该能用于树莓派 3、3B+ 和其他各种版本，但是请参照项目的官方网站核对详细信息。

**注意：** 排名不分先后。

#### 1\. Raspbian OS：官方的树莓派操作系统

![][7]

Raspbian 是官方支持的树莓派板操作系统。它集成了很多工具，用于教育、编程以及其他广泛的用途。特别地，它包含 Python、Scratch、Sonic Pi、Java和一些其他的很重要的包。

最初，Raspbian 是基于 Debian 的，系统中预安装了很多有用的包。因此，当你安装 Raspbian 后，你可能就不需要特意安装基本工具了 — 你会发现大部分工具已经提前安装好了。

Raspbian OS 是被积极地维护着的，它也是最流行的树莓派操作系统之一。你可以使用 [NOOBS][5] 或参照[官方文档][6]来安装它。

[Raspbian OS][8]

#### 2\. Ubuntu MATE：适合通用计算需求

![][9]

虽然 Raspbian 是官方支持的操作系统，但是对于最新和最好的包它往往不能及时支持。因此，如果你想更新得更快并且在将来想用最新的包，你可以试试树莓派版本的 Ubuntu MATE。

树莓派定制版的 Ubuntu MATE 是很适合安装的不可思议的轻量级发行版本。它还被广泛用于 [NVIDIA 的 Jetson Nano][10]。换言之，你可以在树莓派的很多场景下使用它。

为了更好地帮助你，我们还有一份详细的教程：[怎样在树莓派上安装 Ubuntu MATE][11]。

[Ubuntu MATE for Raspberry Pi][12]

#### 3\. Ubuntu Server：把树莓派作为一台 Linux 服务器来使用

![][13]

如果你计划把你的树莓派当作你项目的服务器来使用，那么安装 Ubuntu Server 会是一个不错的选择。

Ubuntu Server 有 32 位和 64 位的镜像。你可以根据你的板的类型（是否支持 64 位）来选择对应的操作系统。

然而，值得注意的一点是 Ubuntu Server 不是为桌面用户定制的。因此，你需要留意 Ubuntu Server 默认不会安装图形用户界面。

[Ubuntu Server][14]

#### 4\. LibreELEC：适合做媒体服务器

![][15]

我们已经有一个 [Linux 下可用的媒体服务器软件][16]，LibreELEC 在列表中。

它是一个伟大的轻量级操作系统，让你可以在树莓派上安装 [KODI][17]。你可以尝试使用 Raspberry Pi Imager 来安装它。

你可以很容易地找到他们的[官方下载页面][18]，并找到适合你板子的安装镜像。

[LibreELEC][19]

#### 5\. OSMC：适合做媒体服务器

![][20]

OSMC 是另一个 Linux 下[流行的媒体服务器软件][16]。如果要把树莓派板作为媒体中心设备，那么 OSMC 是你可以向他人推荐的操作系统之一。

类似 LibreELEC，OSMC 也运行 KODI 来帮助你管理你的媒体文件和享受你已有的素材中。

OSMC 官方没有提及对 **Raspberry Pi 4** 的支持。因此，如果你的树莓派是 Raspberry Pi 3 或更早的版本，那么应该没有问题。

[OSMC][21]

#### 6\. RISC OS：传统的 ARM 操作系统

![][22]

ARM 设备的原始草稿版，RISC 已经存在了差不多 30 年了。

如果你想了解，我们也有篇详细介绍 [RISC OS][23] 的文章。简而言之，RISC OS 也是为诸如树莓派的现代基于 ARM 的卡片式计算机定制的。它的用于界面很简单，更专注于性能。

同样的，这个系统也不支持 Raspberry Pi 4。因此，如果你的树莓派是 Raspberry Pi 3 或更早的版本，你可以试一下。

[RISC OS][24]

#### 7\. Mozilla WebThings Gateway：适合 IoT 项目

![][25]

作为 Mozilla 的 [IoT 设备的开源实现][26] 的一部分，WebThings Gateway 让你可以监控和控制连接的 IoT 设备。

你可以参考[官方文档][27]来检查所需的环境，遵照指导把安装到树莓派上。它确实是适合 IoT 应用的最有用的树莓派操作系统之一。

[WebThings Gateway][28]

#### 8\. Ubuntu Core：适合 IoT 项目

另一个适合 [IoT][29] 应用的树莓派操作系统，或者仅仅用来测试一下 — Ubuntu Core。

Ubuntu Core 是为 IoT 设备或特定的树莓派特意定制。我不会刻意主张大家使用它 — 但是 Ubuntu Core 是适合树莓派板的安全的操作系统。你可以自己尝试一下！

[Ubuntu Core][30]

#### 9\. DietPi：轻量级树莓派操作系统

![DietPi Screenshot via Distrowatch][31]

DietPi 是一款轻量级的 [Debian][32] 操作系统，它还宣称比 “Raspbian Lite” 操作系统更轻量。

考虑到它是一款轻量级的树莓派操作系统，它在很多使用场景下以很便捷的方式提供了大量的功能。从简单的软件安装包到备份解决方案，还有很多功能等待发掘。

如果你想安装一个低内存占用而性能相对更好的操作系统，你可以尝试一下 DietPi。

[DietPi][33]

#### 10\. Lakka Linux：打造复古的游戏控制台

![][34]

想让你的树莓派变成一个复古的游戏控制台？

Lakka Linux 发行版本最初是在 RetroArch 模拟器中构建的。因此，你可以立刻在树莓派上获得所有的复古游戏。

如果你想了解，我们也有一篇介绍 [Lakka Linux][35] 的文章。或者直接上手吧！

[Lakka][36]

#### 11\. RetroPie：适合复古游戏

![ ][37]

RetroPie 是另一款可以让树莓派变成复古游戏控制台的树莓派操作系统。它提供了很多配置工具，因此你可以自定义主题，或者调整模拟器来找到最好的复古游戏。

值得注意的是它不包含任何有版权的游戏。你可以试一下，看看它是怎么工作的！

[RetroPie][38]

#### 12\. Kali Linux：适合低成本入侵

![][39]

想要在你的树莓派上尝试和学习一些渗透测试技巧？Kali Linux 会是最佳选择。是的，Kali Linux 通常会支持最新的树莓派。

Kali Linux 不仅适合树莓派，它也支持很多其他设备。尝试一下，玩得愉快！

[Kali Linux][40]

#### 13\. OpenMediaVault：适合<ruby>网络附加存储<rt>Network Attached Storage</rt></ruby>

![][41]

如果你想在最小的硬件上搭建 [NAS][42] 解决方案，树莓派可以帮助你。

OpenMediaVault 最初是基于 Debian Linux 的，提供了大量功能，如基于 web 的管理员能力、插件支持，等等。它支持大多数树莓派模块，因此你可以尝试下载并安装它！

[OpenMediaVault][43]

#### 14\. ROKOS：适合加密挖矿

![][44]

如果你对加密货币和比特币很感兴趣，那么 ROKOS 会吸引你。

ROKOS 是基于 Debian 的操作系统，预安装的驱动和包基本可以让你的树莓派变成一个节点。当然，在安装之前你需要了解它是怎么工作的。因此，如果你对此不太了解，我建议你先调研下。

[ROKOS][45]

#### 15\. Alpine Linux：专注于安全的轻量级 Linux

当今年代，很多用户都在寻找专注于安全和[隐私的发行版本][46]。如果你也是其中一员，你可以试试在树莓派上安装 Alpine Linux。

如果你是个树莓派新手，它可能不像你想象的那样对用户友好（或对新手友好）。但是，如果你想尝试一些不一样的东西，那么你可以试试 Alpine Linux 这个专注于安全的 Linux 发行版本。

[Alpine Linux][47]

#### 16\. Kano OS：适合儿童教育的操作系统

![][48]

如果你在寻找一款能让学习变得有趣还能教育儿童的树莓派操作系统，那么 Kano OS 是个不错的选择。

它是被积极地维护着的，Kano 操作系统上的桌面对于儿童玩和学习的用户体验都是很简单的。

[Kano OS][49]

#### 17\. KDE Plasma Bigscreen：适合把普通 TV 转换为智能 TV

![][50]

这是 KDE 的子开发项目。在树莓派上安装 [KDE Plasma Bigscreen OS][51] 后，你可以把普通 TV 变成智能 TV。

你不需要特殊的远程服务器来控制 TV。你可以使用普通的远程控制。

Plasma Bigscreen 也集成了 [MyCroft open source AI][52] 作为声控。

这个项目还在内测阶段，所以如果你想尝试，可能会有一些 bug 和问题。

[Plasma Bigscreen][53]

#### 结语

我知道还有很多为树莓派定制的操作系统 — 但是我尽力列出了被积极维护的最流行的或最有用的操作系统。

如果你觉得我遗漏了最合适的树莓派操作系统，尽情在下面的评论去告诉我吧！

--------------------------------------------------------------------------------

via: https://itsfoss.com/raspberry-pi-os/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/
[2]: https://itsfoss.com/raspberry-pi-projects/
[3]: https://itsfoss.com/tutorial-how-to-install-raspberry-pi-os-raspbian-wheezy/
[4]: https://www.raspberrypi.org/downloads/
[5]: https://www.raspberrypi.org/downloads/noobs/
[6]: https://www.raspberrypi.org/documentation/installation/installing-images/README.md
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/06/raspbian_home_screen.jpg?resize=800%2C492&ssl=1
[8]: https://www.raspbian.org/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/Desktop-ubuntu.jpg?resize=800%2C600&ssl=1
[10]: https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-nano/
[11]: https://itsfoss.com/ubuntu-mate-raspberry-pi/
[12]: https://ubuntu-mate.org/raspberry-pi/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/ubunt-server.png?ssl=1
[14]: https://ubuntu.com/download/raspberry-pi
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/libreelec.jpg?resize=800%2C600&ssl=1
[16]: https://itsfoss.com/best-linux-media-server/
[17]: https://kodi.tv/
[18]: https://libreelec.tv/downloads_new/
[19]: https://libreelec.tv/
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/osmc-server.jpg?resize=800%2C450&ssl=1
[21]: https://osmc.tv/
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/10/riscos5.1.jpg?resize=800%2C600&ssl=1
[23]: https://itsfoss.com/risc-os-is-now-open-source/
[24]: https://www.riscosopen.org/content/
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/web-things-gateway.png?ssl=1
[26]: https://iot.mozilla.org/about/
[27]: https://iot.mozilla.org/docs/gateway-getting-started-guide.html
[28]: https://iot.mozilla.org/gateway/
[29]: https://en.wikipedia.org/wiki/Internet_of_things
[30]: https://ubuntu.com/download/raspberry-pi-core
[31]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/diet-pi.jpg?ssl=1
[32]: https://www.debian.org/
[33]: https://dietpi.com/
[34]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2016/08/lakkaos.jpg?resize=1024%2C640&ssl=1
[35]: https://itsfoss.com/lakka-retrogaming-linux/
[36]: http://www.lakka.tv/
[37]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/retro-pie.png?ssl=1
[38]: https://retropie.org.uk/
[39]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/kali-linux-pi.png?ssl=1
[40]: https://www.offensive-security.com/kali-linux-arm-images/
[41]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/openmediavault.jpg?ssl=1
[42]: https://en.wikipedia.org/wiki/Network-attached_storage
[43]: https://www.openmediavault.org/
[44]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/rocos-bitcoin-pi.jpg?ssl=1
[45]: https://rokos.space/
[46]: https://itsfoss.com/privacy-focused-linux-distributions/
[47]: https://alpinelinux.org/
[48]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/kano-os-pi.jpeg?ssl=1
[49]: https://kano.me/row/downloadable
[50]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/plasma-bigscreen-menu.jpg?ssl=1
[51]: https://itsfoss.com/kde-plasma-bigscreen/
[52]: https://itsfoss.com/mycroft-mark-2/
[53]: https://plasma-bigscreen.org/#download-jumpto
