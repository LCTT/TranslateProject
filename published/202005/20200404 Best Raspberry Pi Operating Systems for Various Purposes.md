[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12219-1.html)
[#]: subject: (Best Raspberry Pi Operating Systems for Various Purposes)
[#]: via: (https://itsfoss.com/raspberry-pi-os/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

用于各种用途的最佳树莓派操作系统
======

![](https://img.linux.net.cn/data/attachment/album/202005/15/105040b17d6v7gdmj63k3k.jpg)

[树莓派][1] 是一款不可缺少的单板电脑，在很多工作中都能派上用场。不相信？只要[看看这个树莓派项目列表][2]，就能了解这个小小的设备能做什么。

考虑到树莓派用途这么多，为它选择一个合适的操作系统就极其重要。当然，你可以用 Linux 做很多事，但专门为特定目的配置的操作系统可以为你节省大量的时间和精力。

因此，本文中我要介绍一些专门为树莓派量身定制的流行且实用的操作系统。

### 由于有树莓派镜像工具，安装任何操作系统到树莓派上都很容易

[在 SD 卡上安装树莓派操作系统][3]比以前容易得多。你只需下载[树莓派镜像][4]就可以快速地安装任何树莓派操作系统。请看下面的官方视频，你就知道有多简单。

- [HOW TO INSTALL RASPBIAN OS to your Raspberry Pi with ease - Raspberry Pi Imager](https://youtu.be/J024soVgEeM)

你也可以使用 [NOOBS][5]（<ruby>新开箱即用软件<rt>New Out Of the Box Software</rt></ruby>）在树莓派上轻松安装各种的操作系统。你还可以从他们的 [NOOBS 官方下载页面][5]提到的支持的零售商列表中获得预装 SD 卡。

欢迎在他们的[官方文档][6]中了解更多关于安装操作系统的信息。

- [下载树莓派操作系统][4]

现在你知道了怎么安装它（以及从哪儿获取），让我来重点介绍几个有用的树莓派操作系统，希望对你有所帮助。

### 适用于树莓派的各种操作系统

请注意，我花了一些精力筛选出了那些被积极维护的树莓派操作系统项目。如果某个项目在不久的将来会停止维护，请在评论区告诉我，我会更新本文。

另一件事是，我关注到现在最新的版本是树莓派 4，但是下面的列表不应被认为是树莓派 4 的操作系统列表，这些系统应该也能用于树莓派 3、3B+ 和其他变种，但是请参照项目的官方网站了解详细信息。

**注意：** 排名不分先后。

#### 1、Raspbian OS：官方的树莓派操作系统

![][7]

Raspbian OS 是官方支持的树莓派板卡操作系统。它集成了很多工具，用于教育、编程以及其他广泛的用途。具体来说，它包含了 Python、Scratch、Sonic Pi、Java 和其他一些重要的包。

最初，Raspbian OS 是基于 Debian 的，并预装了大量有用的包。因此，当你安装 Raspbian OS 后，你可能就不需要特意安装基本工具了 — 你会发现大部分工具已经提前安装好了。

Raspbian OS 是被积极地维护着的，它也是最流行的树莓派操作系统之一。你可以使用 [NOOBS][5] 或参照[官方文档][6]来安装它。

- [Raspbian OS][8]

#### 2、Ubuntu MATE：适合通用计算需求

![][9]

尽管 Raspbian 是官方支持的操作系统，但它的特点不是最新、最大的软件包。因此，如果你想更快的更新，想用最新的包，你可以试试 Ubuntu MATE 的树莓派版本。

Ubuntu MATE 的树莓派定制版是值得安装的非常不错的轻量级发行版。它还被广泛用于 [NVIDIA 的 Jetson Nano][10]。换言之，你可以在树莓派的很多场景下使用它。

为了更好地帮助你，我们还有一份详细的教程：[怎样在树莓派上安装 Ubuntu MATE][11]。

- [Ubuntu MATE for Raspberry Pi][12]

#### 3、Ubuntu Server：把树莓派作为一台 Linux 服务器来使用

![][13]

如果你计划把你的树莓派当作项目的某个服务器来使用，那么安装 Ubuntu Server 会是一个不错的选择。

Ubuntu Server 有 32 位和 64 位的镜像。你可以根据你的板卡类型（是否支持 64 位）来选择对应的操作系统。

然而，值得注意的一点是 Ubuntu Server 不是为桌面用户定制的。因此，你需要留意 Ubuntu Server 默认不会安装图形用户界面。

- [Ubuntu Server][14]

#### 4、LibreELEC：适合做媒体服务器

![][15]

我们已经有一个 [Linux 下可用的媒体服务器软件][16]，LibreELEC 在列表中。

它是一个很棒的轻量级操作系统，让你可以在树莓派上安装 [KODI][17]。你可以尝试使用树莓派镜像工具来安装它。

你可以很容易地找到他们的[官方下载页面][18]，并找到适合你板卡的安装镜像。

- [LibreELEC][19]

#### 5、OSMC：适合做媒体服务器

![][20]

OSMC 是另一个 Linux 下[流行的媒体服务器软件][16]。如果要把树莓派板作为媒体中心设备，那么 OSMC 是你可以向他人推荐的操作系统之一。

类似 LibreELEC，OSMC 也运行 KODI，可以帮助你管理你的媒体文件和欣赏你已有的素材。

OSMC 没有正式提及对树莓派  4 的支持。因此，如果你的树莓派是树莓派 3 或更早的版本，那么应该没有问题。

- [OSMC][21]

#### 6、RISC OS：最初的 ARM 操作系统

![][22]

RISC OS 最初是为 ARM 设备打造的，至今已有近 30 年左右的历史。

如果你想了解，我们也有篇详细介绍 [RISC OS][23] 的文章。简而言之，RISC OS 也是为诸如树莓派的现代基于 ARM 的单板计算机定制的。它的用户界面很简单，更专注于性能。

同样的，这并不是为树莓派 4 量身定做的。因此，如果你的树莓派是 3 或更早的版本，你可以试一下。

- [RISC OS][24]

#### 7、Mozilla WebThings Gateway：适合 IoT 项目

![][25]

作为 Mozilla 的 [IoT 设备的开源实现][26]的一部分，WebThings Gateway 让你可以监控和控制所有连接的 IoT 设备。

你可以参考[官方文档][27]来检查所需的环境，遵照指导把安装到树莓派上。它确实是适合 IoT 应用的最有用的树莓派操作系统之一。

- [WebThings Gateway][28]

#### 8、Ubuntu Core：适合 IoT 项目

Ubuntu Core 是又一个树莓派操作系统，适用于潜在的 [IoT][29] 应用，或者只是测试一下 Snap。

Ubuntu Core 是专门为 IoT 设备或者具体来说是树莓派定制的。我不会刻意宣传它 —— 但是 Ubuntu Core 是一款适合树莓派板卡的安全操作系统。你可以自己尝试一下！

- [Ubuntu Core][30]

#### 9、DietPi：轻量级树莓派操作系统

![][31]

DietPi 是一款轻量级的 [Debian][32] 操作系统，它还宣称比 “Raspbian Lite” 操作系统更轻量。

虽然它被视作一款轻量级的树莓派操作系统，但它提供了很多功能，可以在多个使用场景中派上用场。从简单的软件安装包到备份解决方案，还有很多功能值得探索。

如果你想安装一个低内存占用而性能相对更好的操作系统，你可以尝试一下 DietPi。

- [DietPi][33]

#### 10、Lakka Linux：打造复古的游戏主机

![][34]

想让你的树莓派变成一个复古的游戏主机？

Lakka Linux 发行版本最初是建立在 RetroArch 模拟器上的。因此，你可以立刻在树莓派上获得所有的复古游戏。

如果你想了解，我们也有一篇介绍 [Lakka Linux][35] 的文章。或者直接上手吧！

- [Lakka][36]

#### 11、RetroPie：适合复古游戏

![][37]

RetroPie 是另一款可以让树莓派变成复古游戏主机的树莓派操作系统。它提供了几个配置工具，让你可以自定义主题，或者调整模拟器即可拥有最好的复古游戏。

值得注意的是它不包含任何有版权的游戏。你可以试一下，看看它是怎么工作的！

- [RetroPie][38]

#### 12、Kali Linux：适合低成本渗透

![][39]

想要在你的树莓派上尝试和学习一些道德黑客技巧吗？[Kali Linux][64] 会是最佳选择。是的，Kali Linux 通常在最新的树莓派一发布就会支持它。

Kali Linux 不仅适合树莓派，它也支持很多其他设备。尝试一下，玩得愉快！

- [Kali Linux][40]

#### 13、OpenMediaVault：适合网络附加存储（NAS）

![][41]

如果你想在极简的硬件上搭建 [NAS][42] 解决方案，树莓派可以帮助你。

OpenMediaVault 最初是基于 Debian Linux 的，提供了大量功能，如基于 Web 的管理能力、插件支持，等等。它支持大多数树莓派型号，因此你可以尝试下载并安装它！

- [OpenMediaVault][43]

#### 14、ROKOS：适合加密挖矿

![][44]

如果你对加密货币和比特币很感兴趣，那么 ROKOS 会吸引你。

ROKOS 是基于 Debian 的操作系统，基本上可以让你把你的树莓派变成一个节点，同时预装了相应的驱动程序和软件包。当然，在安装之前你需要了解它是怎么工作的。因此，如果你对此不太了解，我建议你先调研下。

- [ROKOS][45]

#### 15、Alpine Linux：专注于安全的轻量级 Linux

当今年代，很多用户都在寻找专注于安全和[隐私的发行版本][46]。如果你也是其中一员，你可以试试在树莓派上安装 Alpine Linux。

如果你是个树莓派新手，它可能不像你想象的那样对用户友好（或者说对初学者来说容易上手）。但是，如果你想尝试一些不一样的东西，那么你可以试试 Alpine Linux 这个专注于安全的 Linux 发行版本。

- [Alpine Linux][47]

#### 16、Kano OS：适合儿童教育的操作系统

![][48]

如果你在寻找一款能让学习变得有趣还能教育儿童的树莓派操作系统，那么 Kano OS 是个不错的选择。

它正在积极维护中，而且 Kano OS 上的桌面集成的用户体验相当简单，玩起来也很有趣，可以让孩子们从中学习。

- [Kano OS][49]

#### 17、KDE Plasma Bigscreen：把普通电视转换为智能电视

![][50]

这是 KDE 一个正在开发中的项目。在树莓派上安装 [KDE “等离子大屏”][51] 后，你可以把普通电视变成智能电视。

你不需要特殊的遥控器来控制电视，你可以使用普通的遥控器。

“等离子大屏”也集成了 [MyCroft 开源 AI][52] 作为声控。

这个项目还在测试阶段，所以如果你想尝试，可能会有一些错误和问题。

- [Plasma Bigscreen][53]

#### 18、Manjaro Linux：为你提供多功能的桌面体验

![][54]

如果你想在树莓派上寻找一个基于 Arch 的 Linux 发行版，那么 Manjaro Linux 应该是一个很好的补充，它可以做很多事情，适合一般的计算任务。

Manjaro Linux ARM 版也支持最新的树莓派 4。它为你的树莓派或任何[树莓派替代品][55]提供了 XFCE 和 KDE  Plasma 变体。

此外，它似乎还提供了树莓派设备上最快/最好的体验之一。如果你还没试过，那就试试吧!

- [Manjaro ARM][56]

#### 19、Volumio：作为一个开源音乐播放器使用

![][57]

想做一个廉价的音乐发烧友系统？Volumio 应该可以帮到你。

它是一个自由而开源的操作系统（[GitHub][58]），还支持集成多个设备的能力。你可以通过一个简单的 Web 控制界面，对所有连接的设备进行管理。除了免费版之外，它还提供了一个高级版，可以让你获得独家功能。

它也确实支持最新的树莓派 4。所以，如果你对调整已有的家庭立体声系统有一定的兴趣，想要获得最佳的音质，不妨试试这个。

- [Volumio][59]

#### 20、FreeBSD

不想使用 Linux 发行版？不用担心，你也可以用 FreeBSD 在树莓派上安装一个类 UNIX 操作系统。

如果你不知道的话，我们有一篇关于 [FreeBSD 项目][60]的详细文章。

一旦你按照他们的[官方说明][61]安装好之后，你可以利用它来进行任何 DIY 实验，或者只是把它作为一个轻量级的桌面系统来完成特定的任务。

- [FreeBSD][62]

#### 21、NetBSD

NetBSD 是另一个令人印象深刻的类 UNIX 操作系统，你可以在树莓派上安装。它的目标是成为一个跨多个系统的便携式操作系统。

如果你在其他系统中使用过它，你可能已经知道它的好处了。然而，它不仅仅是一个轻量级的便携式操作系统，它的特点是拥有一套有用的功能，可以完成各种任务。

- [NetBSD][63]

### 结语

我相信还有很多为树莓派定制的操作系统 — 但是我尽力列出了被积极维护的最流行的或最有用的操作系统。

如果你觉得我遗漏了最合适树莓派的操作系统，尽情在下面的评论去告诉我吧！

--------------------------------------------------------------------------------

via: https://itsfoss.com/raspberry-pi-os/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/
[2]: https://itsfoss.com/raspberry-pi-projects/
[3]: https://linux.cn/article-12136-1.html
[4]: https://www.raspberrypi.org/downloads/
[5]: https://www.raspberrypi.org/downloads/noobs/
[6]: https://www.raspberrypi.org/documentation/installation/installing-images/README.md
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/06/raspbian_home_screen.jpg?resize=800%2C492&ssl=1
[8]: https://www.raspbian.org/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/Desktop-ubuntu.jpg?resize=800%2C600&ssl=1
[10]: https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-nano/
[11]: https://linux.cn/article-10817-1.html
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
[35]: https://linux.cn/article-10158-1.html
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
[54]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/manjaro-arm.jpg?w=800&ssl=1
[55]: https://linux.cn/article-10823-1.html
[56]: https://manjaro.org/download/#raspberry-pi-4
[57]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/volumio.jpg?w=800&ssl=1
[58]: https://github.com/volumio
[59]: https://volumio.org/
[60]: https://itsfoss.com/freebsd-interview-deb-goodkin/
[61]: https://www.freebsdfoundation.org/freebsd/how-to-guides/installing-freebsd-for-raspberry-pi/
[62]: https://www.freebsd.org/
[63]: https://www.netbsd.org/
[64]: https://linux.cn/article-10690-1.html
