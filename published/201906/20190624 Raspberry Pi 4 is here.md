[#]: collector: (lujun9972)
[#]: translator: (wahailin)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11034-1.html)
[#]: subject: (Raspberry Pi 4 is here!)
[#]: via: (https://opensource.com/article/19/6/raspberry-pi-4)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

树莓派 4 来袭！  
======

![](https://img.linux.net.cn/data/attachment/album/201906/29/161918icu6zrn8qrg3p38u.png)

> 售价 35 美元起的新一代树莓派单板计算机，装载了 1.5 GHz 的 Arm 芯片，并支持双 HDMI 4K 显示，全吞吐量千兆以太网，以及更多新特性。

![Raspberry Pi 4 board][1]

树莓派的最新版本树莓派 4 代，已于近日（北京时间 6 月 24 日）发布，这早于此前预期。树莓派 4 装载了 1.5 GHz 的 Arm 芯片和 VideoCore GPU，支持双 4K 显示输出，并引入了 USB 3 接口和全吞吐量千兆以太网，以及最高可达 4G 的多个可选 RAM 配置。

![Raspberry Pi 4 case][2]

树莓派 4 是非常强大的单板计算机，其起始售价依然是 35 美元。起始版的 RAM 配置为 1G，2G RAM 配置的树莓派售价为 45 美元，顶配 4G RAM 的树莓派售价为 55 美元，采用这种差异化定价对树莓派尚属首次。
 
树莓派 4 的详细配置如下：

  * 1.5 GHz 4 核心 64 位博通 BCM2711 A72 CPU
  * VideoCore VI GPU
  * 千兆以太网端口
  * 1GB/2GB/4GB LPDDR4 SDRAM 内存
  * 双 Micro-HDMI 接口
  * 两个 USB 3 接口
  * 两个 USB 2 接口
  * 双频（2.4 GHz 和 5 GHz）无线网络
  * 蓝牙 5.0
  * USB Type C 电源接口
  * CSI 摄像头接口
  * DSI 显示接口
  * MicroSD 卡槽
  * PoE（以太网供电）供电针
  * 完全兼容早期的树莓派产品

### USB 接口和网络

树莓派 4 板载了更高速率的 USB 3 接口；它通过 Type C 接口供电，并提供两个 USB 3 接口和两个 USB 2 接口。USB 3 接口可以为连接的硬盘和其它外部设备提供更高的速率。

![Raspberry Pi 4 USBs][3]
  
基于 BCM2835 的树莓派 1 到 3 代的芯片只有一个本地 USB 接口，并且没有以太网接口，因而需要使用板子的 USB 集线器给出更多的 USB 接口和以太网接口。树莓派 3B+ 增加了一个专用的局域网（LAN）芯片，装载了千兆以太网，但它受到 USB 2 速率的限制。树莓派 4 板载了专门的千兆以太网，并且由于它不再受到 USB 速率的限制，网络速度要快得多。

树莓派 4 采用了 3B+ 中已有的技术 —— 该技术使得树莓派 3B+ 成为了第一个带有双频无线网络的单板计算机，即可以同时连接 2.4 GHz 和 5 GHz 频率的网络。

### 显示
 
设计第一代树莓派时，其 CPU 和 GPU 性能的平衡大大偏向于 GPU。VideoCore IV 是一个非常强大的图形处理器，支持全高清 1080p 多媒体的处理，这就是为什么树莓派一直作为家庭媒体中心而广受欢迎的原因。树莓派 2 代在某种程度上进行了权衡修改，并将 CPU 的性能进行提升，将树莓派从单核发展成四核 ARM 芯片。而树莓派 4 代将 CPU 和 GPU 的性能都进行了大幅提升。新的 VideoCore VI GPU 支持 4K 视频，并允许通过板子上的两个 Micro HDMI 端口（板子特意保持了和旧有型号相同的尺寸）进行双显示输出，这里要用一个适配器或 Micro HDMI 转 full HDMI 的转换线连接到 HDMI 屏幕。

当你需要同时浏览多个窗口时，需要用到更多的物理显示屏，双显示的好处在此时就得到了绝佳体现。如果你正在编程，你可能会在其中一个屏幕上编写代码，构建网站或应用，而在另一个屏幕上查看数据库、Web 浏览器、电子邮件或其他内容。这是树莓派首次可以不必将开发局限在一台显示器上，从而可以让你在需要时，在不同的屏幕上构建具有不同内容的基于树莓派的项目。
 
该树莓派还有一个显示器串行接口（DSI)，用于驱动另一个特殊的显示-这里并非指另一个监视器本身，而是通过一根挠性电缆连接的官方树莓派触摸屏显示器。

### Raspbian Buster

树莓派 4 发布后，紧接着更新了基于 Debian 的系统 Raspbian Buster，而新的树莓派对 OpenGL ES 3 的支持，使我们在 Raspbian Buster 上为树莓派 4 开发任意软件成为可能。Buster 对界面进行了一些调整，并对很多软件进行了升级，其中包括 Python3.7。

![Raspbian Buster][4]

### 开源图形驱动程序
  
在过去的五年中，Eric Anholt 一直致力于为树莓派编写开源图形驱动程序。现在，Raspbian 可以使用这个驱动程序加速树莓派上的 Web 浏览、桌面图形和 3D 应用，这取代了以前需要的大量闭源代码。非常感谢 Eric 和博通的贡献。

按之前预计，树莓派 4 将于明年完成，但由于芯片设计比预期更早投入生产，树莓派 4 因而可以提早到现在发布。

* * *
  
树莓派 4 已经开始发售，你会选择哪个型号呢？在评论中说出你的想法吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/raspberry-pi-4

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[wahailin](https://github.com/wahailin)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberry-pi-4_lead.jpg?itok=2bkk43om (Raspberry Pi 4 board)
[2]: https://opensource.com/sites/default/files/uploads/raspberry-pi-4-case.jpg (Raspberry Pi 4 case)
[3]: https://opensource.com/sites/default/files/uploads/raspberry-pi-4-usb.jpg (Raspberry Pi 4 USBs)
[4]: https://opensource.com/sites/default/files/uploads/raspbian-buster.png (Raspbian Buster)
