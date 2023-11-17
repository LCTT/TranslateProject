[#]: subject: "Raspberry Pi OS Upgrade: Ditching X11, A New Browser, and Debian 12"
[#]: via: "https://news.itsfoss.com/raspberry-pi-os-bookworm/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16285-1.html"

树莓派操作系统升级：基于 Debian 12、淘汰 X11
======

![][0]

> 为了匹配最新的树莓派 5 硬件，树莓派操作系统已做好准备，该系统中融入了 Debian 12 以及其他重大更新。

这个新版本的 <ruby>树莓派操作系统<rt>Raspberry Pi OS</rt></ruby> 能够完善支持新推出的 [树莓派 5][1]。

为此，开发者们投入了大量的心血和精力。新系统带来了诸多改进，同时还标志着向更现代化的窗口系统的迁移。

下面，我们来看看他们的具体成果。

### 树莓派操作系统: 新的变化有哪些？

![][2]

开发者基于最新的 [Debian 12 “Bookworm”][3] 版本，对树莓派桌面进行了 **重大的架构更新**。

一些显著的新特性包括：

  * 全面采用 Wayland
  * 网络性能显著提升
  * 默认使用 PipeWire
  * 为树莓派优化的 Firefox

显然，你将会享受到 Debian “Bookworm” 的核心优点，同时还能体验到上述提到的一些新变化。

#### 全面采用 Wayland

没错，你没有看错。

树莓派桌面已经默认启用 [Wayland][4] 窗口系统，正式摒弃了因多种限制不再使用的 [X11][5] 窗口系统。Wayland 的主要优点是其**在现代硬件上有更出色的性能表现**。

这一切的实现离不开 [Wayfire][6] 合成器的支持，这使得开发者能够在更新中**保持用户熟知的体验**。

以下是开发者在发布公告中的引述：

> 如果你在树莓派 4 或 5 上启动树莓派操作系统，现在你会看到的是一个 Wayfire 桌面。它看起来和你之前在 Bullseye 上使用的桌面几乎一模一样，但在一致的外观背后，我们为了使两个桌面环境看起来一样已进行了大量的工作！

**我们对此并不感到惊讶。**

近期，我们注意到有很多桌面正在从 X11 和 [Openbox][7] 这样的旧窗口系统转向 Wayland。

比如，GNOME 最近的更新开启了向 **[全面使用 Wayland 的未来][8]** 的转变。即使是 Fedora Linux 40 也准备弃用 X11 会话，转向使用 [Plasma 6][9] 的 XWayland 方式。

看到树莓派操作系统已经率先进行了这样的变化，实在是让人感到十分有趣 😄

> 📋 不过别担心，**对于仍希望使用 X11/Openbox 显示系统的用户**，他们可以在 `raspi-config` 中的 “<ruby>高级设置<rt>Advanced Settings</rt></ruby>” 菜单中重新启用它。

#### 网络性能显著提升

![][10]

开发者在之前实现的 [NetworkManager][11] 网络控制器的基础上进行了优化，他们为 **任务栏增加了网络插件**。

虽然新版本的插件和旧版本看上去差不多，但新增了一个 “<ruby>高级选项<rt>Advanced Options</rt></ruby>” 选项，用户可以通过它访问 NetworkManager 提供的更多功能。

#### 默认使用 PipeWire

现在，树莓派 Desktop 使用 [PipeWire][12] 来处理所有与音频/视频相关的任务。它取代了 [PulseAudio][13]，使**音频/视频处理迈向更现代化和灵活的方式**。

在用户端，你可以得到**更优化的蓝牙音频设备管理**、**更低的延迟时间**，**和 Wayland 的更好互操作性**等等。

用户也可以通过和切换窗口系统类似的步骤**选择回退使用 PulseAudio**。

#### 为树莓派优化的 Firefox

![][14]

这次，我们看到了一个**由官方支持且专门为树莓派优化的 [Mozilla Firefox][15] 版本**，它在这次树莓派操作系统的发布版中首次被引入。

现在，用户可以使用 **V4L2 编码支持** 来启用他们的树莓派上的硬件 h.264 解码器，这将会有助于**实现更好的 HD 视频播放效果**。

此外，他们也启用了 [Widevine DRM][16]，以在主流的视频流媒体平台上提供**无障碍的流媒体观看体验**。

在这次发布的版本中还有其他一些细微的变化。想了解更多，请参考 [官方博客][17]。

### 📥 下载树莓派操作系统

由于操作系统细节的大量变化，开发者建议你**从全新安装开始** （重新烧录你的 SD 卡）。

当然，你也可以选择自行升级，但需要自担风险。

你可以访问 [官方网站][18] 进行下载。

> **[树莓派操作系统][18]**

💬 你对新的树莓派操作系统升级感到兴奋吗？欢迎在评论区告诉我们。

*（题图：MJ/2fe701cd-5ced-41e2-b00e-1454c6f3fa4a）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/raspberry-pi-os-bookworm/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/raspberry-pi-5/
[2]: https://news.itsfoss.com/content/images/2023/10/RaspberryPi_OS_Bookworm_1.png
[3]: https://news.itsfoss.com/debian-12-release/
[4]: https://wayland.freedesktop.org/
[5]: https://en.wikipedia.org/wiki/X_Window_System
[6]: https://github.com/WayfireWM/wayfire
[7]: https://en.wikipedia.org/wiki/Openbox
[8]: https://news.itsfoss.com/gnome-wayland-xorg/
[9]: https://fedoraproject.org/wiki/Changes/KDE_Plasma_6
[10]: https://news.itsfoss.com/content/images/2023/10/RaspberryPi_OS_Bookworm_2.png
[11]: https://networkmanager.dev/
[12]: https://pipewire.org/
[13]: https://www.freedesktop.org/wiki/Software/PulseAudio/
[14]: https://news.itsfoss.com/content/images/2023/10/RaspberryPi_OS_Bookworm_3.png
[15]: https://www.mozilla.org/en-US/firefox/new/
[16]: https://www.widevine.com/solutions/widevine-drm
[17]: https://www.raspberrypi.com/news/bookworm-the-new-version-of-raspberry-pi-os/
[18]: https://www.raspberrypi.com/software/operating-systems/
[0]: https://img.linux.net.cn/data/attachment/album/202310/14/233127bc5jlvhkphkgngjh.jpg