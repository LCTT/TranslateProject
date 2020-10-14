[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12655-1.html)
[#]: subject: (Meet eDEX-UI, A Sci-Fi Inspired Linux Terminal Emulator With Some Cool Features)
[#]: via: (https://itsfoss.com/edex-ui-sci-fi-terminal/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

eDEX-UI：一款科幻风格的酷炫 Linux 终端仿真器
======

> eDEX-UI 是一个很酷的科幻电影式的终端仿真器，看起来很酷，有大量包括系统监控在内的选项。让我们来快速看看它提供了什么。

你可能已经知道了[大量有趣的 Linux 命令][1]。但你知道当谈到 Linux 命令行时，还有什么有趣的东西吗？那就是终端本身。

是的，终端仿真器（俗称终端）也可以很有趣。还记得 80 年代和 90 年代初的[酷炫复古的终端，给你一个复古的终端][2]吗？

那一款深受 《<ruby>[创：战纪][3]<rt>TRON Legacy</rt></ruby>》 电影特效启发的养眼终端感觉怎么样？

在本文中，让我们来看看一款神奇的跨平台终端模拟器，注意口水！

### eDEX-UI: 一个很酷的终端仿真器

[eDEX-UI][5] 是一款开源的跨平台终端仿真器，它为你呈现了一个科幻风格的外观和一些有用的功能。

它最初的灵感来自于 [DEX UI][6] 项目，但该项目已经不再维护。

尽管 eDEX-UI 的重点是外观和未来主义主题的终端，但它也可以作为一个 [Linux 系统监控工具][7]。怎么说呢？因为当你在终端中工作时，它可以在侧边栏中显示系统的统计信息。事实上，其开发者提到，他的目标是将其改进为一个可用的系统管理工具。

让我们来看看它还提供了什么，以及如何让它安装到你的电脑上。

### eDEX-UI 的特点

![][8]

eDEX-UI 本质上是一个终端仿真器。你可以像普通终端一样使用它来运行命令和其他任何你可以在终端中做的事情。

它以全屏方式运行，侧边栏和底部面板可以监控系统和网络的统计信息。此外，还有一个用于触摸设备的虚拟键盘。

我做了一个简短的视频，我建议你观看这个视频，看看这个很酷的终端模拟器运行起来是什么样子。**播放视频时要打开声音**（相信我）。

- [视频](https://player.vimeo.com/video/460435965)

eDEX-UI 的特点：

  * 多标签
  * 对 curses 的支持
  * 目录查看器，显示当前工作目录的内容
  * 显示系统信息，包括主板信息、网络状态、IP、网络带宽使用情况、CPU 使用情况、CPU 温度、RAM 使用情况等
  * 自定义选项，以改变主题、键盘布局、CSS 注入
  * 可选的声音效果，让你有一种黑客的感觉
  * 跨平台支持（Windows、macOS 和 Linux）

### 在 Linux 上安装 eDEX

![eDEX-UI with Matrix theme][10]

如前所述，它支持所有主要平台，包括 Windows、macOS，当然还有 Linux。

要在 Linux 发行版上安装它，你可以从它的 [GitHub 发布部分][11]中抓取 AppImage 文件，或者在包括 [AUR][13] 在内的[可用资源库][12]中找到它。如果你不知道，我建议你去看一下我们关于[在 Linux 中使用 AppImage][14] 的指南。

你可以访问它的 GitHub 页面，如果你喜欢它，可以随时星标他们的仓库。

- [eDEX-UI][5]

### 我对 eDEX-UI 的体验

因为它的科幻风格的外观，我喜欢这个终端仿真器。但是，我发现它对系统资源的消耗相当大。我没有[检查我的 Linux 系统的 CPU 温度][15]，但 CPU 消耗肯定很高。

所以，如果你需要它运行在后台或单独的工作空间中（像我这样），你可能要注意这一点。除此以外，它是一个令人印象深刻的工具，拥有目录查看器和系统资源监控等有用的选项。

顺便说一句，如果你想模拟黑客来娱乐一下客人和孩子们，[那么可以试试好莱坞工具][16]。

你觉得 eDEX-UI 怎么样？你是想试一试，还是觉得太幼稚/过于复杂？

--------------------------------------------------------------------------------

via: https://itsfoss.com/edex-ui-sci-fi-terminal/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/funny-linux-commands/
[2]: https://itsfoss.com/cool-retro-term/
[3]: https://www.imdb.com/title/tt1104001/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/edex-ui-hacking-terminal.jpg?resize=800%2C450&ssl=1
[5]: https://github.com/GitSquared/edex-ui
[6]: https://github.com/seenaburns/dex-ui
[7]: https://itsfoss.com/linux-system-monitoring-tools/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/edex-ui-screenshot-1.png?resize=800%2C450&ssl=1
[9]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/edex-ui-screenshot.png?resize=800%2C450&ssl=1
[11]: https://github.com/GitSquared/edex-ui/releases
[12]: https://repology.org/project/edex-ui/versions
[13]: https://itsfoss.com/aur-arch-linux/
[14]: https://itsfoss.com/use-appimage-linux/
[15]: https://itsfoss.com/check-laptop-cpu-temperature-ubuntu/
[16]: https://itsfoss.com/hollywood-hacker-screen/
