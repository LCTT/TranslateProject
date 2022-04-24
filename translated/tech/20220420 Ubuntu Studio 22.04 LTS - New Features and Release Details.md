[#]: subject: "Ubuntu Studio 22.04 LTS – New Features and Release Details"
[#]: via: "https://www.debugpoint.com/2022/04/ubuntu-studio-22-04-lts/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu Studio 22.04 LTS - 新功能和发布细节
======
Ubuntu Studio 22.04 LTS “JAMMY JELLYFISH” 的新特性和增强功能列表

[Ubuntu Studio][1] 是 Ubuntu 的官方版本，专门为那些主要从事照片、音频和视频工作的创作者服务。这个官方发行版在其 ISO 镜像中预装了几乎所有流行的开源创意软件，为你提供了一个现成而稳定的系统来启动你的专业工作。

![Ubuntu Studio 22.04 LTS Desktop][2]

### Ubuntu Studio 22.04 LTS - 新功能

像所有的 Ubuntu 官方版本一样，Ubuntu Studio 22.04 LTS 基于 [Ubuntu 22.04 LTS “JAMMY JELLYFISH”][3]。Linux Kernel 5.15 LTS 为 Ubuntu Studio 22.04 提供支持，这是一个稳定的内核，适合目前所有的现代硬件阵容。

大多数创造性的工作通常发生在高端和现代的机器上；因此内核版本在 Ubuntu Studio 中是很重要的。[Linux Kernel 5.15 LTS][4] 支持英特尔和 AMD 当前的 CPU 和 GPU 阵容。例如，这个内核带来了用于高带宽 I/O 操作的 AMD PTDMA 驱动和更多的基本更新，这对现代硬件的创造性工作非常重要。

除此之外，定制的 [KDE Plasma 5.24][5] 和 KDE Framework 5.92 带来了友好的用户界面和 Ubuntu Studio 的本地深色主题和图标主题。KDE Plasma 桌面被调整为带有快捷方式和必要的系统托盘部件的顶部面板，使所有的专业工作更加流畅。

此外，如果你从 Ubuntu Studio 20.04 LTS Focal Fossa 迁移到这个版本，KDE Plasma 是用户将体验到的一个新桌面。因为 Ubuntu Studio 20.04 LTS 是最后一个带有 Xfce 桌面环境的版本。而从那时起，Ubuntu Studio 已经转向了 KDE Plasma 桌面环境，以获得更好的现代技术和性能支持。

#### 应用栈

Ubuntu Studio 22.04 LTS 的应用栈带来了最新的稳定版本。Studio Controls（Ubuntu Studio 的本地控制中心）提升到了 2.3.0 版本，改进了混音器和插件，并修复了错误。

![Studio Controls][6]

除此之外，图形、视频和音频软件套件也都更新了它们的最新稳定版本。此外，如果你和上一个 LTS 版本做一个功能对比，你可能会注意到功能和改进的大规模升级。主要是针对 Blender、KDenlive 和 Ardour，因为这些超级令人印象深刻的开源应用在开发中非常活跃。

然而，这并不是我们在这里列出的主要的完整清单。

  * Blender v3.0.1 （3D 计算机图形）
  * KDenlive v21.12.3 （视频编辑）
  * Krita v5.0.2 （光栅图形绘制和动画）
  * Gimp v2.10.24 （光栅图形绘制）
  * Ardour v6.9 （[数字音频工作站][8]）
  * Scribus v1.5.7 （桌面出版）
  * Darktable v3.6.0 （RAW 图像和照片管理）
  * Inkscape v1.1.2 （矢量图形编辑器）
  * Carla v2.4.2 （音频插件主机）
  * Studio Controls v2.3.0 （音频管理和控制）
  * OBS Studio v27.2.3 （流媒体应用）
  * MyPaint v2.0.1 （简单绘画）



此外，Jammy Jellyfish 的重大变化之一是引入了 [Pipewire][9] 0.3.48（与 Focal Fossa 相比）。这种现代音频和视频流服务器技术将帮助许多用户进行高级音频控制。但它可能需要命令行的调整来管理它。我不确定 Studio 团队未来是否会在 Studio 控制工具中带来额外的设置来管理 Pipewire。

最后，Ubuntu Studio 团队新设计的标志与 Canonical 的品牌形象相一致，看起来令人印象深刻，在这个版本中非常突出。

![Ubuntu Studio New Logo][10]

### 下载和升级

上述所有的应用使得 Ubuntu Studio 22.04 LTS 的 ISO 大小达到了惊人的 4GB 以上（它不能装在一张 DVD里 ，要用 USB）。如果你想试试，你可以使用下面的链接下载 BETA 镜像。

[ubuntustudio-22.04-beta-dvd-amd64.iso][11]

[ubuntustudio-22.04-beta-dvd-amd64.iso.torrent][12] （Torrent）

如果你打算从 Ubuntu Studio 20.04 LTS 升级到这个新版本，需要注意一下。由于桌面环境从 Xfce 变为 KDE Plasma，你不应该从 Ubuntu Studio 20.04 LTS 升级到 Ubuntu 22.04 LTS。它不被支持。

相反，你应该进行全新的安装。重新安装可能会有点复杂和挑战，因为你已经在系统中设置了许多插件、设置和建立了音频和视频工作的工作流程。但我还是建议你这样做，因为这样可以让你在 Ubuntu Studio 22.04 LTS 中清理一下，然后用一套新的应用和桌面环境重新开始。

_来自[发布说明][13]。_

_专题图片由 Unsplash 上的 [Milad Fakurian][14] 拍摄。_


* * *

我们带来最新的技术、软件新闻和重要的东西。通过 [Telegram] 保持联系！

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/ubuntu-studio-22-04-lts/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi]（https://github.com/geekpi）
校对：[校对者ID]（https://github.com/校对者ID）

本文由 [LCTT]（https://github.com/LCTT/TranslateProject） 原创编译，[Linux中国]（https://linux.cn/） 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://ubuntustudio.org/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Ubuntu-Studio-22.04-LTS-Desktop-1024x631.jpg
[3]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[4]: https://www.debugpoint.com/2021/11/linux-kernel-5-15/
[5]: https://www.debugpoint.com/2022/03/kde-plasma-5-24-review/
[6]: https://www.debugpoint.com/wp-content/uploads/2022/04/Studio-Controls-1024x453.jpg
[8]: https://www.debugpoint.com/2018/08/3-best-daw-digital-audio-workstation-apps-ubuntu-linux/
[9]: https://gitlab.freedesktop.org/pipewire/pipewire
[10]: https://www.debugpoint.com/wp-content/uploads/2022/04/Ubuntu-Studio-New-Logo.jpg
[11]: https://cdimage.ubuntu.com/ubuntustudio/releases/22.04/beta/ubuntustudio-22.04-beta-dvd-amd64.iso
[12]: https://cdimage.ubuntu.com/ubuntustudio/releases/22.04/beta/ubuntustudio-22.04-beta-dvd-amd64.iso.torrent
[13]: https://ubuntustudio.org/ubuntu-studio-22-04-lts-release-notes/
[14]: https://unsplash.com/@fakurian
[15]: https://t.me/debugpoint
[16]: https://twitter.com/DebugPoint
[17]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[18]: https://facebook.com/DebugPoint
