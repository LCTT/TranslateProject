[#]: subject: "CrunchBang++ Linux – The Ultimate Lightweight and Stable Linux Distribution"
[#]: via: "https://www.debugpoint.com/2022/04/crunchbang-linux-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14454-1.html"

CrunchBang++ Linux —— 极致轻量和稳定的 Linux 发行版本
======

> 我们来对基于 Debian 的、由 Openbox 驱动的轻量级 Linux 发型版本 Crunchbang++ Linux 进行了评测，并为你提供了如何使用它的指导。

CrunchBang 项目已经停止维护，CrunchBang++ Linux 是这个独特的项目的继承者。早期的 CrunchBang Linux 很受欢迎，因为它使用非常少的系统资源，对低端硬件也很友好。而 CrunchBang++ 也有一个 32 位的安装程序（现在很少见），可以在过时的硬件或 PC 上正常运行。

在我们之前介绍 [顶级轻量级 Linux 发行版][1] 的文章中，有读者评论想让我们介绍 CrunchBang++。因此，我们想从性能、无障碍访问和其他因素等方面对这个超级轻量级的 Linux 发行版做一个深入的研究。让我们深入了解一下。

### CrunchBang++ Linux 测评

![CrunchBang++ Linux Desktop with Openbox][2]

#### 现场介质和安装

目前为止，CrunchBang++ 基于最新的 Debian 11 Bullseye，并提供 32 位和 64 位 ISO 变体。你可以从其 [官方网站][3] 下载。本文中，我们使用 64 位的安装程序，其大小为 1.6 GB，与当今流行的 Linux 发行版的 ISO 大小相比，是很小的。例如，最新的 Ubuntu 64 位桌面 ISO 就很大，已经超过了 3.2 GB。

安装程序的启动菜单提供了测试<ruby>现场镜像<rt>Live Image</rt></ruby>和启动安装程序的选项。你可以先从现场镜像开始。但是，你不能从现场介质安装！相反，你必须再次启动并选择重新安装选项。<ruby>现场桌面<rt>Live desktop</rt></ruby>的用户 ID 和密码都是 “live”。

![Installation in the boot menu][4]

在物理机和虚拟机（[virt-manager][5]）上的安装都很顺利。CrunchBang++ 使用 Debian 的原生安装程序，这有点复杂。但你可以按照屏幕上的指示轻松地安装它。如果你不熟悉 Debian 安装程序，你可以参照我们的 [Debian 安装指南][6]。

在虚拟机和物理系统上安装过程平均需要约 5 到 10 分钟。

#### 桌面初窥

CrunchBang++ 给你经典的 Openbox 窗口管理器体验。登录屏幕出乎意料的干净和完美，只有输入凭证的选项。

如果你是第一次运行它，有一个欢迎脚本会引导你检查网速，更新你的系统，等等。

![The welcome script][7]

Openbox 本身是快速和干净的。桌面以其预先配置的 SBPP Openbox 主题带来了一个整洁的外观，其组件如下：

  * [gmrun][8]：一个轻量的应用程序启动器
  * [Tint2][9]：桌面顶层的控制面板
  * [dmenu][10]：动态菜单系统

你可以通过右键菜单的简单配置选项来配置它们。

默认情况下，可以通过顶部面板切换两个工作区。顶部面板也有基本的托盘图标以满足你的需要。

  * 音量控制
  * 网络连接
  * 语言工具
  * 电量监控
  * 剪贴板管理

作为一个窗口管理器，这里没有应用程序视图。但有了 gmrun 应用程序启动器，启动任何应用程序都超级容易。当你需要启动任何应用程序时，Openbox 右键菜单会给你所有的选项。

#### 无障碍访问和应用程序

CrunchBang++ 只包括最低限度的应用程序，以保持 ISO 和安装的轻便。以下是预装的应用程序。

  * GIMP
  * Thunar 文件管理器
  * Catfish 文件搜索
  * Gnumeric
  * VLC 媒体播放器
  * Filezilla
  * 远程桌面客户端
  * Transmission Torrent 客户端
  * Screenshot 工具
  * Geany 文本编辑器

强大的 Synaptic 软件包管理器会满足你所有的软件需求。LibreOffice 不是默认安装的，所以你需要单独安装它。没有用于集中设置的工具，所以有时你可能会觉得缺少一个设置管理器。

#### 性能和资源占用情况

CrunchBang++ 的性能对于轻量级发行版来说是完美的。

这个发行版使用了 585 MB 的内存，空闲状态下 CPU 占用为 1%。如果你让系统在非活动状态下运行一个小时或更长时间，内存占用会进一步减少到 350 MB 左右。这是一个令人印象深刻的指标。

![Performance During Idle State][12]

为了测试重压工作负载，我们在 CrunchBang++ 中打开了以下应用程序的一个实例：

  * Firefox 两个标签页
  * Thunar 文件管理器
  * GIMP
  * Gnumeric
  * 文本编辑器
  * 终端
  * Catfish 文件搜索

整个工作负载占用内存 1.07 GB，CPU 占用为 5% - 7%。

这个发行版的默认安装占用了 4 GB 的硬盘空间。

![Performance During Heavy workload State][13]

#### 连接性

我们对它进行了下面列出的各种连接性测试。除了蓝牙，它通过了每一项测试。

  * Wi-Fi 检测和连接 —— 完美通过测试
  * 它在多个显示器和分辨率配置下能正确工作（由于有预装的 ARandR）
  * 自动检测 USB（即使在虚拟机模式下） —— 正常通过测试

没有用于蓝牙的启用、发现和连接的工具（有点像 Xfce 桌面）。所以，如果你安装一个实用程序，你应该都能搞定。

#### CrunchBang++ 的一些缺点

在我看来，这个 Linux 发行版应该由有一些经验的用户来使用，他们在 Linux 中遇到的问题一般都能通过查阅资料解决，并且在需要时也能自如地使用终端。

我还发现了一些我认为默认安装需要（而没有安装）的项目。在这个发行版中没有办法配置鼠标、键盘。没有预装任何工具。然而，你可以通过终端对它们进行调整。你可能需要安装额外的应用程序来配置这些。

在“最近使用的应用程序”的右键菜单和 Nitrogen 壁纸更换器中有些错误。然而，对于你的日常使用来说，它们并不是一个障碍。

所以，总的来说，我认为它很稳定，尽管有所缺失，但可以很好地工作。

### 总结

在结束对 CrunchBang++ 的测评时，我不得不说它是一个高效和实用的 Linux 发行版。它可能不是一个闪闪发光的桌面，但它是一个稳定的、生产级的 Linux 发行版，可以在任何硬件上运行。你可以很容易地把它作为你的日常使用系统，并在不用重装你的整个系统的情况下使用它多年。CrunchBang++ 是贡献者们创造出的伟大的软件。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/crunchbang-linux-review/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

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
