[#]: subject: "CrunchBang++ Linux – The Ultimate Lightweight and Stable Linux Distribution"
[#]: via: "https://www.debugpoint.com/2022/04/crunchbang-linux-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

CrunchBang++ Linux —— 极致轻量和稳定的 Linux 发行版本
======
**我们来回顾下基于 Debian 的、由 Openbox 驱动的轻量级 Linux 发型版本 Crunchbang++ Linux，并指导你如何使用它。**
CrunchBang++ Linux 是已停止维护的 CrunchBang 项目的继承者。早期的 CrunchBang Linux 很受欢迎，因为它使用非常少的系统资源，对低端硬件也很友好。CrunchBang++ 也有一个 32 位的安装程序（现在很少见），可以在过时的硬件或 PC 上正常运行。

在我们之前的文章 [顶级轻量级Linux发行版][1] 中，有读者评论想让我们介绍 CrunchBang++。因此，我们想从性能、可访问性和其他因素等方面对这个超级轻量级的 Linux 发行版做一个深入的研究。让我们深入了解一下。

### CrunchBang++ Linux 回顾

![CrunchBang++ Linux Desktop with Openbox][2]

#### LIVE 媒体和安装

目前为止，CrunchBang++ 基于最新的 Debian 11 Bullseye，并提供 32 位和 64 位 ISO 程序。你可以从 [官方网站][3] 下载。本文中我们使用 64 位的安装程序。64 位安装程序的大小为 1.6 GB，与当今流行的 Linux 发行版的 ISO 大小相比，是很小的。例如，最新的 Ubuntu 64 位桌面 ISO 就很大，已经超过了 3.2 GB。

安装程序的启动菜单提供了测试 LIVE 镜像和启动安装的选项。你可以先从 LIVE 镜像开始。但是，你不能从媒体安装 LIVE！相反，你必须再次启动并选择安装选项。Live 桌面的用户 ID 和密码都是  "live"。

![Installation in the boot menu][4]

在物理机和虚拟机（[virt-manager][5]）上的安装都很顺利。CrunchBang++ 使用 Debian 的原生安装程序，这有点复杂。但你可以按照屏幕上的指示轻松地安装它。如果你不熟悉 Debian 安装程序，你可以参照我们的 [Debian 安装指南][6]。

在虚拟机和物理系统上安装过程平均需要约 5 到 10 分钟。

#### 桌面初窥

CrunchBang++ 给你经典的 Openbox 窗口管理器体验。登录屏幕出乎意料的干净和完美，只有输入凭证的选项。

如果你是第一次运行它，一个欢迎脚本会引导你检查网速，更新你的系统，等等。

![The welcome script][7]

The Openbox itself is fast and clean. The desktop brings a clean look with its pre-configured SBPP Openbox theme with the following components –

Openbox 本身是快速和干净的。桌面以其预先配置的 SBPP Openbox 主题带来了一个整洁的外观，其组件如下：

  * [gmrun][8] 一个轻量的应用程序启动器
  * [Tint2][9] 桌面顶层的控制面板
  * [dmenu][10] 动态菜单系统



你可以通过右键菜单的简单配置选项来配置它们。
默认情况下，可以通过顶部面板切换两个工作区。顶部面板也有基本的托盘图标以满足你的需要。

  * 音量控制
  * 网络连接
  * 语言工具
  * 电量监控
  * 粘贴板管理



作为一个窗口管理者，你没有一个应用程序视图。但有了 gmrun 应用程序启动器，启动任何应用程序都超级容易。当你需要启动任何应用程序时，Openbox 右键菜单会给你所有的选项。

#### 可用的应用程序

CrunchBang++ 只包括最低限度的应用程序，以保持 ISO 和安装的轻便。以下是预装的应用程序。

  * GIMP
  * Thunar 文件管理器
  * Catfish 文件搜索
  * Gnumeric
  * VLC Media Player
  * Filezilla
  * 远程桌面客户端
  * Transmission Torrent Client
  * Screenshot 工具
  * Geany 文本编辑



[][11]

请参照：基于最新的 Deepin 桌面的发行版本 ExTiX 21.1

强大的 Synaptic 软件包管理器会满足你所有的软件需求。LibreOffice 不是默认安装的，所以你需要单独安装它。没有用于集中设置的工具，所以有时你可能会觉得缺少一个设置管理器。

#### 性能和资源占用情况

CrunchBang++ 的性能对于轻量级发行版来说是完美的。

这个发行版使用 585 MB 的 RAM，空闲状态下 CPU 为 1%。如果你让系统在非活动状态下运行一个小时或更长时间，RAM 会进一步减少到 350 MB 左右。这是一个令人印象深刻的指标。

![Performance During Idle State][12]

为了测试繁重的工作负载，我们在 CrunchBang++ 中打开了以下应用程序的一个实例：

  * Firefox 两个标签页
  * Thunar 文件管理器
  * GIMP
  * Gnumeric
  * 文本编辑器
  * 终端
  * Catfish 文件搜索



整个工作负载占用 RAM 1.07 GB，CPU 占用为 5% - 7%。

这个发行版的默认安装占用 4 GB 的硬盘空间。

![Performance During Heavy workload State][13]

#### 连接

我们对它进行了下面列出的各种连接性测试。除了蓝牙，它通过了每一项测试。

  * Wifi 探测和连接 —— 完美通过测试
  * 它在多个显示器和分辨率配置下能正确对齐（由于有预装的 ARandR）
  * 自动探测 USB（即使在虚拟机模式下） —— 正常通过测试



没有任何实用程序可用于蓝牙的启用、发现和连接（有点像 Xfce 桌面）。所以，如果你安装了一个实用程序，你应该都能搞定。

#### CrunchBang++ 的一些缺点

在我看来，这个 Linux 发行版应该由没有什么经验的用户来使用，他们在 Linux 中一般都能通过查阅资料解决错误，并且在需要时能自如地使用终端。

我还发现了一些我认为是默认安装（而没有安装）的。在这个发行版中没有办法配置鼠标、键盘。没有预装任何工具。然而，你可以通过终端对它们进行调整。你可能需要安装额外的应用程序来配置这些。

在最近的应用程序的右键菜单和 Nitrogen 壁纸更换器中有些 bug。然而，对于你的日常使用来说，它们并不是一个障碍。

所以，总的来说，我认为它很稳定，尽管有缺失，但可以很好地工作。

### 概括和总结

在结束对 CrunchBang++ 的回顾时，我不得不说它是一个高效和实用的 Linux 发行版。它可能不是一个闪闪发光的桌面，但它是一个稳定的、生产级的 Linux 发行版，可以在任何硬件上运行。你可以很容易地把它作为你的日常驱动，并在不格式化你的整个系统的情况下使用它多年。CrunchBang++ 是贡献者们创造出的伟大的软件。

* * *

我们可以带来最新的技术、软件新闻和重要的东西。通过 [Telegram][14]、[Twitter][15]、[YouTube ][16]和 [Facebook][17] 与我们保持联系，不要错过任何更新！

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/crunchbang-linux-review/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2022/03/lightweight-linux-distributions-2022/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/CrunchBang-Linux-Desktop-with-Openbox-1024x576.jpg
[3]: https://crunchbangplusplus.org/
[4]: https://www.debugpoint.com/wp-content/uploads/2022/04/Installation-in-boot-menu.jpg
[5]: https://www.debugpoint.com/2020/11/virt-manager/
[6]: https://www.debugpoint.com/2021/01/install-debian-buster/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/04/The-welcome-script.jpg
[8]: https://github.com/WdesktopX/gmrun
[9]: https://gitlab.com/o9000/tint2
[10]: https://tools.suckless.org/dmenu/
[11]: https://www.debugpoint.com/2021/01/extix-21-1-review/
[12]: https://www.debugpoint.com/wp-content/uploads/2022/04/Performance-During-Idle-State.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/04/Performance-During-Heavy-workload-State.jpg
[14]: https://t.me/debugpoint
[15]: https://twitter.com/DebugPoint
[16]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[17]: https://facebook.com/DebugPoint
