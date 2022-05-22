[#]: subject: (What’s new in Fedora Workstation 34)
[#]: via: (https://fedoramagazine.org/whats-new-fedora-34-workstation/)
[#]: author: (Christian Fredrik Schaller https://fedoramagazine.org/author/uraeus/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13359-1.html)

Fedora Workstation 34 中的新变化
======

![](https://img.linux.net.cn/data/attachment/album/202105/03/233735glmkkimcz8ilmcmr.jpg)

Fedora Workstation 34 是我们领先的操作系统的最新版本，这次你将获得重大改进。最重要的是，你可以从 [官方网站][2] 下载它。我听到你在问，有什么新的东西？好吧，让我们来介绍一下。

### GNOME 40

[GNOME 40][3] 是对 GNOME 桌面的一次重大更新，Fedora 社区成员在其设计和实现过程中发挥了关键作用，因此你可以确信 Fedora 用户的需求被考虑在内。

当你登录到 GNOME 40 桌面时，首先注意到的就是你现在会被直接带到一个重新设计的概览屏幕。你会注意到仪表盘已经移到了屏幕的底部。GNOME 40 的另一个主要变化是虚拟工作空间现在是水平摆放的，这使 GNOME 与其他大多数桌面更加一致，因此应该使新用户更容易适应 GNOME 和 Fedora。

我们还做了一些工作来改善桌面中的手势支持，用三根手指水平滑动来切换工作空间，用三根手指垂直滑动来调出概览。

![][4]

更新后的概览设计带来了一系列其他改进，包括：

  * 仪表盘现在将收藏的和未收藏的运行中的应用程序分开。这使得可以清楚了解哪些应用已经被收藏，哪些未收藏。
  * 窗口缩略图得到了改进，现在每个窗口上都有一个应用程序图标，以帮助识别。
  * 当工作区被设置为在所有显示器上显示时，工作区切换器现在会显示在所有显示器上，而不仅仅是主显示器。
  * 应用启动器的拖放功能得到了改进，可以更轻松地自定义应用程序网格的排列方式。

GNOME 40 中的变化经历了大量的用户测试，到目前为止反应非常正面，所以我们很高兴能将它们介绍给 Fedora 社区。更多信息请见 [forty.gnome.org][3] 或 [GNOME 40 发行说明][5]。

### 应用程序的改进

GNOME “天气”为这个版本进行了重新设计，具有两个视图，一个是未来 48 小时的小时预报，另一个是未来 10 天的每日预报。

新版本现在显示了更多的信息，并且更适合移动设备，因为它支持更窄的尺寸。

![][6]

其他被改进的应用程序包括“文件”、“地图”、“软件”和“设置”。更多细节请参见 [GNOME 40 发行说明][5]。

### PipeWire

PipeWire 是新的音频和视频服务器，由 Wim Taymans 创建，他也共同创建了 GStreamer 多媒体框架。到目前为止，它只被用于视频捕获，但在 Fedora Workstation 34 中，我们也开始将其用于音频，取代 PulseAudio。

PipeWire 旨在与 PulseAudio 和 Jack 兼容，因此应用程序通常应该像以前一样可以工作。我们还与 Firefox 和 Chrome 合作，确保它们能与 PipeWire 很好地配合。OBS Studio 也即将支持 PipeWire，所以如果你是一个播客，我们已经帮你搞定了这些。

PipeWire 在专业音频界获得了非常积极的回应。谨慎地说，从一开始就可能有一些专业音频应用不能完全工作，但我们会源源不断收到测试报告和补丁，我们将在 Fedora Workstation 34 的生命周期内使用这些报告和补丁来延续专业音频 PipeWire 的体验。

### 改进的 Wayland 支持

我们预计将在 Fedora Workstation 34 的生命周期内解决在专有的 NVIDIA 驱动之上运行 Wayland 的支持。已经支持在 NVIDIA 驱动上运行纯 Wayland 客户端。然而，当前还缺少对许多应用程序使用的 Xwayland 兼容层的支持。这就是为什么当你安装 NVIDIA 驱动时，Fedora 仍然默认为 X.Org。

我们正在 [与 NVIDIA 上游合作][7]，以确保 Xwayland 能在 Fedora 中使用 NVIDIA 硬件加速。

### QtGNOME 平台和 Adwaita-Qt

Jan Grulich 继续他在 QtGNOME 平台和 Adawaita-qt 主题上的出色工作，确保 Qt 应用程序与 Fedora 工作站的良好整合。多年来，我们在 Fedora 中使用的 Adwaita 主题已经发生了演变，但随着 QtGNOME 平台和 Adwaita-Qt 在 Fedora 34 中的更新，Qt 应用程序将更接近于 Fedora Workstation 34 中当前的 GTK 风格。

作为这项工作的一部分，Fedora Media Writer 的外观和风格也得到了改进。

![][8]

### Toolbox

Toolbox 是我们用于创建与主机系统隔离的开发环境的出色工具，它在 Fedora 34 上有了很多改进。例如，我们在改进 Toolbox 的 CI 系统集成方面做了大量的工作，以避免在我们的环境中出现故障时导致 Toolbox 停止工作。

我们在 Toolbox 的 RHEL 集成方面投入了大量的工作，这意味着你可以很容易地在 Fedora 系统上建立一个容器化的 RHEL 环境，从而方便地为 RHEL 服务器和云实例做开发。现在在 Fedora 上创建一个 RHEL 环境就像运行：`toolbox create -distro rhel -release 8.4` 一样简单。 

这给你提供了一个最新桌面的优势：支持最新硬件，同时能够以一种完全原生的方式进行针对 RHEL 的开发。

![][9]

### Btrfs

自 Fedora 33 以来，Fedora Workstation 一直使用 Btrfs 作为其默认文件系统。Btrfs 是一个现代文件系统，由许多公司和项目开发。Workstation 采用 Btrfs 是通过 Facebook 和 Fedora 社区之间的奇妙合作实现的。根据到目前为止的用户反馈，人们觉得与旧的 ext4 文件系统相比，Btrfs 提供了更快捷、更灵敏的体验。

在 Fedora 34 中，新安装的 Workstation 系统现在默认使用 Btrfs 透明压缩。与未压缩的 Btrfs 相比，这可以节省 20-40% 的大量磁盘空间。它也增加了 SSD 和其他闪存介质的寿命。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/whats-new-fedora-34-workstation/

作者：[Christian Fredrik Schaller][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/uraeus/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/f34-workstation-816x345.jpg
[2]: https://getfedora.org/workstation
[3]: https://forty.gnome.org/
[4]: https://lh3.googleusercontent.com/xDklMWAGBWvRGRp2kby-XKr6b0Jvan8Obmn11sfmkKnsnXizKePYV9aWdEgyxmJetcvwMifYRUm6TcPRCH9szZfZOE9pCpv2bkjQhnq2II05Yu6o_DjEBmqTlRUGvvUyMN_VRtq8zkk2J7GUmA
[5]: https://help.gnome.org/misc/release-notes/40.0/
[6]: https://lh6.googleusercontent.com/pQ3IIAvJDYrdfXoTUnrOcCQBjtpXqd_5Rmbo4xwxIj2qMCXt7ZxJEQ12OoV7yUSF8zpVR0VFXkMP0M8UK1nLbU7jhgQPJAHPayzjAscQmTtqqGsohyzth6-xFDjUXogmeFmcP-yR9GWXfXv-yw
[7]: https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/587
[8]: https://lh6.googleusercontent.com/PDXxFS7SBFGI-3jRtR-TmqupvJRxy_CbWTfjB4sc1CKyO1myXkqfpg4jGHQJRK2e1vUh1KD_jyBsy8TURwCIkgAJcETCOlSPFBabqB5yDeWj3cvygOOQVe3X0tLFjuOz3e-ZX6owNZJSqIEHOQ
[9]: https://lh6.googleusercontent.com/dVRCL14LGE9WpmdiH3nI97OW2C1TkiZqREvBlHClNKdVcYvR1nZpZgWfup_GP5SN17iQtSJf59FxX2GYqoajXbdXLRfOwAREn7gVJ1fa_bspmcTZ81zkUQC4tNUx3f7D7uD7Peeg2Zc9Kldpww
