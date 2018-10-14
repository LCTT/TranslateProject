为什么我喜欢 ARM 和 PowerPC？
======

> 一个学生在搜寻强劲而节能的工作站的历程中怎样对开源系统的热情与日俱增的。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/desk_clock_job_work.jpg?itok=Nj4fuhl6)

最近我被问起为什么在博客和推特里经常提到 [ARM][1] 和 [PowerPC][2]。我有两个答案：一个是个人原因，另一个是技术上的。 

### 个人原因

从前，我是学环境保护的。在我读博的时候，我准备买个新电脑。作为一个环保人士，我需要一台强劲且节能的电脑。这就是我开始对 PowerPC 感兴趣的原因，我找到了  [Pegasos][3]，这是一台 [Genesi][4] 公司制造的 PowerPC 工作站。

我还用过 [RS/6000][5] （PowerPC）、 [SGI][6] （MIPS）、 [HP-UX][7] （PA-RISC）和 [VMS][8] （Alpha）的服务器和工作站，由于我的 PC 使用 Linux 而非 Windows，所以使用不同的 CPU 架构对我来说并没有什么区别。 [Pegasos][9] 是我第一台工作站，它小型而节能而且对家用来说性能足够。

很快我就开始为 Genesi 工作，为 Pegasos 移植 [openSUSE][10]、 Ubuntu 和其他 Linux 发行版，并提供质量保证和社区支持。继 Pegasos 之后是 [EFIKA][11]，这是另一款基于 PowerPC 的开发板。在用过工作站之后，刚开始使用嵌入式系统会感觉有点奇怪。但是作为第一代普及价位的开发板，这是一场革命的开端。

我工作于一个大规模的服务器项目时，我收到 Genesi 的另一块有趣的开发板：基于 ARM 的 [Smarttop][12] 和 [Smartbook][13]。我最喜欢的 Linux 发行版——openSUSE，也收到了一打这种机器。这在当时 ARM 电脑非常稀缺的情况下，极大地促进了 ARM 版 openSUSE 项目的开发。

尽管最近我很忙，我尽量保持对 ARM 和 PowerPC 新闻的关注。这有助于我支持非 x86 平台上的 syslog-ng 用户。只要有半个小时的空，我就会去捣鼓一下 ARM 机器。我在[树莓派2][14]上做了很多 [syslog-ng][15] 的测试，结果令人振奋。我最近在树莓派上做了个音乐播放器，用了一块 USB 声卡和[音乐播放守护进程][17]，我经常使用它。

### 技术方面

美好的多样性：它创造了竞争，而竞争创造了更好的产品。虽然 x86 是一款强劲的通用处理器，但 ARM 和 PowerPC （以及许多其他）这样的芯片在多种特定场景下显得更适合。

如果你有一部运行[安卓][18]的移动设备或者[苹果][19]的 iPhone 或 iPad，极有可能它使用的就是基于ARM 的 SoC (片上系统)。网络存储服务器也一样。原因很简单：省电。你不会希望手机一直在充电，也不想为你的路由器付更多的电费。

ARM 亦在使用 64 位 ARMv8 芯片征战企业级服务器市场。很多任务只需要极少的计算能力，另一方面省电和快速 IO 才是关键，想想存储、静态网页服务器、电子邮件和其他网络/存储相关的功能。一个最好的例子就是 [Ceph][20]，一个分布式的面向对象文件系统。[SoftIron][21] 就是一个基于 ARMv8 开发版，使用 CentOS 作为基准软件，运行在 Ceph 上的完整存储应用。

众所周知 PowerPC 是旧版苹果 [Mac][22] 电脑上的 CPU。虽然它不再作为通用桌面电脑的 CPU ，它依然在路由器和电信设备里发挥作用。而且 [IBM][23] 仍在为高端服务器制造芯片。几年前，随着 Power8 的引入， IBM 在 [OpenPower 基金会][24] 的支持下开放了架构。 Power8 对于关心内存带宽的设备，比如 HPC 、大数据、数据挖掘来说，是非常理想的平台。目前，Power9 也正呼之欲出。

