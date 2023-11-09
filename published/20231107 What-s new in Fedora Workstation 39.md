[#]: subject: "What’s new in Fedora Workstation 39"
[#]: via: "https://fedoramagazine.org/whats-new-fedora-workstation-39/"
[#]: author: "Merlin Cooper https://fedoramagazine.org/author/mxanthropocene/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16362-1.html"

Fedora Workstation 39 的新特性
======

![][0]

作为领先的开源桌面操作系统，Fedora Workstation 由全球社区共同携手打造。本文将向你展示最新版本 Fedora Workstation 39 主要的用户所能见到的变化。如今，你可以在 [Fedora Workstation 官方网页][3] 下载体验，或是通过在“软件”应用内或使用 [dnf system-upgrade][4] 在你喜爱的终端模拟器进行升级。

### GNOME 45

Fedora Workstation 39 搭载了 GNOME 的最新版本——GNOME 45。这个版本为几个核心应用带来了时尚的新插件、全新的图像查看器应用、新增了在特定系统上的键盘背光设置等。同时，我们的一个更具信息性的活动按钮，及多项性能改进，将伴随全面优化的整套用户体验而来。你可以在 [GNOME 45 发布说明][5] 查看更多详细信息。

#### 内在改进

GNOME 45 在用户体验的方方面面都有所细化，以下几点只是其中的一部分：

  * 使用动态工作空间指示器取代了静态的活动按钮。新的指示器不仅显示工作空间数量，而且还能快速展示你正在关注的工作空间。

    ![新的动态工作空间指示器][6]

  * 新增了一个摄像头活动指示器，要启用它，你可以通过 Pipewire 访问你的摄像头。这将与麦克风、屏幕录制和屏幕录像指示器协同工作。
  * 快速设置菜单新增了一个键盘背光设置，这项设置仅支持特定的硬件设备。

    ![新的键盘背光设置][7]

  * 重新设计了默认的光标，并修复了原来设置中很多长期存在的问题。
  * Fedora Workstation 39 已不再支持 Adwaita-qt 与 QGnomePlatform Qt 主题，取而代之的是 Qt 应用的上游默认主题。

#### 核心应用

在 GNOME 45，许多应用现在使用了 libadwaita 1.4 特色的新用户界面插件。这提供了美观的双色设计并将侧边栏延伸至窗口全高。这不仅使应用看起来更酷，而且在小窗口尺寸下更易于使用。可在 [此处][8] 查看详细信息。此外，新的 headerbar 插件使顶栏与窗口内容的视觉分隔更加明显。

![文件、设置和日历显示新的侧边栏插件][9]

Fedora Workstation 39 引入了 GNOME 的新图像查看器应用，内部代号为 Loupe。该应用自底而上，使用 Rust、GTK 4，和 libadwaita 进行构建以实现高性能和高度适应性。

![新的图像查看器应用（截图中的素援工作公有领域）][10]

在核心应用中我们还有很多细微的改进。例如：

  * “设置”应用新增了“系统详情”区块，新的键盘布局查看器，简洁的描述字段，以及优化的键盘导航功能。

    ![新的系统详情窗口][11]

  * 在“文件”应用中，我们对搜索结果进行了顺序优化。
  * 我们在“软件”应用中提供了卸载 Flatpak 时删除用户数据的选项。

    ![卸载 Flatpak 应用时显示的新提示][12]

  * “日历”应用新增了逐行滚动和更有用的搜索结果功能。
  * 在“连接”应用中使用 RDP 连接时新增了复制文件、图像、文本的功能。

#### 性能改进

在 GNOME 45，我们对性能提升投入了很多努力。

  * 现在默认优先使用硬件加速的视频解码（在支持的环境下）。
  * “文件”应用中的缩略图生成现在支持多线程处理。
  * 我们显著减少了光标的卡顿和延迟。
  * 在 GNOME Shell 中，以及“文件”、“软件”、“字符”等应用的搜索性能得到显著提升。

我们在整个技术栈中也进行了一些性能改进，包括 GLib、GTK 的 OpenGL 渲染器，和 systemd。这些性能优化工作都得益于我们在 Fedora Workstation 之前的版本中启用的帧指针！

### Fedora Linux 39 的底层突破

Fedora Linux 39 也有许多值得注意的底层变化，此处列出一些：

  * Fedora Linux 39 现在将彩色 Bash 提示符作为默认设置！

    ![彩色 Bash 提示符][13]

  * 对于使用 Indic 脚本的语系，我们现在把 Noto 字体作为默认字体，取代了旧的 Lohit 字体集。
  * 由于使用量较低且缺乏主动维护，[模块化][14] 仓库在 Fedora Linux 39 中不再被提供。
    * Fedora 模块构建服务将在 Fedora Linux 38 的生命周期结束后，也就是在 2024 年的 5 月左右结束。

*（题图：MJ/f06d0e9b-4c2e-4947-8333-e51340a45324）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/whats-new-fedora-workstation-39/

作者：[Merlin Cooper][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mxanthropocene/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/10/f39workstation-816x345.jpg
[2]: https://fedoraproject.org/wiki/User:Jimmac
[3]: https://fedoraproject.org/workstation/
[4]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/
[5]: https://release.gnome.org/45/
[6]: https://fedoramagazine.org/wp-content/uploads/2023/10/Activites5-1.gif
[7]: https://fedoramagazine.org/wp-content/uploads/2023/10/Keyboard.png
[8]: https://blogs.gnome.org/alicem/2023/09/15/libadwaita-1-4/
[9]: https://fedoramagazine.org/wp-content/uploads/2023/10/New-sidebars-1024x545.png
[10]: https://fedoramagazine.org/wp-content/uploads/2023/10/Screenshot-from-2023-10-20-02-54-42.png
[11]: https://fedoramagazine.org/wp-content/uploads/2023/10/Screenshot-from-2023-10-20-02-58-49.png
[12]: https://fedoramagazine.org/wp-content/uploads/2023/10/image-1.png
[13]: https://fedoramagazine.org/wp-content/uploads/2023/10/Screenshot-from-2023-10-20-03-14-17.png
[14]: https://docs.fedoraproject.org/en-US/modularity/
[0]: https://img.linux.net.cn/data/attachment/album/202311/09/143205c3c7636ooh0zuhuu.png