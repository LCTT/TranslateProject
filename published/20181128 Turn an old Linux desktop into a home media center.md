[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (Turn an old Linux desktop into a home media center)
[#]: via: (https://opensource.com/article/18/11/old-linux-desktop-new-home-media-center)
[#]: author: ([Alan Formy-Duval](https://opensource.com/users/alanfdoss))
[#]: url: (https://linux.cn/article-10446-1.html)

将旧的 Linux 台式机变成家庭媒体中心
======

> 重新利用过时的计算机来浏览互联网并在大屏电视上观看视频。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/migration_innovation_computer_software.png?itok=VCFLtd0q)

我第一次尝试搭建一台“娱乐电脑”是在 20 世纪 90 年代后期，使用了一台带 Trident ProVidia 9685 PCI 显卡的普通旧台式电脑。我使用了所谓的“电视输出”卡，它有一个额外的输出可以连接到标准电视端子上。屏幕显示看起来不太好，而且没有音频输出。并且外观很丑：有一条 S-Video 线穿过了客厅地板连接到我的 19 英寸 Sony Trinitron CRT 电视机上。

我在 Linux 和 Windows 98 上得到了同样令人遗憾的结果。在和那些看起来不对劲的系统挣扎之后，我放弃了几年。值得庆幸的是，如今的 HDMI 拥有更好的性能和标准化的分辨率，这使得廉价的家庭媒体中心成为现实。

我的新媒体中心娱乐电脑实际上是我的旧 Ubuntu Linux 桌面，最近我用更快的电脑替换了它。这台电脑在工作中太慢，但是它的 3.4GHz 的 AMD Phenom II X4 965 处理器和 8GB 的 RAM 足以满足一般浏览和视频流的要求。

以下是我让旧系统在新角色中发挥最佳性能所采取的步骤。

### 硬件

首先，我移除了不必要的设备，包括读卡器、硬盘驱动器、DVD 驱动器和后置 USB 卡，我添加了一块 PCI-Express 无线网卡。我将 Ubuntu 安装到单个固态硬盘 （SSD） 上，这可以切实提高任何旧系统的性能。

### BIOS

在 BIOS 中，我禁用了所有未使用的设备，例如软盘和 IDE 驱动器控制器。我禁用了板载显卡，因为我安装了带 HDMI 输出的 NVidia GeForce GTX 650 PCI Express 显卡。我还禁用了板载声卡，因为 NVidia 显卡芯片组提供音频。

### 音频

Nvidia GeForce GTX 音频设备在 GNOME 控制中心的声音设置中被显示为 GK107 HDMI Audio Controller，因此单条 HDMI 线缆可同时处理音频和视频。无需将音频线连接到板载声卡的输出插孔。

![Sound settings screenshot][2]

*GNOME 音频设置中的 HDMI 音频控制器。*

### 键盘和鼠标

我有罗技的无线键盘和鼠标。当我安装它们时，我插入了两个外置 USB 接收器，它们可以使用，但我经常遇到信号反应问题。接着我发现其中一个被标记为联合接收器，这意味着它可以自己处理多个罗技输入设备。罗技不提供在 Linux 中配置联合接收器的软件。但幸运的是，有个开源程序 [Solaar][3] 能够做到。使用单个接收器解决了我的输入性能问题。

![Solaar][5]

*Solaar 联合接收器界面。*

### 视频

最初很难在我的 47 英寸平板电视上阅读文字，所以我在 Universal Access 下启用了“大文字”。我下载了一些与电视 1920x1080 分辨率相匹配的壁纸，这看起来很棒！

### 最后处理

我需要在电脑的冷却需求和我对不受阻碍的娱乐的渴望之间取得平衡。由于这是一台标准的 ATX 微型塔式计算机，我确保我有足够的风扇转速，以及在 BIOS 中精心配置过的温度以减少噪音。我还把电脑放在我的娱乐控制台后面，以进一步减少风扇噪音，但同时我可以按到电源按钮。

最后得到一台简单的、没有巨大噪音的机器，而且只使用了两根线缆：交流电源线和 HDMI。它应该能够运行任何主流或专门的媒体中心 Linux 发行版。我不期望去玩高端的游戏，因为这可能需要更多的处理能力。

![Showing Ubuntu Linux About page onscreen][7]

*Ubuntu Linux 的关于页面。*

![YouTube on the big screen][9]

*在大屏幕上测试 YouTube 视频。*

我还没安装像 [Kodi][10] 这样专门的媒体中心发行版。截至目前，它运行的是 Ubuntu Linux 18.04.1 LTS，而且很稳定。

这是一个有趣的挑战，可以充分利用我已经拥有的东西，而不是购买新的硬件。这只是开源软件的一个好处。最终，我可能会用一个更小，更安静的带有媒体中心的系统或其他小机顶盒替换它，但是现在，它很好地满足了我的需求。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/old-linux-desktop-new-home-media-center

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[2]: https://opensource.com/sites/default/files/uploads/soundsettings.png (Sound settings screenshot)
[3]: https://pwr.github.io/Solaar/
[5]: https://opensource.com/sites/default/files/uploads/solaar_interface.png (Solaar)
[7]: https://opensource.com/sites/default/files/uploads/finalresult1.png (Showing Ubuntu Linux About page onscreen)
[9]: https://opensource.com/sites/default/files/uploads/finalresult2.png (YouTube on the big screen)
[10]: https://kodi.tv/