这些都是服务器应用，但也有计划用于终端用户。猛禽工程团队正在开发一款基于 [Power9 的工作站][25]，也有一个基于飞思卡尔/恩智浦 QORIQ E6500 芯片[制造笔记本] [26]的倡议。当然，这些电脑并不适合所有人，你不能在它们上面安装 Windows 游戏或者商业应用。但它们对于 PowerPC 开发人员和爱好者，或者任何想要完全开放系统的人来说是理想的选择，因为从硬件到固件到应用程序都是开放的。

### 梦想

我的梦想是完全没有 x86 的环境，不是因为我讨厌 x86 ，而是因为我喜欢多样化而且总是希望使用最适合工作的工具。如果你看看猛禽工程网页上的[图][27]，根据不同的使用情景， ARM 和 POWER 完全可以代替 x86 。现在，我在笔记本的 x86 虚拟机上编译、打包和测试 syslog-ng。如果能用上足够强劲的 ARMv8 或者 PowerPC 电脑，无论工作站还是服务器，我就能避免在 x86 上做这些事。

现在我正在等待下一代[菠萝本][28]的到来，就像我在二月份 [FOSDEM][29] 上说的，下一代有望提供更高的性能。和 Chrome 本不同的是，这个 ARM 笔记本设计用于运行 Linux 而非仅是个客户端（LCTT 译注：Chrome 笔记本只提供基于网页的应用）。作为桌面系统，我在寻找 ARMv8 工作站级别的硬件。有些已经接近完成——就像 Avantek 公司的 [雷神 X 台式机][30]——不过他们还没有装备最新最快最重要也最节能的 ARMv8 CPU。当这些都实现了，我将用我的 Pixel C 笔记本运行安卓。它不像 Linux 那样简单灵活，但它以强大的 ARM SoC 和 Linux 内核为基础。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/why-i-love-arm-and-powerpc

作者：[Peter Czanik][a]
译者：[kennethXia](https://github.com/kennethXia)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/czanik
[1]:https://en.wikipedia.org/wiki/ARM_architecture
[2]:https://en.wikipedia.org/wiki/PowerPC
[3]:https://genesi.company/products/opendesktop
[4]:https://genesi.company/
[5]:https://en.wikipedia.org/wiki/RS/6000
[6]:https://en.wikipedia.org/wiki/Silicon_Graphics#Workstations
[7]:https://en.wikipedia.org/wiki/HP-UX
[8]:https://en.wikipedia.org/wiki/OpenVMS#Port_to_DEC_Alpha
[9]:https://en.wikipedia.org/wiki/Pegasos
[10]:https://www.opensuse.org/
[11]:https://genesi.company/products/efika/5200b
[12]:https://genesi.company/products/efika
[13]:https://genesi.company/products/smartbook
[14]:https://www.raspberrypi.org/products/raspberry-pi-2-model-b/
[15]:https://syslog-ng.com/open-source-log-management
[16]:https://syslog-ng.com/blog/syslog-ng-raspberry-pi-2/
[17]:https://www.musicpd.org/
[18]:https://www.android.com/
[19]:http://www.apple.com/
[20]:http://ceph.com/
[21]:http://softiron.co.uk/
[22]:https://en.wikipedia.org/wiki/Power_Macintosh
[23]:https://www.ibm.com/us-en/
[24]:http://openpowerfoundation.org/
[25]:https://www.raptorcs.com/TALOSII/
[26]:http://www.powerpc-notebook.org/en/
[27]:https://secure.raptorengineering.com/TALOS/power_advantages.php
[28]:https://www.pine64.org/?page_id=3707
[29]:https://fosdem.org/2018/
[30]:https://www.avantek.co.uk/store/avantek-32-core-cavium-thunderx-arm-desktop.html
