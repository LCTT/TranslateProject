[#]: subject: "Linux Mint Debian Edition 5 – Perfection with Stability [Review]"
[#]: via: "https://www.debugpoint.com/2022/03/linux-mint-debian-edition-5-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Mint Debian Edition 5 – 完美稳定
======
我们对最近发布的 LINUX MINT DEBIAN EDITION 5 (LMDE 5) 的性能、稳定性和用户友好性等方面进行了评审。这里是我们的发现。
在 LMDE 4 (Debbie) 发布两年多的时间后，Linux Mint 团队宣告了 Linux Mint Debian Edition LMDE 5 (LMDE 5) 的发布。LMDE 5 基于 [Debian 11 Bullseye][1] ，它带来了长期支持的 Linux Kernel 5.10 和 Debian 软件包源。除内核版本以外，大多数的应用程序和软件包与Linux Mint 20.3 几乎完全相同。

这意味着, 让我们尽情开始吧。

### Linux Mint Debian Edition 5 概述

我们在现有的较旧的硬件下测试 Linux Mint Debian Edition 5 (LMDE 5)。

  * 英特尔 酷睿 i3 第一代
  * 4GB DDR3 内存条
  * 博通芯片
  * 英伟达® GeForce® 315M
  * 固态硬盘



#### ISO 下载，LIVE 媒介 和 安装

从最新设计的 Linux Mint 网站查找并下载 ISO 文件是很容易的。LIVE 媒介启动正常，安装器图标出现在安装器的桌面中。

LMDE 使用 Debian 安装器的一款修改版本。它不是 Calamares 。普通的 Debian 安装器是很难操作的，有点 [让新用户感到困惑][2] [我的个人观点]。但是，Linux Mint 团队使其只需几个步骤就可以非常容易地安装，并从 Debian 安装器中移除了所有的使人困惑的选项。

你只需要提供位置、键盘布局、姓名和密码，你就准备好来安装了。安装器的分区系统使用 GParted ，它很方便好用。

因此，在我的测试的虚拟机和物理机硬件中，安装过程都运行平稳。

在物理机系统中安装将花费 4 到 5 分钟，而在虚拟机系统中安装将花费 3 分钟。

#### 第一印象

![Linux Mint Debian Edition 5 \(LMDE5\) Desktop][3]

如果你先前就熟悉带有 Cinnamon 桌面环境的 Linux Mint，那么你将不会在 Debian 版本中找到任何的不同。它们是相同的。如果你新来到 Linux Mint 的 Cinnamon 桌面环境，那么在你完成你的安装后，一个极好的干净的桌面会欢迎你。

桌面图标、完美调教过的颜色和主题、底部任务栏、系统托盘 – 一切都配合有序，你能够立刻开始。

不管你使用低端或高端硬件 – Linux Mint Debian edition 都能快速响应和在应用程序中很好地工作。应用程序和整体桌面环境之间无缝地切换响应。

你将获得完美测试过的应用程序和软件包，这将不会破坏 Debian 的稳定性。这意味着不必担心软件包的冲突、缺少更新和 Linux 系统的常见问题。

#### 预安装的应用程序

Linux Mint (不仅仅是 Debian 版本) 的一个优势是它的预加载的应用程序。很多 Linux 发行版在 ISO 安装器中没有包含必要的应用程序，因为一些原因，例如 ISO 文件的大小等等。

但是，Linux Mint 团队全心全意为它们的用户考虑，并打包你们所需要的所有的应用程序。这照顾到了大多数用户的基本需求。它有助于减少最终用户在安装 Linux Mint Debian Edition 5 后在搜索和安装兼容性应用程序方面的负担。

[][4]

请参考: Zorin OS 16 Lite 概述 - 美丽、性能和简洁的完美组合

例如，在 Linux Mint Debian Edition 5 中，已默认安装下面的必备软件，随时待用。

  * 绘图:Pencil
  * 多媒体: Celluloid media player, Hypnotix, Rythmbox
  * Torrent 客户端:Transmission 3.0
  * 完整的办公套件: LibreOffice 7.0
  * Email客户端: Thunderbird 91.0
  * 网络浏览器: Firefox 97.0



这不是所有。对于下面的所有的具体使用情况，你都会得到一个专用的本机应用程序。


用户无需为这些应用寻找单独的应用程序。

  * 屏幕截图和屏幕保护程序
  * 减少眼睛疲劳的工具
  * USB 格式化工具和镜像写入器
  * 便签
  * Synaptic 软件包管理器
  * 系统备份和恢复程序
  * 防火墙使用程序



#### LMDE5 的性能表现怎么样?

查看一个发行版的预期性能表现总是令人感兴趣的。Linux Mint Debian Edition 5 的性能表现远远超出预期。

在空闲状态下，它消耗 750 MB 的 RAM 和 2% 的 CPU 。

![Performance During the light workload][5]

接下来，我使用下面的工作内容来完成繁重的工作负载。

  * Firefox （附带有打开的三个标签页，其中一个播放 YouTube 视频）
  * LibreOffice Calc（打开一个表格）
  * 绘图应用程序（附带有一个实例）
  * 设置
  * 一个终端窗口
  * 文件管理器



随着上述的工作负载，它消耗了大约 1.5 GB 的 RAM 和 14% 的 CPU 。显然，Firefox 消耗了大部分的资源。

![Performance During heavy workload][6]

在我看来，对于较旧的硬件来说，它完美地平衡量化和优化资源消耗。上述的量化是在物理机系统上测量的。

#### 网络链接

因为网络链接是任意操作系统的不可或缺的一部分。所以，Linux Mint Debian Edition 5 能够链接到 WiFi (使用一款老旧的 Broadcom 芯片) 和链接到蓝牙扬声器（不需任意的额外调整）。

在我的测试期间，音量控制与蓝牙守护进程一起工作地很好。

此外，我们也测试了 USB 接口设备的热插拔，它们被自动侦测和挂载而没有遇到任何问题。

因此，这没有让人感到意外，这是意料之中的。

### 一些错误?

我在测试期间没有遇到任何错误。一切都很好地工作。

但是当我关闭我的物理测试系统的笔记本盖板时，我发现一个错误。在它进入待机状态后，不能将其唤醒。我不能看到登录屏幕。没有任何光标的黑屏。我必需重新启动来进入系统。

它可能是我测试设备上的特定硬件设备的问题。我相信它不会在新的硬件系统上有任何的问题。

### 总结

总结一下 Linux Mint Debian Edition 5 的评审，它显然是最稳定、最优化的 Linux 发行版。如果你计划在未来两年或更长的时间段内使用一款用于日常驱动的系统，你可以信赖这个版本。因此，如果你需要一款非基于 Ubuntu 的稳定的、快速的、低维护率的系统，并针对你的旧系统或新系统来长期运行日常驱动，这会是一个完美的选择。请试试。

你可以 [在官方网站上][7] 下载 Linux Mint Debian Edition 5 。

谢谢。

* * *

我们带来最新的科技、软件新闻和重要的题材。通过 [Telegram][8]、[Twitter][9]、[YouTube][10] 和 [Facebook][11] 保持联系、不错过一次更新!

##### 请参考

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/03/linux-mint-debian-edition-5-review/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2021/05/debian-11-features/
[2]: https://www.debugpoint.com/2021/01/install-debian-buster/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/03/Linux-Mint-Debian-Edition-5-LMDE5-Desktop-1024x580.jpg
[4]: https://www.debugpoint.com/2021/12/zorin-os-16-lite-review-xfce/
[5]: https://www.debugpoint.com/wp-content/uploads/2022/03/Performance-During-light-workload-1024x606.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/03/Performance-During-heavy-workload-1024x601.jpg
[7]: https://linuxmint.com/edition.php?id=297
[8]: https://t.me/debugpoint
[9]: https://twitter.com/DebugPoint
[10]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[11]: https://facebook.com/DebugPoint
