[#]: subject: "helloSystem, the Mac-like FreeBSD OS, Takes Another Step Towards Full Release"
[#]: via: "https://news.itsfoss.com/hellosystem-towards-first-release/"
[#]: author: "John Paul Wohlscheid https://news.itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13915-1.html"

helloSystem：一款类似 Mac 的 FreeBSD 系统
======

![](https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/hello-system-bsd.jpg?w=1200&ssl=1)

最近，helloSystem 的开发者发布了他们操作系统的最新版本。helloSystem 是一个较新的项目，希望以 FreeBSD 为基础创建一个简单易用的操作系统。让我们来看看这对你我意味着什么。

### helloSystem 简介

![helloSystem 的关于屏幕][1]

你们中的大多数人可能以前从未听说过 [helloSystem][2]。该项目是由 [AppImage 的创建者][3] [Simon Peter][4] 在去年年初启动的。Simon 的目标是创建一个“友好的 [自由桌面][5] 操作系统，重点是简单、简约优雅和可用性。”

Simon 从上世纪 80 、90 年代更为简单的操作系统中获得了灵感，特别是 **早期的 MacOS**，比如 [System 1][6]。如果你只是看一下系统运行的截图，你可能会想说，“我不明白这有什么好大惊小怪的。有一堆 Linux 发行版或主题，看起来就像 MacOS。”

该项目不仅仅是看起来像 MacOS，它想回归到更简单、更容易使用的设计。据 [其网站][7] 上讲，“helloSystem 是一个面向创作者的桌面系统，注重简单、优雅和实用性。它的设计遵循 ‘少而精’ 的理念。它的目的是为 ‘普通人’ 提供一个系统，欢迎从 Mac 切换过来的人”。你可以通过观看 Simon 在 [FOSDEM 21][8] 上的演讲，了解更多关于他对 helloSystem 计划的想法。

就像 [Suckless 项目][9] 一样，Simon 创建了一个 “[欢迎和不欢迎的技术][10]” 列表。被批准的技术清单包括：

  * Qt
  * mDNSResponder
  * Python
  * Go

![helloSystem 的欢迎屏幕][12]

“不受欢迎的技术”清单包括 Simon 认为“太复杂或被认为不美观”的东西。这些技术包括：

  * 触摸
  * btrfs
  * Gnome
  * GTK
  * 客户端窗口装饰
  * Wayland
  * Pipewire
  * XDG 桌面规范
  * 与原始字体在度量上兼容的字体，但不试图在视觉上与原始字体相似
  * 最终用户应用程序的包管理器
  * 配置文件、IP 地址
  * D-Bus
  * 通过限制用户或应用程序可以做的事情而提供的安全性
  * Polkit
  * 大写锁定键
  * 本地文件的 URI

![在 helloSystem 上安装 Inkscape][13]

### helloSystem 如何工作

我最好解释一下 helloSystem 的工作方式。就像 MacOS 一样，桌面在屏幕顶部有一个全局菜单，底部有一个 Dock。与 MacOS 的 Finder 一样，helloSystem 也有一个文件管理器（名为 Filer），它也负责窗口管理。

在左上方，你会发现一个 “<ruby>系统<rt>System</rt></ruby>” 菜单，你可以用它来访问应用程序。（你也可以在左上角的搜索框中输入应用程序的名称。）helloSystem 只安装了几个开箱即用的基本应用程序。如果你点击一个未安装的应用程序，helloSystem 会下载并安装该应用程序的 AppImage。

helloSystem 基于 FreeBSD 12.2。它默认启用了 ZFS。它没有密码或用户账户系统，但这并不意味着他们无视安全。据 [其网站][10] 讲，“这并不是说一般的安全问题不重要。而是说它需要以一种不会限制设备的合法用户（所有者）真正 ‘拥有’ 该设备的方式来实现。”

### 最新版本中的新功能

![helloSystem 的实用程序窗口][14]

最新版本的 helloSystem 包括不少图形方面的更新和小的变化，包括：

  * 从 Openbox 切换到 KWin 窗口管理器
  * 合理的窗口标题居中
  * 当窗口被拖到屏幕边缘时，会缩放到一定大小，类似于 “Aero Snap”。
  * 简化了 “<ruby>桌面设置<rt>Desktop Settings</rt></ruby>” 的用户界面；现在更改会立即应用
  * 移除文件管理器中的标签以简化用户界面
  * 为菜单添加新的电池小程序，以显示电池充电量
  * 桌面上的垃圾箱图标不再有 “<ruby>移动到垃圾箱<rt>Move to Trash</rt></ruby>” 的上下文菜单项
  * 最小化窗口和取消最小化窗口时的动画
  * 窗口大小调整时的动画
  * 调整内核配置以优化声音
  * 简化了文件管理器中的 “<ruby>获取信息<rt>Get Info</rt></ruby>” 对话框

你可以在 [这里][11] 看到其余的变化。你也可以从同一个链接下载最新的 .iso 文件。试一试，让我们知道你的想法。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/hellosystem-towards-first-release/

作者：[John Paul Wohlscheid][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/hello-about.jpg?w=850&ssl=1
[2]: https://github.com/helloSystem/hello
[3]: https://itsfoss.com/appimage-interview/
[4]: https://github.com/probonopd
[5]: https://medium.com/@probonopd/bring-back-the-ease-of-80s-and-90s-personal-computing-393738c5e2a1
[6]: https://github.com/helloSystem/hello/wiki#design-principles
[7]: https://hellosystem.github.io/docs/
[8]: https://fosdem.org/2021/schedule/event/hello_bsd/
[9]: https://suckless.org/sucks/
[10]: https://github.com/helloSystem/hello/wiki/Welcome-and-unwelcome-technologies
[11]: https://github.com/helloSystem/ISO/releases/tag/r0.6.0
[12]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/hello-welcome.jpg?w=850&ssl=1
[13]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/hello-install.jpg?w=850&ssl=1
[14]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/10/hello-utillities.jpg?w=850&ssl=1