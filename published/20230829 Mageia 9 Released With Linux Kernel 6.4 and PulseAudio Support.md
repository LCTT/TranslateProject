[#]: subject: "Mageia 9 Released With Linux Kernel 6.4 and PulseAudio Support"
[#]: via: "https://news.itsfoss.com/mageia-9-released/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16144-1.html"

Mageia 9 发布：搭载 Linux 内核 6.4，支持 PulseAudio
======

![][0]

> 最新的 Mageia 主要版本已经推出，赶快来试试看吧。

Mageia 最初是 [Mandriva Linux][1] 的一个分支，但现在已经发展成全面的 [独立 Linux 发行版][2]。

从 2010 年以来，Mageia 已经成为一个用于桌面或服务器的稳定且安全的操作系统，并且定期更新。

它的近期的发布公告揭示了 Mageia 9 带来的众多核心改进。

下面就让我为你介绍一下这些改进。

### 🆕 Mageia 9：新亮点是什么？

![][2A]

由最新发布的 [Linux 内核 6.4][3] 驱动的 Mageia 9，与前一个版本相比，有了大量的提升。

以下是一些主要的亮点：

 * 改善了内核与硬件的支持
 * 更新了软件套件
 * 升级了桌面环境

### 改善了内核与硬件的支持

得益于 Linux 内核 6.4，Mageia 9 配备了 [Mesa 3D 23.1][4]，这使得图形支持达到了新的高度。

在硬件方面，**Mageia 9 使用了针对 AMD/ATI 显卡的自由视频驱动程序，AMDGPU**，能同时支持新旧显卡。不过，似乎专有驱动程序不能用于这个版本。

另外，**对于英伟达显卡** ，与 Mageia 8 相比，Xorg Nouveau 驱动的表现得到了提升，并且在非自由仓库中还提供了专有的英伟达驱动程序。

因此，Mageia 9 能够同时支持新款和旧款的英伟达 GPU。

还有，Mageia 9 提供了 **X.Org 21.1.8** 和 **XWayland 22.1.9**，这些都已从 Xserver 分离出来，以便进行更加方便的维护。

### 更新的软件套件

Mageia 9 特色之一是它丰富的应用策略，所有这些应用都已经升级至新版本。

包含如下内容：

  * [LibreOffice 7.5][5]
  * Blender 3.3.4
  * VirtualBox 7.0.10
  * NeoVim 0.9.1
  * Xen 4.17.0
  * Ruby 3.1.4
  * QEmu 7.2
  * RPM 4.18
  * Vim 9.0
  * PHP 8.2

### 桌面环境升级

![][5A]

首先，由于 Mageia 的默认桌面是 KDE Plasma，让我们先从这个开始。

Mageia 9 带有基于 **Qt 5.15.7** 构建的 **KDE Plasma 5.27.5**、**KDE Frameworks 5.105** 和 **KDE Applications 23.04.1**。

然后，对于 **GNOME 版** ，Mageia 9 提供了 **GNOME 44.2** ，现在默认在启动时运行 Wayland，同时提供了 “GNOME on Xorg” 的备选会话选项。

对于 **Xfce** ，Mageia 9 发行了 [Xfce 4.18][6]，现在有专门的 32 位 / 64 位的立付 DVD。

最后，我们还有 **MATE 1.26.0** 、**Cinnamon 5.6**、**LXQt 1.3.0** ，这些都是 Mageia 9 提供的其它版本。

### 🛠️ 其他技术性变化

总结一下，以下是一些值得强调的其他更改：

  * 同时支持 PulseAudio 和 PipeWire 声音服务器。
  * 如果禁用了推荐软件包，将减少安装占用。
  * RPM 数据库现在采用 SQLite 记录，已不再使用 Berkeley DB。
  * 对 [Nvidia Optimus][7] 笔记本进行了重大性能提升。

要了解此版本更多详情，可翻阅 [发布说明][8]。

### 📥 下载 Mageia 9

Mageia 9 现已可以下载，欢迎访问 [官方网站][9] 进行下载。

> **[Mageia 9][9]**

**针对现有用户**，你可以按照官方提供的 [方便的指南][10] 进行升级。

💬 你对新变化有何感想？你是否一直期待着这次发布？欢迎在下方留言分享你的观点。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/mageia-9-released/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Mandriva_Linux
[2]: https://itsfoss.com/independent-linux-distros/
[2A]: https://news.itsfoss.com/content/images/size/w1600/2023/08/Mageia_9_1.png
[3]: https://news.itsfoss.com/linux-kernel-6-4/
[4]: https://docs.mesa3d.org/relnotes/23.1.0.html
[5]: https://news.itsfoss.com/libreoffice-7-5-release/
[5A]: https://news.itsfoss.com/content/images/size/w1600/2023/08/Mageia_9_2.png
[6]: https://news.itsfoss.com/xfce-4-18-release/
[7]: https://en.wikipedia.org/wiki/Nvidia_Optimus
[8]: https://wiki.mageia.org/en/Mageia_9_Release_Notes
[9]: https://www.mageia.org/en/downloads/
[10]: https://wiki.mageia.org/en/How_to_choose_the_right_Mageia_upgrade_method
[0]: https://news.itsfoss.com/content/images/size/w1304/2023/08/mageia-9-release.png