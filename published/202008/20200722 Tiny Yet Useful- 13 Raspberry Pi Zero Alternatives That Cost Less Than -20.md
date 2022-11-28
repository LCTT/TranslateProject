[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12502-1.html)
[#]: subject: (Tiny Yet Useful: 13 Raspberry Pi Zero Alternatives That Cost Less Than $20)
[#]: via: (https://itsfoss.com/raspberry-pi-zero-alternatives/)
[#]: author: (Chinmay https://itsfoss.com/author/chinmay/)

个头小本事大：13 种 20 美元以下的树莓派 Zero 替代品
======

最近两年，[树莓派 Zero][1] 和 [树莓派 Zero W][2] 作为新成员出现在树莓派产品线中。这些超小型的单板计算机大受欢迎，而且会在相当长的一段时间内成为创客和 DIY 社区的 [树莓派项目][3] 的一部分。

为了实现更小尺寸和有效地控制价位，它们不得不在许多特性上做出让步，如放弃专用网口、采用更慢的处理器等（与其它们同族的全功能版相比）。

早先的一篇文章中，我们罗列了 [树莓派的最佳替代品][4]。这里，我将给出树莓派 Zero 和树莓派 Zero W 的一些替代品。

### 树莓派 Zero 替代品：应用于物联网和嵌入式项目的超小单板计算机

![][9]

受益于开源设计和开源软件栈，我们有为不同项目提供的具有各种功能集的优秀替代品。所有这些板子运行的都是嵌入式 Linux 的各种变体。

尽管树莓派 Zero 和树莓派 Zero W 的发布价格分别是 5 美元和 10 美元，但即使是在美国境内，也很难按这个价格买到。在美国之外，更是要花 12 和 20 美元才有可能买到。

知道了这些，让我们看看一些 20 美元以下的树莓派 Zero 替代品。

#### 1、香蕉派 BPI M2 Zero

![][10]

香蕉派 M2 Zero 售价 **18 美元**，与树莓派 Zero W 拥有相同的布局。它看起来像是树莓派 Zero W 的复制品，但也仅仅是外形像而已。它使用的是更快的全志 H2+ SOC 芯片，而且可以外接网络模块。它还可以运行多种基于 Linux 的操作系统。

**主要参数**

  * 全志 H2+ 四核 Cortex-A7 处理器，Mali400MP2 GPU，H265/HEVC 1080P
  * 512M DDR3 内存（与 GPU 共享）
  * 40 针接口，与树莓派 3 兼容
  * 板载 WiFi（AP6212）、蓝牙，外部天线连接口
  * CSI 摄像头输入接口
  * 电源及复位按钮
  * Mini HDMI 视频输出

详情可参阅 [Banana Pi Wiki][11]。

#### 2、香蕉派 BPI-M2 Magic（BPi-M2M）

![][13]

这个型号有 2 个变体，无板载 eMMC 闪存的标价 **20 美元**。这是相对其尺寸而言拥有更大处理能力的小型单板计算机。我觉得毫无疑问它很适合作为物联网和自动家居中的触控面板和显示面板。其板载电源管理系统也很有吸引力。

**主要参数**

  * 全志 A33/R16 四核 ARM Cortex-A7 处理器，MALI 400 MP2 GPU
  * 板载 802.11 b/g/n 2.4GHz WiFi（AP6212），蓝牙 4.0，支持 BLE
  * 512MB DDR3（与 GPU 共享）
  * MIPI 串行显示接口（DSI），4 数据通道
  * CSI 摄像头输入接口，最大分辨率 1080p 时可达 30 帧/秒
  * 板载话筒和电池管理
  * 无 HDMI 输出

详情可参阅 [Banana Pi Wiki][14]。

#### 3、香蕉派 BPI-P2 Maker

![][16]

它是带有板载网络模块及支持网口供电（POE）的最小的单板计算机之一，此板售价 **13 美元**（带有 POE 模块的版本售价 **19 美元**）。和香蕉派 M2 Zero 一样，使用的是全志 H2+ SOC 芯片，是块非常有趣的板子。它具有板载 8 GB eMMC 存储空间及摄像头接口，同时具有 POE 功能，可用于 DIY 监控摄像，也可以作为基本的机器学习处理器使用。

**主要参数**

  * 处理器：全志 H2+，四核，Cortex-A7 架构
  * 512MB DDR 3 同步动态随机存取内存
  * 板载 WiFi（AP6212）和蓝牙
  * 板载 8G eMMC 闪存
  * 100M 网络
  * Mini HDMI
  * CSI 摄像头接口
  * 具有 POE 模块，支持 IEEE 802.3af PoE 标准

详情可参阅 [Banana Pi Wiki][17]。

#### 4、桔子派 Zero LTS

![][19]

当前支持板载网络及 POE 的最小且最便宜的单板计算机，售价仅为 **11.49 美元**（256 MB 内存版本售价 **9.49 美元**）。其采用非常常见的全志 H2+ 处理器，并通过 GPIO 和 13 针功能头提供可靠的扩展方式。

**主要参数**

  * 全志 H2+ 四核 Cortex-A7 架构处理器，视频支持 H.265/HEVC 1080P
  * Mali400MP2 GPU @600MHz
  * 256MB/512MB DDR3 SDRAM（与 GPU 共用）（256 MB 版为标准版）
  * 10/100M 自适应网络，RJ45 网口，POE 功能默认关闭
  * WiFi 使用 XR819 方案，支持 IEEE 802.11 b/g/n
  * 26 针 GPIO 连接头
  * 13 针连接头，包含 2 路 USB、红外线接口和声音端口（MIC、AV）

详情可参阅 [官方网站][20]。

#### 5、桔子派 i96

![][24]

尺寸仅有 6×3 平方厘米，个头最小的型号之一，售价 **8.8 美元**。该板使用 [RDA8810PL 处理器][25]，可作为相当先进的功能手机，（据厂商称）适合摄像应用，最高可以 30 帧/秒的速率采集 1080p 分辨率的图像。在同等价位产品中，输入输出功能出色。

**主要参数**

  * RDA8810PL ARM Cortex-A5 32 位单核处理器
  * Vivante 出品 GC860 GPU
  * 集成 256MB LPDDR2 SDRAM
  * RDA5991 方案的 WiFi 和蓝牙
  * CSI 摄像头输入接口
  * 40 针 GPIO 头

详情可参阅 [官方网站][26]。

#### 6、桔子派 PC

![][28]

该板售价 **15 美元**，包含了很多功能。是在同等价位板子中少有的集成了 1 GB 内存的型号之一。采用全志 H3 SoC 芯片，可解码 4K HEVC/H.265 视频。具有 HDMI 输出口并支持 HDCP 和 CEC。该单板计算机可以通过安装软件成为一个很好用的媒体盒子。它竟然还配备了板载红外接收器和话筒。

**主要参数**

  * 全志 H3 四核 Cortex-A7 架构处理器，主频 1.6 GHz
  * 1GB DDR3 内存（与 GPU 共享）
  * 支持 4K 输出的 HDMI
  * CSI 摄像头接口，板载话筒
  * SD 卡槽
  * IR 接收器
  * 3.5mm 音频接口
  * 网络接口
  * 板上无 WiFi 和蓝牙

桔子派 PC 还有一种减配版，使用的是同样的处理器，只是内存容量要小。

详情可参阅 [官方网站][29]。

#### 7、桔子派 One 和桔子派 Lite

这两种板子与桔子派 PC 一样，使用的是全志 H3 处理器，但配备的是 512MB 内存。

**主要参数**

  * 全志 H3 四核处理器
  * HDMI 输出，支持 4K 高清
  * SD 卡槽
  * 512 MB DDR3 内存
  * CSI 摄像头接口

![Orange Pi Lite][31]

![Orange Pi One][32]

桔子派 Lite 售价 **12 美元**，不支持板载有线网络，但提供了 WiFi 联网功能。其具有板载话筒和红外接收器。详情可参阅 [官方网站][33]。

桔子派 One 售价 **11 美元**，具有板载有线网络，但不支持 WiFi。详情可参阅 [官方网站][35]。

在桔子派相关内容的最后，我想简单提一下他们提供的几种适合自定义应用的板子。

  * 桔子派 R1 – 具有双有线网口的小板子，可用于构建网络设备。
  * Orange Pi 2G IOT 和 Orange Pi 3G IOT - 这些板子分别提供了 2G 和 3G 蜂窝网络连接能力，适合作为物联网设备。

这些板子都不超过 **20 美元**，详情可参阅 [官方网站][37]。

#### 8、NanoPi Neo LTS

![][38]

起步价 **9.99 美元**，该板非常袖珍（4x4 平方厘米），与桔子派 Zero 规格相似。不同的是，它使用的是更为强悍的全志 H3 SoC 芯片和高达 512MB 的内存。虽然无任何板载 WiFi 和蓝牙芯片，但可以通过 USB 接口外接相关器件获得相应功能。该板非常适合作为无显示器的 Linux 服务器、DNS 过滤器（如 Pi-Hole），同时也很适合作为物联网应用的边缘设备使用。通过 GPIO 可以扩展出你需要的很多功能。

**主要参数**

  * 全志 H3 四核处理器，Cortex A7 内核，主频 1.2 GHz
  * 512 MB 内存
  * Micro SD 卡槽（最高支持 128 GB）
  * 10/100 Mbps 网口
  * 冗余 GPIO 针可实现其它所需功能

可从 [官方网站][39] 了解详情及购买。

![][40]

NanoPi NEO 的极简版称为 NanoPi NEO Core LTS，该极简版为满足工业应用需求增加了 eMMC 存储，且通过扩展 GPIO 提供了板载 USB 接口和板载网络接口。详情参阅 [这里][41]。

![][42]

Nano NEO Air 的 WiFi/蓝牙版称为 NanoPi NEO Air，提供了 eMMC 存储和摄像头输入接口，提供了板载 USB 接口和板载网络接口。详情参阅 [这里][43].

#### 9、Zero Pi

![][44]

这是所有这里提到的板子中，我最感兴趣的板子之一，售价 **9.99 美元**，具有板载千兆网口，使用全志 H3 处理器，小而强悍，适合应用于网络相关场景。它可以运行 OpenWRT，和其配备的千兆网络相得益彰。在作为 DNS 服务器运行的同时，还可以运行 Pi-Hole 的多个实例。

**主要参数**

  * 全志 H3 四核处理器，Cortex A7 架构，主频最高 1.2GHz
  * 512MB 内存
  * USB 2.0 接口
  * 可运行 OpenWRT

可从 [官方网站][45] 了解详情及下单购买。

#### 10、NanoPi NEO 2

![][46]

NanoPi NEO 2 售价 **19.99 美元**，是 NanoPi NEO 的 2 倍。其外形尺寸与 NanoPi Neo 相同，但使用的是全志 H5 处理器，并配备了千兆网功能。这使得该板子个头小而性能强。

**主要参数**

  * 全志 H5 处理器，四核 64 位，高性能 Cortex A53 架构 
  * Hexacore Mali450 GPU
  * 512MB 内存
  * 1Gbps 板载网络
  * 24 针 GPIO
  * 包含音频及红外之类功能的外接口

可从 [官方网站][47] 了解详情及下单购买。

上面的链接是关于 NanoPi 系列板子的。除此之外，还有一些其它有趣的板子，如配备双千兆网口的，以及针对摄像头应用的。

#### 11、La Frite

![][48]

出品商是 [Le Potato][49]，售价 **20 美元**，主要面向媒体消费及流媒体。它通过 HDMI 2.0 接口以 HDR 方式实现 1080p 视频播放，支持最新的安卓 9 /电视、上游的 Linux、u-boot、Kodi 等。

**主要参数**

  * Amlogic S805X 处理器，四核，Cortex-A53 架构，主频 1.2GHz
  * 最大 1GB DDR4 SDRAM
  * Amlogic 视频引擎 10，支持 H.264、H.265 和 VP9 解码，最高能以 60 帧/秒的速率实现 1080p 高清
  * 百兆网
  * 红外接器
  * 40 针 GPIO

详情可参阅 [官方网站][50]。

#### 12、Onion Omega2+

![][51]

如果你需要的是应用于物联网场景的单板计算机，那么 [Onion Omega][52] 2+ 是替代树莓派 Zero 的很好选择。它是针对物联网的开发平台，运行的是基于 [OpenWRT][53] 的嵌入式 Linux 开发环境。

**主要参数**

  * MT7688 SoC 芯片
  * 2.4 GHz WiFi，支持 IEEE 802.11 b/g/n
  * 128 MB DDR2 内存
  * 32 MB 板载闪存
  * MicroSD 卡槽
  * USB 2.0
  * 12 个 GPIO 引针

你可以 **13 美元** 的单价从 [官方网站][54] 购买其极简版，并可以选配各种附件。

#### 13、VoCore2

![][55]

VoCore2 肯定是类似产品中最小的一款，极简版尺寸只有 1 英寸见方，售价 **17.99 美元**。小巧的尺寸使得其能方便的嵌入到不同的应用场合，而且允许根据需要扩充不同的特性。该板使用过的是联发科针对中低端路由器的处理器 MT7628 处理器。生产商声明将持续供应至 2025 年，这是个不错的消息。

**主要参数**

  * 联发科 MT7628 处理器，主频 580 MHz，MIPS 24K
  * 128MB DDR2 内存, 内存刷新率 166 MHz
  * 1 或 5 网口，100 Mbps 网络
  * 无线网，支持 802.11n，双收双发，网速最高 300Mbps
  * 板载 16M NOR 存储器，支持最大 2TB SDXC 卡
  * 一个板载 U.FL 槽（天线接口）

你可以从 [此处][56] 了解更多细节。

### 结束语

无可否认，不同规格和特性的各种单板计算机可以满足千变万化的使用需求。另外，绝大部分此类产品都基于开源设计，运行着开源软件。这绝对是硬核玩家不可多得的乐园。

由于新冠病毒的肆虐，要上手这些板子可能要稍费周折，期待情况能尽快好转！

如果各位知道树莓派 Zero 和树莓派 Zero W 的其它有趣的替代型号，请留言。我们根据情况检查充实。

--------------------------------------------------------------------------------

via: https://itsfoss.com/raspberry-pi-zero-alternatives/

作者：[Chinmay][a]
选题：[lujun9972][b]
译者：[silentdawn-zz](https://github.com/silentdawn-zz)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chinmay/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/products/raspberry-pi-zero/
[2]: https://itsfoss.com/raspberry-pi-zero-w/
[3]: https://itsfoss.com/raspberry-pi-projects/
[4]: https://linux.cn/article-10823-1.html
[5]: https://i1.wp.com/m.media-amazon.com/images/I/517BwcAPmTL._SL160_.jpg?ssl=1
[6]: https://www.amazon.com/dp/B072N3X39J?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1
[7]: https://www.amazon.com/gp/prime/?tag=chmod7mediate-20 (Amazon Prime)
[8]: https://www.amazon.com/dp/B072N3X39J?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/raspberry-pi-zero-alterantives.png?ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/banana-pi-zero-1.png?ssl=1
[11]: http://wiki.banana-pi.org/Banana_Pi_BPI-M2_ZERO#Hardware_interfaces
[12]: https://www.aliexpress.com/item/32839074880.html?spm=2114.12010612.8148356.2.258c72dbKctWv3
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/Banana-Pi-M2M-2-1.jpg?ssl=1
[14]: http://wiki.banana-pi.org/Banana_Pi_BPI-M2M
[15]: https://www.aliexpress.com/item/32836172813.html?spm=2114.12010612.8148356.2.25ac76c2BKPl43
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/Banana-Pi-P2-Zero-1.png?ssl=1
[17]: http://wiki.banana-pi.org/Banana_Pi_BPI-P2_Zero
[18]: https://www.aliexpress.com/item/32953609399.html?spm=2114.12010612.8148356.6.6d4070a9ktu2qs
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/Orange-Pi-Zero-LTS.png?ssl=1
[20]: http://www.orangepi.org/orangepizerolts/
[21]: https://i0.wp.com/m.media-amazon.com/images/I/51wOvNrzHkL._SL160_.jpg?ssl=1
[22]: https://www.amazon.com/dp/B07ZYJGPF8?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Orange Pi Zero Single Board Computer Quad Core Open-Source Development Board 512MB with WiFi Antenna)
[23]: https://www.amazon.com/dp/B07ZYJGPF8?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/Orange-Pi-i96.png?ssl=1
[25]: https://www.openhacks.com/uploadsproductos/2016030304473558.pdf
[26]: http://www.orangepi.org/OrangePii96/
[27]: https://www.aliexpress.com/item/32819068354.html?spm=2114.12010612.8148356.2.7cb16aa1JdhlzK
[28]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/opipc.png?ssl=1
[29]: http://www.orangepi.org/orangepipc/
[30]: https://www.aliexpress.com/item/32448079125.html
[31]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/Orange-Pi-Lite.png?ssl=1
[32]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/Orange-Pi-One.png?ssl=1
[33]: http://www.orangepi.org/orangepilite/
[34]: https://www.aliexpress.com/item/32662738571.html?spm=2114.12010612.8148356.16.222f4f44KYIA5v
[35]: http://www.orangepi.org/orangepione/
[36]: https://www.aliexpress.com/item/32603308880.html?spm=a2g0o.detail.1000060.1.4fb86a5eWkGEex&gps-id=pcDetailBottomMoreThisSeller&scm=1007.13339.146401.0&scm_id=1007.13339.146401.0&scm-url=1007.13339.146401.0&pvid=9042001e-bc4a-471b-a3a0-9f0d276d0c3f&_t=gps-id:pcDetailBottomMoreThisSeller,scm-url:1007.13339.146401.0,pvid:9042001e-bc4a-471b-a3a0-9f0d276d0c3f,tpp_buckets:668%230%23131923%2358_668%23808%237756%23236_668%23888%233325%232_668%232846%238111%23464_668%232717%237564%23664_
[37]: http://www.orangepi.org
[38]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/NanoPi-NEO_04-900x630-1.jpg?ssl=1
[39]: https://www.friendlyarm.com/index.php?route=product/product&path=69&product_id=132&sort=p.price&order=ASC
[40]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/07/Core_04-900x630-1.jpg?ssl=1
[41]: https://www.friendlyarm.com/index.php?route=product/product&path=69&product_id=212&sort=p.price&order=ASC
[42]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/air_03-900x630-1.jpg?ssl=1
[43]: https://www.friendlyarm.com/index.php?route=product/product&path=69&product_id=151&sort=p.price&order=ASC
[44]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/07/ZeroPi_03-900x630-1.jpg?ssl=1
[45]: https://www.friendlyarm.com/index.php?route=product/product&path=69&product_id=266&sort=p.price&order=ASC
[46]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/NEO2_04-900x630-1.jpg?ssl=1
[47]: https://www.friendlyarm.com/index.php?route=product/product&product_id=180
[48]: https://i0.wp.com/cdn.shopify.com/s/files/1/1098/4826/products/84988b14aa58054c0a4cbf8c03466fa9_original_1024x1024.jpg?resize=544%2C306&ssl=1
[49]: https://libre.computer/products/boards/aml-s905x-cc/
[50]: https://libre.computer/products/boards/aml-s805x-ac/
[51]: https://i0.wp.com/onion.io/wp-content/uploads/2019/08/OM-O2P.jpg?resize=424%2C424&ssl=1
[52]: https://itsfoss.com/onion-omega-2/
[53]: https://openwrt.org/
[54]: https://onion.io/
[55]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/VoCore2.png?resize=719%2C319&ssl=1
[56]: https://vocore.io/v2.html
[57]: https://vocore.io/
