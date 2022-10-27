[#]: subject: "Linux Mint Debian Edition 5 – Perfection with Stability [Review]"
[#]: via: "https://www.debugpoint.com/2022/03/linux-mint-debian-edition-5-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14467-1.html"

Linux Mint Debian Edition（LMDE） 5 – 完美稳定
======

![](https://img.linux.net.cn/data/attachment/album/202204/13/132621gz9v9c49k349ebe4.jpg)

> 我们对最近发布的 Linux Mint Debian Edition 5（LMDE 5）的性能、稳定性和用户友好性等方面进行了评测。这里是我们的发现。

在 Linux Mint Debian Edition LMDE 4（Debbie）发布两年多后，Linux Mint 团队宣告了 Linux Mint Debian Edition LMDE 5（LMDE 5）的发布。LMDE 5 基于 [Debian 11 Bullseye][1] ，它带来了长期支持的 Linux 内核 5.10 和 Debian 软件包源。除内核版本以外，大多数的应用程序和软件包与 Linux Mint 20.3 几乎完全相同。

让我们深入了解一下。

### LMDE 5 评测

我们测试 Linux Mint Debian Edition 5（LMDE 5）是在现有的较旧的硬件下：

  * 英特尔酷睿 i3 第一代
  * 4GB DDR3 内存
  * 博通芯片
  * 英伟达® GeForce® 315M
  * 固态硬盘

#### ISO 下载、现场介质和安装

从新设计的 Linux Mint 网站找到并下载 ISO 文件是很容易的。<ruby>现场介质<rt>Live media</rt></ruby>启动很顺利，通过桌面上的安装图标启动了安装程序。

LMDE 使用的一款修改版的 Debian 安装器。它不是 Calamares 。普通的 Debian 安装器是很难操作的，[在我看来] 有点 [让新用户感到困惑][2] 。但是，Linux Mint 团队使其非常容易安装，只需几个步骤，并从 Debian 安装器中移除了所有使人困惑的选项。

你只需要提供安装位置、键盘布局、名字和密码，就可以开始安装了。安装器的分区系统使用 GParted ，它很方便好用。

因此，在我的测试的虚拟机和物理机硬件中，安装过程都很顺利。

在物理机系统中安装花费了 4 到 5 分钟，而虚拟机系统中的安装时间约为 3 分钟。

#### 第一印象

![Linux Mint Debian Edition 5 \(LMDE5\) Desktop][3]

如果你熟悉 Linux Mint 早期的 Cinnamon 桌面，那么你不会在这个 Debian 版本中找到什么不同。它们是一样的。如果你是第一次使用 Linux Mint 的 Cinnamon 桌面环境，那么在你完成你的安装后，你会看到一个漂亮而干净的桌面。

桌面图标、完美调整过的颜色和主题、底部任务栏、系统托盘，这一切都配合有序，让你能够立刻上手。

不管你使用低端还是高端的硬件，LMDE 都能快速响应，应用程序能够很好的工作。应用程序的切换和整体桌面的响应都很可靠。

你得到的是经过良好测试的应用程序和软件包，而基于 Debian 的稳定性，很少会出现故障。这意味着不必担心软件包的冲突、更新缺失，以及 Linux 系统的常见问题。

#### 预装的应用程序

Linux Mint（不仅仅是 Debian 版本）的优势之一是它的预装的应用程序。许多 Linux 发行版由于 ISO 大小等原因，在 ISO 安装程序中不包括必要的应用程序。

但是，Linux Mint 团队全心全意为它们的用户考虑，打包了所有你需要的必要应用程序。这照顾到了大多数用户的需求。它有助于减少最终用户在安装 LMDE 5 后搜索和安装兼容应用程序方面的负担。

例如，在 LMDE 5 中，已默认安装下面的必备软件，随时待用：

  * 绘图应用
  * 多媒体：Celluloid 媒体播放器、Hypnotix、Rythmbox
  * Torrent 客户端：Transmission 3.0
  * 完整的办公套件：LibreOffice 7.0
  * Email 客户端：Thunderbird 91.0
  * 网页浏览器：Firefox 97.0

这不是所有。对于下面的所有的具体使用情况，你都会得到一个专门的原生应用程序。用户不需要为这些寻找一个单独的应用程序：

  * 屏幕截图和屏幕保护程序
  * 减少眼睛疲劳的工具
  * USB 格式化工具和镜像写入器
  * 便签
  * Synaptic 软件包管理器
  * 系统备份和恢复
  * 防火墙工具

#### LMDE5 的性能表现怎么样?

看到一个发行版按照预期的表现，总是令人感兴趣的。而 LMDE 5 的性能表现远超预期。

在空闲状态下，它消耗 750 MB 的内存和 2% 的 CPU 。

![Performance During the light workload][5]

接下来，我使用下面的任务让它完成繁重的工作负载：

  * Firefox（打开三个标签页，其中一个播放 YouTube 视频）
  * LibreOffice Calc（打开一个表格）
  * 绘图应用程序（打开一个实例）
  * 设置
  * 一个终端窗口
  * 文件管理器

在上述的工作负载中，它消耗了大约 1.5 GB 的内存和 14% 的 CPU 。显然，大部分的资源都被 Firefox 消耗了。

![Performance During heavy workload][6]

在我看来，这是一个完美的指标，而且对旧硬件进行了很好的优化分配。上述指标是在物理机系统上测量的。

#### 连接性

连接性是任何操作系统的不可或缺的一部分。LMDE 5 能够连接到 Wi-Fi（使用一款老旧的博通芯片）和连接到蓝牙音箱，而不需任意的额外调整。

在我的测试期间，音量控制与蓝牙守护进程配合得很好。

此外，我们也测试了 USB 接口设备的热插拔，它们可以自动侦测和挂载，而没有遇到任何问题。

所以，没有什么意外，这也是意料之中的。

### 有什么错误吗？

我在测试期间没有遇到任何错误。一切都运行良好。

但是当我关闭我的物理测试系统的笔记本盖板时，我发现一个错误。在它进入待机状态后，不能将其唤醒。我无法看到登录屏幕，屏幕是黑色的，没有任何光标。我必须因重启才能进入系统。

这可能是我测试设备上的特定硬件设备的问题。我相信它在新的硬件系统上不会有任何的问题。

### 总结

总结一下 LMDE 5 的评测，它显然是最稳定、最优化的 Linux 发行版。如果你计划在未来两年或更长的时间段内使用一款用于日常用途的系统，你可以信赖这个版本。因此，如果你需要一款非基于 Ubuntu 的稳定的、快速的、低维护率的长期日用系统，并运行在你的旧机器或新机器上，这会是一个完美的选择。请试试。

你可以 [在官方网站上][7] 下载 LMDE 5 。

感谢阅读。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/03/linux-mint-debian-edition-5-review/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

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
